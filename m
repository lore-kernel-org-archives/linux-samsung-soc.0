From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: enable more platforms in defconfig
Date: Tue, 19 Jun 2012 17:58:35 +0900
Message-ID: <01a601cd4df9$b5aece20$210c6a60$%kim@samsung.com>
References: <1338784735-10683-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13690 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753882Ab2FSI6i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:58:38 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U0024HWQY0V60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:58:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00HSMWXN3Y60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:58:36 +0900 (KST)
In-reply-to: <1338784735-10683-1-git-send-email-olof@lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
Hi Olof,

Sorry for late reply on this, I came back from travelling, anyway.

> This enables the new EXYNOS5 platforms in the defconfig, and enables DT
> support on EXYNOS4.
> 
Yes, agree, it's time to move on new defconfig for supporting DT.

> While I'm at it, I renamed it exynos4_defconfig -> exynos_defconfig,
> since it now encompasses all (known and supported) versions of exynos.
> 
OK, basically looks good to me. But how about keeping exynos4_defconfig for
non-DT and creating exynos_defconfig for supporting DT on EXYNOS4 and
EXYNOS5? Of course, we can remove exynos4_defconfig after finishing of
EXYNOS DT later.

> Other options enabled: USB host, EXT3/4, regulators and tps65090,
> networking and a few of the common usb ethernet adapters as well as the
> smsc911x controller used on some boards.
> 
> I enabled EFI_PARTITION, since it's used on some filesystem images I'm
> using. I didn't see a need to keep Solaris and BSD partition format
> still enabled.
> 
> Finally, framebuffer console, logo and fonts were enabled.
> 
> Note that enabling some of these options introduces build coverage
> previously missing, thus introducing a few build errors and warnings
> for which fixes have been sent out already.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/arm/configs/exynos4_defconfig | 68 --------------------------
>  arch/arm/configs/exynos_defconfig  | 98
> ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 68 deletions(-)
>  delete mode 100644 arch/arm/configs/exynos4_defconfig
>  create mode 100644 arch/arm/configs/exynos_defconfig
> 

[...]


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
