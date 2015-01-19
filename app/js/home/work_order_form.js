/**
 * Created by twer on 15/1/19.
 */
var count=$("#count").html().to_i;
function keyup(obj) {
    var e = window.event;
    if (e.keyCode == 74) {
        $("#question_list").append(add(5));
    }
}
function add(index) {
    return $("<div>").append(add_label(index,"title","问题")).
        append(add_text(index,"title")).
        append(add_label(index,"answer","答案")).
        append(add_text(index, "answer")).
        append(add_label(index,"note","备注")).
        append(add_text(index,"note")).append(add_hr());
}
function add_text(index, title) {
    return $("<input>").attr("type", "text").
        attr("class", "form-control").
        attr("id", "work_order_customer_questions_attributes_" + index + "_" + title).
        attr("name", "work_order[customer_questions_attributes][" + index + "][" + title + "]");
}
function add_label(index, title, value) {
    return $("<label>").attr("for", "work_order_customer_questions_attributes_" + index + "_" + title).html(value);
}
function add_hr() {
    return $("<hr>")
}