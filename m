From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] pinctrl: dt-bindings: samsung: add drive strength
 macros for Exynos5433
Date: Fri, 30 Dec 2016 15:37:41 +0900
Message-ID: <586600B5.1000903@samsung.com>
References: <20161230041421.24448-1-andi.shyti@samsung.com>
 <CGME20161230041427epcas1p1e4d0dd5e7f9928664c664b7850dbd87a@epcas1p1.samsung.com>
 <20161230041421.24448-3-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161230041421.24448-3-andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andi,

On 2016년 12월 30일 13:14, Andi Shyti wrote:
> Commit 5db7e3bb87df ("pinctrl: dt-bindings: samsung: Add header with
> values used for configuration") has added a header file for defining the
> pinctrl values in order to avoid hardcoded settings in the Exynos
> DTS related files.
> 
> Extend samsung.h to the Exynos5433 for drive strength values
> which are strictly related to the particular SoC and may defer
> from others.
> 
> Signed-off-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  include/dt-bindings/pinctrl/samsung.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
> index 6276eb785e2b..e0ebb20ffdd3 100644
> --- a/include/dt-bindings/pinctrl/samsung.h
> +++ b/include/dt-bindings/pinctrl/samsung.h
> @@ -45,6 +45,20 @@
>  #define EXYNOS5420_PIN_DRV_LV3		2
>  #define EXYNOS5420_PIN_DRV_LV4		3
>  
> +/* Drive strengths for Exynos5433 */
> +#define EXYNOS5433_PIN_DRV_FAST_SR1	0
> +#define EXYNOS5433_PIN_DRV_FAST_SR2	1
> +#define EXYNOS5433_PIN_DRV_FAST_SR3	2
> +#define EXYNOS5433_PIN_DRV_FAST_SR4	3
> +#define EXYNOS5433_PIN_DRV_FAST_SR5	4
> +#define EXYNOS5433_PIN_DRV_FAST_SR6	5
> +#define EXYNOS5433_PIN_DRV_SLOW_SR1	8
> +#define EXYNOS5433_PIN_DRV_SLOW_SR2	9
> +#define EXYNOS5433_PIN_DRV_SLOW_SR3	0xa
> +#define EXYNOS5433_PIN_DRV_SLOW_SR4	0xb
> +#define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
> +#define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
> +
>  #define EXYNOS_PIN_FUNC_INPUT		0
>  #define EXYNOS_PIN_FUNC_OUTPUT		1
>  #define EXYNOS_PIN_FUNC_2		2
> 

Looks good to me. ('SR' means "Slew Rate".)
Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
