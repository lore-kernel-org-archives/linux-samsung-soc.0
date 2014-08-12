From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Tue, 12 Aug 2014 15:06:20 +0200
Message-ID: <CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:51107 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810AbaHLNGl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 09:06:41 -0400
Received: by mail-we0-f179.google.com with SMTP id u57so9972210wes.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2014 06:06:40 -0700 (PDT)
In-Reply-To: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, liquid.acid@gmx.net, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Tested on an Odroid-U2:

Tested-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Thanks,

Tomeu


On 16 July 2014 10:50, Daniel Drake <drake@endlessm.com> wrote:
> The ODROID kernel shows that the PMIC interrupt line is hooked up
> to pin GPX3-2.
>
> This is needed for the max77686-irq driver to create the PMIC IRQ
> domain, which is needed by max77686-rtc.
>
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 6d6d23c..cb6f55f 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -148,6 +148,10 @@
>
>                 max77686: pmic@09 {
>                         compatible = "maxim,max77686";
> +                       interrupt-parent = <&gpx3>;
> +                       interrupts = <2 0>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&max77686_irq>;
>                         reg = <0x09>;
>                         #clock-cells = <1>;
>
> @@ -368,4 +372,11 @@
>                 samsung,pins = "gpx1-3";
>                 samsung,pin-pud = <0>;
>         };
> +
> +       max77686_irq: max77686-irq {
> +               samsung,pins = "gpx3-2";
> +               samsung,pin-function = <0>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <0>;
> +       };
>  };
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
