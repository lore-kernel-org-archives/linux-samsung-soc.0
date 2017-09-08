From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/6] [media] exynos-gsc: Remove unnecessary compatible
Date: Fri, 8 Sep 2017 13:24:05 +0200
Message-ID: <CAJKOXPfyrH66X3iPLaXK_OJgadU6HByyjTwfp_6xYasq8cS-Lw@mail.gmail.com>
References: <CGME20170908060309epcas1p4061542ce39ddfdd385b1b6b51eda2ace@epcas1p4.samsung.com>
 <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com> <1504850560-27950-6-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504850560-27950-6-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 8, 2017 at 8:02 AM, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Currently, the compatible('samsung,exynos5-gsc') is not used.
> Remove unnecessary compatible.
>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/exynos5-gsc.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> index daa56d5..1ea05f1 100644
> --- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> @@ -3,9 +3,9 @@
>  G-Scaler is used for scaling and color space conversion on EXYNOS5 SoCs.
>
>  Required properties:
> -- compatible: should be "samsung,exynos5-gsc" (for Exynos 5250, 5420 and
> -             5422 SoCs) or "samsung,exynos5433-gsc" (Exynos 5433)
> -             or "samsung,exynos5250-gsc" or "samsung,exynos5420-gsc"
> +- compatible: should be "samsung,exynos5250-gsc", "samsung,exynos5420-gsc"
> +             or "samsung,exynos5433-gsc" (for Exynos 5250, 5420, 5422,
> +             and 5433 SoCs)

You should not remove the compatible (neither here nor in the driver)
but mark it as deprecated. Removal should happen slightly later.

Best regards,
Krzysztof

>  - reg: should contain G-Scaler physical address location and length.
>  - interrupts: should contain G-Scaler interrupt number
>
> @@ -16,7 +16,7 @@ Optional properties:
>  Example:
>
>  gsc_0:  gsc@0x13e00000 {
> -       compatible = "samsung,exynos5-gsc";
> +       compatible = "samsung,exynos5250-gsc;
>         reg = <0x13e00000 0x1000>;
>         interrupts = <0 85 0>;
>  };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
