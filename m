From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 6/6] s3c24xx driver
Date: Thu, 13 Jun 2013 09:26:38 +0900
Message-ID: <143901ce67cc$ab45c9f0$01d15dd0$%kim@samsung.com>
References: <51B791F6.4000004@samsung.com>
 <20130612235158.GC9067@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40946 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756833Ab3FMA0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 20:26:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB007I92KE8AB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 09:26:38 +0900 (KST)
In-reply-to: <20130612235158.GC9067@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Wed, Jun 12, 2013 at 06:09:10AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> >
> >   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/s3c24xx-driver-1
> >
> > for you to fetch changes up to ae7b6dccf6711e8d5815688f1572ab55bf5b3069:
> >
> >   Merge branch 'v3.11-next/driver-cpufreq' into
> > v3.11-next/s3c24xx-driver (2013-06-12 05:24:22 +0900)
> >
> > ----------------------------------------------------------------
> >
> > update driver for s3c24xx
> > - move cpufreq driver into drivers/
> > - add pinctrl-s3c24xx driver
> > - cleanup OF in gpio driver
> >
> > ----------------------------------------------------------------
> > Heiko Stuebner (1):
> >       pinctrl: Add pinctrl-s3c24xx driver
> >
> > Kukjin Kim (3):
> >       Merge branch 'v3.11-next/driver-gpio' into v3.11-next/s3c24xx-
> driver
> >       Merge branch 'v3.11-next/driver-pinctrl' into
> > v3.11-next/s3c24xx-driver
> >       Merge branch 'v3.11-next/driver-cpufreq' into
> > v3.11-next/s3c24xx-driver
> 
> Hi,
> 
Hi,

> No need to do a merge commit per patch, just do them on a single branch in
> the
> future, please.
> 
OK.

> Pulled.
> 
Thanks.

- Kukjin
