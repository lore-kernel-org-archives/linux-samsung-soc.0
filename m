From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung boards update for v3.5
Date: Tue, 15 May 2012 17:55:38 +0900
Message-ID: <07fb01cd3278$7f918540$7eb48fc0$%kim@samsung.com>
References: <4FAF0326.8000408@samsung.com> <201205142003.27537.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30324 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758309Ab2EOIzh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 04:55:37 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4200K9X3DQ9KE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:55:36 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M42004DW3GM1E00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:55:35 +0900 (KST)
In-reply-to: <201205142003.27537.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:

> 
> On Sunday 13 May 2012, Kukjin Kim wrote:
> > Hi Arnd, Olof,
> >
> > Please pull Samsung boards update for v3.5.
> >    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next/board-samsung
> >
> > As there were discussions, some exynos4 boards have been updated because
> > current dt cannot support all features for current board files on exynos4.
> >
> > Note, this should be merged after next/devel-samsung because some
> > platform devices are defined in that.
> >
> > If any problems, please let me know.
> 
> Pulled into next/boards now.
> 
Thanks.

> Since we have not pulled the next/devel-samsung branch yet, and that branch
> depends on the sysmmu branch, the dependencies won't easily get fulfilled.

Hmm...I know...but in this case, I had no choice for avoid mess conflicts between them with keeping separate topic branches.

> A test build of exynos4_defconfig showed that there is at least no build
> time problem.
> 
Yeah, could be. Because current exynos4_defconfig doesn't enable newly added feature such as DRM_EXYNOS which has been included in
next/devel-samsung branch for its platform device.

> What is the dependency you are referring to?
> 
Same above.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
