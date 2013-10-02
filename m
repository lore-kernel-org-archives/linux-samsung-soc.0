From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: RE: [PATCH v2 00/12] clk/exynos convert clock IDs to macros
Date: Tue, 01 Oct 2013 18:09:53 -0700
Message-ID: <20131002010953.9338.23436@quantum>
References: <1378462361-13680-1-git-send-email-a.hajda@samsung.com>
 <8412301.YP2zzplWoe@amdc1227>
 <070001ceafa5$d4d81a40$7e884ec0$%kim@samsung.com>
 <523716C9.3000204@samsung.com> <20130916193709.27384.86101@quantum>
 <06c101cebdc5$75a83d10$60f8b730$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06c101cebdc5$75a83d10$60f8b730$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Andrzej Hajda' <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'devicetree' <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'linux-samsung-soc' <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kukjin Kim (2013-09-30 03:11:41)
> Mike Turquette wrote:
> > 
> > Quoting Sylwester Nawrocki (2013-09-16 07:33:45)
> > > On 09/12/2013 12:50 PM, Kukjin Kim wrote:
> > > > Well...I'm not sure changing to use macro is better or not at this
> > moment...
> > >
> > > I think it is. ;) It's really less error prone to have symbolic names
> > instead
> > > of the plain numbers. The clock ids are defined in one place and it is
> > more
> > > clear what a clock is by looking at symbolic name. It's especially
> > annoying
> > > to use plain numbers where are are many clock in a single node, like 10
> > or
> > > more. What are you main concerns with this ?
> > 
> > I think having the symbolic names is a win for readability.
> > 
> Hmm...since Mike who is a maintainer for ccf agrees with Sylwester's opinion, so I agree. Actually, I had no strong objection on this but still I'm not sure using macro is really better because sometimes the name doesn't give readability really I think though.
> 
> Mike, can you give me your ack on clk stuff?

Yes, but I was thinking to take this change through the clk tree. The
new branch based on -rc3 will be published tonight.

Let me know if it causes problems for you for me to take it.

Regards,
Mike

> 
> Thanks,
> Kukjin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
