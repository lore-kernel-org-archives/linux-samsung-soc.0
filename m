From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH/RFC 2/3] ARM: S5PV310: Add a platform helper for MIPI
 DSIM/CSIS setup
Date: Thu, 13 Jan 2011 11:36:43 +0900
Message-ID: <4D2E653B.4090502@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
 <1294153764-25006-3-git-send-email-s.nawrocki@samsung.com>
 <020401cbb2c1$ef9f7c30$cede7490$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61228 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932538Ab1AMCg4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jan 2011 21:36:56 -0500
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LEX00654WLHW770@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 02:36:53 +0000 (GMT)
Received: from [10.89.54.82] by spt2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LEX00NU7WLE2Q@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 02:36:53 +0000 (GMT)
In-reply-to: <020401cbb2c1$ef9f7c30$cede7490$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

On 01/13/2011 10:33 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> MIPI_PHYn_CONTROL registers are shared between MIPI DSIM
>> and MIPI CSIS drivers so a spinlock is used to protect multiple
>> access to these registers. Also a proper state of a common
>> PHY enable bit is maintained in order to avoid a DSIM
>> and CSIS driver conflict.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
...
> 
> Basically, it's not good that each machine(SoC) has each own setup-mipi...
> Because it is very similar(almost same)...means can move it in plat-s5p with
> following. 
> 
> 1. # of MIPI PHY can be calculated by platform device id
> 2. can use same definition of MIPI PHY control address with same name
> re-mapping.

Yes, I agree with that. Originally I had it done it plat-s5p, I will
prepare a merged version. The main difference between s5pv210 and s5pv310
indeed was the register naming and placement in PMU or CLK subsystem, so the
register  address definitions were in regs-clk.h or regs-pmu.h. So there 
just will have to be included different header files depending on on SoC 
architecture.


Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
