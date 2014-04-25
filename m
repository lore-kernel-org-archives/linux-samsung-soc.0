From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCHv2 0/4] Enable usbphy and hsotg for exynos4
Date: Fri, 25 Apr 2014 11:03:27 +0200
Message-ID: <535A24DF.2040201@samsung.com>
References: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28801 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877AbaDYJDg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 05:03:36 -0400
In-reply-to: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, devicetree@vger.kernel.org

Hi Chanho,

On 25.04.2014 08:59, Chanho Park wrote:
> This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
> phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
> syscon phandles.
> 
> Changes from v1: Applied Tomasz Figa's comments
>  - Document PMU syscon compatibles for exynos4210/4x12
>  - Use clock macro instead of raw clock number
>  - Correct phy name to "usb2-phy"
> 
> Chanho Park (4):
>   ARM: dts: exynos4: add PMU syscon node
>   ARM: dts: exynos4: add exynos_usbphy node
>   ARM: dts: exynos4: add hsotg device node
>   ARM: dts: exynos4412-trats2: enable usb nodes
> 
>  .../devicetree/bindings/arm/samsung/pmu.txt        |  2 ++
>  arch/arm/boot/dts/exynos4.dtsi                     | 26 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4412-trats2.dts            | 10 +++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  |  9 ++++++++
>  4 files changed, 47 insertions(+)
> 

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
