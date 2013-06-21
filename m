From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: [PATCH V6 6/6] clk: exynos5250: Add enum entries for divider clock
 of i2s1 and i2s2
Date: Thu, 20 Jun 2013 23:54:45 -0700
Message-ID: <20130621065445.9136.69447@quantum>
References: <1371024463-303-1-git-send-email-padma.v@samsung.com>
 <1371024463-303-7-git-send-email-padma.v@samsung.com>
 <20130612164553.26381.41398@quantum>
 <CAAgF-BfEvBcrm186t6U9Tp4r64wB3sEsy6hoXMQi=dHJgncvfw@mail.gmail.com>
 <CAAgF-Bf4BVfGVuFF8-CwPRi-em5VHA5HXYjkRDxPxvyAZPx7kw@mail.gmail.com>
 <19ac01ce6b43$96bfb4d0$c43f1e70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:60458 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758638Ab3FUGyt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 02:54:49 -0400
Received: by mail-pa0-f52.google.com with SMTP id kq13so7374059pab.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 23:54:49 -0700 (PDT)
In-Reply-To: <19ac01ce6b43$96bfb4d0$c43f1e70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Padma Venkat' <padma.kvr@gmail.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, broonie@kernel.org

Quoting Kukjin Kim (2013-06-17 03:15:27)
> Padma Venkat wrote:
> > 
> > Hi Mike,
> > 
> > On Thu, Jun 13, 2013 at 8:32 AM, Padma Venkat <padma.kvr@gmail.com> wrote:
> > > Hi Mike,
> > >
> > > On Wed, Jun 12, 2013 at 10:15 PM, Mike Turquette <mturquette@linaro.org>
> > wrote:
> > >> Quoting Padmavathi Venna (2013-06-12 01:07:43)
> > >>> This patch adds enum entries for div_i2s1 and div_i2s2 which are
> > >>> required for i2s1 and i2s2 controllers.
> > >>>
> > >>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > >>
> > >> Looks good.  Did you want me to take the clk patches or just gathering
> > >> Acks?
> > >
> > > Please take the patches :).
> > >
> > > Thanks
> > > Padma
> > 
> > clk related patches in this set has some dependency on arch side
> > patches because one of the patch replaces all '/include's with
> > '#include's and adds a header file in
> > arch/arm/boot/include/dt-bindings/. So all these patches required to
> > go into one tree.
> > 
> > Hi Kukjin,
> > 
> > Can you please take all these patches into samsung-tree?
> > 
> Padma, sure, I will.
> 
> BTW, Mike, according to your reply, I may get your ack on 2nd and 6th clk
> patches...If any problems, please kindly let me know.

Fine by me.

Regards,
Mike

> 
> Thanks,
> - Kukjin
