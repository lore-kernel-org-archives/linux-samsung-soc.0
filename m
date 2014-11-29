From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 3/5] Samsung defconfig update for v3.19
Date: Sat, 29 Nov 2014 09:18:31 +0900
Message-ID: <019301d00b6a$01877d80$04967880$@kernel.org>
References: <546F491B.4020709@kernel.org> <201411281315.57712.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45096 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbaK2ASd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 19:18:33 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFR002XEY6VZF30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 29 Nov 2014 09:18:31 +0900 (KST)
In-reply-to: <201411281315.57712.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Kevin Hilman' <khilman@linaro.org>

Arnd Bergmann wrote:
> 
> On Friday 21 November 2014, Kukjin Kim wrote:
> > The following changes since commit 0df1f2487d2f0d04703f142813d53615d62a1da4:
> >
> >   Linux 3.18-rc3 (2014-11-02 15:01:51 -0800)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-defconfig-v3.19
> >
> > for you to fetch changes up to 26048def56ac2f901d4245d2935c797984e96d68:
> >
> >   ARM: exynos_defconfig: Use 16 minors per MMC block device (2014-11-21
> > 22:04:05 +0900)
> >
> > ----------------------------------------------------------------
> > Samsung defconfig update for v3.19
> >
> > - Use 16 minors per MMC block device for exynos_defconfig
> >   : 16 minors per MMC block device are required for Rinato (Gear 2)
> >
> 
> 
> The defconfig branch didn't have v3.18-rc3 yet, so I cherry-picked the
> one patch from this branch to avoid a back-merge from upstream.
> 
OK, I'm fine.

> Please make sure to base patches on older -rc releases if you can,
> it makes our lives easier.
> 
OK, I will :)

Thanks,
Kukjin
