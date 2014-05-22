From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/5] Samsung Exynos MCPM support for 3.16
Date: Thu, 22 May 2014 20:19:14 +0900
Message-ID: <02fe01cf75af$a9a89cc0$fcf9d640$@samsung.com>
References: <014801cf73c8$7d1f9930$775ecb90$@samsung.com>
 <20140522053841.GI32618@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50809 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347AbaEVLTQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 07:19:16 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Z00C4L3G29390@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 20:19:14 +0900 (KST)
In-reply-to: <20140522053841.GI32618@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Olof Johansson wrote:
> 
> On Tue, May 20, 2014 at 10:11:54AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> d7067f1c5fa0232001502569c6878d22308da268:
> >
> >   devicetree: bindings: document SYSRAM binding (2014-05-15 03:30:29
> +0900)
> >
> > are available in the git repository at:
> >
> >   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/exynos-mcpm
> >
> > for you to fetch changes up to ccf5511797cd4b48d20a85fa1778f5608eac9fd7:
> >
> >   ARM: EXYNOS: Add MCPM call-back functions (2014-05-16 04:26:30 +0900)
> >
> > ----------------------------------------------------------------
> > Exynos MCPM support for v3.16
> >
> > - adding MCPM backend support for SMP secondary boot and core switching
> > on Samsung's Exynos5420.
> >
> > Tested on exynos5420-smdk5420 and exynos5420 based chromebook
(peach-pit)
> > using the "/dev/b.L_switcher" user interface. Secondary core boot-up has
> > also been tested on both the boards.
> 
> This goes with new SoC enablement as well; we'll merge it after multi-
> platform.
> 
Well, the branch (tags/exynos-mcpm) is for exynos5420 and as you know, it is
not new SoC? I think. But it's up to you.

Thanks,
Kukjin
