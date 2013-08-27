From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/4] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Tue, 27 Aug 2013 11:30:09 +0200
Message-ID: <521C71A1.4070609@samsung.com>
References: <1377595171-31116-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11511 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752824Ab3H0JaM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 05:30:12 -0400
In-reply-to: <1377595171-31116-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: linus.walleij@linaro.org, t.figa@samsung.com, thomas.abraham@linaro.org, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

Just a few nits...

On 08/27/2013 11:19 AM, Mateusz Krawczuk wrote:
> This patch implements pinctrl for s5pv210 and adds required device tree bindings.

Would be good to wrap this to not exceed 80 columns.

> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> ---
[...]
> diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
> index a74b3cb..fc3e1d7 100644
> --- a/drivers/pinctrl/pinctrl-exynos.c
> +++ b/drivers/pinctrl/pinctrl-exynos.c
> @@ -660,6 +660,64 @@ static void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  			exynos_pinctrl_resume_bank(drvdata, bank);
>  }
>  
> +/* pin banks of s5pv210 pin-controller */
> +static struct samsung_pin_bank s5pv210_pin_banks0[] = {

Couldn't it be 'static const' ?

> +	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
> +	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
> +	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpb", 0x08),
> +	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpc0", 0x0c),
> +	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpc1", 0x10),
> +	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
> +	EXYNOS_PIN_BANK_EINTG(4, 0x0C0, "gpd1", 0x18),
> +	EXYNOS_PIN_BANK_EINTG(5, 0x0E0, "gpe0", 0x1c),

How about consistently using lower case for the hex numbers ?

--
Thanks,
Sylwester
