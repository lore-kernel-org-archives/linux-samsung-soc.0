From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Tue, 8 Mar 2011 11:37:53 +0000
Message-ID: <20110308113752.GA5892@sirena.org.uk>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37326 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752982Ab1CHLhz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 06:37:55 -0500
Content-Disposition: inline
In-Reply-To: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Tue, Mar 08, 2011 at 04:10:52PM +0530, Giridhar Maruthy wrote:

> +#ifdef CONFIG_REGULATOR_WM8994
> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
> +	{
> +		.dev_name	= "1-001a",
> +		.supply		= "AVDD2",

This ifdef looks wrong - you're testing for the WM8994 regulators but
the things inside the define are fixed voltage regulators.  Probably
best to just make the whole lot depend on CONFIG_REGULATOR and then
select the regulator drivers if that's enabled:

	select REGULATOR_WM8994 if REGULATOR
	select REGULATOR_FIXED if REGULATOR

(just doing Kconfig symbols from memory, I might be misremembering.)

> +#ifdef CONFIG_I2C_S3C2410
> +#ifdef CONFIG_S3C_DEV_I2C1

The above will break if someone builds I2C modular - there's a separate
_MODULE define for that.  Though TBH I'm not sure all this ifdefery is
really buying much.
