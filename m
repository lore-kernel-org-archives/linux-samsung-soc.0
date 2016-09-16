From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: usb phy reset for ethernet.
Date: Fri, 16 Sep 2016 10:55:56 +0200
Message-ID: <45aff519-892a-7b3c-f0fd-9f3c1c116e6f@samsung.com>
References: <CGME20160910102333eucas1p1c6562273f27fb7f27749691ac73e9615@eucas1p1.samsung.com>
 <CANAwSgT0f5LiD6O2yogfAJAvrHQqXKYxmMgqHuzv9AsqhSK29g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39628 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757375AbcIPI4E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 04:56:04 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODL00GA3A5C7500@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2016 09:56:00 +0100 (BST)
In-reply-to: <CANAwSgT0f5LiD6O2yogfAJAvrHQqXKYxmMgqHuzv9AsqhSK29g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@debian.org>

On 09/10/2016 12:23 PM, Anand Moon wrote:
> Hi Krzysztof,
> 
> For log time I am trying to understanding the reset for PHY for Odroid XU4
> for ethenet/emmc/sdcard.
> 
> So in-order to reset the PHY I would like to attempt some thing like this below.
> I am trying to understand and modify the driver drivers/regulator/s2mps11.c
> If you thing this approach is good enough. Or their will be another approach.
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index d562530..bed5263 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -369,9 +369,10 @@
>                         };
> 
>                         ldo17_reg: LDO17 {
> -                               regulator-name = "tsp_avdd";
> +                               regulator-name = "vdd_eth";
>                                 regulator-min-microvolt = <3300000>;
>                                 regulator-max-microvolt = <3300000>;
> +                               samsung,ext-control-gpios = <&gpg1 1
> GPIO_ACTIVE_HIGH>;
>                                 regulator-always-on;
>                         };
> 
> Or is there reset core logic for the usb phy to be integrated for
> exynos platform.
> 
> Please let me know your thought on this.

I don't see any correlation between the patch and the goal you
mentioned. An always on regulator, won't be turned off... because it is
always on.

The DTS change above does not introduce any reset-phy logic. You need to
use a proper driver for that.

Best regards,
Krzysztof
