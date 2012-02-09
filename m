From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCHv3 1/3] ARM: Exynos: JPEG board definition
Date: Thu, 09 Feb 2012 15:46:23 +0100
Message-ID: <008101cce739$9839f8f0$c8adead0$%szyprowski@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
 <1328095165-31628-2-git-send-email-andrzej.p@samsung.com>
 <001601cce726$3dee9080$b9cbb180$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28347 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757653Ab2BIOqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 09:46:30 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZ4002NLRPGKN@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 14:46:28 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ400DWQRPG11@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 14:46:28 +0000 (GMT)
In-reply-to: <001601cce726$3dee9080$b9cbb180$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

On Thursday, February 09, 2012 1:28 PM Kukjin Kim wrote:

> > ARM: Exynos: JPEG board definition
> >
> 
> [...]
> 
> >
> > +#define EXYNOS4_PA_JPEG			0x11840000
> > +
> >  #define EXYNOS4_PA_G2D			0x12800000
> >
> >  #define EXYNOS4_PA_I2S0			0x03830000
> > @@ -164,6 +166,7 @@
> >  #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
> >  #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
> >  #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
> > +#define S5P_PA_JPEG			EXYNOS4_PA_JPEG
> 
> I'm not sure we _really_ need to re-define for JPEG.
> Why not just use EXYNOS4_PA_JPEG?

The s5p-jpeg driver can be also used on S5PV210 so this approach seems 
to be fine, the patch only lacks definitions for the S5PV210 series.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
