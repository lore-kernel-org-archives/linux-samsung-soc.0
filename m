From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND PATCH 1/3] ARM: EXYNOS: Move arm core power down clock to
 exynos5250 common clock
Date: Thu, 13 Jun 2013 21:26:45 +0900
Message-ID: <150e01ce6831$44d94920$ce8bdb60$%kim@samsung.com>
References: <1363240979-1939-2-git-send-email-amit.daniel@samsung.com>
 <1370501833-9196-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19487 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756470Ab3FMM0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 08:26:47 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB00MHGZWMZ900@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 21:26:46 +0900 (KST)
In-reply-to: <1370501833-9196-1-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Mike Turquette' <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Amit Daniel Kachhap wrote:
> 
> Now with common clock support added for exynos5250 it is necessary to move
> this code to exynos5250 common clock driver as clock registers should be
> handled there. This change is tested in exynos5250 based arndale platform.
> 
> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>

Hmm...I'm not sure it's better to handle the ARM core power down clock in
common clock but the clock registers should be handled in one part, clock.

Acked-by: Kukjin Kim <kgene.kim@samsugn.com>

Mike, the mach-exynos/cpuidle.c is not touched in samsung tree at this
moment, so this patch will not create any conflict between samsung and clk.

Thanks,
- Kukjin
