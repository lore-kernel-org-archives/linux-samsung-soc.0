From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] pinctrl: add a gpio and pinctrl driver for samsung
 io-pad controllers
Date: Wed, 16 Nov 2011 11:23:05 +0000
Message-ID: <20111116112305.GA773@sirena.org.uk>
References: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48125 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756008Ab1KPLXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 06:23:09 -0500
Content-Disposition: inline
In-Reply-To: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linaro-kernel@lists.linaro.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com

On Wed, Nov 16, 2011 at 01:36:40AM +0530, Thomas Abraham wrote:

> +/* Note: The pin group list needs to be further populated */
> +static unsigned int exynos4210_spi0_pins[] = {
> +	EXYNOS4_GPB(0),	EXYNOS4_GPB(1),	EXYNOS4_GPB(2),	EXYNOS4_GPB(3),
> +};

Given the large number of SoCs in play here might it not be better to
arrange things so that the data part can go in the SoC directory, or at
least in a file separate to the main driver.  Otherwise the file is
going to get enormous but that's mostly going to be data tables.

Also, I'd expect these pin lists to include information on the function
number.
