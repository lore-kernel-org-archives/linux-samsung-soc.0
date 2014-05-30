From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/5] Samsung Exynos MCPM support for 3.16
Date: Fri, 30 May 2014 10:26:24 +0900
Message-ID: <060801cf7ba6$2b815ec0$82841c40$@samsung.com>
References: <014801cf73c8$7d1f9930$775ecb90$@samsung.com>
 <20140522053841.GI32618@quad.lixom.net>
 <CAOesGMj=c3RVQs2=xtWV82nMxjD9w6QNv2Wz4wTi7KrOuHYTig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46267 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752220AbaE3B0Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 21:26:25 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6D006MI5C00ND0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 May 2014 10:26:24 +0900 (KST)
In-reply-to: <CAOesGMj=c3RVQs2=xtWV82nMxjD9w6QNv2Wz4wTi7KrOuHYTig@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Olof Johansson wrote:
> 
> On Wed, May 21, 2014 at 10:38 PM, Olof Johansson <olof@lixom.net> wrote:
> > On Tue, May 20, 2014 at 10:11:54AM +0900, Kukjin Kim wrote:
> >> The following changes since commit d7067f1c5fa0232001502569c6878d22308da268:
> >>
> >>   devicetree: bindings: document SYSRAM binding (2014-05-15 03:30:29 +0900)
> >>
> >> are available in the git repository at:
> >>
> >>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >> tags/exynos-mcpm
> >>
> >> for you to fetch changes up to ccf5511797cd4b48d20a85fa1778f5608eac9fd7:
> >>
> >>   ARM: EXYNOS: Add MCPM call-back functions (2014-05-16 04:26:30 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Exynos MCPM support for v3.16
> >>
> >> - adding MCPM backend support for SMP secondary boot and core switching
> >> on Samsung's Exynos5420.
> >>
> >> Tested on exynos5420-smdk5420 and exynos5420 based chromebook (peach-pit)
> >> using the "/dev/b.L_switcher" user interface. Secondary core boot-up has
> >> also been tested on both the boards.
> >
> > This goes with new SoC enablement as well; we'll merge it after multi-platform.
> 
> Merged now, since multiplatform is going in as well.
> 
> What confused me for a while here was that this branch was based on a
> partial version of the DT branch, but it didn't match any of the

Yeah, I just thought that it would be better if this could be having minimally
the dependent patches.

> branch heads we had merged in. It's not wrong to do so but it's useful
> to get a heads up in the pull request.
> 
OK, I see. I will do as you suggested in future.

Thanks,
Kukjin
