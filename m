From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] Fixes for S5PV210 PM
Date: Sat, 13 Aug 2011 10:46:26 +0900
Message-ID: <000001cc595a$d1f45080$75dcf180$%kim@samsung.com>
References: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60435 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab1HMBqb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 21:46:31 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPU00HEYFLAGL80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 10:46:29 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPU00672FLHA4@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 10:46:29 +0900 (KST)
In-reply-to: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
> 
> This patchset fixes a compilation warning and removes an unwanted
> Kconfig symbol.
> 
> Abhilash Kesavan (2):
>   ARM: S5PV210: Fix build warning
>   ARM: S5PV210: Remove unncessary symbol for PM
> 
>  arch/arm/mach-s5pv210/Kconfig  |    6 ------
>  arch/arm/mach-s5pv210/Makefile |    2 +-
>  arch/arm/mach-s5pv210/pm.c     |    2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> --
> 1.7.4.1

Looks ok, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
