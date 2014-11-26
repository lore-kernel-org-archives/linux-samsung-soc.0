From: Alim Akhtar <alim.akhtar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] arm64: exynos: Add bus1 pinctrl node on exynos7
Date: Wed, 26 Nov 2014 18:59:01 +0530
Message-ID: <CAGOxZ52XtT-Aq-HJFq7GAzfAq6GEdrzKeez_=fwJR-Z2rkUF+g@mail.gmail.com>
References: <CAGOxZ53TUvZhSDLfeCuyvBwVcrkQhFnftQzk1DbkU_krdoFbZA@mail.gmail.com>
 <1416834381-11314-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416834381-11314-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On Mon, Nov 24, 2014 at 6:36 PM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> BUS1 pinctrl provides gpios for usb and power regulator
> available on exynos7-espresso board. So add relevant device
> node for pinctrl-bus1.
>
> Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>
Looks good to me.
Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> This patch was part of series:
> "[PATCH 00/11] Exynos7: Adding USB 3.0 support"
>  https://lkml.org/lkml/2014/11/21/247
>
> Changes since V1:
>  - Added support for all pin banks which are part of BUS1 pin controller.
>
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi |   82 +++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi         |    7 ++
>  2 files changed, 89 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> index 2eef4a2..c367f0a 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> @@ -335,6 +335,88 @@
>         };
>  };
>
> +&pinctrl_bus1 {
> +       gpf0: gpf0 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpf1: gpf1 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpf2: gpf2 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpf3: gpf3 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpf4: gpf4 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpf5: gpf5 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg1: gpg1 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg2: gpg2 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gph1: gph1 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpv6: gpv6 {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
>  &pinctrl_nfc {
>         gpj0: gpj0 {
>                 gpio-controller;
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index 1d9e4c9..e633b02 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -26,6 +26,7 @@
>                 pinctrl5 = &pinctrl_ese;
>                 pinctrl6 = &pinctrl_fsys0;
>                 pinctrl7 = &pinctrl_fsys1;
> +               pinctrl8 = &pinctrl_bus1;
>         };
>
>         cpus {
> @@ -242,6 +243,12 @@
>                         interrupts = <0 383 0>;
>                 };
>
> +               pinctrl_bus1: pinctrl@14870000 {
> +                       compatible = "samsung,exynos7-pinctrl";
> +                       reg = <0x14870000 0x1000>;
> +                       interrupts = <0 384 0>;
> +               };
> +
>                 pinctrl_nfc: pinctrl@14cd0000 {
>                         compatible = "samsung,exynos7-pinctrl";
>                         reg = <0x14cd0000 0x1000>;
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
