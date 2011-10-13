From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 1/2] ARM: EXYNOS4: Add SPI support
Date: Thu, 13 Oct 2011 11:02:06 +0100
Message-ID: <20111013100206.GP21648@n2100.arm.linux.org.uk>
References: <1318234084-19960-1-git-send-email-padma.v@samsung.com> <1318234084-19960-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55241 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752353Ab1JMKCX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 06:02:23 -0400
Content-Disposition: inline
In-Reply-To: <1318234084-19960-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, kgene.kim@samsung.com

On Mon, Oct 10, 2011 at 01:38:04PM +0530, Padmavathi Venna wrote:
> +void __init exynos4_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
> +{
> +	struct s3c64xx_spi_info *pd;
> +
> +	/* Reject invalid configuration */
> +	if (!num_cs || src_clk_nr < 0
> +			|| src_clk_nr > EXYNOS4_SPI_SRCCLK_SCLK) {
> +		printk(KERN_ERR "%s: Invalid SPI configuration\n", __func__);

Let's start using pr_err() rather than printk(KERN_ERR...) in ARM code
please.
