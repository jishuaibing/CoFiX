// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.6.6;

interface ICoFiXRouter {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    // All pairs: {ETH <-> ERC20 Token}

    /// @dev Maker add liquidity to pool, get pool token (mint sToken to maker) (notice: msg.value = amountETH + oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  amountETH The amount of ETH added to pool
    /// @param  amountToken The amount of Token added to pool
    /// @param  liquidityMin The minimum liquidity maker wanted
    /// @param  to The target address receiving the liquidity pool (sToken)
    /// @param  deadline The dealine of this request
    /// @return liquidity The real liquidity or sToken minted from pool
    function addLiquidity(
        address token,
        uint amountETH,
        uint amountToken,
        uint liquidityMin,
        address to,
        uint deadline
    ) external payable returns (uint liquidity);

    /// @dev Maker remove liquidity from pool to get ERC20 Token back (maker burn sToken) (notice: msg.value = oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  liquidity The amount of liquidity (sToken) sent to pool, or the liquidity to remove
    /// @param  amountTokenMin The minimum amount of Token wanted to get from pool
    /// @param  to The target address receiving the Token
    /// @param  deadline The dealine of this request
    /// @return amountToken The real amount of Token transferred from the pool
    function removeLiquidityGetToken(
        address token,
        uint liquidity,
        uint amountTokenMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken);

    /// @dev Maker remove liquidity from pool to get ETH back (maker burn sToken) (notice: msg.value = oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  liquidity The amount of liquidity (sToken) sent to pool, or the liquidity to remove
    /// @param  amountETHMin The minimum amount of ETH wanted to get from pool
    /// @param  to The target address receiving the ETH
    /// @param  deadline The dealine of this request
    /// @return amountETH The real amount of ETH transferred from the pool
    function removeLiquidityGetETH(
        address token,
        uint liquidity,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountETH);

    /// @dev Trader swap exact amount of ETH for ERC20 Tokens (notice: msg.value = amountIn + oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  amountIn The exact amount of ETH a trader want to swap into pool
    /// @param  amountOutMin The minimum amount of Token a trader want to swap out of pool
    /// @param  to The target address receiving the Token
    /// @param  deadline The dealine of this request
    /// @return _amountIn The real amount of ETH transferred into pool
    /// @return _amountOut The real amount of Token transferred out of pool
    function swapExactETHForTokens(
        address token,
        uint amountIn,
        uint amountOutMin,
        address to,
        uint deadline
    ) external payable returns (uint _amountIn, uint _amountOut);

    /// @dev Trader swap exact amount of ERC20 Tokens for ETH (notice: msg.value = oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  amountIn The exact amount of Token a trader want to swap into pool
    /// @param  amountOutMin The mininum amount of ETH a trader want to swap out of pool
    /// @param  to The target address receiving the ETH
    /// @param  deadline The dealine of this request
    /// @return _amountIn The real amount of Token transferred into pool
    /// @return _amountOut The real amount of ETH transferred out of pool
    function swapExactTokensForETH(
        address token,
        uint amountIn,
        uint amountOutMin,
        address to,
        uint deadline
    ) external payable returns (uint _amountIn, uint _amountOut);

    /// @dev Trader swap ETH for exact amount of ERC20 Tokens (notice: msg.value = amountInMax + oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  amountInMax The max amount of ETH a trader want to swap into pool
    /// @param  amountOutExact The exact amount of Token a trader want to swap out of pool
    /// @param  to The target address receiving the Token
    /// @param  deadline The dealine of this request
    /// @return _amountIn The real amount of ETH transferred into pool
    /// @return _amountOut The real amount of Token transferred out of pool
    function swapETHForExactTokens(
        address token,
        uint amountInMax,
        uint amountOutExact,
        address to,
        uint deadline
    ) external payable returns (uint _amountIn, uint _amountOut);

    /// @dev Trader swap ERC20 Tokens for exact amount of ETH (notice: msg.value = oracle fee)
    /// @param  token The address of ERC20 Token
    /// @param  amountInMax The max amount of Token a trader want to swap into pool
    /// @param  amountOutExact The exact amount of ETH a trader want to swap out of pool
    /// @param  to The target address receiving the ETH
    /// @param  deadline The dealine of this request
    /// @return _amountIn The real amount of Token transferred into pool
    /// @return _amountOut The real amount of ETH transferred out of pool
    function swapTokensForExactETH(
        address token,
        uint amountInMax,
        uint amountOutExact,
        address to,
        uint deadline
    ) external payable returns (uint _amountIn, uint _amountOut);
}
