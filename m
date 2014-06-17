From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] ARM: dts: remove display power domain for exynos5420
Date: Tue, 17 Jun 2014 11:19:56 +0530
Message-ID: <CAPdUM4OVjRSqVdQDUJZR7vGm1uUEYr31s-tx7Oxs8tM_xc2v7g@mail.gmail.com>
References: <1402313299-18885-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:43776 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752160AbaFQFt6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 01:49:58 -0400
In-Reply-To: <1402313299-18885-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi All,

Please review this patch.

Regards,
Rahul Sharma

On 9 June 2014 16:58, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Display domain is removed due to instability issues. Explaining
> the problem below:
>
> exynos_init_late triggers the pm_genpd_poweroff_unused which
> powers off the unused power domains. This call hits before
> the trigger to deferred probes.
>
> DRM DP Panel defers the probe due to supply get failure. By the
> time, deferred probe is scheduled again, Display Power Domain is
> powered off by pm_genpd_poweroff_unused.
>
> FIMD and DP drivers are accessing registers during Probe and Bind
> callbacks. If display domain is enabled/disabled around register
> accesses, display domain gets unstable and we are getting Power
> Domain Disable fail notification. Increasing the Timeout also
> didn't help.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> based on Kukjin's for-next branch.
>
>  arch/arm/boot/dts/exynos5420.dtsi |    6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index e385322..3d528cf 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -262,11 +262,6 @@
>                 reg = <0x10044060 0x20>;
>         };
>
> -       disp_pd: power-domain@100440C0 {
> -               compatible = "samsung,exynos4210-pd";
> -               reg = <0x100440C0 0x20>;
> -       };
> -
>         msc_pd: power-domain@10044120 {
>                 compatible = "samsung,exynos4210-pd";
>                 reg = <0x10044120 0x20>;
> @@ -518,7 +513,6 @@
>         };
>
>         fimd: fimd@14400000 {
> -               samsung,power-domain = <&disp_pd>;
>                 clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
>                 clock-names = "sclk_fimd", "fimd";
>         };
> --
> 1.7.9.5
>
