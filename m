From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 4/4] Samsung exynos7 updates for v3.19
Date: Wed, 03 Dec 2014 19:49:34 +0900
Message-ID: <020801d00ee6$d3992380$7acb6a80$@kernel.org>
References: <5476CD88.1030406@kernel.org> <201411281335.55663.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17908 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbaLCKth (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 05:49:37 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG000DR862NTDB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 19:49:35 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Mike Turquette' <mturquette@linaro.org>, arm@kernel.org, 'Kevin Hilman' <khilman@linaro.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Olof Johansson' <olof@lixom.net>

Kukjin Kim wrote:
> 
> Arnd Bergmann wrote:
> >
> > On Thursday 27 November 2014, Kukjin Kim wrote:
> > > Samsung arch/arm64 DT updates for v3.19
> > >
> > > - to support ARMv8 based exynos7 SoC
> > >   : add initial device tree and add pinctrl, PMU, mmc, i2c, rtc,
> > >     watchdog, and adc nodes for exynos7 SoC and exynos7 based
> > >     espresso board.
> > >
> > > NOTE that this is including following dependencies
> > > : cleanup/dts-subdirs in arm-soc for arm64 vendor support
> > > : tags/samsung-driver for samsung serial
> > > : for-v3.19/exynos-clk in samsung-clk tree for exynos7 clk
> > >
> > > One more NOTE, for support exynos7 we need Liviu's "arm64: Create
> > > link to include/dt-bindings to enable C preprocessor use" in arm-soc
> > > tree and arm64 defconfig update should be handled directly.
> >
> > I'm confused by the dependencies. I don't see a "for-v3.19/exynos-clk"
> > in arm-soc, you haven't put the clk maintainer on Cc and I see no indication
> > that he has this in his tree already, so I'm not pulling this until further
> > clarification.
> >
> Hi,
> 
> Sorry for insufficient description.
> 
> Since the exynos7 stuff requires regarding clk stuff for kernel build, I talked
> to Mike, Sylwester and Mike suggested pulling the branch into Samsung tree.
> 
> http://www.spinics.net/lists/linux-samsung-soc/msg39368.html
> 
> If any problems, please let me know.
> 
Hi Arnd,

Do you have any concerns on this?

- Kukjin
