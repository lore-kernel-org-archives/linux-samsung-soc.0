From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Thu, 2 Feb 2012 11:22:14 -0700
Message-ID: <20120202182214.GN15343@ponder.secretlab.ca>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com>
 <1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
 <4F2817FA.5020407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:59516 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755982Ab2BBSWQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Feb 2012 13:22:16 -0500
Received: by dadp15 with SMTP id p15so2050023dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2012 10:22:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4F2817FA.5020407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sangsu Park <sangsu4u.park@samsung.com>

On Tue, Jan 31, 2012 at 05:34:02PM +0100, Sylwester Nawrocki wrote:
> Hi Kukjin,
> 
> I have few comments below...
> 
> On 01/31/2012 04:50 PM, Kukjin Kim wrote:
> > From: Sangsu Park <sangsu4u.park@samsung.com>
> > 
> > This patch adds follwing.
> 
> s/follwing/following.
> 
> nit: AFAIK it's a good habit not to start a commit description
> with "This patch.."
> 

"This patch..." descriptions are just fine.  I write a lot of patches that
way, but I do expect description of not just what a patch does, but why the
patch is necessary.

> > -/* EXYNOS4 GPIO number definitions */
> > +/* GPIO number definitions */
> >  #define EXYNOS4_GPA0(_nr)	(EXYNOS4_GPIO_A0_START + (_nr))
> >  #define EXYNOS4_GPA1(_nr)	(EXYNOS4_GPIO_A1_START + (_nr))
> >  #define EXYNOS4_GPB(_nr)	(EXYNOS4_GPIO_B_START + (_nr))
> > @@ -140,10 +139,138 @@ enum s5p_gpio_number {
> >  
> >  /* the end of the EXYNOS4 specific gpios */
> >  #define EXYNOS4_GPIO_END	(EXYNOS4_GPZ(EXYNOS4_GPIO_Z_NR) + 1)
> > -#define S3C_GPIO_END		EXYNOS4_GPIO_END
> >  
> > -/* define the number of gpios we need to the one after the GPZ() range */
> > -#define ARCH_NR_GPIOS		(EXYNOS4_GPZ(EXYNOS4_GPIO_Z_NR) +	\
> > -				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
> > +/* EXYNOS5 serise */
> > +/* GPIO bank sizes */
> > +#define EXYNOS5_GPIO_A0_NR	(8)
> 
> nit: It's been always a mystery to me, what are the parentheses around the
> numbers helpful for ? IMHO even if there is more things like this in
> the file it might be better to skip extra parentheses here.

It protects against the preprocessor combining a macro with other code in
unpredictable ways.  For example:

#define SIZE  10 + 20
int i = SIZE * 5;

Without the parenthesis the result of i is 110, when the programmer would
expect 150.

For single integers like these, the parenthesis aren't actually necessary, but
I given that for every other #define it is good practice, I don't object to
seeing them on single integers also.

g.
