From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: RE: [PATCH v2 00/12] clk/exynos convert clock IDs to macros
Date: Sun, 06 Oct 2013 13:27:09 -0700
Message-ID: <20131006202709.32214.75572@quantum>
References: <1378462361-13680-1-git-send-email-a.hajda@samsung.com>
 <8412301.YP2zzplWoe@amdc1227>
 <070001ceafa5$d4d81a40$7e884ec0$%kim@samsung.com>
 <523716C9.3000204@samsung.com> <20130916193709.27384.86101@quantum>
 <06c101cebdc5$75a83d10$60f8b730$%kim@samsung.com>
 <20131002010953.9338.23436@quantum>
 <0d8901cec170$f7230b50$e56921f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:42000 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719Ab3JFU1N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Oct 2013 16:27:13 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so6364067pdi.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2013 13:27:12 -0700 (PDT)
In-Reply-To: <0d8901cec170$f7230b50$e56921f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, 'Andrzej Hajda' <a.hajda@samsung.com>, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'devicetree' <devicetree@vger.kernel.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Quoting Kukjin Kim (2013-10-04 19:16:56)
> Mike Turquette wrote:
> > 
> > Quoting Kukjin Kim (2013-09-30 03:11:41)
> > > Mike Turquette wrote:
> > > >
> > > > Quoting Sylwester Nawrocki (2013-09-16 07:33:45)
> > > > > On 09/12/2013 12:50 PM, Kukjin Kim wrote:
> > > > > > Well...I'm not sure changing to use macro is better or not at this
> > > > moment...
> > > > >
> > > > > I think it is. ;) It's really less error prone to have symbolic
> > names
> > > > instead
> > > > > of the plain numbers. The clock ids are defined in one place and it
> > is
> > > > more
> > > > > clear what a clock is by looking at symbolic name. It's especially
> > > > annoying
> > > > > to use plain numbers where are are many clock in a single node, like
> > 10
> > > > or
> > > > > more. What are you main concerns with this ?
> > > >
> > > > I think having the symbolic names is a win for readability.
> > > >
> > > Hmm...since Mike who is a maintainer for ccf agrees with Sylwester's
> > opinion, so I agree. Actually, I had no strong objection on this but still
> > I'm not sure using macro is really better because sometimes the name
> > doesn't give readability really I think though.
> > >
> > > Mike, can you give me your ack on clk stuff?
> > 
> > Yes, but I was thinking to take this change through the clk tree. The
> > new branch based on -rc3 will be published tonight.
> > 
> > Let me know if it causes problems for you for me to take it.
> > 
> Uhm, I think dt changes can make ugly conflicts because of spread dt changing?

Sure, go ahead and take the patches then.

Acked-by: Mike Turquette <mturquette@linaro.org>

Regards,
Mike

> 
> - Kukjin
