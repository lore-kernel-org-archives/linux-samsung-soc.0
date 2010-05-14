From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v3] ARM: S5PC100: Pre-requisite clock patch for
 plat-s5pc1xx to plat-s5p move.
Date: Fri, 14 May 2010 07:22:03 +0200
Message-ID: <008501caf325$65716430$30542c90$%szyprowski@samsung.com>
References: <1273797327-5342-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:62719 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731Ab0ENFWq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 01:22:46 -0400
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E005ZZ9LVV3@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 14:22:44 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2E00CLT9LKWK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 14:22:43 +0900 (KST)
In-reply-to: <1273797327-5342-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>, ben-linux@fluff.org, kyungmin.park@samsung.com

Hello,

On Friday, May 14, 2010 2:35 AM Kukjin Kim wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> This is a pre-requisite clock patch for the plat-s5pc1xx to plat-s5p
> movement. The patches that perform the movement of the code from
> plat-s5pc1xx to plat-s5p (and mach-s5pc100) should also enable the
> build for the mach-s5pc100/clock.c code.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pc100/clock.c                   | 1362
> +++++++++++++++++++++++
>  arch/arm/mach-s5pc100/include/mach/regs-clock.h |   71 ++
>  arch/arm/plat-s5p/clock.c                       |    2 +-
>  arch/arm/plat-s5p/include/plat/pll.h            |   22 +
>  arch/arm/plat-s5p/include/plat/s5p-clock.h      |    2 +
>  5 files changed, 1459 insertions(+), 1 deletions(-)
>  create mode 100755 arch/arm/mach-s5pc100/clock.c
>  create mode 100644 arch/arm/mach-s5pc100/include/mach/regs-clock.h
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> new file mode 100755

Please use 0644 mode for new files, no need to set the 'execute' bit.

> ...

I also got the following compilation warnings:

arch/arm/mach-s5pc100/clock.c:47: warning: 'clk_mout_href' defined but not used
arch/arm/mach-s5pc100/clock.c:400: warning: 's5pc100_d2_0_ctrl' defined but not
used

Besides the above this patch works fine. I will post my redesigned s5pc100 patch
series in a few minutes.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
