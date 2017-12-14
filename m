From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: exynos: extend cpuidle support to midas boards
Date: Thu, 14 Dec 2017 14:50:34 +0100
Message-ID: <CAJKOXPfokV3KuipqkYCTmS7xnTR1d_zHOABH_9MLj=3aDQx7EQ@mail.gmail.com>
References: <20171214125015.2611-1-simon@lineageos.org> <20171214125015.2611-5-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214125015.2611-5-simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 14, 2017 at 1:50 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
> Exynos4412 can only use cpuidle when running under a compatible
> bootloader/firmware. The midas family of boards, including trats2,
> have such a firmware, so allow them to use cpuidle.
>
> Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
> ---
>  arch/arm/mach-exynos/exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index 9a9caac1125a..bfd119d7b63f 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -196,7 +196,7 @@ static void __init exynos_dt_machine_init(void)
>  #endif
>         if (of_machine_is_compatible("samsung,exynos4210") ||
>             (of_machine_is_compatible("samsung,exynos4412") &&
> -            of_machine_is_compatible("samsung,trats2")) ||

Please leave trats2 compatible for compatibility with older DTBs, as
part of ABI.

Best regards,
Krzysztof

> +            of_machine_is_compatible("samsung,midas")) ||
>             of_machine_is_compatible("samsung,exynos3250") ||
>             of_machine_is_compatible("samsung,exynos5250"))
>                 platform_device_register(&exynos_cpuidle);
> --
> 2.15.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
