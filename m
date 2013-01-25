From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6] Initial Device Tree support for S3C64xx
Date: Fri, 25 Jan 2013 11:25:12 -0800
Message-ID: <017001cdfb31$b44bd3d0$1ce37b70$@samsung.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
 <1689405.9Ne2g34LZt@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28442 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757234Ab3AYTZg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 14:25:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH700CHO4MM3OG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 04:25:34 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700JUD4MIQL50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 04:25:34 +0900 (KST)
In-reply-to: <1689405.9Ne2g34LZt@flatron>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk

Tomasz Figa wrote:
> 
> On Sunday 13 of January 2013 02:10:52 Tomasz Figa wrote:
> > This series is adds Device Tree support for Samsung S3C64xx SoC series.
> >
> > It fixes several problems preventing from booting an S3C64xx-based
> > system using Device Tree, adds all the infrastructure for Device
> > Tree-based board support, including mach-s3c64xx-dt and dts include
> > files for S3C64xx SoCs, and (very) basic device tree source for
> > FriendlyARM Mini6410 board.
> >
> > Current support is very limited and allows only basic bootup with UART
> > and SDHCI, but should be fine as a start and will be extended in
> > future, hopefully with help of S3C64xx board maintainers.
> >
> > Tomasz Figa (6):
> >   ARM: common: vic: Parse interrupt and resume masks from device tree
> >   ARM: common: vic: Fix invalid first IRQ number in OF-based
> >     registration
> >   ARM: s3c64xx: Add support for OF-based VIC initialization
> >   ARM: s3c64xx: Add board file for boot using Device Tree
> >   ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
> >   ARM: dts: Add dts file for S3C6410-based Mini6410 board
> >
> >  Documentation/devicetree/bindings/arm/vic.txt |  6 ++
> >  arch/arm/boot/dts/Makefile                    |  1 +
> >  arch/arm/boot/dts/s3c6400.dtsi                | 33 +++++++++
> >  arch/arm/boot/dts/s3c6410-mini6410.dts        | 50 ++++++++++++++
> >  arch/arm/boot/dts/s3c6410.dtsi                | 33 +++++++++
> >  arch/arm/boot/dts/s3c64xx.dtsi                | 97
> > +++++++++++++++++++++++++++ arch/arm/common/vic.c
> >   |  9 ++-
> >  arch/arm/mach-s3c64xx/Kconfig                 | 13 ++++
> >  arch/arm/mach-s3c64xx/Makefile                |  1 +
> >  arch/arm/mach-s3c64xx/common.c                | 16 +++++
> >  arch/arm/mach-s3c64xx/common.h                |  4 ++
> >  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       | 84
> > +++++++++++++++++++++++ 12 files changed, 345 insertions(+), 2
> > deletions(-)
> >  create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
> >  create mode 100644 arch/arm/boot/dts/s3c6410-mini6410.dts
> >  create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
> >  create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
> >  create mode 100644 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> 
> Any other comments on this series?
> 
Looks good to me. But would be better if the vic changes could get ack ;-)

Thanks.

- Kukjin
