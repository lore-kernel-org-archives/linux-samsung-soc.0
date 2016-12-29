From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/4] pinctrl: dt-bindings: samsung: add drive strength
 macros for Exynos5433
Date: Thu, 29 Dec 2016 18:17:54 +0900
Message-ID: <37b86cdb-b5e9-a5fa-fbb1-46e8d8c90cd8@samsung.com>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084221epcas5p43926b87dccbee0db4045faa5ddca565d@epcas5p4.samsung.com>
 <20161229084211.20442-2-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161229084211.20442-2-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andi,

On 2016년 12월 29일 17:42, Andi Shyti wrote:
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

Exynos5433 has the same value with EXYNOS5420. So, I'd like you to use the EXYNOS5420_PIN_DRV_LVx instead of separate the definitions.

> +
>  #define EXYNOS_PIN_FUNC_INPUT		0
>  #define EXYNOS_PIN_FUNC_OUTPUT		1
>  #define EXYNOS_PIN_FUNC_2		2
> 

-- 
Regards,
Chanwoo Choi
