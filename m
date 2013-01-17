From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-3 for v3.8
Date: Wed, 16 Jan 2013 16:35:28 -0800
Message-ID: <0c1201cdf44a$8e44c040$aace40c0$@samsung.com>
References: <0c0301cdf447$109e7d50$31db77f0$@samsung.com>
 <CAOesGMiRSUbsnP2cCC=Ur9zL1CG9HGT0AQZ_fMktL+QAUmiDzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29536 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757751Ab3AQAfu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 19:35:50 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGQ00BE6UZDIJ50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:35:48 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGQ00HCVUZM8Q30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:35:48 +0900 (KST)
In-reply-to: <CAOesGMiRSUbsnP2cCC=Ur9zL1CG9HGT0AQZ_fMktL+QAUmiDzA@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
> On Wed, Jan 16, 2013 at 4:10 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> > Hi Arnd, Olof
> >
> > Here is Samsung fixes for v3.8, please pull from:
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > v3.8-samsung-fixes-3
> >
> > That branch fixes build warnings and error for S3C24XX/S3C64xx. And
> corrects
> > dw-mshc properties on EXYNOS5 DT and fixes IRQ mapping on
> Cragganmore board.
> >
> > If any problems, please kindly let me know.
> >
> > Thanks.
> >
> > - Kukjin
> >
> > The following changes since commit
> 9931faca02c604c22335f5a935a501bb2ace6e20:
> >
> >   Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > v3.8-samsung-fixes-3
> >
> > for you to fetch changes up to
> cd9a8934a28d604ffb62e80ab08ba12fab128a1e:
> >
> >   ARM: S3C24XX: Make 'clk_msysclk' static (2013-01-16 15:53:48 -0800)
> >
> > ----------------------------------------------------------------
> > Alim Akhtar (1):
> >       ARM: dts: correct the dw-mshc timing properties as per binding
> >
> > Dimitris Papastamos (1):
> >       ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore
> >
> > Sachin Kamat (2):
> >       ARM: S3C24XX: Fix warnings in irq-s3c2416.c
> >       ARM: S3C24XX: Make 'clk_msysclk' static
> 
> Those two are sparse fixes, please queue for 3.9 instead.
> 
Agreed, it's not critical. I did. Can you pull same branch?

If you want new branch for this, let me know.

Thanks.

- Kukjin

The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:

  Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.8-samsung-fixes-3

for you to fetch changes up to b86dc0d8c12bbb9fed3f392c284bdc7114ce00c1:

  ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore (2013-01-16
15:49:53 -0800)

----------------------------------------------------------------
Alim Akhtar (1):
      ARM: dts: correct the dw-mshc timing properties as per binding

Dimitris Papastamos (1):
      ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore

Tomasz Figa (1):
      ARM: S3C64XX: Fix build error with CONFIG_S3C_DEV_FB disabled

 arch/arm/boot/dts/cros5250-common.dtsi       |   12 ++++++------
 arch/arm/boot/dts/exynos5250-smdk5250.dts    |    8 ++++----
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    2 +-
 arch/arm/mach-s3c64xx/pm.c                   |    2 ++
 4 files changed, 13 insertions(+), 11 deletions(-)
