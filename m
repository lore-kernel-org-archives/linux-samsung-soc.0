From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH][resend] ARM: EXYNOS: Remove leftovers of the Samsung
 specific power domain control
Date: Fri, 22 Jun 2012 11:08:22 +0900
Message-ID: <04ab01cd501b$e6953690$b3bfa3b0$%kim@samsung.com>
References: <201205230936.46759.b.zolnierkie@samsung.com>
 <038001cd4f43$909269d0$b1b73d70$%kim@samsung.com>
 <201206211130.20174.b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16221 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab2FVCId (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jun 2012 22:08:33 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5Z003B2XXKCR90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jun 2012 11:08:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5Z00A44XXYT170@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jun 2012 11:08:22 +0900 (KST)
In-reply-to: <201206211130.20174.b.zolnierkie@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Grant Likely' <grant.likely@secretlab.ca>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org

Bartlomiej Zolnierkiewicz wrote:
> 
> On Thursday 21 June 2012 02:19:46 Kukjin Kim wrote:
> > Bartlomiej Zolnierkiewicz wrote:
> > >
> > > From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Subject: [PATCH] ARM: EXYNOS: Remove leftovers of the Samsung specific
> > > power domain control
> > >
> > > Nowadays we use generic power domain support instead of Samsung
> > > specific power domain control driver.
> > >
> > > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > > Cc: Rob Herring <rob.herring@calxeda.com>
> > > Cc: Grant Likely <grant.likely@secretlab.ca>
> > > Cc: Rafael J. Wysocki <rjw@sisk.pl>
> > > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> 
> [...]
> 
> > Looks OK, but you need to re-submit this with right format :(
> >
> > Applying: ARM: EXYNOS: Remove leftovers of the Samsung specific power
> domain
> > control
> > fatal: patch fragment without header at line 20: @@ -48,7 +48,6 @@
> 
> Sorry for this.  Here is a refreshed version against your for-next tree.
> 
No, I meant you need to create your patch with git-format-patch not wrong
against on.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
