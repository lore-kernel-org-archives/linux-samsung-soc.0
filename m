From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Thu, 28 May 2015 17:43:13 +0900
Message-ID: <030f01d09922$55a2e120$00e8a360$@samsung.com>
References: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
 <55667652.5050102@samsung.com> <025901d098fa$da62d320$8f287960$@samsung.com>
 <5566A7A0.4080608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33716 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbbE1InP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 04:43:15 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP100MAYXJW5J80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 17:43:08 +0900 (KST)
In-reply-to: <5566A7A0.4080608@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>

Hi,

> When adding new 5422 board we can split out CPU configuration to
> separate DTSI file. I already posted patches for Odroid XU3-family
> common DTSI file for XU3 Lite board:
> http://www.spinics.net/lists/linux-samsung-soc/msg44868.html

IMHO, all of the exynos5422 boards will be same cpu configurations. That's
why I added new exynos5422.dtsi.

> 
> > BTW, booting of secondary cpus are still broken. Is there any progress
> of
> > the patch[1]?
> > This patch is also generated top of the patch with some fixes.
> >
> > [1]. http://www.spinics.net/lists/linux-samsung-soc/msg39523.html
> 
> No progress so far. Apparently nobody knows why this works and what to
> do with it. I would suspect booted CPUs stuck somewhere in BL1 or BL2
> and writing to PMU_SPARE2 kicks them. However this is just a guess.
> 
> Kukjin which could be the closest person to the real knowledge (LSI) did
> not gave his feedback.
> 
> We have a lot of such hacks and undocumented interfaces between kernel
> and bootloaders. IMHO it would be good to start documenting them.

Good. But, who can do it?

Best Regards,
Chanho Park
