From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] MAINTAINERS: Extend Samsung patterns to cover SPI and
 ASoC drivers
Date: Thu, 01 Dec 2011 16:30:07 +0900
Message-ID: <045e01ccaffb$0cb6cb20$26246160$%kim@samsung.com>
References: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1320923776-26626-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <005701cca376$f6abbba0$e40332e0$%kim@samsung.com>
 <20111115111603.GC3077@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16996 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753333Ab1LAHaJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 02:30:09 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVI00MGRKSMWXF0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 16:30:07 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVI00LUOKU7DX70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 16:30:07 +0900 (KST)
In-reply-to: <20111115111603.GC3077@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, grant.likely@secretlab.ca

Mark Brown wrote:
> 
> On Tue, Nov 15, 2011 at 06:14:22PM +0900, Kukjin Kim wrote:
> > Mark Brown wrote:
> 
> > > +F:	drivers/spi/spi-s3c*
> > > +F:	sound/soc/samsung/*
> 
> > Hmm, I'm ok on this but needs Grant's opinion :)
> 
> > (Cc'ed Grant Likely)
> 
> Note that you can have multiple entries for a single file, people are
> supposed to use a bit of thought when working out who to mail - if you
> use something like get_maintainers it'll return all matching entries.

OK, I agree.
Will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
