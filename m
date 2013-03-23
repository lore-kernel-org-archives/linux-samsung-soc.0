From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 0/4] Initial Device Tree support for S3C64xx
Date: Sat, 23 Mar 2013 13:28:40 +0100
Message-ID: <2474214.PvUtMM3R7F@flatron>
References: <1362860975-18635-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:52771 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836Ab3CWM2l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Mar 2013 08:28:41 -0400
Received: by mail-ee0-f42.google.com with SMTP id b47so2552809eek.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Mar 2013 05:28:40 -0700 (PDT)
In-Reply-To: <1362860975-18635-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>

Hi,

On Saturday 09 of March 2013 21:29:31 Tomasz Figa wrote:
> This series adds Device Tree support for Samsung S3C64xx SoC series.
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
> This series depends on my other series reworking samsung-time for
> multiplatform: [PATCH v3 00/12] ARM: samsung-time: Prepare for
> multiplatform support
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16664
> 
> Changes since v3:
>  - Rebased onto current for-next branch of Kgene's tree
>  - Updated timer node for next version of samsung-time patches
>  - Replaced local s3c64xx_dt_init_irq with irqchip_init
> 
> Changes since v2:
>  - Updated timer node for next version of samsung-time patches
> 
> Changes since v1:
>  - Dropped two VIC-related patches that are no longer necessary
>  - Added Device Tree-based instantation of system timers
>  - Corrected VIC interrupt specifiers
>  - Adjusted CPU compatible values and dropped @id
> 
> Tomasz Figa (4):
>   ARM: common: vic: Parse interrupt and resume masks from device tree
>   ARM: s3c64xx: Add board file for boot using Device Tree
>   ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
>   ARM: dts: Add dts file for S3C6410-based Mini6410 board

Any comments for this series?

Best regards,
Tomasz
