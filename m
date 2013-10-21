From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 4/8] clk: samsung: s3c64xx: Add aliases for DMA clocks
Date: Mon, 21 Oct 2013 05:11:42 -0700
Message-ID: <20131021121142.11944.48412@quantum>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
 <1381950659-12703-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:54629 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753379Ab3JUMLt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 08:11:49 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so6899449pbc.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 05:11:49 -0700 (PDT)
In-Reply-To: <1381950659-12703-5-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Tomasz Figa <tomasz.figa@gmail.com>

Quoting Tomasz Figa (2013-10-16 12:10:55)
> This patch adds clkdev aliases for clocks used by PL08x DMA driver.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/clk-s3c64xx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
> index 7d2c842..06cf105 100644
> --- a/drivers/clk/samsung/clk-s3c64xx.c
> +++ b/drivers/clk/samsung/clk-s3c64xx.c
> @@ -332,7 +332,9 @@ static struct samsung_clock_alias s3c64xx_clock_aliases[] = {
>         ALIAS(HCLK_HSMMC0, "s3c-sdhci.0", "hsmmc"),
>         ALIAS(HCLK_HSMMC0, "s3c-sdhci.0", "mmc_busclk.0"),
>         ALIAS(HCLK_DMA1, NULL, "dma1"),
> +       ALIAS(HCLK_DMA1, "dma-pl080s.1", "apb_pclk"),
>         ALIAS(HCLK_DMA0, NULL, "dma0"),
> +       ALIAS(HCLK_DMA0, "dma-pl080s.0", "apb_pclk"),
>         ALIAS(HCLK_CAMIF, "s3c-camif", "camif"),
>         ALIAS(HCLK_LCD, "s3c-fb", "lcd"),
>         ALIAS(PCLK_SPI1, "s3c6410-spi.1", "spi"),
> -- 
> 1.8.3.2
