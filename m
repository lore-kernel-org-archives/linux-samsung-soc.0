From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 07/13] ARM: dts: Add AK8975 device node for Exynos4412 TRATS2 board
Date: Sat, 06 Jul 2013 01:18:46 +0200
Message-ID: <1491290.c836bFtNe2@flatron>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com> <1372692155-17653-8-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:41842 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906Ab3GEXSt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:18:49 -0400
Received: by mail-ee0-f51.google.com with SMTP id e52so1671158eek.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:18:48 -0700 (PDT)
In-Reply-To: <1372692155-17653-8-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Sylwester, Jacek,

On Monday 01 of July 2013 17:22:29 Sylwester Nawrocki wrote:
> From: Jacek Anaszewski <j.anaszewski@samsung.com>
> 
> This patch adds AK8975 magnetometer node and corresponding
> i2c-gpio bus node for TRATS2 board.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts
> b/arch/arm/boot/dts/exynos4412-trats2.dts index 056b835..b9de3b5 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -19,6 +19,10 @@
>  	model = "Samsung Trats 2 based on Exynos4412";
>  	compatible = "samsung,trats2", "samsung,exynos4412";
> 
> +	aliases {
> +		i2c8 = &i2c_ak8975;
> +	};
> +
>  	memory {
>  		reg =  <0x40000000 0x40000000>;
>  	};
> @@ -453,4 +457,19 @@
>  	serial@13830000 {
>  		status = "okay";
>  	};
> +
> +	i2c_ak8975: i2c-gpio@0 {

I think this @0 is slightly incorrect here, as it seems like there is no 
reg property present inside the node and so the device isn't located at 
any address.

For logical indices like in this case I would rather use i2c-gpio-0 
instead.

> +		compatible = "i2c-gpio";
> +		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
> +		i2c-gpio,delay-us = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";
> +
> +		ak8975@0c {
> +			compatible = "asahi-kasei,ak8975";
> +			reg = <0x0c>;
> +			gpios = <&gpj0 7 0>;
> +		};
> +	};
>  };

Otherwise looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
