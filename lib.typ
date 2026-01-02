#let get_children(doc) = {
  let d_t = type(doc)
  let children = ()
  if d_t == array {
    children = doc
  } else if d_t == dictionary {
    children = doc.keys()
  } else if d_t == content {
    children = if doc.has("children") { doc.children } else if doc.has("body") {
      get_children(doc.body)
    } else { () }
  }
  return children
}

#let query_label(name, content) = {
  if get_children(content).contains(metadata("__label__" + name + "_before")) {
    let c = get_children(content)
      .split(metadata("__label__" + name + "_before"))
      .last()
      .split(metadata("__label__" + name + "_after"))
      .first()
      .join()
    c
  }
  let children = get_children(content)
  for child in children {
    query_label(name, child)
  }
}

#let clear_labels(content) = {
  let children = get_children(content)
  if children.len() == 0 {
    content
  }
  for child in children {
    if not (
      str(type(child)) == "content"
        and child.func() == metadata
        and child
          .fields()
          .value
          .matches(regex("__label__.*_(before|after)"))
          .len()
          != 0
    ) {
      clear_labels(child)
    }
  }
}

#let clabel(name, content) = {
  metadata("__label__" + name + "_before")
  content
  metadata("__label__" + name + "_after")
}

