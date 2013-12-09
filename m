From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2 v2] i2c: exynos5: add support for HSI2C on Exynos5260
 SoC
Date: Mon, 09 Dec 2013 17:27:29 +0100
Message-ID: <47816304.YeQAZze1OM@amdc1227>
References: <1385100726-32165-1-git-send-email-ch.naveen@samsung.com>
 <1385439977-19077-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29952 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932468Ab3LIQ1m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:27:42 -0500
In-reply-to: <1385439977-19077-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, sjg@chromium.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, ben-linux@fluff.org, grant.likely@secretlab.ca, broonie@kernel.org, dianders@chromium.org, cpgs@samsung.com

Hi Naveen,

On Tuesday 26 of November 2013 09:56:17 Naveen Krishna Chatradhi wrote:
> This patch adds new compatible to support HSI2C module on Exynos5260
> HSI2C module on Exynos5260 needs to be reset during during initialization.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> Changes since v1:
> Rebasing on linux-i2c for-next
> 
>  .../devicetree/bindings/i2c/i2c-exynos5.txt        |    6 +++-
>  drivers/i2c/busses/i2c-exynos5.c                   |   31 ++++++++++++++++++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> index 056732c..704ab92 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> @@ -5,7 +5,11 @@ at various speeds ranging from 100khz to 3.4Mhz.
>  
>  Required properties:
>    - compatible: value should be.
> -      -> "samsung,exynos5-hsi2c", for i2c compatible with exynos5 hsi2c.
> +	-> "samsung,exynos5-hsi2c", for i2c compatible with HSI2C available on
> +				Exynos5250/5420 SoCs.
> +	-> "samsung,exynos5260-hsi2c", for i2c compatible with HSI2C available
> +				on Exynos5260 SoCs.
> +
>    - reg: physical base address of the controller and length of memory mapped
>      region.
>    - interrupts: interrupt number to the cpu.
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index da39ff0..497ff91 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -184,14 +184,35 @@ struct exynos5_i2c {
>  	 * 2. Fast speed upto 1Mbps
>  	 */
>  	int			speed_mode;
> +
> +	/* Version of HS-I2C Hardware */
> +	unsigned int		version;
> +};
> +
> +enum hsi2c_version {
> +	EXYNOS_5,
> +	EXYNOS_5260
>  };

I don't like this kind of hardware versioningm as there might show up
revisions that are previous revisions mixed together (e.g. some quirks
from one and some quirks from another).

IMHO better way to represent differences between hardware versions are
variant structs that define characteristics of particular variants.

For now, it doesn't really matter, though, as the only things that change
are fifo depth and whether the reset is needed (although see my comment
below on this). However if you could spot any other differences between
these two versions that might affect the driver in future, it would be
better to use a variant struct.

>  
>  static const struct of_device_id exynos5_i2c_match[] = {
> -	{ .compatible = "samsung,exynos5-hsi2c" },
> +	{
> +		.compatible = "samsung,exynos5-hsi2c",
> +		.data = (void *)EXYNOS_5 },
> +	{
> +		.compatible = "samsung,exynos5260-hsi2c",
> +		.data = (void *)EXYNOS_5260 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
>  
> +static inline unsigned int exynos5_i2c_get_version(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +
> +	match = of_match_node(exynos5_i2c_match, pdev->dev.of_node);
> +	return (unsigned int)match->data;
> +}
> +
>  static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
>  {
>  	writel(readl(i2c->regs + HSI2C_INT_STATUS),
> @@ -692,7 +713,13 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clk;
>  
> -	exynos5_i2c_init(i2c);
> +	i2c->version = exynos5_i2c_get_version(pdev);
> +
> +	/* The HS-I2C core on Exynos5260 needs a reset to start with */
> +	if (i2c->version == EXYNOS_5260)
> +		exynos5_i2c_reset(i2c);
> +	else
> +		exynos5_i2c_init(i2c);

What about simply calling exynos5_i2c_reset() here regardless of the
version? I don't think it should cause any problems and could be even
more reliable as the hardware would be always reset to its default state
regardless of what the firmware does with it.

Best regards,
Tomasz
