From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] PM / OPP: Remove ARCH_HAS_OPP
Date: Mon, 9 Jun 2014 10:19:20 +0530
Message-ID: <CAOh2x=ms6Z421AqGAQxJFA3v63fDGu+=+zfrVzNzrfQOZoZGjg@mail.gmail.com>
References: <1402051016-28853-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:44285 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbaFIEtV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 00:49:21 -0400
In-Reply-To: <1402051016-28853-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Tony Lindgren <tony@atomide.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Linux PM list <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org, linux-sh@vger.kernel.org, Mark Brown <broonie@linaro.org>

On Fri, Jun 6, 2014 at 4:06 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Since the OPP layer is a kernel library which has been converted to be
> directly selectable by its callers rather than user selectable and
> requiring architectures to enable it explicitly the ARCH_HAS_OPP symbol
> has become redundant and can be removed. Do so.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  Documentation/power/opp.txt    | 3 ---
>  arch/arm/mach-exynos/Kconfig   | 1 -
>  arch/arm/mach-highbank/Kconfig | 1 -
>  arch/arm/mach-imx/Kconfig      | 1 -
>  arch/arm/mach-omap2/Kconfig    | 1 -
>  arch/arm/mach-shmobile/Kconfig | 2 --
>  arch/arm/mach-vexpress/Kconfig | 1 -
>  arch/arm/mach-zynq/Kconfig     | 1 -
>  drivers/devfreq/Kconfig        | 1 -
>  kernel/power/Kconfig           | 3 ---
>  10 files changed, 15 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
