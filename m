From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 12 Dec 2011 05:27:46 +0000
Message-ID: <20111212052745.GA686@sirena.org.uk>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
 <1323446682-25252-3-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53747 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751431Ab1LLF1r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 00:27:47 -0500
Content-Disposition: inline
In-Reply-To: <1323446682-25252-3-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

On Fri, Dec 09, 2011 at 05:04:41PM +0100, Kamil Debski wrote:

> index 236bbe1..5251e91 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1262,6 +1262,7 @@ static struct platform_device *nuri_devices[] __initdata = {
>  	&s3c_device_i2c3,
>  	&i2c9_gpio,
>  	&s3c_device_adc,
> +	&s5p_device_g2d,

For devices like g2d which are always part of the SoC and which don't
require any external wiring on the board I was thinking we should just
have the core code for the SoC register the device rather than including
it in each board individually.  It'd save effort and ensure that people
automatically get to use the feature.

The crypto accelerators are another example of this - it's not really
board specific if they're useful.
