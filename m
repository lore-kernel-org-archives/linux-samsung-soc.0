From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] MAINTAINERS: Add Samsung pinctrl entries
Date: Fri, 14 Jun 2013 07:59:24 +0900
Message-ID: <15df01ce6889$a5d522a0$f17f67e0$%kim@samsung.com>
References: <1371143144-31764-1-git-send-email-dianders@chromium.org>
 <1552010.DOo3aEBKyJ@flatron> <15cf01ce6884$8c073f20$a415bd60$%kim@samsung.com>
 <26381641.c4KnMQ8aS6@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <26381641.c4KnMQ8aS6@flatron>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Mauro Carvalho Chehab' <mchehab@redhat.com>, 'Andrew Morton' <akpm@linux-foundation.org>, 'Cesar Eduardo Barros' <cesarb@cesarb.net>, "'David S. Miller'" <davem@davemloft.net>, 'Hans Verkuil' <hans.verkuil@cisco.com>, linux-kernel@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 

[...]

> > > From my understanding how it works, there is no need to list Linus in
> > > particular drivers, because he's already listed as a maintainer of the
> > > whole pinctrl subsystem and get-maintainer accounts for this.
> > >
> > > Similarly for Kukjin, he's listed as the main Samsung maintainer
> > > already,
> > If so, the directory like pinctrl should be added under Samsung ARM
> > Architectures like spi and sound for Samsung stuff...
> 
> I don't think so, because it's a part of the pin control subsystem.
> 
Yes right. I mean, pinctrl is clos

> > > but AFAIK in this case the script can't infer this based on directory
> >
> > > structure. Let's see how it's done for other Samsung drivers:
> > Well, I don't think so, because pinctrl has the close relationship with
> > exynos arch part and it's little bit different with following. Just in
> > my understanding.
> 
> I'm not really sure what you mean. Pin control is a separate kernel
> subsystem, which shouldn't have any dependencies on arch code.
> 
Yes, right. I have no objection about it is a subsystem. I meant just
relationship and it helps people find the overall architecture.

[...]

> > And I'm asking above all guys _really_ do review and maintaining the
> > file or directories? I don't think so.
> 
> I'm not really sure what makes you think they don't. I can see all of them
> involved in works on mentioned drivers.
> 
What's the role of maintainer? I mean, as you said, above guys are really do
it...

- Kukjin
