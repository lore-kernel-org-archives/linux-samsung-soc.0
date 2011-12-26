From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Mon, 26 Dec 2011 19:06:17 +0000
Message-ID: <20111226190616.GL8722@opensource.wolfsonmicro.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44248 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752261Ab1LZTGV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 14:06:21 -0500
Content-Disposition: inline
In-Reply-To: <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

On Mon, Dec 12, 2011 at 09:16:29PM +0530, Thomas Abraham wrote:

> +	/* Wait max 1ms */
> +	timeout = 10;
> +	while ((__raw_readl(base + 0x4) & S5P_INT_LOCAL_PWR_EN)
> +					!= S5P_INT_LOCAL_PWR_EN) {
> +		if (!timeout) {
> +			pr_err("Power domain %s enable failed\n", domain->name);
> +			return -ETIMEDOUT;
> +		}
> +		timeout--;
> +		udelay(100);
> +	}

Might be worth putting a cpu_relax() in there just to be a bit nicer?
