From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND PATCHv2 0/3] Power-domain clk handling
Date: Thu, 10 Jul 2014 22:26:14 +0900
Message-ID: <024101cf9c42$861966e0$924c34a0$@samsung.com>
References: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10882 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753403AbaGJN0Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jul 2014 09:26:16 -0400
In-reply-to: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, shaik.ameer@samsung.com, arunkk.samsung@gmail.com

Arun Kumar K wrote:
> 
> This patch series for clock handling in power domain is
> re-send for merging after rebasing onto latest linux-samsung.git,
> for-next branch.
> Original series and discussion can be found here:
> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31550.html
> 
> Arun Kumar K (2):
>   clk: exynos5420: Add IDs for clocks used in PD mfc
>   ARM: dts: Add clock property for mfc_pd in 5420
> 
> Prathyush K (1):
>   ARM: EXYNOS: Add support for clock handling in power domain
> 
>  .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |    3 +
>  arch/arm/mach-exynos/pm_domains.c                  |   61 +++++++++++++++++++-
>  drivers/clk/samsung/clk-exynos5420.c               |    6 +-
>  include/dt-bindings/clock/exynos5420.h             |    2 +
>  5 files changed, 89 insertions(+), 3 deletions(-)
> 
> --
> 1.7.9.5

Yeah, this is required now because regarding clock registers are also powered
down during pd-off on some exynos SoCs as you mentioned. Just note that you
know the registers are moved into pd related register on latest exynos SoC's
anyway. 

OK, I will apply into fixes for 3.16.

Thanks,
Kukjin
