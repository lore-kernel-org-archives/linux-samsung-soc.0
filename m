From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] ARM: S3C24XX: add devicetree support for smdk2416
Date: Tue, 21 May 2013 01:07:35 +0900
Message-ID: <519A4A47.1010300@samsung.com>
References: <201304131606.48278.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:51092 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756950Ab3ETQHj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 12:07:39 -0400
Received: by mail-da0-f48.google.com with SMTP id h32so3986814dak.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 09:07:38 -0700 (PDT)
In-Reply-To: <201304131606.48278.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On 04/13/13 23:06, Heiko St=C3=BCbner wrote:
> Definitions in s3c24xx.dtsi are usable for all s3c24xx SoCs, but some
> need to be extended with proper compatible properties, as can be seen
> in s3c2416.dtsi .
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> Reviewed-by: Sylwester Nawrocki<s.nawrocki@samsung.com>

Looks good to me, applied, thanks.

- Kukjin

> ---
> changes since v1:
>    fix compatible property of default irq controller
>    (the correct one is samsung,s3c2410-irq)
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
