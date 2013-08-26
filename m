From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH RFC 3/5] ARM: samsung: add clock setup for FIMC and FIMD
Date: Mon, 26 Aug 2013 18:19:18 +0200
Message-ID: <1445676.NMCyFEC5q4@amdc1032>
References: <1377517114-20222-1-git-send-email-m.krawczuk@partner.samsung.com>
 <1377517114-20222-4-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11172 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab3HZQTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 12:19:35 -0400
In-reply-to: <1377517114-20222-4-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, mturquette@linaro.org, thomas.abraham@linaro.org, t.stanislaws@samsung.com, m.chehab@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org


Hi,

On Monday, August 26, 2013 01:38:32 PM Mateusz Krawczuk wrote:
> This patch adds code that sets correct parents and rates for clocks
> used by FIMC and FIMD on Goni board.
> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c | 48 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
> index e5cd9fb..309b5ad 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -55,6 +55,7 @@
>  #include <media/s5p_fimc.h>
>  #include <media/noon010pc30.h>
>  
> +#include <linux/clk.h>
>  #include "common.h"
>  
>  /* Following are default values for UCON, ULCON and UFCON UART registers */
> @@ -195,6 +196,49 @@ static struct platform_device goni_spi_gpio = {
>  	},
>  };
>  
> +static void set_fimd_clock(void)

It can be marked as __init.

> +{
> +	struct clk *lcd_clk, *parent_clk;
> +
> +	lcd_clk = clk_get(NULL, "sclk_fimd");
> +	parent_clk = clk_get(NULL, "mout_mpll");
> +	clk_set_parent(lcd_clk, parent_clk);
> +	clk_set_rate(lcd_clk, clk_get_rate(parent_clk)/3);
> +
> +	clk_put(parent_clk);
> +	clk_put(lcd_clk);
> +}
> +
> +static void set_fimc_clock(void)

ditto

> +{
> +	struct clk *cam0_clk, *cam1_clk, *fimc2_clk, *fimc1_clk,
> +			*fimc0_clk, *parent_clk, *vpll_clk, *csis_clk;
> +
> +	parent_clk = clk_get(NULL, "mout_mpll");
> +	vpll_clk = clk_get(NULL, "mout_vpll");
> +	cam0_clk = clk_get(NULL, "mout_cam0");
> +	cam1_clk = clk_get(NULL, "mout_cam1");
> +	fimc2_clk = clk_get(NULL, "mout_fimc2");
> +	fimc1_clk = clk_get(NULL, "mout_fimc1");
> +	fimc0_clk = clk_get(NULL, "mout_fimc0");
> +	csis_clk = clk_get(NULL, "mout_csis");

Shouldn't you check clk_get() return value with IS_ERR()?

You can do one big check here and than just do clk_put() if !IS_ERR(), i.e.

if (IS_ERR(parent_clk) || IS_ERR(vpll_clk) || ...)
...

clk_set_parent()
...

if (!IS_ERR(parent_clk))
	clk_put(parent_clk);
...

> +	clk_set_parent(cam0_clk, vpll_clk);
> +	clk_set_parent(cam1_clk, vpll_clk);
> +	clk_set_parent(fimc2_clk, parent_clk);
> +	clk_set_parent(fimc1_clk, parent_clk);
> +	clk_set_parent(fimc0_clk, parent_clk);
> +	clk_set_parent(csis_clk, parent_clk);
> +
> +	clk_put(parent_clk);
> +	clk_put(vpll_clk);
> +	clk_put(cam0_clk);
> +	clk_put(cam1_clk);
> +	clk_put(fimc2_clk);
> +	clk_put(fimc1_clk);
> +	clk_put(fimc0_clk);
> +}
> +
>  /* KEYPAD */
>  static uint32_t keymap[] __initdata = {
>  	/* KEY(row, col, keycode) */
> @@ -931,6 +975,10 @@ static void __init goni_machine_init(void)
>  	s3c_i2c2_set_platdata(&i2c2_data);
>  	i2c_register_board_info(2, i2c2_devs, ARRAY_SIZE(i2c2_devs));
>  
> +	/* FIMD AND FIMC set clock config */
> +	set_fimd_clock();
> +	set_fimc_clock();
> +
>  	/* PMIC */
>  	goni_pmic_init();
>  	i2c_register_board_info(AP_I2C_GPIO_PMIC_BUS_4, i2c_gpio_pmic_devs,

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
