{ pkgs, ... }: {
    variables = {
        EDITOR = "vim";
    };
    systemPackages = with pkgs; [ 
        vim
        wget
        # fish
    ];
}