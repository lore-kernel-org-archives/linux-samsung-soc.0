From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/4] ARM: S5P: Add platform support for MIPI-CSI2 devices
Date: Fri, 03 Dec 2010 11:00:46 +0100
Message-ID: <4CF8BFCE.3030908@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <012201cb92a0$3644eae0$a2cec0a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:32701 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932349Ab0LCKAv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 05:00:51 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LCU0009MJTCT110@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 10:00:48 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCU0067KJTB31@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 10:00:47 +0000 (GMT)
In-reply-to: <012201cb92a0$3644eae0$a2cec0a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Hi Kukjin,

On 12/03/2010 05:11 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Hello,
>>
> Hi :-)
> 
>> the following patch series adds S5P platform support for MIPI-CSI2
> devices.
>> It has been rebased onto next-samsung branch at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
> It would be more helpful to me to use the 'for-next' next time.

OK, thank you for the hint. I'll keep that in mind or will be asking
in advance if possible.

>>
>> [PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
>> [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
>> [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
>> [PATCH 4/4] mach-s5pv210: Add MIPI-CSI DPHY clock definition
>>
> 
> And used following commit title in others...
> 
> ARM: S5PV210: xxx
> ARM: S5P: xxx

Ok, will stick to that.

Thanks,
Sylwester

-- 
Sylwester Nawrocki
Linux Platform Group
Samsung Poland R&D Center
