From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/6] [CPUFREQ] S5PV210: Add arm/int voltage control
	support
Date: Wed, 22 Jun 2011 14:38:38 +0100
Message-ID: <20110622133838.GI23666@sirena.org.uk>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com> <1308730065-24737-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:39349 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755582Ab1FVNil (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 09:38:41 -0400
Content-Disposition: inline
In-Reply-To: <1308730065-24737-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davej@redhat.com, Jonghwan Choi <jhbird.choi@samsung.com>

On Wed, Jun 22, 2011 at 05:07:41PM +0900, Kukjin Kim wrote:

>  	if (freqs.new > freqs.old) {
>  		/* Voltage up: will be implemented */

Presumably this comment is bitrotted?

> +		if (!IS_ERR(arm_regulator) &&
> +				!IS_ERR(int_regulator)) {

You should not do this.  The regulator API stubs itself out and provides
mechanisms for boards to fill out partial regulator configurations, and
clearly these supplies must be physically present in the system.

Plus...

>  static int __init s5pv210_cpufreq_init(void)
>  {
> +	arm_regulator = regulator_get(NULL, "vddarm");
> +	if (IS_ERR(arm_regulator)) {
> +		pr_err("failed to get regulator vddarm");
> +		return PTR_ERR(arm_regulator);
> +	}
> +
> +	int_regulator = regulator_get(NULL, "vddint");
> +	if (IS_ERR(int_regulator)) {
> +		pr_err("failed to get regulator vddint");
> +		regulator_put(arm_regulator);
> +		return PTR_ERR(int_regulator);
> +	}

...the driver won't currently bind if it didn't get the regulators.

Ideally you should also have code which checks to see if the regulators
can support all the operating points.  This will ensure that governors
don't end up spending time trying to go into states that can't be
supported for some reason.  That said this is fairly unusual so may not
be worth bothering.
