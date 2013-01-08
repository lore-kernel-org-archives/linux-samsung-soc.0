From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-2 for v3.8
Date: Tue, 08 Jan 2013 09:38:16 -0800
Message-ID: <097901cdedc6$f23612f0$d6a238d0$@samsung.com>
References: <081701cded2f$6dcf9960$496ecc20$@samsung.com>
 <CAOesGMjjsT-fZqLQQf9=SBY6WKoF76MZmt7CfXEsyNFsNzJhzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47393 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756785Ab3AHRig (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jan 2013 12:38:36 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGB00HV9IC7JIY0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 02:38:35 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGB0049PIC9C2D0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 02:38:35 +0900 (KST)
In-reply-to: <CAOesGMjjsT-fZqLQQf9=SBY6WKoF76MZmt7CfXEsyNFsNzJhzQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
Hi :-)

> On Mon, Jan 7, 2013 at 3:33 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> > Hi Arnd, Olof
> >
> > Here is Samsung-fixes-2 for v3.8.
> > Most of them are EXYNOS5440 fixes which are for changing uart console,
> cpu
> > id (typo)  and silent complaining gpio error in kernel boot.
> >
> > If any problems, please kindly let me know.
> >
> > Thanks and a very happy new year.
> >
> > - Kukjin
> >
> > The following changes since commit
> a49f0d1ea3ec94fc7cf33a7c36a16343b74bd565:
> >
> >   Linux 3.8-rc1 (2012-12-21 17:19:00 -0800)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > v3.8-samsung-fixes-2
> >
> > for you to fetch changes up to
> 61bcbc2af8be4cafb5723d4bd306053b70f52a7a:
> >
> >   ARM: EXYNOS: skip the clock initialization for exynos5440 (2013-01-05
> > 08:32:55 -0800)
> >
> > ----------------------------------------------------------------
> > Kukjin Kim (5):
> >       ARM: SAMSUNG: fix the cpu id for EXYNOS5440
> >       ARM: dts: use uart port0 for console on exynos5440-ssdk5440
> >       ARM: dts: use uart port1 for console on exynos4210-smdkv310
> >       ARM: EXYNOS: enable PINCTRL for EXYNOS5440
> >       ARM: EXYNOS: skip the clock initialization for exynos5440
> 
> See comment I just sent to the posted patch for this one.
> 
I replied on that. If any concerns, please kindly  let me know.

Thanks.

- Kukjin
