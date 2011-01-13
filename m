From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH/RFC 1/3] ARM: S5P: Add a platform callback for MIPI CSIS
 PHY control
Date: Thu, 13 Jan 2011 11:12:59 +0900
Message-ID: <4D2E5FAB.6010106@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
 <1294153764-25006-2-git-send-email-s.nawrocki@samsung.com>
 <020301cbb2c1$5ed9dec0$1c8d9c40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44501 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab1AMCNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jan 2011 21:13:16 -0500
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LEX00G8HVHXNW@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 02:13:09 +0000 (GMT)
Received: from [10.89.54.82] by spt1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LEX000TUVHT84@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 02:13:09 +0000 (GMT)
In-reply-to: <020301cbb2c1$5ed9dec0$1c8d9c40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Hi Kukjin,

thank you for the update.

On 01/13/2011 10:29 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> The phy_enable callback in struct s5p_platform_mipi_csis is added
>> to allow the CSIS driver to control its PHY enable and reset signals.
>> This allows to use same MIPI CSIS driver across various SoCs.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/plat-s5p/dev-csis0.c              |    2 +-
>>  arch/arm/plat-s5p/dev-csis1.c              |    2 +-
>>  arch/arm/plat-s5p/include/plat/csis.h      |   28 --------------------
>>  arch/arm/plat-s5p/include/plat/mipi_csis.h |   39
>> ++++++++++++++++++++++++++++
>>  4 files changed, 41 insertions(+), 30 deletions(-)
>>  delete mode 100644 arch/arm/plat-s5p/include/plat/csis.h
>>  create mode 100644 arch/arm/plat-s5p/include/plat/mipi_csis.h
>>
...
> 
> I think should be separated like following.
> 
> If required, ...
> 
> 1. change copyright
> 2. rename csis.h to mipi_csis.h

I don't want to bother with a separate patches for that, just prefer
to drop the above changes.

> 3. add phy enable feature

OK, I would reduce the patch to that change only.

Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
