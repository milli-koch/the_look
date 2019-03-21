view: pdt_with_a_really_really_long_name_for_bug_reproduction_purposes {
 derived_table: {
   sql: select id from public.orders ;;
  datagroup_trigger: the_look_default_datagroup
  indexes: ["id"]
 }



dimension: id {}
}
