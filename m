From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: remove usb2-phy on Exynos5 series SoC
Date: Thu, 12 Mar 2015 18:29:10 +0530
Message-ID: <CAFp+6iHr5pDge7AGfus4uXoe6Oe_Q44B6nzEJYA1==Vb-8PdYA@mail.gmail.com>
References: <1426155007-22189-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426155007-22189-1-git-send-email-jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


On Thu, Mar 12, 2015 at 3:40 PM, Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Exynos5 series SoC does not have usb2-phy on USB3.0 Controller.
> It is controlled by only usb3-phy. So, this patch remove usb2-phy
> property.

Why would you want to remove the usb2-phy property ?
The usb2-phy projected here is actually the UTMI+ phy which is present
as a part of a hybrid PHY controller (that includes both UTMI+ as well
as PIPE3 phys).

And the exynos5-usbdrd phy driver also differentiates between the two PHYs.
It does try to separate out the initializations for UTMI+ and PIPE3
phy, if you notice
the functions:
exynos5_usbdrd_utmi_init() and exynos5_usbdrd_pipe3_init().

I don't think this change seems valid.

>
> Signed-off-by: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    4 ++--
>  arch/arm/boot/dts/exynos5420.dtsi |    8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 9bb1b0b..b58b169 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -565,8 +565,8 @@
>                         compatible = "synopsys,dwc3";
>                         reg = <0x12000000 0x10000>;
>                         interrupts = <0 72 0>;
> -                       phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
> -                       phy-names = "usb2-phy", "usb3-phy";
> +                       phys = <&usbdrd_phy 0>;
> +                       phy-names = "usb3-phy";
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 9dc2e97..0df14bb 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -845,8 +845,8 @@
>                         compatible = "snps,dwc3";
>                         reg = <0x12000000 0x10000>;
>                         interrupts = <0 72 0>;
> -                       phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
> -                       phy-names = "usb2-phy", "usb3-phy";
> +                       phys = <&usbdrd_phy0 0>;
> +                       phy-names = "usb3-phy";
>                 };
>         };
>
> @@ -871,8 +871,8 @@
>                         compatible = "snps,dwc3";
>                         reg = <0x12400000 0x10000>;
>                         interrupts = <0 73 0>;
> -                       phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
> -                       phy-names = "usb2-phy", "usb3-phy";
> +                       phys = <&usbdrd_phy1 1>;
> +                       phy-names = "usb3-phy";
>                 };
>         };
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
