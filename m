From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 2/5] Samsung clock updates for 3.16
Date: Thu, 22 May 2014 20:42:51 +0900
Message-ID: <032801cf75b2$f62f57c0$e28e0740$@samsung.com>
References: <014501cf73c8$5eb66960$1c233c20$@samsung.com>
 <20140522053126.GF32618@quad.lixom.net> <537DC9B5.6090405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53610 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504AbaEVLmx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 07:42:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Z00BZJ4JFFRA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 20:42:51 +0900 (KST)
In-reply-to: <537DC9B5.6090405@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi Olof,
> 
> On 22.05.2014 07:31, Olof Johansson wrote:
> > On Tue, May 20, 2014 at 10:11:03AM +0900, Kukjin Kim wrote:
> >> The following changes since commit
> 34c453ce16633539a94a2e876faeb731ac1be899:
> >>
> >>   ARM: S3C24XX: fix merge conflict (2014-05-15 05:54:38 +0900)
> >>
> >> are available in the git repository at:
> >>
> >>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-
> samsung.git
> >> tags/samsung-clk
> >>
> >> for you to fetch changes up to
6520e968eef4f88c076a84a80e026049d157132e:
> >>
> >>   clk: exynos5420: Add 5800 specific clocks (2014-05-19 22:15:08 +0900)
> >>
> >
> > 1. This is new SoC support -- you said you're sending multiplatform soon
> so
> >    we'll hold off until that's made it in.
> >
> > 2. What's the actual dependency here for taking it through arm-soc?
> Seems like
> >    nearly all of it is in drivers/clk.
> 
> This is a complicated network of dependencies:
> 
>  1) s3c24xx conversion to CCF had dependencies on Kukjin's tree so it
> was applied there,
>  2) support for multiple clock providers in Samsung clock library needed
> to convert s3c24xx clock driver (applied to Kukjin's tree) as well,
>  3) due to quite invasive nature of the series above, most of the
> patches touching Samsung clock drivers ended depending on it, due to
> multiple conflicts otherwise.
> 
Yeah it's tree, so we talked about its handling and this way would be better
to us in this time and Mike also agreed about that. Basically as you know,
we need to avoid useless merge conflicts and this is a good way it's not a
best way sometimes though :-)

Thanks,
Kukjin
