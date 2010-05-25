From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Fix the platform external interrupt issues.
Date: Tue, 25 May 2010 07:45:43 +0200
Message-ID: <019e01cafbcd$8640c6a0$92c253e0$%szyprowski@samsung.com>
References: <1274687063-748-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37228 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752835Ab0EYFqZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 01:46:25 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2Y00AZ9O1BY6@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 May 2010 14:46:23 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2Y00M9VO170D@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 May 2010 14:46:23 +0900 (KST)
In-reply-to: <1274687063-748-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Pannaga Bhushan' <p.bhushan@samsung.com>

Hello,

On Monday, May 24, 2010 9:44 AM Kukjin Kim wrote:

> From: Pannaga Bhushan <p.bhushan@samsung.com>
> 
> This patch does the following:
> 
> 1. Corrects the common platform code for external interrupts for using the
>    VIC mask/unmask bits also.
> 2. Moves the common defines related to external interrupt for plat-s5p
>    to common files.
> 3. Based on the new common defines, corresponding changes are made in the
>    affected platforms (S5P6440, S5P6442 and S5PC100).
> 
> Signed-off-by: Pannaga Bhushan <p.bhushan@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/irqs.h      |    9 ++++++++-
>  arch/arm/mach-s5p6442/include/mach/irqs.h      |    5 +++--
>  arch/arm/mach-s5pc100/include/mach/irqs.h      |    3 ---
>  arch/arm/mach-s5pv210/include/mach/irqs.h      |   14 ++------------
>  arch/arm/mach-s5pv210/include/mach/regs-gpio.h |   14 +++++++++-----
>  arch/arm/plat-s5p/Kconfig                      |    1 +
>  arch/arm/plat-s5p/include/plat/irqs.h          |    7 +++++++
>  arch/arm/plat-s5p/irq-eint.c                   |   15 ++++++++++-----
>  8 files changed, 40 insertions(+), 28 deletions(-)

This patch lacks a fix for arch/arm/mach-s5pc100/include/mach/regs-gpio.h
file. It should revert the changes from commit 45c79433c02b8fe7b8a1cbf6054
to that file. Without it the external interrupt 16..31 does not work on
S5PC100.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
