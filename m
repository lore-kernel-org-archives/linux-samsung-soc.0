From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 3/6] exynos arch
Date: Thu, 13 Jun 2013 09:37:05 +0900
Message-ID: <143b01ce67ce$20d5f5e0$6281e1a0$%kim@samsung.com>
References: <51B791E0.5040104@samsung.com>
 <20130612232526.GA9067@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32217 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755889Ab3FMAhH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 20:37:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB00BV631TIJ00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 09:37:05 +0900 (KST)
In-reply-to: <20130612232526.GA9067@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Wed, Jun 12, 2013 at 06:08:48AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> >
> >   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/exynos-arch-1
> >
> > for you to fetch changes up to d75666024bbb7d1b4fa6f0b00ecd8d834033259a:
> >
> >   ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor
> > (2013-06-10 18:28:04 +0900)
> >
> > ----------------------------------------------------------------
> > update exynos arch part
> 
> Kukjin, please, write proper tag messages. This adds no value. Give a
> brief
> overview of what's in the branch instead.
> 
YES, I will.

> > ----------------------------------------------------------------
> > Doug Anderson (1):
> >       ARM: EXYNOS: Select PINCTRL_EXYNOS for exynos4/5 at chip level
> >
> > Girish K S (1):
> >       ARM: EXYNOS: force MAC ip to 32bit DMA
> >
> > Kukjin Kim (1):
> >       ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
> >
> > Leela Krishna Amudala (1):
> >       ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor
> >
> > Thomas Abraham (1):
> >       ARM: EXYNOS: Add a platform bus notifier to set dma masks for
> > Exynos5440
> 
> This one has outstanding comments from Russell that were not addressed?
> 
Oops, I missed the comment from Russell and looked at just now. Thanks.

> 
> Not pulled.
> 
OK.

- Kukjin
