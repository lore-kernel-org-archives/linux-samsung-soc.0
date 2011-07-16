From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/7] ARM: EXYNOS4: Adds External GIC
Date: Sat, 16 Jul 2011 15:55:34 +0900
Message-ID: <037601cc4385$604ca990$20e5fcb0$%kim@samsung.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14693 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab1GPGzm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 02:55:42 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00FPWZ8TWM80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 15:55:41 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00LDYZ8TP8@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 15:55:41 +0900 (KST)
In-reply-to: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Changhwan Youn' <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Changhwan Youn wrote:
> 
> This patch adds implementation External GIC on EXYNOS4 SoC.
> 
> Note: need to update timer codes for supporting old type of
> EXYNOS4 SoCs.
> 
> [PATCH 1/7] ARM: EXYNOS4: Add external GIC io memory mapping
> [PATCH 2/7] ARM: EXYNOS4: modify interrupt mappings for external GIC
> [PATCH 3/7] ARM: EXYNOS4: set the affinity of mct1 interrupt using
IRQ_MCT_L1
> [PATCH 4/7] ARM: GIC: move gic_chip_data structure declaration to header
> [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
> [PATCH 6/7] ARM: EXYNOS4: Remove clock event timers using ARM private
timers
> [PATCH 7/7] ARM: EXYNOS4: Add chained enrty/exit function to uart
interrupt
> handler

OK, applied.
Thanks.

As a note, this is needed for to support upcoming other EXYNOS4 SoCs with
current exynos4 mainline.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
