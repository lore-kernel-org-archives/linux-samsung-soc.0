From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCHv4 0/4] Enable usbphy and hsotg for exynos4
Date: Fri, 02 May 2014 20:21:02 +0200
Message-ID: <5363E20E.9010802@gmail.com>
References: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:37793 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193AbaEBSVE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 14:21:04 -0400
In-Reply-To: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com, k.debski@samsung.com

Hi Chanho,

On 02.05.2014 06:26, Chanho Park wrote:
> This patchset enables a exynos4 usbphy and hsotg DT node for exynos4. The usb
> phy node uses generic exynos phy driver. The driver uses PMU syscon and SYSREG
> syscon phandles.
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
>   arch/arm/boot/dts/exynos4x12.dtsi                  |  9 ++++++++
>   4 files changed, 48 insertions(+)
>

Looks good. Feel free to add

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
