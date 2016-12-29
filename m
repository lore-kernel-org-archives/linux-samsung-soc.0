From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [1/4] pinctrl: dt-bindings: samsung: add drive strength macros for
 Exynos5433
Date: Thu, 29 Dec 2016 18:39:31 +0900
Message-ID: <b855ad96-9dd6-9cc3-2353-576d1bd302d8@samsung.com>
References: <20161229084211.20442-2-andi.shyti@samsung.com>
 <CGME20161229093931epcas1p11b118da454a0dbf3a798ba406f35ce54@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33124 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752698AbcL2Jjf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 04:39:35 -0500
In-reply-to: <20161229084211.20442-2-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>

On 12/29/2016 05:42 PM, Andi Shyti wrote:
> Commit 5db7e3bb87df ("pinctrl: dt-bindings: samsung: Add header with
> values used for configuration") has added a header file for defining the
> pinctrl values in order to avoid hardcoded settings in the Exynos
> DTS related files.
> 
> Extend samsung.h to the Exynos5433 for drive strength values
> which are strictly related to the particular SoC and may defer
> from others.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  include/dt-bindings/pinctrl/samsung.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
> index 6276eb785e2b..58868313d64b 100644
> --- a/include/dt-bindings/pinctrl/samsung.h
> +++ b/include/dt-bindings/pinctrl/samsung.h
> @@ -45,6 +45,12 @@
>  #define EXYNOS5420_PIN_DRV_LV3		2
>  #define EXYNOS5420_PIN_DRV_LV4		3
>  
> +/* Drive strengths for Exynos5433 */
> +#define EXYNOS5433_PIN_DRV_LV1		0
> +#define EXYNOS5433_PIN_DRV_LV2		1
> +#define EXYNOS5433_PIN_DRV_LV3		2
> +#define EXYNOS5433_PIN_DRV_LV4		3

Well, i'm not sure..but you needs to compare the other Exynos5 series.
it's difference bit Offset. Did you check it?

I didn't check pinctrl file..if it doesn't apply any exynos5433 pinctrl for drv_strength.
it will work wrong..

Best Regards,
Jaehoon Chung

> +
>  #define EXYNOS_PIN_FUNC_INPUT		0
>  #define EXYNOS_PIN_FUNC_OUTPUT		1
>  #define EXYNOS_PIN_FUNC_2		2
> 
> 
