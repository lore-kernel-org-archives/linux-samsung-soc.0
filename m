From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: S5PV210: GONI board update for CIF camera support
Date: Wed, 29 Jun 2011 22:13:34 +0900
Message-ID: <004601cc365e$5e2f5dd0$1a8e1970$%kim@samsung.com>
References: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56642 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263Ab1F2NNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 09:13:43 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNJ006OVZEN4Q80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jun 2011 22:13:42 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNJ000EFZEUWD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jun 2011 22:13:42 +0900 (KST)
In-reply-to: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

Sylwester Nawrocki wrote:
> 
> This patchset adds platform data definition for NOON010PC30 camera sensor
> for GONI board and renames sclk_cam clocks on S5PV210 platform which is
> needed
> for FIMC media device driver.
> 
> The whole patches converting s5p-fimc to media controller API can be found
at:
> 
> http://git.infradead.org/users/kmpark/linux-2.6-samsung
> branch: s5p-fimc-next
> 
> Sylwester Nawrocki (2):
>   ARM: S5PV210: Rename sclk_cam clocks for FIMC media driver
>   ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board
> 
>  arch/arm/mach-s5pv210/Kconfig     |    1 +
>  arch/arm/mach-s5pv210/clock.c     |    6 +---
>  arch/arm/mach-s5pv210/mach-goni.c |   52
> +++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 4 deletions(-)
> 
> Created against for-next branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Looks ok to me, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
