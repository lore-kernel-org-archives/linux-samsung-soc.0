From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] [CPUFREQ] EXYNOS5250: Add support max 1.7GHz for EXYNOS5250
Date: Tue, 17 Jul 2012 20:33:38 +0200
Message-ID: <201207172033.38308.rjw@sisk.pl>
References: <02d501cd4ebe$d9fbc100$8df34300$%kim@samsung.com> <144501cd63b0$a91e94c0$fb5bbe40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:44747 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752059Ab2GQS2A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jul 2012 14:28:00 -0400
In-Reply-To: <144501cd63b0$a91e94c0$fb5bbe40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, jc.lee@samsung.com

On Tuesday, July 17, 2012, Kukjin Kim wrote:
> Kukjin Kim wrote:
> > 
> > From: Jaecheol Lee <jc.lee@samsung.com>
> > 
> > This patch adds support 1.7GHz max frequency for EXYNOS5250
> > 
> > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/cpufreq/exynos5250-cpufreq.c |   55
> +++++++++++++++---------------
> > ----
> >  1 files changed, 24 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/exynos5250-cpufreq.c
> > b/drivers/cpufreq/exynos5250-cpufreq.c
> > index a883316..e64c253 100644
> > --- a/drivers/cpufreq/exynos5250-cpufreq.c
> > +++ b/drivers/cpufreq/exynos5250-cpufreq.c
> > @@ -65,20 +65,20 @@ static unsigned int
> > clkdiv_cpu0_5250[CPUFREQ_LEVEL_END][8] = {
> >  	 * Clock divider value for following
> >  	 * { ARM, CPUD, ACP, PERIPH, ATB, PCLK_DBG, APLL, ARM2 }
> >  	 */
> > -	{ 0, 3, 7, 7, 6, 1, 3, 0 },	/* 1700 MHz - N/A */
> > -	{ 0, 3, 7, 7, 6, 1, 3, 0 },	/* 1600 MHz - N/A */
> > -	{ 0, 3, 7, 7, 5, 1, 3, 0 },	/* 1500 MHz - N/A */
> > -	{ 0, 3, 7, 7, 6, 1, 3, 0 },	/* 1400 MHz */
> > -	{ 0, 3, 7, 7, 6, 1, 3, 0 },	/* 1300 MHz */
> > -	{ 0, 3, 7, 7, 5, 1, 3, 0 },	/* 1200 MHz */
> > -	{ 0, 2, 7, 7, 5, 1, 2, 0 },	/* 1100 MHz */
> > -	{ 0, 2, 7, 7, 4, 1, 2, 0 },	/* 1000 MHz */
> > -	{ 0, 2, 7, 7, 4, 1, 2, 0 },	/* 900 MHz */
> > -	{ 0, 2, 7, 7, 3, 1, 1, 0 },	/* 800 MHz */
> > +	{ 0, 3, 7, 7, 7, 3, 5, 0 },	/* 1700 MHz */
> > +	{ 0, 3, 7, 7, 7, 1, 4, 0 },	/* 1600 MHz */
> > +	{ 0, 2, 7, 7, 7, 1, 4, 0 },	/* 1500 MHz */
> > +	{ 0, 2, 7, 7, 6, 1, 4, 0 },	/* 1400 MHz */
> > +	{ 0, 2, 7, 7, 6, 1, 3, 0 },	/* 1300 MHz */
> > +	{ 0, 2, 7, 7, 5, 1, 3, 0 },	/* 1200 MHz */
> > +	{ 0, 3, 7, 7, 5, 1, 3, 0 },	/* 1100 MHz */
> > +	{ 0, 1, 7, 7, 4, 1, 2, 0 },	/* 1000 MHz */
> > +	{ 0, 1, 7, 7, 4, 1, 2, 0 },	/* 900 MHz */
> > +	{ 0, 1, 7, 7, 4, 1, 2, 0 },	/* 800 MHz */
> >  	{ 0, 1, 7, 7, 3, 1, 1, 0 },	/* 700 MHz */
> > -	{ 0, 1, 7, 7, 2, 1, 1, 0 },	/* 600 MHz */
> > +	{ 0, 1, 7, 7, 3, 1, 1, 0 },	/* 600 MHz */
> >  	{ 0, 1, 7, 7, 2, 1, 1, 0 },	/* 500 MHz */
> > -	{ 0, 1, 7, 7, 1, 1, 1, 0 },	/* 400 MHz */
> > +	{ 0, 1, 7, 7, 2, 1, 1, 0 },	/* 400 MHz */
> >  	{ 0, 1, 7, 7, 1, 1, 1, 0 },	/* 300 MHz */
> >  	{ 0, 1, 7, 7, 1, 1, 1, 0 },	/* 200 MHz */
> >  };
> > @@ -87,9 +87,9 @@ static unsigned int
> > clkdiv_cpu1_5250[CPUFREQ_LEVEL_END][2] = {
> >  	/* Clock divider value for following
> >  	 * { COPY, HPM }
> >  	 */
> > -	{ 0, 2 },	/* 1700 MHz - N/A */
> > -	{ 0, 2 },	/* 1600 MHz - N/A */
> > -	{ 0, 2 },	/* 1500 MHz - N/A */
> > +	{ 0, 2 },	/* 1700 MHz */
> > +	{ 0, 2 },	/* 1600 MHz */
> > +	{ 0, 2 },	/* 1500 MHz */
> >  	{ 0, 2 },	/* 1400 MHz */
> >  	{ 0, 2 },	/* 1300 MHz */
> >  	{ 0, 2 },	/* 1200 MHz */
> > @@ -106,10 +106,10 @@ static unsigned int
> > clkdiv_cpu1_5250[CPUFREQ_LEVEL_END][2] = {
> >  };
> > 
> >  static unsigned int exynos5_apll_pms_table[CPUFREQ_LEVEL_END] = {
> > -	(0),				/* 1700 MHz - N/A */
> > -	(0),				/* 1600 MHz - N/A */
> > -	(0),				/* 1500 MHz - N/A */
> > -	(0),				/* 1400 MHz */
> > +	((425 << 16) | (6 << 8) | 0),	/* 1700 MHz */
> > +	((200 << 16) | (3 << 8) | 0),	/* 1600 MHz */
> > +	((250 << 16) | (4 << 8) | 0),	/* 1500 MHz */
> > +	((175 << 16) | (3 << 8) | 0),	/* 1400 MHz */
> >  	((325 << 16) | (6 << 8) | 0),	/* 1300 MHz */
> >  	((200 << 16) | (4 << 8) | 0),	/* 1200 MHz */
> >  	((275 << 16) | (6 << 8) | 0),	/* 1100 MHz */
> > @@ -126,9 +126,10 @@ static unsigned int
> > exynos5_apll_pms_table[CPUFREQ_LEVEL_END] = {
> > 
> >  /* ASV group voltage table */
> >  static const unsigned int asv_voltage_5250[CPUFREQ_LEVEL_END] = {
> > -	0, 0, 0, 0, 0, 0, 0,	/* 1700 MHz ~ 1100 MHz Not supported */
> > -	1175000, 1125000, 1075000, 1050000, 1000000,
> > -	950000, 925000, 925000, 900000
> > +	1300000, 1250000, 1225000, 1200000, 1150000,
> > +	1125000, 1100000, 1075000, 1050000, 1025000,
> > +	1012500, 1000000,  975000,  950000,  937500,
> > +	925000
> >  };
> > 
> >  static void set_clkdiv(unsigned int div_index)
> > @@ -248,15 +249,7 @@ static void __init set_volt_table(void)
> >  {
> >  	unsigned int i;
> > 
> > -	exynos5250_freq_table[L0].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L1].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L2].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L3].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L4].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L5].frequency = CPUFREQ_ENTRY_INVALID;
> > -	exynos5250_freq_table[L6].frequency = CPUFREQ_ENTRY_INVALID;
> > -
> > -	max_support_idx = L7;
> > +	max_support_idx = L0;
> > 
> >  	for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++)
> >  		exynos5250_volt_table[i] = asv_voltage_5250[i];
> > --
> > 1.7.1
> 
> Hi Rafael,
> 
> Any problems or comments on this? I couldn't find this in your tree...

No problems and I thought it would be merged through your platform tree.

Thanks,
Rafael
