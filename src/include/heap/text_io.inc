%define VIDEOMEM				0xb8000
%define COL						0x50
%define ROW						0x19


%include "src/data/text_io.s"
%include "src/common/text_io/putc.s"
%include "src/common/text_io/puts.s"
%include "src/common/text_io/get_text_position.s"
%include "src/common/text_io/set_cursor.s"
%include "src/common/text_io/clear_screen.s"
