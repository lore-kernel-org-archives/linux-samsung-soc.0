From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/4] ARM: Samsung: Add board setup for M-5MOLS and
 NOON010PC30 camera sensors
Date: Wed, 21 Sep 2011 20:52:14 +0900
Message-ID: <004601cc7854$e7e9ffc0$b7bdff40$%kim@samsung.com>
References: <1316453441-13525-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52612 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794Ab1IULwR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 07:52:17 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRV000CHFM2WYI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 20:52:16 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRV00MSXFN3VW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 20:52:15 +0900 (KST)
In-reply-to: <1316453441-13525-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
> the following change set adds board setup code for NOOON01PC30 sensor on
> GONI
> and M-5MOLS on UNIVERSAL_C210 board.
> Some clocks are modified in line with latest FIMC driver modifications for
v3.2.
> 
> Changes since previous version:
>  - improved error handling, switched to gpio_request_array()
>  - created against git://github.com/kgene/linux-samsung.git for-next
> 
Thanks for your re-submitting :)

> Sylwester Nawrocki (4):
>   ARM: S5PV210: Rename sclk_cam clocks for FIMC media driver
>   ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board
>   ARM: EXYNOS4: Rename sclk_cam clocks for FIMC driver
>   ARM: S5PV210: UNIVERSAL_C210: Add support for M-5MOLS image sensor
> 
>  arch/arm/mach-exynos4/Kconfig               |    3 +
>  arch/arm/mach-exynos4/clock.c               |    6 +-
>  arch/arm/mach-exynos4/mach-universal_c210.c |  206
> +++++++++++++++++++++++++-
>  arch/arm/mach-s5pv210/Kconfig               |    1 +
>  arch/arm/mach-s5pv210/clock.c               |    6 +-
>  arch/arm/mach-s5pv210/mach-goni.c           |   53 +++++++
>  6 files changed, 259 insertions(+), 16 deletions(-)
> --
> 1.7.6.3
> 
> The patches can be pulled from
git://git.infradead.org/users/kmpark/linux-2.6-
> samsung,
> branch samsung-board-camera.
> 
Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
