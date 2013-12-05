From: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Fix mmc node on exynos5250 snow board
Date: Thu, 5 Dec 2013 10:49:14 -0800
Message-ID: <CAPz6YkUO7tqSa+tU_M4Do5k7dwc6MaCxX3T-3aJtG1=XQFjTRQ@mail.gmail.com>
References: <1386237974-2255-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386237974-2255-1-git-send-email-yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, ALIM AKHTAR <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 5, 2013 at 2:06 AM, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Commits 64c138a ("ARM: dts: Move fifo-depth property from exynos5250
> board dts") and 0c3de788 ("ARM: dts: change status property of dwmmc
> nodes for exynos5250") missed out handling the exynos5250 snow dts file.
> Delete the fifo-depth property and enable the mmc node in the snow dts
> file.
>

Since this is really fixing two different issues, even though they
both affect dw_mmc, would you mind splitting this up into two
different commits?

> Signed-off-by : Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/cros5250-common.dtsi |    7 -------
>  arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
> index 6470536..2dd70e9 100644
> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> @@ -233,7 +233,6 @@
>                 num-slots = <1>;
>                 supports-highspeed;
>                 broken-cd;
> -               fifo-depth = <0x80>;

Why are you deleting fifo-depth?

>                 card-detect-delay = <200>;
>                 samsung,dw-mshc-ciu-div = <3>;
>                 samsung,dw-mshc-sdr-timing = <2 3>;
> @@ -247,14 +246,9 @@
>                 };
>         };
>
> -       mmc@12210000 {
> -               status = "disabled";
> -       };
> -
>         mmc@12220000 {
>                 num-slots = <1>;
>                 supports-highspeed;
> -               fifo-depth = <0x80>;
>                 card-detect-delay = <200>;
>                 samsung,dw-mshc-ciu-div = <3>;
>                 samsung,dw-mshc-sdr-timing = <2 3>;
> @@ -273,7 +267,6 @@
>                 num-slots = <1>;
>                 supports-highspeed;
>                 broken-cd;
> -               fifo-depth = <0x80>;
>                 card-detect-delay = <200>;
>                 samsung,dw-mshc-ciu-div = <3>;
>                 samsung,dw-mshc-sdr-timing = <2 3>;
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index a9395c4..67484d1 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -171,11 +171,20 @@
>                 };
>         };
>
> +       mmc@12200000 {
> +               status = "okay";
> +       };
> +
> +       mmc@12220000 {
> +               status = "okay";
> +       };
> +
>         /*
>          * On Snow we've got SIP WiFi and so can keep drive strengths low to
>          * reduce EMI.
>          */
>         mmc@12230000 {
> +               status = "okay";
>                 slot@0 {
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
