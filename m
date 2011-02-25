From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: S5P: Add platform helpers for camera GPIO
	configuration
Date: Fri, 25 Feb 2011 14:14:08 +0100
Message-ID: <4D67AB20.8000000@samsung.com>
References: <1297447665-19492-1-git-send-email-s.nawrocki@samsung.com>
 <1297447665-19492-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61742 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753665Ab1BYNOM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Feb 2011 08:14:12 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LH600KJYCRM57@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Feb 2011 13:14:10 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LH600EIKCRLJW@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Feb 2011 13:14:09 +0000 (GMT)
In-reply-to: <1297447665-19492-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com


On 02/11/2011 07:07 PM, Sylwester Nawrocki wrote:
> Add functions for the parallel camera GPIO interface
> configuration on S5PV210 and S5PV310 SoCs.
> 

Kukjin, are you OK with general concept of those?
I would probably need to rework the patches after recent
S5PV310 -> EXYNOS4 renaming. And move camera.h 
to arch/arm/plat-samsung/include/plat/?

What's your opinion?

Thanks,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
