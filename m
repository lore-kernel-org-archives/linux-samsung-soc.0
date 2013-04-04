From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Re[2]: [PATCH 1/4] ARM: s3c24xx: Removed unneeded dependency on
 ARCH_S3C24XX for boards
Date: Thu, 04 Apr 2013 10:02:00 +0900
Message-ID: <26f101ce30d0$0374a530$0a5def90$%kim@samsung.com>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
 <201303021143.38390.arnd@arndb.de> <1362225644.599345374@f82.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18507 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932245Ab3DDBCC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 21:02:02 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKP00BTLHJDIR70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 10:02:01 +0900 (KST)
In-reply-to: <1362225644.599345374@f82.mail.ru>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Shiyan' <shc_work@mail.ru>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Alexander Shiyan wrote:
> 
> > On Saturday 02 March 2013, Alexander Shiyan wrote:
> > > Board options are already under "if ARCH_S3C24XX" condition, so
> > > additional dependencies on this symbol can be removed.
> > >
> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> >
> > Hi Alexander,
> >
> > Is this just a cosmetic change that has no other consequences, or do you
> > have other follow-up patches that depend on patches 1-3?
> 
> Hello Arnd.
> Nothing more yet. Perhaps I'll do a merging some parts of the code for
> different versions of the CPU into one unit and some future changes
> may remove some Kconfig symbols, so it is only initial Kconfig cleaning.
> Thanks.
> 
Looks good to me on patches 1-3 but for 4th patch, see my comments on that.

Applied 1-3 patches, thanks.

- Kukjin
