From: Alim Akhtar <alim.akhtar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: Fix drive strength of sd0_xxx pin definitions
Date: Wed, 18 Jan 2017 22:40:42 +0900
Message-ID: <CAGOxZ50aXxVitrgS6EXLbZdip0M7Xb0AwmSUvb7diVFVBK5OLw@mail.gmail.com>
References: <CGME20170118053953epcas1p18e06184783a0edc6a2cfc3b6a9d9ce31@epcas1p1.samsung.com>
 <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com> <1484718141-28785-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484718141-28785-2-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kgene <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, Jan 18, 2017 at 2:42 PM, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> As per Exynos7 datasheet FSYS1 pinctrl block does not support drive
> strength value of 0x3. This patch fixes this and update the correct
> drive strength for sd0_xxx pin definitions.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
Looks good.
Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> index 8232198..7ebb939 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> @@ -497,49 +497,49 @@
>                 samsung,pins = "gpr0-0";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <0>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_cmd: sd0-cmd {
>                 samsung,pins = "gpr0-1";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <3>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_ds: sd0-ds {
>                 samsung,pins = "gpr0-2";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <1>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_qrdy: sd0-qrdy {
>                 samsung,pins = "gpr0-3";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <1>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_bus1: sd0-bus-width1 {
>                 samsung,pins = "gpr1-0";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <3>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_bus4: sd0-bus-width4 {
>                 samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <3>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd0_bus8: sd0-bus-width8 {
>                 samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
>                 samsung,pin-function = <2>;
>                 samsung,pin-pud = <3>;
> -               samsung,pin-drv = <3>;
> +               samsung,pin-drv = <4>;
>         };
>
>         sd1_clk: sd1-clk {
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
