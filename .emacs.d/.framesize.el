(delete 'width initial-frame-alist)
(delete 'height initial-frame-alist)
(delete 'top initial-frame-alist)
(delete 'left initial-frame-alist)
(setq initial-frame-alist (append (list
'(width . 79)
'(height . 39)
'(top . 14)
'(left . 705))
initial-frame-alist))
