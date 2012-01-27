From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6] ARM: SAMSUNG: Board updates and minor fixes
Date: Fri, 27 Jan 2012 10:34:10 +0900
Message-ID: <016901ccdc93$c79a8e80$56cfab80$%kim@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49479 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752062Ab2A0BeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 20:34:22 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF0008QOCJS270@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:34:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF003ENOCYPL50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:34:15 +0900 (KST)
In-reply-to: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com

Sylwester Nawrocki wrote:
> 
> The following patch series adds S5K6AAFX sensor support on Nuri and
> UNIVERSAL_C210 boards. It also includes minor correction for the I2C
> controller setup and the M-5MOLS sensor.
> 
> 
> Sylwester Nawrocki (6):
>   ARM: SAMSUNG: Increase virtual framebuffer size on Universal C210 board
>   ARM: SAMSUNG: Add support for S5K6AAFX image sensor on Universal C210
> board
>   ARM: SAMSUNG: Add support for S5K6AAFX camera on Nuri board
>   ARM: SAMSUNG: Correct framebuffer window size on Nuri board
>   ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on Nuri board
>   ARM: SAMSUNG: Fix platform data setup for I2C adapter 0
> 
>  arch/arm/mach-exynos/Kconfig               |    2 +
>  arch/arm/mach-exynos/mach-nuri.c           |   73
++++++++++++++++++++++++--
>  arch/arm/mach-exynos/mach-universal_c210.c |   78
> ++++++++++++++++++++++++++--
>  arch/arm/plat-samsung/devs.c               |    4 +-
>  4 files changed, 147 insertions(+), 10 deletions(-)
> 
> --
> 1.7.8.3

OK, looks good to me, will apply in my v3.3-samsung-fixes-2 for 6/6 and
next/board-samsung for others.

And I'm not sure some board updates are for fix now so if required, please
let me know.

Plus, I looked at some wrong alignment(tab and white space?) in your
patches, so if you don't mind, let me fix it when I apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
