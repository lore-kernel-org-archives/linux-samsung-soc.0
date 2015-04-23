From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Fix wake-up interrupts for Exynos3250
Date: Thu, 23 Apr 2015 09:15:18 +0900
Message-ID: <CAJKOXPd45=c5fybCiyExdyRUZcC9p8zdZqZPPYcjiZd5x28sHw@mail.gmail.com>
References: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f47.google.com ([209.85.216.47]:36505 "EHLO
	mail-vn0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965757AbbDWAPX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 20:15:23 -0400
Received: by vnbf62 with SMTP id f62so184281vnb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Apr 2015 17:15:18 -0700 (PDT)
In-Reply-To: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

2015-04-23 2:40 GMT+09:00 Marc Zyngier <marc.zyngier@arm.com>:
> Commit 8b283c025443 (ARM: exynos4/5: convert pmu wakeup to
> stacked domains) changed the Exynos PMU code to use stacked
> domains. This has led to a number of interrupt numbers to be
> fixed.
>
> In the meantime, support for Exynos 3250 was added, missing
> the required change to this platform. This amounts to revert
> ace283a04a4a (ARM: EXYNOS: Fix wrong hwirq of RTC interrupt
> for Exynos3250 SoC), as the initial patch was right, just a
> bit early...
>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  arch/arm/mach-exynos/suspend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Thanks for fixing this!
Best regards,
Krzysztof
