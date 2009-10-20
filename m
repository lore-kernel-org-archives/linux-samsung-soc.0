From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH v2 1/4] S3C: sdhci: Fix incorrect clock option for SDHCI
	base clock.
Date: Tue, 20 Oct 2009 20:07:24 +0900
Message-ID: <84c135f50910200407k2c4ebb92m1020a502dcc72a4d@mail.gmail.com>
References: <1255585698-31029-1-git-send-email-thomas.ab@samsung.com>
	 <20091015214428.GS28849@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f171.google.com ([209.85.216.171]:57727 "EHLO
	mail-px0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbZJTLMW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2009 07:12:22 -0400
Received: by pxi1 with SMTP id 1so1280612pxi.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2009 04:12:26 -0700 (PDT)
In-Reply-To: <20091015214428.GS28849@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Ben,

On Fri, Oct 16, 2009 at 6:44 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Thu, Oct 15, 2009 at 02:48:18PM +0900, Thomas Abraham wrote:
>> The third base clock option for SDHCI controller in S3C64XX is
>> mout_epll. This patch removes mmc_bus clock and uses mout_epll
>> as the third clock option for SDHCI base clock.
>
> I thought the MMC bus clock was the one that was gated through the
> SCLK_MMC0 and the CLKSRC_MMC0 divider system which takes not only the
> mout_epll, but dout_epll, fin_epll and the 27m clock, as so:
>
> static struct clk *clkset_spi_mmc_list[] = {
>        &clk_mout_epll.clk,
>        &clk_dout_mpll,
>        &clk_fin_epll,
>        &clk_27m,
> };
>
> So I don't think this change is the right one but I don't have any
> docummentation to hand as I'm currently attending ELC09.
>

As per the 6410 user manual, the 6410 SDHCI controller module receives
two clocks - CLKMMCx and SDHCI controller base clock.

The CLKMMCx clock source can be derived from one of the four possible
parent clocks - mout_epll, dout_mpll, fin_epll and 27Mhz. The parent
clock is selected using the MMC mux and it goes through a divider
before being used as CLKMMCx.

The SDHCI controller base clock can be derived from one the four
possible parent clocks - hclk, hclk, epll and ext clock. The parent
clock for base clock is selected using CONTROL2[5:4] register bits.
The CONTROL2 register is part of the SDHCI controller module.

The CLKMMCx clock is represented using the name "mmc_bus" in
"plat-s3c64xx/s3c6400-clock.c" file.

The list of parent clock sources for second clock (SDHCI base clock)
is listed in "mach-s3c6410/setup-sdhci.c" file
(s3c6410_hsmmc_clksrcs). In this list, "mmc_bus" was listed as parent
clock. This, I feel is not correct because "mmc_bus" clock is the
CLKMMCx clock. So this patch replaced "mmc_bus" with "mout_epll" as
the clock source (which is as per the spec).

Please let us know your opinion.

Thanks,
Thomas.
