From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable S2MPS11 voltage regulator
Date: Wed, 18 Dec 2013 23:35:17 +0530
Message-ID: <CAK9yfHxy_xwVX2M9U9HfFOWcqRfh9DpB3XB8K8apB8TM2cQd9w@mail.gmail.com>
References: <1386657521-30924-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:33863 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab3LRSFS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:05:18 -0500
Received: by mail-oa0-f50.google.com with SMTP id n16so8595484oag.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 10:05:18 -0800 (PST)
In-Reply-To: <1386657521-30924-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

 On 10 December 2013 12:08, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> S2MPS11 voltage regulator is commonly used on the latest Exynos
> boards like SMDK5420, Arndale-Octa, etc. Hence it makes sense to
> enable it like S5M8767A voltage regulator.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/configs/exynos_defconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index aec8a3ea1436..dbe1f1c47bb0 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -79,6 +79,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_MAX8997=y
>  CONFIG_REGULATOR_MAX77686=y
> +CONFIG_REGULATOR_S2MPS11=y
>  CONFIG_REGULATOR_S5M8767=y
>  CONFIG_REGULATOR_TPS65090=y
>  CONFIG_FB=y
> --
> 1.7.9.5
>

 Ping Kukjin.

-- 
With warm regards,
Sachin
