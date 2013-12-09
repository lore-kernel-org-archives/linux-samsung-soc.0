From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add missing op_mode property to PMIC on
 Arndale
Date: Tue, 10 Dec 2013 06:34:41 +0900
Message-ID: <52A63771.60209@samsung.com>
References: <1385543663-23582-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:50679 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab3LIVeq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:34:46 -0500
Received: by mail-pd0-f171.google.com with SMTP id z10so5932257pdj.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:34:46 -0800 (PST)
In-Reply-To: <1385543663-23582-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 11/27/13 18:14, Sachin Kamat wrote:
> Though the default value is 1, add it explicitly to avoid
> unnecessary boot warnings and for consistency.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index e1d79efadf02..6c92c4a827dc 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -302,11 +302,13 @@
>   				buck7_reg: BUCK7 {
>   					regulator-name = "PVDD_BUCK7";
>   					regulator-always-on;
> +					op_mode =<1>;
>   				};
>
>   				buck8_reg: BUCK8 {
>   					regulator-name = "PVDD_BUCK8";
>   					regulator-always-on;
> +					op_mode =<1>;
>   				};
>
>   				buck9_reg: BUCK9 {

OK, applied.

Thanks,
Kukjin
