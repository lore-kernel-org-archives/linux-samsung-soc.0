From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl: dt-bindings: samsung: add drive strength
 macros for Exynos5433
Date: Thu, 29 Dec 2016 13:50:59 +0200
Message-ID: <20161229115059.ncvtakz32vhcfsij@kozik-lap>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084221epcas5p43926b87dccbee0db4045faa5ddca565d@epcas5p4.samsung.com>
 <20161229084211.20442-2-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161229084211.20442-2-andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 29, 2016 at 05:42:08PM +0900, Andi Shyti wrote:
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

Same values as existing. No need to re-define these.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
