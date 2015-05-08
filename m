From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Fix typo in trip point temperature forexynos5420/5440
Date: Sat, 09 May 2015 03:10:04 +0900
Message-ID: <554CFBFC.7010604@kernel.org>
References: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48310 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752214AbbEHSKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 14:10:09 -0400
In-Reply-To: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: kgene@kernel.org, k.kozlowski@samsung.com, l.majewski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

On 05/07/15 17:54, Abhilash Kesavan wrote:
> Remove the extra zero in the "cpu-crit-0" trip point for exynos5420
> and exynos5440.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-trip-points.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5440-trip-points.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-trip-points.dtsi b/arch/arm/boot/dts/exynos5420-trip-points.dtsi
> index 5d31fc1..2180a01 100644
> --- a/arch/arm/boot/dts/exynos5420-trip-points.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-trip-points.dtsi
> @@ -28,7 +28,7 @@ trips {
>  		type = "active";
>  	};
>  	cpu-crit-0 {
> -		temperature = <1200000>; /* millicelsius */
> +		temperature = <120000>; /* millicelsius */
>  		hysteresis = <0>; /* millicelsius */
>  		type = "critical";
>  	};
> diff --git a/arch/arm/boot/dts/exynos5440-trip-points.dtsi b/arch/arm/boot/dts/exynos5440-trip-points.dtsi
> index 48adfa8..356e963 100644
> --- a/arch/arm/boot/dts/exynos5440-trip-points.dtsi
> +++ b/arch/arm/boot/dts/exynos5440-trip-points.dtsi
> @@ -18,7 +18,7 @@ trips {
>  		type = "active";
>  	};
>  	cpu-crit-0 {
> -		temperature = <1050000>; /* millicelsius */
> +		temperature = <105000>; /* millicelsius */
>  		hysteresis = <0>; /* millicelsius */
>  		type = "critical";
>  	};

Applied into fixes.

Thanks,
Kukjin
