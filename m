From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Fri, 13 Jul 2012 20:28:18 +0900
Message-ID: <117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60895 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754938Ab2GML2U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 07:28:20 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7300JSWJV7TVO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M73002GIJV7BIA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:19 +0900 (KST)
In-reply-to: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>, linux@roeck-us.net

Amit Daniel Kachhap wrote:
> 
> These TMU enablement patches are needed for exynos4 and exynos5 TMU
> driver patches sent earlier. The link for those are
> http://www.spinics.net/lists/lm-sensors/msg35858.html.
> 
How was going on above patches? I can't see them you said in linux-next now,
it means if I apply this series in my tree, problem will be happened :(

Note1: I've seen Rafael's updating exynos4_tmu patch which is using struct
dev_pm_ops for pm and applied by Guenter.

Note2: would be helpful if you could do adding me in Cc of exynos tmu
patches...

> Also patch 1 depends on combiner dt node patch sent by Thomas Abraham.
> (http://www.spinics.net/lists/arm-kernel/msg184129.html)
> 
Already in my tree.

> This patchset is based Samsung Maintainer's tree,
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-
> next
> 
OK.

> Amit Daniel Kachhap (2):
>   ARM: exynos4: Add devicetree node for TMU driver
>   ARM: exynos5: Add devicetree node for TMU driver
> 
>  arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
>  arch/arm/boot/dts/exynos5250.dtsi        |    6 ++++++
>  arch/arm/mach-exynos/clock-exynos4.c     |    5 +++++
>  arch/arm/mach-exynos/clock-exynos5.c     |    5 +++++
>  arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
>  arch/arm/mach-exynos/include/mach/map.h  |    3 +++
>  arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
>  arch/arm/mach-exynos/mach-exynos5-dt.c   |    2 ++
>  8 files changed, 33 insertions(+), 0 deletions(-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
