From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH] ARM: MM: Configure the number of banks
Date: Mon, 12 Dec 2011 15:46:53 +0900
Message-ID: <006901ccb899$d5c33930$8149ab90$%kim@samsung.com>
References: <1323048539-9573-1-git-send-email-boojin.kim@samsung.com>
 <20111211100325.GR14542@n2100.arm.linux.org.uk>
 <20111211102443.GT14542@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13315 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931Ab1LLGrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 01:47:04 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW200138W5Q1PO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 15:46:54 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW20088KW658Y20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 15:46:54 +0900 (KST)
In-reply-to: <20111211102443.GT14542@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

Russell King wrote:


> >
> >  source arch/arm/mm/Kconfig
> >
> > +config ARM_NR_BANKS
> > +	int
> > +	default 16 if ARCH_EP93XX
>
> I've now committed this patch - if you want to add exynos to this,
> please send a patch to do just that.  Thanks.

It's good to me.
Thank you for review !
