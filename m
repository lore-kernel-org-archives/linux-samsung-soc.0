From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 3/8] ARM: EXYNOS4: Add support PM with external GIC
Date: Mon, 04 Jul 2011 18:35:05 +0900
Message-ID: <004e01cc3a2d$abab2080$03016180$%kim@samsung.com>
References: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com>
 <1309485457-13305-4-git-send-email-kgene.kim@samsung.com>
 <20110701212144.GF21898@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12461 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752379Ab1GDJfN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 05:35:13 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNS006O8YMINUP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 18:35:11 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNS00K3DYMNOD@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 18:35:11 +0900 (KST)
In-reply-to: <20110701212144.GF21898@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org, 'Colin Cross' <ccross@android.com>

Russell King - ARM Linux wrote:
> 
> Why not fix arch/arm/common/gic.c to save and restore the GIC state
> itself?
> 
Sorry I missed that. I saw "ARM: gic: Use cpu pm notifiers to save gic
state" by Colin Cross just now so will follow that up for supporting Samsung
SoCs which use GIC.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
