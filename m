From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] ARM64: dts: exynos5433: remove unused code
Date: Thu, 29 Dec 2016 13:54:21 +0200
Message-ID: <20161229115421.pq52ab57e53xntoz@kozik-lap>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084222epcas5p41dacaeed3e2d4f10b07eee3930f7531c@epcas5p4.samsung.com>
 <20161229084211.20442-5-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36403 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752565AbcL2Ly2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:54:28 -0500
Content-Disposition: inline
In-Reply-To: <20161229084211.20442-5-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>

On Thu, Dec 29, 2016 at 05:42:11PM +0900, Andi Shyti wrote:
> Because the pinctrl DTS is using the samsung.h macros, the
> previously pin defines are anused. Remove them.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> index 9afed9fcf7e1..3c821e5c241e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> @@ -14,19 +14,6 @@
>  
>  #include <dt-bindings/pinctrl/samsung.h>
>  
> -#define PIN_PULL_NONE		0
> -#define PIN_PULL_DOWN		1
> -#define PIN_PULL_UP		3
> -
> -#define PIN_DRV_LV1		0
> -#define PIN_DRV_LV2		2
> -#define PIN_DRV_LV3		1
> -#define PIN_DRV_LV4		3
> -
> -#define PIN_IN			0
> -#define PIN_OUT			1
> -#define PIN_FUNC1		2
> -

This should be squashed with 3/4 because logically it is strictly
related to it and splitting it does not bring any benefits. Actually
while looking at 3/4 I was surprised to see them not removed.

Best regards,
Krzysztof
