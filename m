From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Power domain DT support extension
Date: Wed, 19 Sep 2012 15:28:13 +0200
Message-ID: <269615331.sxeOnu1O9R@amdc1227>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33561 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754310Ab2ISN2U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 09:28:20 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAL007OPMR5CQP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 22:28:19 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAL004GLMR5E1A0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 22:28:19 +0900 (KST)
In-reply-to: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl

Hi,

On Thursday 06 of September 2012 11:38:03 Tomasz Figa wrote:
> This patch series fixes two issues with existing DT support for Exynos
> power domains and extends it with the ability of binding devices to
> domains, basically making it possible to use power domains when using
> DT.
> 
> Tomasz Figa (3):
>   ARM: EXYNOS: pm_domain: Detect domain state on registration from DT
>   ARM: EXYNOS: pm_domain: Fix power domain name initialization
>   ARM: EXYNOS: pm_domain: Bind devices to power domains using DT
> 
>  .../bindings/arm/exynos/power_domain.txt           | 15 +++-
>  arch/arm/mach-exynos/pm_domains.c                  | 93
> +++++++++++++++++++++- 2 files changed, 100 insertions(+), 8
> deletions(-)

Any further comments for this series? Could we merge it for 3.7?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
