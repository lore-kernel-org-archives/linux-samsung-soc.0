From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Configure ARM_NR_BANKS for EXYNOS SoC
Date: Thu, 09 Feb 2012 09:44:51 +0900
Message-ID: <000001cce6c4$0e1fb800$2a5f2800$%kim@samsung.com>
References: <003201cce600$81c8f100$855ad300$%kim@samsung.com>
 <20120208084716.GG889@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42165 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756840Ab2BIApD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Feb 2012 19:45:03 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ300JEBOQSE610@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 09:45:01 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ3000UBOQSCP60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 09:45:01 +0900 (KST)
In-reply-to: <20120208084716.GG889@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene.kim@samsung.com>

Russell King - ARM Linux wrote:
> >
> >  config ARM_NR_BANKS
> >  	int
> > -	default 16 if ARCH_EP93XX
> > +	default 16 if ARCH_EP93XX || ARCH_EXYNOS4 || ARCH_EXYNOS5
>
> ARCH_EXYNOS ?
ARCH_EXYNOS5 may support the bigger memory than 4GB because it's running series.
Anyway ARCH_EXYNOS seems be better now. I will resend it soon.
Thank you..

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
