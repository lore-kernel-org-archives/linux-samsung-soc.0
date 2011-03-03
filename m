From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/3] ARM: S5P: Rename MIPI-CSIS header and update Copyright
Date: Thu, 03 Mar 2011 10:34:21 +0100
Message-ID: <4D6F609D.3020501@samsung.com>
References: <1299087289-29926-1-git-send-email-s.nawrocki@samsung.com>
 <1299087289-29926-2-git-send-email-s.nawrocki@samsung.com>
 <01a501cbd95c$37069cf0$a513d6d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33690 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757717Ab1CCJe2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 04:34:28 -0500
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LHH0080Z6LBZB90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 09:34:23 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHH00KUA6L9PH@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 09:34:22 +0000 (GMT)
In-reply-to: <01a501cbd95c$37069cf0$a513d6d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com


On 03/03/2011 05:33 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/plat-s5p/dev-csis0.c              |    2 +-
>>  arch/arm/plat-s5p/dev-csis1.c              |    2 +-
>>  arch/arm/plat-s5p/include/plat/csis.h      |   28
> --------------------------
>> --
>>  arch/arm/plat-s5p/include/plat/mipi_csis.h |   28
>> ++++++++++++++++++++++++++++
>>  4 files changed, 30 insertions(+), 30 deletions(-)
>>  delete mode 100644 arch/arm/plat-s5p/include/plat/csis.h
>>  create mode 100644 arch/arm/plat-s5p/include/plat/mipi_csis.h
>>
> Oops, why didn't use '-M'?
> It can show me this like following.
> 

Yes, I could do better. Sorry, I had two version of the patch
and somehow ended up with te wrong one being send.

> .../plat-s5p/include/plat/{csis.h => mipi_csis.h}  |   10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename arch/arm/plat-s5p/include/plat/{csis.h => mipi_csis.h} (68%)
> 
> Secondly, I remember this...
> Following is your response at that time.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2011-January/038037.ht
> ml
> 

Yes, but afterwards I realized there will be issues when one is trying
to build common kernel binary for multiple SoCs.
Nevertheless I will prepare common code for S5P and a callback into platform
code, so at least we can move on with the v4l driver.

Thanks,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
