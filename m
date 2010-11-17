From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM: S5PV310: Set bit 22 in the PL310 (cache
 controller) AuxCtlr register
Date: Wed, 17 Nov 2010 09:07:28 +0000
Message-ID: <1289984848.2351.2.camel@e102109-lin.cambridge.arm.com>
References: <1289976931-9759-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:37733 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932635Ab0KQJTb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 04:19:31 -0500
In-Reply-To: <1289976931-9759-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, stable@kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

On Wed, 2010-11-17 at 06:55 +0000, Kukjin Kim wrote:
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -168,7 +168,7 @@ static int __init s5pv310_l2x0_cache_init(void)
>         __raw_writel(L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN,
>                      S5P_VA_L2CC + L2X0_POWER_CTRL);
> 
> -       l2x0_init(S5P_VA_L2CC, 0x7C070001, 0xC200ffff);
> +       l2x0_init(S5P_VA_L2CC, 0x7C470001, 0xC200ffff);

The patch is fine.

But I think we should also set this bit in the cache-l2x0.c file if
PL310. That's such a fundamental issue and it's easy to miss in the
platform code.

-- 
Catalin
