From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix the IRQ definitions for MIPI CSIS device
Date: Fri, 12 Aug 2011 19:18:53 +0900
Message-ID: <008901cc58d9$3ea0b9d0$bbe22d70$%kim@samsung.com>
References: <1312809118-6181-1-git-send-email-s.nawrocki@samsung.com>
 <4E411BA4.2020909@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40184 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752972Ab1HLKS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:18:58 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT00CTF8N2AQR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:18:57 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00EC08NLRI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:18:57 +0900 (KST)
In-reply-to: <4E411BA4.2020909@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, m.szyprowski@samsung.com

Sergei Shtylyov wrote:
> 
> Hello.
> 
> On 08-08-2011 17:11, Sylwester Nawrocki wrote:
> 
> > This is a regression fix after migration to the external GIC.
> > The breakage has been introduced in commit:
> > "ARM: EXYNOS4: modify interrupt mappings for external GIC"
> 
>     Would be good to also cite that commit's ID for gitweb.
> 
Yes, I think so :)

Sylwester,
This is required now so I added commit id when I applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
