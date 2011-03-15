From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: EXYNOS4: Enhancement of System MMU
Date: Tue, 15 Mar 2011 22:35:50 +0900
Message-ID: <011701cbe315$e9677140$bc3653c0$%kim@samsung.com>
References: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51560 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757832Ab1CONf5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 09:35:57 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300FHOPRWBH10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:35:56 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI300587PRVFJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:35:56 +0900 (KST)
In-reply-to: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'KyongHo Cho' <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

KyongHo Cho wrote:
> 
> This patch includes the following enhancements for System MMU:
> - Enhanced readability
> - Removal of unused data structures or their members
> - Simplified function definitions
> - Corrections of some logical errors
> - Full compliance with Linux coding style
> - Simpler way of registering callback functions of System MMU faults
> - Add clock gating for System MMU
> 
> [PATCH 1/2] ARM: EXYNOS4: Enhancement of System MMU driver
> [PATCH 2/2] ARM: EXYNOS4: Implement Clock gating for System MMU

Cc'ed Marek.

As I said before, Marek's SystemMMU driver has some problems.

One is that it allocates 4MB virtual memory at once. It is really a problem
because, the device memory manager must knows the peculiarity and handles
it. Otherwise, page tables can be overwritten...

Anyway, I think Marek's initial idea is good esp., clock handling.
But now, this looks better for its enhancement and as we know if required,
we can improve this later.

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
