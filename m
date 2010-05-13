From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: S5PC100 planning
Date: Thu, 13 May 2010 13:11:43 +0200
Message-ID: <006a01caf28d$13e86bb0$3bb94310$%szyprowski@samsung.com>
References: <20100513042545.GT6684@trinity.fluff.org>
 <006901caf283$60709930$2151cb90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:51001 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758547Ab0EMLMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 07:12:24 -0400
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2C007EIV4LRD@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 20:12:22 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2C00CFKV4BXU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 20:12:21 +0900 (KST)
In-reply-to: <006901caf283$60709930$2151cb90$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com

Hello,

On Thursday, May 13, 2010 12:02 PM Kukjin Kim wrote:

> Ben Dooks wrote:
> >
> > I would like to get an idea of what each group involvedi n the
> > current S5PC100 changes is planning to allow the organisation of
> > what is going on.
> >
> > Firstly, I think Kukjin's clock changes are the first to be
> > applied, followed by looking at what support exists (or is being
> > submitted) in plat-s5p which could be used for s5pc100.
> >
> > Then, let's move out what is left of plat-s5pc1xx into mach-s5pc100
> > and get rid of it (although the final removal may have to be left
> > until the next merge window, due to time constraints).
> >
> > I would like to see whatever changes done grouped into sections,
> > such as clock, machine, core, gpio.
> 
> I will re-submit S5PC100 clock patch which can be merged to Ben's latest
> tree
> without any compile error.
> 
> Marek, can you re-make your patches based on it?

Yes, I will do this soon.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
