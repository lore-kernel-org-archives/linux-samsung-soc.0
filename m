From: Vikas Sajjan <sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: Add PMU reg node to exynos4210
Date: Thu, 24 Apr 2014 17:29:57 +0530
Message-ID: <CAGm_ybjfxprtLUX6Vs8QVvXoMOaHez4-Og8a9n3UevibvmzbZA@mail.gmail.com>
References: <1396425778-4379-1-git-send-email-pankaj.dubey@samsung.com>
	<1396425778-4379-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396425778-4379-2-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chow.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

+Tomasz


On Wed, Apr 2, 2014 at 1:32 PM, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds pmu regnode to exynos4210 dtsi to handle
> PMU register access via DT.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index cacf614..0a2c0fe 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -81,6 +81,11 @@
>                 interrupts = <2 2>, <3 2>;
>         };
>
> +       pmu_system_controller: system-controller@10020000 {
> +               compatible = "samsung,exynos4210-pmu", "syscon";
> +               reg = <0x10020000 0x5000>;

Can we have 2 strings as "compatible" and these 2 strings are used by
2 different driver?

Because once syscon driver gets probed, exynos-pmu.c [1] driver will
never be probed.

The new PMU driver [1] completely relies on this. With just
exynos_defconfig, you will not notice this issue, since syscon is NOT
enabled by exynos_defconfig. When I enabled "System Controller
Register R/W Based on Regmap" in menuconfig, I could see PMU driver
[1] is NEVER probed.

Let me know, if I am missing something.

 [1] http://www.spinics.net/lists/arm-kernel/msg319750.html


> +       };
> +
>         pinctrl_0: pinctrl@11400000 {
>                 compatible = "samsung,exynos4210-pinctrl";
>                 reg = <0x11400000 0x1000>;
> --
> 1.7.10.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
