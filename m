From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 3/8] ARM: EXYNOS4: Add support PM with external GIC
Date: Fri, 08 Jul 2011 16:21:43 +0900
Message-ID: <002a01cc3d3f$b1eff9b0$15cfed10$%kim@samsung.com>
References: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com>
 <1309485457-13305-4-git-send-email-kgene.kim@samsung.com>
 <20110701212144.GF21898@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53161 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab1GHHVs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2011 03:21:48 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LO0000QS74AKYL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 16:21:46 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LO000LRB74AOX@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 16:21:46 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org, 'Colin Cross' <ccross@android.com>

Kukjin Kim wrote:
> 
> Russell King - ARM Linux wrote:
> >
> > Why not fix arch/arm/common/gic.c to save and restore the GIC state
> > itself?
> >
> Sorry I missed that. I saw "ARM: gic: Use cpu pm notifiers to save gic
state" by
> Colin Cross just now so will follow that up for supporting Samsung SoCs
which
> use GIC.
> 
Hi Russell,

We tested this with Colin's "ARM: gic: Use cpu pm notifiers to save gic
state" and it works fine.
So right now we don't need to add some stuff of GIC in common but I'm not
sure how it was going on...

Anyway how do you think that firstly I apply these into -next? If this
commit is not required will rebase(to remove existing save/restore GIC)
before pull request.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
