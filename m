From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 16:31:35 +0900
Message-ID: <565BFB57.2000701@samsung.com>
References: <20151130072852.GA25202@jci-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28915 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753179AbbK3Hbm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 02:31:42 -0500
In-reply-to: <20151130072852.GA25202@jci-VirtualBox>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 30.11.2015 16:28, Mutharaju, Prasanna (P.) wrote:
> From: Prasanna Karthik <mkarthi3@visteon.com>
> 
> Remove unneeded variable used to store return value.
> V2: Modified subject  

Changelog (v2) should go after '---' separator so it won't get included
in the commit message.

Now I see that you Signed-off-by is okay - same email address... I got
confused by the difference in name.

Best regards,
Krzysztof

> 
> Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>
> ---
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
> index e9eb935..ec6fb14 100644
> --- a/drivers/clk/samsung/clk-s3c2410-dclk.c
> +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> @@ -77,12 +77,11 @@ static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
>  static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
> -	int ret = 0;
>  
>  	s3c2410_modify_misccr((clkout->mask << clkout->shift),
>  			      (index << clkout->shift));
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct clk_ops s3c24xx_clkout_ops = {
> 
