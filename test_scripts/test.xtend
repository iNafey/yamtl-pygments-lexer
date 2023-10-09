package cd2db

import CD.Attribute
import CD.CDPackage
import CD.Class
import CD.DataType
import Relational.Column
import Relational.RelationalPackage
import Relational.Table
import java.util.List
import yamtl.core.YAMTLModule
import static yamtl.dsl.Rule.*
import static yamtl.dsl.Helper.*

class cd2db extends YAMTLModule {
	val CD = CDPackage.eINSTANCE  
	val DB = RelationalPackage.eINSTANCE  
	new () {
		header().in('cd', CD).out('db', DB)
		
		ruleStore( newArrayList(
			rule('ClassToTable')
				.in('c', CD.class_)
				.out('t', DB.table, [
					t.name = c.name
					t.col += c.attr.fetch as List<Column>
					t.col += pk_col
					val list = c.incomingReferences
						.fetch('fk_col', 'ReferenceToFkColumn') 
						as List<Column>
					if (list !== null)
						t.col += list
				])
				.out('pk_col', DB.column, [
					pk_col.name = 'pk_' + c.name 
				]),
		
			rule('AttributeToColumn')
				.in('att', CD.attribute).filter([
					att.type instanceof DataType
				])
				.out('col', DB.column, [ 
					col.name = att.name
				]),
		
			rule('ReferenceToFkColumn')
				.uniqueLazy
				.in('ref', CD.attribute)
				.out('fk_col', DB.column, [ 
					fk_col.name = 
						'''fk_«ref.type.name»--«ref.name»-->«
						(ref.owner as Class).name»'''
				])
				
		))
	}
	
	def incomingReferences(Class c) {
		CD.attribute.allInstances
		.map[it as Attribute].filter[type==c && multiValued]
	}
	
	def c() {
	  'c'.fetch() as Class
	}
	def t() {
	  't'.fetch() as Table
	}
	def pk_col() {
	  'pk_col'.fetch() as Column
	}
	def att() {
	  'att'.fetch() as Attribute
	}
	def col() {
	  'col'.fetch() as Column
	}
	def ref() {
	  'ref'.fetch() as Attribute
	}
	def fk_col() {
	  'fk_col'.fetch() as Column
	}
}

		