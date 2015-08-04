From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 1/5] Samsung non-critical-fixes for v4.3
Date: Tue, 04 Aug 2015 16:53:37 +0900
Message-ID: <052201d0ce8a$aba37790$02ea66b0$@kernel.org>
References: <55C06995.2030600@kernel.org> <55C06C2D.2010804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41934 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754402AbbHDHxx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Aug 2015 03:53:53 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSJ0268ASLDF9A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Aug 2015 16:53:37 +0900 (KST)
In-reply-to: <55C06C2D.2010804@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Krzysztof Kozlowski wrote:
> 
> On 04.08.2015 16:28, Kukjin Kim wrote:
> > Hi Arnd, Olof, Kevin,
> >
> > Here is Samsung non-critical-fixes for v4.3.
> > Please pull.
> >
> > Thanks,
> > Kukjin
> >
> > The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> >
> >   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-non-critical-1
> >
> > for you to fetch changes up to 2cc6b813579415c4f627b08a043079bdc5b87a33:
> >
> >   ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem (2015-07-21
> > 13:19:06 +0900)
> >
> > ----------------------------------------------------------------
> > Samsung non-critical fixes for v4.3
> >
> > - fix sparse warning for returning iomem
> > - fix clock-frequency of display timing0 for exynos3250-rinato
> 
Hi,

> One more set, which we agreed for pushing to v4.2, is missing:
> 1. cpufreq: exynos: Fix for memory leak in case SOC name does not match

As you can see in ml, I've sent it to Rafael because it would be handled in
cpufreq tree not samsung tree/arm-soc tree.

> 2. video: fbdev: s3c-fb: Constify platform_device_id (this can actually

Same as above, this would be handled in fb tree? Can you please send it?

- Kukjin
