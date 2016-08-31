From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dts: exynos: Add macros for GPIO configuration
Date: Wed, 31 Aug 2016 14:42:57 +0200
Message-ID: <28320955.k33BrW2NEN@wuerfel>
References: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com> <1472645613-5362-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472645613-5362-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, August 31, 2016 2:13:25 PM CEST Krzysztof Kozlowski wrote:
> 
> +#define PIN_PULL_NONE          0
> +#define PIN_PULL_DOWN          1
> +#define PIN_PULL_UP            3
> +
> +#define PIN_DRV_LV1            0
> +#define PIN_DRV_LV2            2
> +#define PIN_DRV_LV3            1
> +#define PIN_DRV_LV4            3
> +
> +#define PIN_FUNC_INPUT         0
> +#define PIN_FUNC_OUTPUT                1
> +#define PIN_FUNC_SPC_2         2
> +#define PIN_FUNC_SPC_3         3
> +#define PIN_FUNC_SPC_4         4
> +#define PIN_FUNC_SPC_5         5
> +#define PIN_FUNC_SPC_F         0xf

Any reason for having a copy in each of those files instead of one
that is shared across all of them?

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
