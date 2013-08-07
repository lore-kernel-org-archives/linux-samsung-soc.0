From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] clk: exynos4: Make exynos4_plls static
Date: Wed, 7 Aug 2013 09:20:35 +0100
Message-ID: <20130807082035.GF23006@n2100.arm.linux.org.uk>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org> <20130806200219.GD23006@n2100.arm.linux.org.uk> <CAK9yfHxKn9JaA5Tbuw9qXeyEX_kio4mt3gOgJxkMNSoDHkHnBQ@mail.gmail.com> <1375846648.2424.69.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40649 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755663Ab3HGIVS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 04:21:18 -0400
Content-Disposition: inline
In-Reply-To: <1375846648.2424.69.camel@joe-AO722>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, patches@linaro.org

On Tue, Aug 06, 2013 at 08:37:28PM -0700, Joe Perches wrote:
> On Wed, 2013-08-07 at 08:51 +0530, Sachin Kamat wrote:
> > +CC Joe Perches
> > 
> > On 7 August 2013 01:32, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> > > Also note:
> > >
> > > On Tue, Aug 06, 2013 at 05:01:13PM +0530, Sachin Kamat wrote:
> > >> @@ -984,7 +984,7 @@ static __initdata struct of_device_id ext_clk_match[] = {
> > >
> > > For the declaration above...
> > >
> > >> -struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
> > >> +static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
> > >
> > > And this one... __initdata should come just before the '=', not at the
> > > start, not in the middle and not before the variable.
> > >
> > > The reasoning is that with how you have it above, the attributes are
> > > applied to the structure.  You want to apply the attributes to the
> > > declaration instead, so it should come after the variable name.
> > >
> > > So, for example:
> > >
> > >         struct foo *foo __attribute__((section(".foo"))) = (void *)1;
> > >
> > > will place the "foo" variable into a section called ".foo", but:
> > >
> > >         struct __attribute__((section(".foo"))) foo *foo = (void *)1;
> > >
> > > will place "foo" into the normal .data section.
> > >
> > > So, the rule with variable declarations is that the __ specifiers we
> > > have as macros in the kernel always come after the variable name being
> > > declared and nowhere else.  We consider anywhere else buggy.
> > 
> > Thanks for this useful tip, Russell. There are several instances in
> > the kernel where these attributes are used at the beginning of the
> > variable declaration.
> > 
> > Probably it would be useful to add this to checkpatch. Joe?
> 
> I think Russell is using the royal "We".

No I'm not.  There have been many patches to fix errors like the above
in the past.  If it's not considered a bug by the community as a whole,
it damn well should be.
