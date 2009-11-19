From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 01/18] ARM: MM: use 64bytes of L1 cache on plat S5PC1xx
Date: Thu, 19 Nov 2009 11:35:15 +0100
Message-ID: <000001ca6903$fe501540$faf03fc0$%szyprowski@samsung.com>
References: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-2-git-send-email-m.szyprowski@samsung.com>
 <20091113231903.GO4808@trinity.fluff.org>
 <20091119093908.GE13376@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10676 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205AbZKSKfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 05:35:17 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTC00DRYQQXHL@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 19:35:21 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KTC000T0QQTT6@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 19:35:21 +0900 (KST)
In-reply-to: <20091119093908.GE13376@n2100.arm.linux.org.uk>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, laforge@gnumonks.org, kyungmin.park@samsung.com, bhmin@samsung.com, linux-arm-kernel@lists.infradead.org

Hello,

On November 19, 2009 10:39 AM Russell King wrote:

> On Fri, Nov 13, 2009 at 11:19:03PM +0000, Ben Dooks wrote:
> > On Thu, Nov 12, 2009 at 09:21:45AM +0100, Marek Szyprowski wrote:
> > > From: Kyungmin Park <kyungmin.park@samsung.com>
> > >
> > > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > This one i'll keep out of the series, as it either needs to go to Russell's
> > patch tracker on be on a branch for Russell to merge into the main arm
> > tree.
> 
> FYI, I haven't seen it there yet.

Ok. I've just posted it there. I thought that posting it again on ARM mailing
list as a separate patch would be enough.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
