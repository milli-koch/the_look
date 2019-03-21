include: "users.view"

view: users_ex {
 extends: [users]


dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}
}
