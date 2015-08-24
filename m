From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/7] Exynos4412-based Trats2 USB gadget (DWC2) fixes
Date: Mon, 24 Aug 2015 16:16:59 +0900
Message-ID: <55DAC4EB.9030304@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20678 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906AbbHXHRJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 03:17:09 -0400
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Kamil Debski <k.debski@samsung.com>, Mark Brown <broonie@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>

On 21.08.2015 21:38, Marek Szyprowski wrote:
> Dear All,
> 
> Since v3.19 s3c-hsotg (DWC2) USB controller stopped working on
> Exynos4412-based Trats2 platform. However on Odroid-U3 (which is also
> Exynos4412-based) it worked fine all the time. After long investigation
> it turned out that this was caused by 2 independent issues.
> 
> First issue was caused by patch 7eec1266751bd3a25e35ce88686634c768fedc24
> ("ARM: dts: Add Maxim 77693 PMIC to exynos4412-trats2") added support
> for Maxim 77693 regulators, but without defining consumers for them.
> This causes regulator core to disable them. However SAFEOUT1 regulator
> provides power supply to VBUS signal, which also power some USB phy
> related parts of Exynos SoC core. This has been fixed by patches 1-3,
> which adds support for VBUS regulator, defines them in DTS for all
> Exynos platforms and changes probe sequence of the drivers to ensure no
> deferred probe occurs (USB gadget subsystem doesn't support deferred
> probe yet).
> 
> Second issue is related to DWC2 driver rewrite and host/gadget/dual-role
> integration code. DWC2 module on some platforms needs three additional
> hardware resources: phy, clock and power supply. All of them must be
> enabled/activated to properly initialize and operate. This was initially
> handled in s3c-hsotg driver, which has been converted to 'gadget' part
> of dwc2 driver. Unfortunately, not all of this code got moved to common
> platform code, what resulted in accessing DWC2 registers without
> enabling power supply regulators and clock. This caused initialization
> failure on Exynos4412-based Trats2. Odroid U3 board worked fine, because
> power supplies used by DWC2 module are marked there as 'always-on',
> because they are also used by other modules (USB hub) and clock was
> shared with USB2 PHY, so it was already enabled. This initialization
> issue has been fixed by the last patch. While preparing it I've also
> fixed a few minor issues found in nearby code (patches 4-6).
> 
> I would like to get those patches merged separately to respective
> subsystem trees:
> patch 1: phy subsystem tree
> patch 2: Samsung Exynos tree
> patch 3: regulator subsystem tree
> patch 4-7: USB gadget subsystem tree
> 
> Patches have been prepared on top of linux-next from 20150821.

Entire patchset tested on Trats2 board:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
