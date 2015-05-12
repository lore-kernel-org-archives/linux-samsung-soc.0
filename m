From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix typo in trip point temperature for
 exynos5420/5440
Date: Tue, 12 May 2015 10:28:55 +0200
Message-ID: <20150512102855.340ebb31@amdc2363>
References: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24894 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932259AbbELI3D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 04:29:03 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO800KK7A8DDS70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 May 2015 17:29:01 +0900 (KST)
In-reply-to: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: kgene@kernel.org, k.kozlowski@samsung.com, linux-arm-kernel@lists.infradead.org, kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org

Hi Abhilash,

> Remove the extra zero in the "cpu-crit-0" trip point for exynos5420
> and exynos5440.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-trip-points.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5440-trip-points.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-trip-points.dtsi
> b/arch/arm/boot/dts/exynos5420-trip-points.dtsi index
> 5d31fc1..2180a01 100644 ---
> a/arch/arm/boot/dts/exynos5420-trip-points.dtsi +++
> b/arch/arm/boot/dts/exynos5420-trip-points.dtsi @@ -28,7 +28,7 @@
> trips { type = "active";
>  	};
>  	cpu-crit-0 {
> -		temperature = <1200000>; /* millicelsius */
> +		temperature = <120000>; /* millicelsius */
>  		hysteresis = <0>; /* millicelsius */
>  		type = "critical";
>  	};
> diff --git a/arch/arm/boot/dts/exynos5440-trip-points.dtsi
> b/arch/arm/boot/dts/exynos5440-trip-points.dtsi index
> 48adfa8..356e963 100644 ---
> a/arch/arm/boot/dts/exynos5440-trip-points.dtsi +++
> b/arch/arm/boot/dts/exynos5440-trip-points.dtsi @@ -18,7 +18,7 @@
> trips { type = "active";
>  	};
>  	cpu-crit-0 {
> -		temperature = <1050000>; /* millicelsius */
> +		temperature = <105000>; /* millicelsius */
>  		hysteresis = <0>; /* millicelsius */
>  		type = "critical";
>  	};

Abhilash, thanks for spotting this mistake.

Acked-by: Lukasz Majewski <l.majewski@samsung.com>

Thanks Krzysztof for picking this fix during my absence :-)

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
