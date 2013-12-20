From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable S2MPS11 voltage regulator
Date: Sat, 21 Dec 2013 06:41:36 +0900
Message-ID: <52B4B990.3020709@samsung.com>
References: <1386657521-30924-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:47446 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752852Ab3LTVll (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:41:41 -0500
Received: by mail-pa0-f41.google.com with SMTP id lf10so3166151pab.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:41:40 -0800 (PST)
In-Reply-To: <1386657521-30924-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 12/10/13 15:38, Sachin Kamat wrote:
> S2MPS11 voltage regulator is commonly used on the latest Exynos
> boards like SMDK5420, Arndale-Octa, etc. Hence it makes sense to
> enable it like S5M8767A voltage regulator.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/configs/exynos_defconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index aec8a3ea1436..dbe1f1c47bb0 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -79,6 +79,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_REGULATOR_MAX8997=y
>   CONFIG_REGULATOR_MAX77686=y
> +CONFIG_REGULATOR_S2MPS11=y
>   CONFIG_REGULATOR_S5M8767=y
>   CONFIG_REGULATOR_TPS65090=y
>   CONFIG_FB=y

Applied, thanks.

- Kukjin
