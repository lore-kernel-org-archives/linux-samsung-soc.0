From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3] ARM: S3C24XX: Add WIZnet W5300E01-ARM board support
Date: Tue, 20 Nov 2012 13:54:01 +0900
Message-ID: <0b6f01cdc6db$0ed72290$2c8567b0$@org>
References: <1346653236-19728-1-git-send-email-kth3321@gmail.com>
 <1346905640.2573.14.camel@taehun-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13825 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770Ab2KTEyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 23:54:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDR003HUS6I1NG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 13:54:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDR002LPSA1MJ00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 13:54:01 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Taehun Kim' <kth3321@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sylvester.nawrocki@gmail.com

Kukjin Kim wrote:
> 
> Taehun Kim wrote:
> >
> > - The gpio routines are changed to use the gpio_request() functions from
> >   comments of Vasily and Sylwester.
> > - The mistake of adding a character by my email client automatically is
> > fixed.
> >
> > Please review this patch and apply it if do not have any problems.
> >
> 
> Taehun,
> 
> Above area is for adding comments like 'This patch adds WIZnet W5300E01
> board' because it will be remained in its git log and nobody want to see
> your old request in there. If any comments which are not related to
> changes just put it after '---' around your sign. It doesn't hurt your
> patch.
> 
> And you need to update this against on for-next of my tree because some
> S3C2410 gpio APIs have been gone.(See the Sylwester's comments) Please re-
> send this.
> 
Any updates on this?

K-Gene <kgene@kernel.org>

> 
> 
> > Signed-off-by: Taehun Kim <kth3321@gmail.com>
> > ---
> >  arch/arm/mach-s3c24xx/Kconfig         |    5 +
> >  arch/arm/mach-s3c24xx/Makefile        |    1 +
> >  arch/arm/mach-s3c24xx/mach-w5300e01.c |  193
> > +++++++++++++++++++++++++++++++++
> >  3 files changed, 199 insertions(+)
> >  create mode 100644 arch/arm/mach-s3c24xx/mach-w5300e01.c
> >
> [snip]
