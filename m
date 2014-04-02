From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/2] Samsung 2nd cleanup for v3.15
Date: Wed, 02 Apr 2014 13:30:13 +0900
Message-ID: <012601cf4e2c$3d9c1340$b8d439c0$@samsung.com>
References: <53285457.80900@samsung.com> <201403290249.04949.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45440 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752773AbaDBEaz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 00:30:55 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3D00ME3Z6DQQ60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Apr 2014 13:30:14 +0900 (KST)
In-reply-to: <201403290249.04949.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:
> 
> On Tuesday 18 March 2014, Kukjin Kim wrote:
> > The following changes since commit
> d9671ca923445aa870ecc34df3db01dd602d87fc:
> >
> >    ARM: EXYNOS: Remove uncompress.h (2014-02-24 09:39:18 +0900)
> >
> > are available in the git repository at:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-cleanup-2
> >
> > for you to fetch changes up to 19a964644f1e655c3f67d539c1e99a9fbcc4588c:
> >
> >    ARM: SAMSUNG: remove all custom uncompress.h (2014-03-11 22:05:18
> +0900)
> >
> > ----------------------------------------------------------------
> > Samsung cleanup-2 for v3.15
> > - use generic uncompress.h and remove all custom
> >    uncompress.h in mach-s3c24xx, s3c64xx, s5p64x0,
> >    s5pc100, s5pv210 and plat-samsung directories.
> >
> > Note that based on previous tags/samsung-cleanup
> 
> I've started a new next/cleanup3 branch for this one and the following
> five samsung branches. I found one small issue with one of the branches,
> if we all agree on a solution for that, I expect we can just send out
> the cleanup3 branch together with cleanup2.
> 
OK, I'm fine.

Thanks,
Kukjin
