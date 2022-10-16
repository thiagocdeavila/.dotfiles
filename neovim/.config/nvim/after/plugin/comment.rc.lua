local status_comment, comment = pcall(require, 'Comment')
if (not status_comment) then return end

comment.setup {}
