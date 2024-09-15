require("toggleterm").setup{

    open_mapping=[[<c-\>]],
    direction =  'float',
    close_on_exit=true,
    shell='/bin/bash',
    persist_size=true,
    persist_mode=true,
    auto_scroll=true,

    float_opts={
        border='single',
        title_pos='center'
    }



}