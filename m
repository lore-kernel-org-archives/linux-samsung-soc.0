From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM:EXYNOS4: Add the missing clock of EXYNOS4210 to remove
 leakage power
Date: Fri, 19 Aug 2011 15:51:11 +0900
Message-ID: <002701cc5e3c$61a16e80$24e44b80$%kim@samsung.com>
References: <4E425573.30408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55720 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746Ab1HSGvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 02:51:13 -0400
In-reply-to: <4E425573.30408@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'linux-kernel' <linux-kernel@vger.kernel.org>, dg77.kim@samsung.com

Chanwoo Choi wrote:
> 
> Singed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Singed-off-by: Donggeun Kim <dg77.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c                 |  295
> +++++++++++++++++++++++++
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h |    6 +
>  2 files changed, 301 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 arch/arm/mach-exynos4/clock.c
> 
NO. don't change the mode :(

And I don't think we _really_ need to add all clocks if they will not be used anywhere in kernel. If it is required, please turn off the clocks in boot loader.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
