From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC1XX: Change clksrc_clks to use array of clocks
Date: Tue, 12 Jan 2010 10:26:25 +0100
Message-ID: <001601ca9369$52835bb0$f78a1310$%szyprowski@samsung.com>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51406 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944Ab0ALJ1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 04:27:30 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW400F4ONLPZV@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 18:27:25 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW400KLENLLRI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 18:27:24 +0900 (KST)
In-reply-to: <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 12, 2010 5:20 AM Ben Dooks wrote:

> From: Ben Dooks <ben-linux@fluff.org>
> 
> Remove the individual 'struct clksrc_clks' and place them into an array
> so that we can simply use s3c_register_clksrcs to register tham all in one
> go.
> 
> Since the spdif clock relies on the audio clock, move the audio clocks
> into their own arrary.
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/plat-s5pc1xx/s5pc100-clock.c |  411 ++++++++++++++-------------------
>  1 files changed, 174 insertions(+), 237 deletions(-)
> 
> diff --git a/arch/arm/plat-s5pc1xx/s5pc100-clock.c b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
> index cf71f2c..d36ab40 100644
> --- a/arch/arm/plat-s5pc1xx/s5pc100-clock.c
> +++ b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
> @@ -534,14 +534,44 @@ static struct clksrc_sources clkset_audio2 = {
>  	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
>  };
> 

> ...

> -/* simplest change - will aggregate clocks later */
> -static struct clksrc_clk *clks_src[] = {
> -	&clk_mout_apll,
> -	&clk_mout_mpll,
> -	&clk_mout_onenand,
> -	&clk_mout_epll,
> -	&clk_spi0,
> -	&clk_spi1,
> -	&clk_spi2,
> -	&clk_uart_uclk1,
> -	&clk_audio0,
> -	&clk_audio1,
> -	&clk_audio2,
> -	&clk_spdif,
> -	&clk_lcd,
> -	&clk_fimc0,
> -	&clk_fimc1,
> -	&clk_fimc2,
> -	&clk_mmc0,
> -	&clk_mmc1,
> -	&clk_mmc2,
> -	&clk_usbhost,
> -};
> -
>  void __init s5pc100_register_clocks(void)
>  {
>  	struct clk *clkp;
> @@ -929,6 +866,6 @@ void __init s5pc100_register_clocks(void)
>  		}
>  	}
> 
> -	for (ptr = 0; ptr < ARRAY_SIZE(clks_src); ptr++)
> -		s3c_register_clksrc(clks_src[ptr], 1);
> +	s3c_register_clksrc(clksrc_audio, ARRAY_SIZE(clksrc_audio));
> +	s3c_register_clksrc(clksrc_clks, ARRAY_SIZE(clksrc_clks));
>  }

After this change mout_apll, mout_mpll, mout_onenand and mout_epll clocks are not registered at all (they are NOT a part of
clksrc_clks array), thus having NULL clk->ops, what causes NULL pointer dereference once their children had been used. This can be
fixed with the following patch (it also fixes missing mout_hpll clock):

diff --git a/arch/arm/plat-s5pc1xx/s5pc100-clock.c b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
index d36ab40..f24082d 100644
--- a/arch/arm/plat-s5pc1xx/s5pc100-clock.c
+++ b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
@@ -836,7 +836,12 @@ static struct clk *clks[] __initdata = {
        &clk_dout_d0_bus,
        &clk_dout_pclkd0,
        &clk_dout_apll2,
+       &clk_mout_apll.clk,
+       &clk_mout_mpll.clk,
        &clk_mout_am.clk,
+       &clk_mout_onenand.clk,
+       &clk_mout_epll.clk,
+       &clk_mout_hpll.clk,
        &clk_dout_d1_bus,
        &clk_dout_pclkd1,
        &clk_dout_mpll2,


Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
