From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: S3C24XX: add devicetree support for smdk2416
Date: Sat, 13 Apr 2013 11:40:39 +0200
Message-ID: <51692817.7060501@gmail.com>
References: <201304130153.11653.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:57726 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167Ab3DMJko (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Apr 2013 05:40:44 -0400
Received: by mail-ea0-f173.google.com with SMTP id k11so1515645eaj.18
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Apr 2013 02:40:43 -0700 (PDT)
In-Reply-To: <201304130153.11653.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 04/13/2013 01:53 AM, Heiko St=C3=BCbner wrote:
> Definitions in s3c24xx.dtsi are usable for all s3c24xx SoCs, but some
> need to be extended with proper compatible properties, as can be seen
> in s3c2416.dtsi .
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>

Well done, thanks!

Would be nice to see it in 3.10.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> This patch depends on the not yet merged s3c24xx pinctrl support and
> the samsung-time muliplatform support.
>
>   arch/arm/boot/dts/Makefile              |    1 +
>   arch/arm/boot/dts/s3c2416-pinctrl.dtsi  |  173 ++++++++++++++++++++=
+++++++++++
>   arch/arm/boot/dts/s3c2416-smdk2416.dts  |   72 +++++++++++++
>   arch/arm/boot/dts/s3c2416.dtsi          |   79 ++++++++++++++
>   arch/arm/boot/dts/s3c24xx.dtsi          |   92 ++++++++++++++++
>   arch/arm/mach-s3c24xx/Kconfig           |   12 ++
>   arch/arm/mach-s3c24xx/Makefile          |    1 +
>   arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |   91 ++++++++++++++++
>   8 files changed, 521 insertions(+), 0 deletions(-)
>   create mode 100644 arch/arm/boot/dts/s3c2416-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/s3c2416-smdk2416.dts
>   create mode 100644 arch/arm/boot/dts/s3c2416.dtsi
>   create mode 100644 arch/arm/boot/dts/s3c24xx.dtsi
>   create mode 100644 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
