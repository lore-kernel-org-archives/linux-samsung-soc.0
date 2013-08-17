From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH v2 0/8] Common Clock Framework support for Samsung S3C64xx
Date: Sat, 17 Aug 2013 19:30:11 +0900
Message-ID: <158901ce9b34$c0ac8720$42059560$@org>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <2956608.dyLtqySMuJ@amdc1227> <20130816210203.4443.43511@quantum>
 <3890424.fJfWX17mED@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <3890424.fJfWX17mED@flatron>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Mike Turquette' <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Mark Brown' <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>, 'Olof Johansson' <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:

[...]

> > > > >
> > > > > Basically, this series looks good to me, but I'm not sure how this
> > > > > should be handled because of dependency with PWM cleanup and clk
> > > > > stuff
> > > > > in clk tree now...
> > > >
> > > > Patches 1-3 can go into the clk tree. 4-6 should go through their
> > > > respective trees.
> > >
> > > It looks like version 2 of patch 2/8 has been applied by mistake,
> > > breaking compilation (and operation) of the clock driver added in
> > > patch 3/8.
> > Ugh. My mistake.
> 
> Happens. Thanks for fast response.
> 
Sorry for late ;-)

> > > Could you please fix this up? Thanks in advance.
> >
> > This is a little tricky since I published the clk-next-s3c64xx branch as
> > a stable branch for Samsung which I think has been merged to the
> > Samsung tree already.
> 
> Right, this somewhat limits our options. Although I'm not really sure
> whether Kukjin already has pushed it to his public tree.
> 
Yeah, I already did sort out in my local but not public tree because of some
problem.

> > So what are the options?
> >
> > One option is to create a fixup patch that just manages the delta
> > between V2 and V3. I can then add this to the top of clk-next-s3c64xx
> > and re-merge it into clk-next. Then the Samsung tree will need to
> > re-merge that dependency branch.
> 
> Well, I can make a "convert PLL65xx to new registration method" patch,
> that would be basically the delta. If this could be merged before patch
> 7/8, no regression would be introduced.
> 
> > Do you have a better idea?
> 
> Not really. Maybe let's ask Kukjin whether he has already merged it to his
> tree. Kukjin, have you?
> 
OK, if new branch is ready, I will replace with that or if re-merge is
required, I will. Either way, I'm fine and can handle. Mike, let me know
your choice :-)

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
