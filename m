From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S3C64XX: Use chip_data to store the shift for
 EINTs
Date: Wed, 01 Dec 2010 21:11:21 +0900
Message-ID: <003d01cb9150$e0282690$a07873b0$%kim@samsung.com>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1290698309-7691-3-git-send-email-broonie@opensource.wolfsonmicro.com>
 <003101cb914d$1caf7040$560e50c0$%kim@samsung.com>
 <20101201115535.GK24176@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8363 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417Ab0LAMLh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 07:11:37 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCR000NI0JBW920@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 21:11:35 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCR00IVT0JBGS@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 21:11:35 +0900 (KST)
In-reply-to: <20101201115535.GK24176@rakim.wolfsonmicro.main>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Wed, Dec 01, 2010 at 08:44:25PM +0900, Kukjin Kim wrote:
> > Mark Brown wrote:
> 
> > > This makes all the functions that use the shift slightly smaller, one
> > > instruction in most cases but more for ack() and maskack().
> 
> > Uhm...I'm not sure to use chip_data for the eint_irq_to_bit() is best to
us.
> 
> Could you elaborate on your concern here?  I can't think of anything
> else we might want to include in the data, and avoiding the shifts
> and/or dereferences seems useful for anyone doing interrupt heavy work.

Hehehe :-)
I just thought it again, I agree with you. Your patch looks ok to me...will
apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
