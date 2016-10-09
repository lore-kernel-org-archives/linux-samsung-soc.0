From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/17] pinctrl: exynos/samsung: Add header with values
 used for configuration
Date: Sun, 9 Oct 2016 16:04:11 +0900
Message-ID: <CA+Ln22Eotn=dLyA8KYT_6Fnwvp1sTSxzP8DepAFB2P8EUMME6Q@mail.gmail.com>
References: <1472987060-28293-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472987060-28293-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

2016-09-04 20:04 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>
> Hi,
>
> Changes since v2
> ================
> 1. Combine separate patchsets into one. Previously I sent separately the fixes
>    and changes for S3C platforms.
> 2. Fix issues pointed during review.
> 3. Add review tags.
>
> Changes since v1
> ================
> 1. Follow Arnd's suggestion about moving the macros to common place.
> 2. Subjects: replace "GPIO" with "pinctrl".
> 3. There were some major changes here so I did not add Javier's
>    reviewed-by and tested-by tags.
>
> Merging
> =======
> Patches #1 and #2 should probably go through pinctrl tree. In that case I would
> appreciate a stable branch/tag so DTS could base on top of it.
>
> Goal
> ====
> Increase readability:
>         uart0_data: uart0-data {
>                 samsung,pins = "gpa0-0", "gpa0-1";
> -               samsung,pin-function = <2>;
> -               samsung,pin-pud = <0>;
> -               samsung,pin-drv = <0>;
> +               samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +               samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;

I like the idea, thanks for cleaning this up. However I'd like to
bikeshed the prefix a bit. Since the properties are already prefixed
by "samsung,", I think it would make much more sense to also prefix
the generic values with "SAMSUNG_". Of course for soc/family-specific
values, the soc/family name prefix sounds right.

Similarly for rest of the value names, such as SAMSUNG_PIN_PUD instead
of SAMSUNG_PIN_PULL, which obviously sounds more like correct English,
however hurts the consistency and could confuse the people writing new
dts files.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
