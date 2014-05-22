From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCHv5 0/4] Enable usbphy and hsotg for exynos4
Date: Fri, 23 May 2014 03:32:55 +0900
Message-ID: <537E42D7.7050608@samsung.com>
References: <1400551590-7772-1-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:59145 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbaEVSdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:33:00 -0400
In-Reply-To: <1400551590-7772-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org

On 05/20/14 11:06, Chanho Park wrote:
> This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
> phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
> syscon phandles.
>
> Changes from v4:
>   - Correct 4212/4412 PMU syscon node according to documentation
>
> Change from v3:
>   - Place a status field at the end of the nodes for readability
>
> Change from v2:
>   - Split 4x12 compatibles to 4212 and 4412
>
> Changes from v1: Applied Tomasz Figa's comments
>   - Document PMU syscon compatibles for exynos4210/4x12
>   - Use clock macro instead of raw clock number
>   - Correct phy name to "usb2-phy"
>
> Chanho Park (4):
>    ARM: dts: exynos4: add PMU syscon node
>    ARM: dts: exynos4: add exynos_usbphy node
>    ARM: dts: exynos4: add hsotg device node
>    ARM: dts: exynos4412-trats2: enable usb nodes
>
>   .../devicetree/bindings/arm/samsung/pmu.txt        |  3 +++
>   arch/arm/boot/dts/exynos4.dtsi                     | 26 ++++++++++++++++++++++
>   arch/arm/boot/dts/exynos4412-trats2.dts            | 10 +++++++++
>   arch/arm/boot/dts/exynos4412.dtsi                  |  4 ++++
>   arch/arm/boot/dts/exynos4x12.dtsi                  |  9 ++++++++
>   5 files changed, 52 insertions(+)
>
Looks good to me, applied.

Thanks,
Kukjin
