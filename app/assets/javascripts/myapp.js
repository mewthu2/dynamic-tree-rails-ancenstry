function generate(text, type, layout, timeout) {
	type = (type === undefined) ? 'success' : type
	layout = (layout === undefined) ? 'topCenter' : layout
	timeout = (timeout === undefined) ? 2000 : timeout
    var n = noty({
        text        : text,
        type        : type,
        dismissQueue: true,
        modal       : false,
        maxVisible  : 1,
        timeout     : timeout,
        layout      : layout,
        theme       : 'defaultTheme'
    });
}