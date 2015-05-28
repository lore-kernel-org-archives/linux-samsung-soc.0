From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Thu, 28 May 2015 13:00:36 +0900
Message-ID: <025901d098fa$da62d320$8f287960$@samsung.com>
References: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
 <55667652.5050102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34844 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbbE1EAi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 00:00:38 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP10339GKGVXV70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 13:00:31 +0900 (KST)
In-reply-to: <55667652.5050102@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, kgene@kernel.org, k.kozlowski@samsung.com
Cc: cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com

Hi,

> -----Original Message-----
> From: Joonyoung Shim [mailto:jy0922.shim@samsung.com]
> Sent: Thursday, May 28, 2015 10:59 AM
> To: Chanho Park; kgene@kernel.org; k.kozlowski@samsung.com
> Cc: cw00.choi@samsung.com; linux-samsung-soc@vger.kernel.org;
> javier.martinez@collabora.co.uk; khilman@linaro.org;
> sjoerd.simons@collabora.co.uk; heesub.shin@samsung.com
> Subject: Re: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
> 
> Hi Chanho,
> 
> On 05/28/2015 12:15 AM, Chanho Park wrote:
> > The odroid-xu3 board which is based on exynos5422 not exynos5800 is
> > booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu
> order
> > is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
> > cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
> > and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7
> and
> > cpu4-7 are cortex-a15.
> 
> The exynos5422 SoC can boot using cortex-a15 cpu depending on gpio
> GPG2CON[1],

Yes, But, the pin is not controllable because it's checked in  the iROM
area.

> i think this is just Odroid-XU3 board problem. Is it
> possible to overwrite cpus information directly from
> exynos5422-odroidxu3.dts?

It's possible to override the info in the odroidxu3.dts. As you know,
however, a new exynos5422 board will be added soon. The board also has same
configuration of the gpio pin and booted cpu0 from a cortex-a7 core.

BTW, booting of secondary cpus are still broken. Is there any progress of
the patch[1]?
This patch is also generated top of the patch with some fixes.

[1]. http://www.spinics.net/lists/linux-samsung-soc/msg39523.html

Best Regards,
Chanho Park
