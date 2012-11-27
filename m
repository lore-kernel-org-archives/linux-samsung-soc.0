From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/3] Samsung devel-2 for v3.8
Date: Tue, 27 Nov 2012 09:35:50 +0900
Message-ID: <15c601cdcc37$26aef440$740cdcc0$%kim@samsung.com>
References: <10d601cdc91b$1a5e73b0$4f1b5b10$%kim@samsung.com>
 <20121126075323.GF9580@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40835 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757545Ab2K0Afw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 19:35:52 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME4000ZTEZQRGC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:35:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME4006JHEZQSR10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:35:50 +0900 (KST)
In-reply-to: <20121126075323.GF9580@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi Kgene,
> 
Hi :-)

> On Fri, Nov 23, 2012 at 10:37:30AM +0900, Kukjin Kim wrote:
> > Hi Arnd, Olof
> >
> > Here is second Samsung development patches for v3.8.
> 
> Please start sorting your branches more. When someone sends in a large
> "devel" branch, it doesn't fit our tree organization very well. The
> branch below contains fixes, new features and cleanups all in one branch.
> 
OK, I see and I will sorting it out more carefully.

> > This includes properly enabling PM support and UART3 DEBUG_LL for
> exynos5
> > and CAMIF for s3c24xx/s3c64xx.
> 
> "Properly enabling PM support" sounds like worthy of a branch on its own,
> for example.
> 
Agreed, I will re-send pull-request tonight.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
