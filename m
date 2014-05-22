From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 3/5] Samsung driver update for 3.16
Date: Thu, 22 May 2014 20:38:43 +0900
Message-ID: <031b01cf75b2$62c9e220$285da660$@samsung.com>
References: <014601cf73c8$68e56030$3ab02090$@samsung.com>
 <20140522053421.GG32618@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11409 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626AbaEVLiq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 07:38:46 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Z004YA4CKNC60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 20:38:44 +0900 (KST)
In-reply-to: <20140522053421.GG32618@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Tue, May 20, 2014 at 10:11:20AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:
> >
> >   Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)
> >
> > are available in the git repository at:
> >
> >   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-drivers
> >
> > for you to fetch changes up to 93bfb769752babdc4d3665a1fb166bb4e3ff927b:
> >
> >   clocksource: exynos_mct: register sched_clock callback (2014-05-02
> > 22:27:01 +0900)
> >
> > ----------------------------------------------------------------
> > exynos_mct update for v3.16
> >
> > - register sched_clock callback to use clocksource mct-frc
> >
> > Note that got ack from Daniel
> 
> Merged into next/drivers, but is there a reason for why you took it
> through
> your own tree instead of through Daniels? Seems like you might as well
> just
> have sent it to him.
> 
Yeah, could be. BTW I thought there will be another driver updates in
samsung tree when I applied it and Daniel also gave ack on the patch :-)

Thanks,
Kukjin
