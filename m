From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: fix incorrect vdd_arm voltage range for Exynos4412
 based boards
Date: Sun, 16 Feb 2014 02:07:46 +0900
Message-ID: <52FF9EE2.4090705@samsung.com>
References: <1390043483-1219-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:32864 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443AbaBORH4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Feb 2014 12:07:56 -0500
Received: by mail-pa0-f43.google.com with SMTP id rd3so13549099pab.16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2014 09:07:55 -0800 (PST)
In-Reply-To: <1390043483-1219-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Dongjin Kim <tobetter@gmail.com>

On 01/18/14 20:11, Thomas Abraham wrote:
> From: Thomas Abraham<thomas.ab@samsung.com>
>
> To allow Exynos4412 based Odroidx and Origen-quad boards to operate between
> 200MHz to 1.4Ghz, update the vdd_arm voltage range to operate between these
> cpu clock speeds.
>
> Cc: Dongjin Kim<tobetter@gmail.com>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4412-odroidx.dts |    2 +-
>   arch/arm/boot/dts/exynos4412-origen.dts  |    4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index 9804fcb..12459b0 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -251,7 +251,7 @@
>   				buck2_reg: BUCK2 {
>   					regulator-name = "vdd_arm";
>   					regulator-min-microvolt =<900000>;
> -					regulator-max-microvolt =<1300000>;
> +					regulator-max-microvolt =<1350000>;
>   					regulator-always-on;
>   					regulator-boot-on;
>   				};
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 6bc0539..388f035 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -459,8 +459,8 @@
>
>   				buck2_reg: BUCK2 {
>   					regulator-name = "vdd_arm";
> -					regulator-min-microvolt =<925000>;
> -					regulator-max-microvolt	=<1300000>;
> +					regulator-min-microvolt =<900000>;
> +					regulator-max-microvolt	=<1350000>;
>   					regulator-always-on;
>   					regulator-boot-on;
>   					op_mode =<1>; /* Normal Mode */

Applied, thanks.

- Kukjin
