From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] pinctrl: samsung: Add GPF support for Exynos5433
Date: Thu, 3 Nov 2016 21:20:02 +0200
Message-ID: <20161103192002.GB12945@kozik-lap>
References: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com>
 <1478155149-28527-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36743 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbcKCTUL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 15:20:11 -0400
Content-Disposition: inline
In-Reply-To: <1478155149-28527-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, andi.shyti@samsung.com, chanwoo@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, Nov 03, 2016 at 03:39:06PM +0900, Chanwoo Choi wrote:
> This patch add the support of GPF[1-5] pin of Exynos5433 SoC. The GPFx need
> to support the multiple memory map because the registers of GPFx are located
> in the different domain.
> 
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

I think that, instead of in previous patch, the
"samsung,exynos5433-pinctrl" compatible should be documented here along
with information that it requires two addresses for mappings.

Best regards,
Krzysztof


> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index d657b52dfdb5..12f7d1eb65bc 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -1339,6 +1339,11 @@ static void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
>  	EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
>  	EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> +	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x020, "gpf1", 0x1004, 1),
> +	EXYNOS_PIN_BANK_EINTW_EXT(4, 0x040, "gpf2", 0x1008, 1),
> +	EXYNOS_PIN_BANK_EINTW_EXT(4, 0x060, "gpf3", 0x100c, 1),
> +	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x080, "gpf4", 0x1010, 1),
> +	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x0a0, "gpf5", 0x1014, 1),
>  };
>  
>  /* pin banks of exynos5433 pin-controller - AUD */
> @@ -1420,6 +1425,7 @@ static void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  		.eint_wkup_init = exynos_eint_wkup_init,
>  		.suspend	= exynos_pinctrl_suspend,
>  		.resume		= exynos_pinctrl_resume,
> +		.nr_ext_resources = 1,
>  	}, {
>  		/* pin-controller instance 1 data */
>  		.pin_banks	= exynos5433_pin_banks1,
> -- 
> 1.9.1
> 
