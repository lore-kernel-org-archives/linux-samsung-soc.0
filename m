From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Fri, 01 Nov 2013 18:08:59 +0100
Message-ID: <8049244.xSqsotZorc@flatron>
References: <1381763305-7085-1-git-send-email-v.tyrtov@samsung.com> <1381763305-7085-2-git-send-email-v.tyrtov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:38483 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752704Ab3KARI7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Nov 2013 13:08:59 -0400
In-Reply-To: <1381763305-7085-2-git-send-email-v.tyrtov@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vyacheslav Tyrtov <v.tyrtov@samsung.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Tarek Dakhran <t.dakhran@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Naour Romain <romain.naour@openwide.fr>, Heiko Stuebner <heiko@sntech.de>

On Monday 14 of October 2013 19:08:22 Vyacheslav Tyrtov wrote:
> From: Tarek Dakhran <t.dakhran@samsung.com>
> 
> EXYNOS5410 is SoC in Samsung's Exynos5 SoC series.
> Add initial support for this SoC.
> 
> Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig             | 12 ++++++++++++
>  arch/arm/mach-exynos/common.c            | 18 ++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h  |  1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c   |  1 +
>  arch/arm/plat-samsung/include/plat/cpu.h |  8 ++++++++
>  5 files changed, 40 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
