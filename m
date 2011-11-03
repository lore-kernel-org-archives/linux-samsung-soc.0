From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/3 v3] ARM: EXYNOS4: Support for generic I/O power domains
 on EXYNOS4210/4212
Date: Thu, 03 Nov 2011 11:24:34 +0100
Message-ID: <4EB26BE2.2060508@samsung.com>
References: <4EA690EF.4000703@samsung.com>
 <013301cc99cd$8d5a6a00$a80f3e00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13503 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752670Ab1KCKYh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 06:24:37 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LU20039FY8ZOR@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Nov 2011 10:24:35 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LU200J40Y8Y5E@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Nov 2011 10:24:35 +0000 (GMT)
In-reply-to: <013301cc99cd$8d5a6a00$a80f3e00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Sylwester Nawrocki' <snjw23@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

Hi Kgene,

On 11/03/2011 03:09 AM, Kukjin Kim wrote:
> As I said, I don't think we should control/gate the clocks with regarding power domain. 

As far as I know there is a plan to let the drivers override start/stop_device callbacks,
moreover the clock control can be disabled globally by not implementing start/stop_device
callbacks or per device by not adding clkdev entities to the device clock list at runtime 
PM core. So IMHO, there is/going to be enough flexibility.

> It should be controlled by each regarding device driver and in addition, as I know,
> to handle block of clock is not recommended on EXYNOS4 now.

What do you mean by this ? I couldn't find such information in any documentation.
Shouldn't "clock gate block" registers be touched by boot loader and the kernel?
Our boot loaders disable all clocks, and if the global clock gate is not enabled
by the kernel there is no chance any multimedia device will work.

Should the global clock block gate be always enabled then ? I'm afraid it is not
optimal form power management POV.

-- 
Thanks,
Sylwester
