From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
Date: Mon, 4 Oct 2010 11:30:42 -0700
Message-ID: <20101004183041.GD2835@opensource.wolfsonmicro.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286192545-18327-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47869 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756684Ab0JDWj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 18:39:28 -0400
Content-Disposition: inline
In-Reply-To: <1286192545-18327-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Mon, Oct 04, 2010 at 08:42:25PM +0900, Seungwhan Youn wrote:
> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
> on S5PC100.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but...

> +static int s5pc100_spdif_set_rate(struct clk *clk, unsigned long rate)
> +{
> +	struct clk *pclk;
> +	int ret;

This and the get() look like they're generic (they just proxy the
operation on to the parent clock, which I imagine applies to a bunch of
other clocks too.
