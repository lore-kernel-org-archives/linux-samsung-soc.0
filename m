From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 00/13] ARM: dts: Add camera and magnetometer support for TRATS(2) board
Date: Sat, 06 Jul 2013 01:27:36 +0200
Message-ID: <7005891.8tx3m8lCx1@flatron>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:37289 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966Ab3GEX1n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:27:43 -0400
Received: by mail-ee0-f43.google.com with SMTP id l10so1633829eei.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:27:39 -0700 (PDT)
In-Reply-To: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Sylwester,

On Monday 01 of July 2013 17:22:22 Sylwester Nawrocki wrote:
> This patch series includes some fixes and extensions to the Exynos dts
> files to add the camera and magnetometer sensor support for the TRATS
> and TRATS2 board. It depends on a patch from Tomasz adding initial
> TRATS2 board dts file [1].
> 
> Comparing to the previous version of this patch set I've added a few
> more patches, for the Exynos4210 based TRATS board and a patch adding
> MIPI CSIS/DSIM PHY provider nodes and related properties to the PHY
> consumer nodes.
> 
> This series has been tested with the S5K6A3/FIMC-IS and S5K5BAFX
> (front facing) cameras on top of next-20130627 tag. It can be found
> also at:
> http://git.linuxtv.org/snawrocki/samsung.git/next-20130627-dts-trats-v3
> 
> Detailed changes since v2 are listed in each patch.
> 
> Changes since v1:
>  - enabled pull down in cam-port-{a, b}-clk-idle nodes (1/8)
>  - added node alias for i2c-gpio@0 I2C controller node (7/8).
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg253184.html
> 
> Andrzej Hajda (2):
>   ARM: dts: Add Exynos4210 SoC camera port pinctrl nodes
>   ARM: dts: Add S5K5BA sensor regulator definitions for Trats board
> 
> Jacek Anaszewski (1):
>   ARM: dts: Add AK8975 device node for Exynos4412 TRATS2 board
> 
> Sylwester Nawrocki (10):
>   ARM: dts: Correct camera pinctrl nodes for Exynos4x12 SoCs
>   ARM: dts: Add pinctrl entries for Exynos4x12 FIMC-IS peripherals
>   ARM: dts: Add ISP power domain node for Exynos4x12
>   ARM: dts: Use generic DMA bindings for Exynos4 SPI devices
>   ARM: dts: Add camera subsystem device nodes to exynos4.dtsi
>   ARM: dts: Add camera subsystem nodes to exynos4x12.dtsi
>   ARM: dts: Add camera device nodes for Exynos4412 TRATS2 board
>   ARM: dts: Add camera device nodes for Exynos4210 SoCs
>   ARM: dts: Add FIMC nodes for Exynos4210 Trats board
>   ARM: dts: Add MIPI PHY node to exynos4.dtsi
> 
>  arch/arm/boot/dts/exynos4.dtsi            |  102
> ++++++++++++++++++++++++-- arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 
>  23 ++++++
>  arch/arm/boot/dts/exynos4210-trats.dts    |  103
> ++++++++++++++++++++++----- arch/arm/boot/dts/exynos4210.dtsi         |
>   30 ++++++++
>  arch/arm/boot/dts/exynos4412-trats2.dts   |  110
> +++++++++++++++++++++++++++++ arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> |   61 ++++++++++++++-- arch/arm/boot/dts/exynos4x12.dtsi         | 
> 103 +++++++++++++++++++++++++++ 7 files changed, 503 insertions(+), 29
> deletions(-)

For all the patches I haven't commented on:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
