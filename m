From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Fix min voltage for vdd_arm on Arndale
Date: Tue, 10 Dec 2013 06:34:01 +0900
Message-ID: <52A63749.9020705@samsung.com>
References: <1385543725-24037-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51118 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab3LIVeH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:34:07 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so6197704pbc.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:34:05 -0800 (PST)
In-Reply-To: <1385543725-24037-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 11/27/13 18:15, Sachin Kamat wrote:
> The minimum recommended ARM voltage for Exynos5250 at 200MHz
> on Arndale board is 0.9125V. Update accordingly.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index bbfb23f942e1..6c92c4a827dc 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -266,7 +266,7 @@
>
>   				buck2_reg: BUCK2 {
>   					regulator-name = "vdd_arm";
> -					regulator-min-microvolt =<925000>;
> +					regulator-min-microvolt =<912500>;
>   					regulator-max-microvolt =<1300000>;
>   					regulator-always-on;
>   					regulator-boot-on;

OK, applied.

Thanks,
Kukjin
