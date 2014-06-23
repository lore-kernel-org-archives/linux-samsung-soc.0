From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] clk: samsung: add more aliases for s3c24xx
Date: Mon, 23 Jun 2014 23:24:39 +0200
Message-ID: <5341183.OFCkpuLYmy@diego>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com> <1403555350-14895-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38642 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755369AbaFWVX2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 17:23:28 -0400
In-Reply-To: <1403555350-14895-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Montag, 23. Juni 2014, 23:29:10 schrieb Vasily Khoruzhick:
> Without these aliases clock lookup fails in s3c2410fb,
> s3cmci, s3c2410-nand, s3c24xx-i2s, and i2c-s3c2410 drivers.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/clk/samsung/clk-s3c2410.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-s3c2410.c
> b/drivers/clk/samsung/clk-s3c2410.c index bd9a873..140f473 100644
> --- a/drivers/clk/samsung/clk-s3c2410.c
> +++ b/drivers/clk/samsung/clk-s3c2410.c
> @@ -152,6 +152,11 @@ struct samsung_clock_alias s3c2410_common_aliases[]
> __initdata = { ALIAS(HCLK, NULL, "hclk"),
>  	ALIAS(MPLL, NULL, "mpll"),
>  	ALIAS(FCLK, NULL, "fclk"),
> +	ALIAS(PCLK, NULL, "watchdog"),
> +	ALIAS(PCLK_SDI, NULL, "sdi"),
> +	ALIAS(HCLK_NAND, NULL, "nand"),
> +	ALIAS(PCLK_I2S, NULL, "iis"),
> +	ALIAS(PCLK_I2C, NULL, "i2c"),
>  };
> 
>  /* S3C2410 specific clocks */
