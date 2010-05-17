From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: Samsung: move common I2C0 device helpers to
 machine	directories
Date: Mon, 17 May 2010 22:20:13 +0900
Message-ID: <004801caf5c3$b28ad030$17a07090$%kim@samsung.com>
References: <1274077795-30873-1-git-send-email-m.szyprowski@samsung.com>
 <1274077795-30873-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47920 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755331Ab0EQNUU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:20:20 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K002W8FPT04@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:20:18 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K00CQGFPTOM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:20:17 +0900 (KST)
In-reply-to: <1274077795-30873-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> I2C0 device helper depend on GPIO pin defines that are SoC specific.
> This patch copies the dummy i2c0 setup code to the respective mach-s5p*
> directories, so each SoC will be able to implement using its own
> defines.

One more, moving from plat-s5p/ is better than creating.

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5p6440/Makefile     |    1 +
>  arch/arm/mach-s5p6440/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/mach-s5p6442/Makefile     |    1 +
>  arch/arm/mach-s5p6442/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/Makefile     |    1 +
>  arch/arm/mach-s5pv210/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/plat-s5p/Makefile         |    1 -
>  arch/arm/plat-s5p/setup-i2c0.c     |   25 -------------------------
>  8 files changed, 78 insertions(+), 26 deletions(-)
>  create mode 100644 arch/arm/mach-s5p6440/setup-i2c0.c
>  create mode 100644 arch/arm/mach-s5p6442/setup-i2c0.c
>  create mode 100644 arch/arm/mach-s5pv210/setup-i2c0.c
>  delete mode 100644 arch/arm/plat-s5p/setup-i2c0.c
> 

(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
