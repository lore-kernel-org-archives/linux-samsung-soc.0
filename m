From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/5] Samsung non-critical-fixes for v3.17
Date: Tue, 22 Jul 2014 20:07:27 +0900
Message-ID: <01c901cfa59d$1f644ff0$5e2cefd0$@samsung.com>
References: <53C9C121.6090403@samsung.com>
 <20140719215942.GC15676@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10382 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753212AbaGVLH3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 07:07:29 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9400HM01KFC7B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Jul 2014 20:07:27 +0900 (KST)
In-reply-to: <20140719215942.GC15676@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Sat, Jul 19, 2014 at 09:51:45AM +0900, Kukjin Kim wrote:
> > The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:
> >
> >   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/fixes-for-3.17
> >
> > for you to fetch changes up to 042b687f880adcca77847688aac35e2e16927944:
> >
> >   ARM: EXYNOS: Fix build breakge with PM_SLEEP=n (2014-07-19
> > 04:45:02 +0900)
> >
> > ----------------------------------------------------------------
> > Samsung non critical fixes for v3.17
> > - update exynos_defconfig for remove outdated configs and
> > enable most of the configs used on latest exynos platforms
> > - fix build breakge for exynos_defconfig with PM_SLEEP=n
> 
> Hi,
> 
Hi, Olof,

> We now separate out defconfigs (as you might have noticed if you looked
> at our tree). I don't see any dependencies between these changes and
> the rest so I'll cherry-pick the patches into fixes-non-critical (for
> the build fix) and defconfig for that patch.
> 
OK, I'm fine and I will follow the way next time.

Thanks for your cherry-pick and pulling other trees.

- Kukjin
