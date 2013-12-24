From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/7] Samsung irq for v3.14
Date: Tue, 24 Dec 2013 10:55:31 +0900
Message-ID: <1af901cf004b$39f812e0$ade838a0$@samsung.com>
References: <52AE0F8C.3040408@samsung.com>
 <20131222220928.GE13365@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48794 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758054Ab3LXBzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 20:55:33 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYA00A0AG0KK120@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 10:55:32 +0900 (KST)
In-reply-to: <20131222220928.GE13365@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Mon, Dec 16, 2013 at 05:22:36AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> >
> >   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-irq
> >
> > for you to fetch changes up to 9403ac88220d79f8822e22c875ad1ebd7ffbea6f:
> >
> >   irqchip: exynos-combiner: remove hard-coded irq_base value
> > (2013-12-02 07:15:51 +0900)
> 
> Pulled into next/drivers. This should probably have gone through the
> irqchip
> maintainer though. The patch is small so I took it anyway.
> 
Yeah, I know, but irqchip maintainer, Tomas Gleixner is included in CC for
the patch for a long time. So I think, your pulling is fair enough ;-)

Thanks.
Kukjin
