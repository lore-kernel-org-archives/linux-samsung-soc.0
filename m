From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/6] Initial Device Tree support for S3C64xx
Date: Fri, 25 Jan 2013 20:09:44 +0100
Message-ID: <1689405.9Ne2g34LZt@flatron>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:65479 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756547Ab3AYTJr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 14:09:47 -0500
Received: by mail-ea0-f171.google.com with SMTP id c13so299864eaa.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jan 2013 11:09:46 -0800 (PST)
In-Reply-To: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk

On Sunday 13 of January 2013 02:10:52 Tomasz Figa wrote:
> This series is adds Device Tree support for Samsung S3C64xx SoC series.
> 
> It fixes several problems preventing from booting an S3C64xx-based
> system using Device Tree, adds all the infrastructure for Device
> Tree-based board support, including mach-s3c64xx-dt and dts include
> files for S3C64xx SoCs, and (very) basic device tree source for
> FriendlyARM Mini6410 board.
> 
> Current support is very limited and allows only basic bootup with UART
> and SDHCI, but should be fine as a start and will be extended in
> future, hopefully with help of S3C64xx board maintainers.
> 
> Tomasz Figa (6):
>   ARM: common: vic: Parse interrupt and resume masks from device tree
>   ARM: common: vic: Fix invalid first IRQ number in OF-based
>     registration
>   ARM: s3c64xx: Add support for OF-based VIC initialization
>   ARM: s3c64xx: Add board file for boot using Device Tree
>   ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
>   ARM: dts: Add dts file for S3C6410-based Mini6410 board
> 
>  Documentation/devicetree/bindings/arm/vic.txt |  6 ++
>  arch/arm/boot/dts/Makefile                    |  1 +
>  arch/arm/boot/dts/s3c6400.dtsi                | 33 +++++++++
>  arch/arm/boot/dts/s3c6410-mini6410.dts        | 50 ++++++++++++++
>  arch/arm/boot/dts/s3c6410.dtsi                | 33 +++++++++
>  arch/arm/boot/dts/s3c64xx.dtsi                | 97
> +++++++++++++++++++++++++++ arch/arm/common/vic.c                      
>   |  9 ++-
>  arch/arm/mach-s3c64xx/Kconfig                 | 13 ++++
>  arch/arm/mach-s3c64xx/Makefile                |  1 +
>  arch/arm/mach-s3c64xx/common.c                | 16 +++++
>  arch/arm/mach-s3c64xx/common.h                |  4 ++
>  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       | 84
> +++++++++++++++++++++++ 12 files changed, 345 insertions(+), 2
> deletions(-)
>  create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
>  create mode 100644 arch/arm/boot/dts/s3c6410-mini6410.dts
>  create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
>  create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
>  create mode 100644 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c

Any other comments on this series?

Best regards,
Tomasz
