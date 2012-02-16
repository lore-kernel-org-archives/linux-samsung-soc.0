From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for
 EXYNOS5250
Date: Thu, 16 Feb 2012 14:28:45 +0900
Message-ID: <054801ccec6b$da57ba60$8f072f20$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36249 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab2BPF26 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:28:58 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZH00LEM0JZR5L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:28:47 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZH009WT0JXRP40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:28:47 +0900 (KST)
In-reply-to: <1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kukjin Kim wrote:
>
> This patch adds the interrupt definitions for EXYNOS5250 at
> <mach/irqs.h> file. Basically, now it is needed for EXYNOS5250
> interrupt and will be updated for single zImage next time.

[...]

> +#define JOP_IRQ_NUMBER		IRQ_SPI(118)

Typo :( Should be 'JOB_IRQ_...'

And I need to update every IRQ definitions...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
