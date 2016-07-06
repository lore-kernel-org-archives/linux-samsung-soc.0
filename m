From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 1/2] clk: exynos5433: do not use CLK_IGNORE_UNUSED for
 SPI clocks
Date: Wed, 06 Jul 2016 13:51:09 +0900
Message-ID: <20160706045108.GD23620@samsunx.samsung>
References: <1467270911-10971-1-git-send-email-andi.shyti@samsung.com>
 <1467270911-10971-2-git-send-email-andi.shyti@samsung.com>
 <577A2EFF.2010306@samsung.com> <20160704102614.GD1257@jack.zhora.eu>
 <CGME20160704151537epcas1p42a74c53ebb4227da9a30c25e250f0c5a@epcas1p4.samsung.com>
 <577A7D8D.8070004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43203 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcGFEvM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 00:51:12 -0400
Content-disposition: inline
In-reply-to: <577A7D8D.8070004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andi Shyti <andi@etezian.org>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>

Hi Sylwester,

> +#if 0
>                         clocks = <&cmu_peric CLK_PCLK_SPI1>,
>                                  <&cmu_top CLK_SCLK_SPI1_PERIC>;
> +#else
> +                       clocks = <&cmu_peric CLK_PCLK_SPI1>,
> +                                <&cmu_peric CLK_SCLK_SPI1>;
> +#endif

Yes, that's how it should be, indeed.

>         /* Disable Clock */
>         if (sdd->port_conf->clk_from_cmu) {
> -               clk_disable_unprepare(sdd->src_clk);
> +               /* clk_disable_unprepare(sdd->src_clk); */
>         } else {
>                 val = readl(regs + S3C64XX_SPI_CLK_CFG);
>                 val &= ~S3C64XX_SPI_ENCLK_ENABLE;
> @@ -626,7 +626,7 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
>                 /* There is half-multiplier before the SPI */
>                 clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
>                 /* Enable Clock */
> -               clk_prepare_enable(sdd->src_clk);
> +               /* clk_prepare_enable(sdd->src_clk); */
>         } else {
>                 /* Configure Clock */
>                 val = readl(regs + S3C64XX_SPI_CLK_CFG);

I don't see anything wrong on the above. We could make it as:

@@ -596,9 +597,7 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
        u32 val;
 
        /* Disable Clock */
-       if (sdd->port_conf->clk_from_cmu) {
-               clk_disable_unprepare(sdd->src_clk);
-       } else {
+       if (!sdd->port_conf->clk_from_cmu) {
                val = readl(regs + S3C64XX_SPI_CLK_CFG);
                val &= ~S3C64XX_SPI_ENCLK_ENABLE;
                writel(val, regs + S3C64XX_SPI_CLK_CFG);
@@ -640,13 +639,7 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
 
        writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
-       if (sdd->port_conf->clk_from_cmu) {
-               /* Configure Clock */
-               /* There is half-multiplier before the SPI */
-               clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
-               /* Enable Clock */
-               clk_prepare_enable(sdd->src_clk);
-       } else {
+       if (!sdd->port_conf->clk_from_cmu) {
                /* Configure Clock */
                val = readl(regs + S3C64XX_SPI_CLK_CFG);
                val &= ~S3C64XX_SPI_PSR_MASK;

> I meant we could amend which clocks are specified at the SPI bus device
> DT nodes and change handling of clocks in the spi-s3c64xx driver to model
> everything properly and get it all working.

I think that if the clock comes from the cmu it's not necessary
to disable it. I would like to avoid adding DTS properties
because we have the clock disabling inherited from old code which
it might not be required at all (in our tests, indeed it works).

Thanks,
Andi
