From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/4] Documentation: dt-bindings: Describe SROMc configuration
Date: Fri, 13 Nov 2015 10:02:52 -0600
Message-ID: <CAL_JsqLfzGjNwH=kqwcZXvPRSc_m1NgxhFcenu6L1Efva+k9Fw@mail.gmail.com>
References: <cover.1447333689.git.p.fedin@samsung.com> <e9e18ab5aa7a147aaa63d1900ad52174413e86d9.1447333689.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e9e18ab5aa7a147aaa63d1900ad52174413e86d9.1447333689.git.p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Nov 12, 2015 at 7:12 AM, Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add documentation for new subnode properties, allowing bank configuration.
> Based on u-boot implementation, but heavily reworked.
>
> Also, fix size of SROMc mapping in the example.
>
> Signed-off-by: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

One nit below.

>                 compatible = "samsung,exynos-srom";
> -               reg = <0x12570000 0x10>;
> +               reg = <0x12570000 0x14>;
> +
> +               ethernet@3 {

This should actually be "ethernet@3,0"

Fields (not cells) in the unit address should be separated by commas.

> +                       compatible = "smsc,lan9115";
> +                       reg = <3 0 0x10000>;       // Bank 3, offset = 0
> +                       phy-mode = "mii";
> +                       interrupt-parent = <&gpx0>;
> +                       interrupts = <5 8>;
> +                       reg-io-width = <2>;
> +                       smsc,irq-push-pull;
> +                       smsc,force-internal-phy;
> +
> +                       samsung,srom-page-mode = <1>;
> +                       samsung,srom-timing = <9 12 1 9 1 1>;
> +               };
>         };
> --
> 2.4.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
