From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 2nd 4/5] Samsung DT updates for v3.14
Date: Tue, 24 Dec 2013 12:09:09 +0900
Message-ID: <1b0901cf0055$8393b7b0$8abb2710$@samsung.com>
References: <52B5DCB4.5030104@samsung.com>
 <20131224025637.GA26914@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30614 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737Ab3LXDJM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 22:09:12 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYA00DXWJFAMG90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 12:09:10 +0900 (KST)
In-reply-to: <20131224025637.GA26914@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Sun, Dec 22, 2013 at 03:23:48AM +0900, Kukjin Kim wrote:
> > Note that this tags/samsung-dt-2 is based on previous Samsung DT
> > request + Samsung 2nd fixes because of dependencies.
> >
> > -----
> >
> > The following changes since commit
> e0b51c2eae8ebf10d80530b7a306818252206325:
> >
> >   ARM: dts: Update Samsung sysreg binding document (2013-12-16
> > 04:47:38 +0900)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-dt-2
> >
> > for you to fetch changes up to a22d060e3299ce672258d00070fa0ed398c035c5:
> >
> >   ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos
> > prefix (2013-12-21 10:09:25 +0900)
> 
> Hi,
> 
> I've merged this, but in the future it would be useful to only see the
> incremental diffstat from the dependencies onto the tip of this branch.
> 
> I.e. the below list of patches and diffstat also contains the changes that
> are
> part of the fixes-2 branch.
> 
Oops, it's my fault sorry. I thought the list is based on fixes-2 branch :-(


> It's not a big deal, but it's slightly easier not to get the patches
> accounted
> for twice.
> 
Sure, thanks.

- Kukjin
