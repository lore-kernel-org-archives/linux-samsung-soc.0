From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 2/2] ARM: dts: ODROID i2c improvements
Date: Tue, 12 Aug 2014 15:11:19 +0200
Message-ID: <CAAObsKBQz=K2ssjCP6tBCkZ4m+XnvX8ZZAszrxE0CAxU=1ZHjw@mail.gmail.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com> <1405500606-5752-2-git-send-email-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:54940 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291AbaHLNLk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 09:11:40 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so9828632wgh.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2014 06:11:39 -0700 (PDT)
In-Reply-To: <1405500606-5752-2-git-send-email-drake@endlessm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Tested on an Odroid-U2:

Tested-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Thanks,

Tomeu

On 16 July 2014 10:50, Daniel Drake <drake@endlessm.com> wrote:
> Increase max i2c bus frequency beyond the default for faster
> data transfers. According to the manual, these faster speeds are
> only available when the board is wired up the right way. In this case,
> the vendor kernel has run at this speed for a long time.
>
> sda-delay is needed for talking to RTC on PMIC, otherwise the i2c
> controller never sees an ACK. Strangely the other PMIC i2c slave (the
> main one) works fine even without this delay. I Chose value 100 to
> match the vendor kernel.
>
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index cb6f55f..adadaf9 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -134,6 +134,8 @@
>         i2c@13860000 {
>                 pinctrl-0 = <&i2c0_bus>;
>                 pinctrl-names = "default";
> +               samsung,i2c-sda-delay = <100>;
> +               samsung,i2c-max-bus-freq = <400000>;
>                 status = "okay";
>
>                 usb3503: usb3503@08 {
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
