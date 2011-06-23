From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/6] [CPUFREQ] S5PV210: Add arm/int voltage control	support
Date: Thu, 23 Jun 2011 16:57:36 +0900
Message-ID: <015f01cc317b$3c18f9f0$b44aedd0$%kim@samsung.com>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
 <1308730065-24737-3-git-send-email-kgene.kim@samsung.com>
 <20110622133838.GI23666@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58474 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803Ab1FWH5q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 03:57:46 -0400
In-reply-to: <20110622133838.GI23666@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davej@redhat.com, 'Jonghwan Choi' <jhbird.choi@samsung.com>

Mark Brown wrote:
> 
> On Wed, Jun 22, 2011 at 05:07:41PM +0900, Kukjin Kim wrote:
> 
> >  	if (freqs.new > freqs.old) {
> >  		/* Voltage up: will be implemented */
> 
> Presumably this comment is bitrotted?
> 
Oops, thanks for your pointing out.

> > +		if (!IS_ERR(arm_regulator) &&
> > +				!IS_ERR(int_regulator)) {
> 
> You should not do this.  The regulator API stubs itself out and provides
> mechanisms for boards to fill out partial regulator configurations, and
> clearly these supplies must be physically present in the system.
> 
Uhm...you're right.

> Plus...
> 
> >  static int __init s5pv210_cpufreq_init(void)
> >  {
> > +	arm_regulator = regulator_get(NULL, "vddarm");
> > +	if (IS_ERR(arm_regulator)) {
> > +		pr_err("failed to get regulator vddarm");
> > +		return PTR_ERR(arm_regulator);
> > +	}
> > +
> > +	int_regulator = regulator_get(NULL, "vddint");
> > +	if (IS_ERR(int_regulator)) {
> > +		pr_err("failed to get regulator vddint");
> > +		regulator_put(arm_regulator);
> > +		return PTR_ERR(int_regulator);
> > +	}
> 
> ...the driver won't currently bind if it didn't get the regulators.
> 
> Ideally you should also have code which checks to see if the regulators
> can support all the operating points.  This will ensure that governors
> don't end up spending time trying to go into states that can't be
> supported for some reason.  That said this is fairly unusual so may not
> be worth bothering.

OK, will address comments from you :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
