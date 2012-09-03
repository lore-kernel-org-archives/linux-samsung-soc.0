From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/6] ARM: Exynos4: Add OF compatibility lookups for Exynos4
 i2c adapters
Date: Mon, 03 Sep 2012 14:21:44 +0200
Message-ID: <6770236.6s5UZoWZ6I@amdc1227>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
 <1346311903-15920-5-git-send-email-t.figa@samsung.com>
 <CAJuYYwT+diyXX0O2WOJ3=yFMJwEXLbb30rmcYfbomjaFEQmOuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64341 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911Ab2ICMVs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 08:21:48 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9R00A18X0B0XY0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:21:47 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9R000IYX09AEC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:21:47 +0900 (KST)
In-reply-to: <CAJuYYwT+diyXX0O2WOJ3=yFMJwEXLbb30rmcYfbomjaFEQmOuQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com

Hi Thomas,

Thanks for reviewing the patch.

On Friday 31 of August 2012 09:29:42 Thomas Abraham wrote:
> > +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(0),
> > +                               "s3c2440-i2c.0", NULL),
> 
> i2c0 lookup information is already in this list. So the above line
> should not be included in this patch.

Right, I must have overlooked it.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
