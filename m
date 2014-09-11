From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Thu, 11 Sep 2014 10:06:08 +0100
Message-ID: <20140911090608.598CFC40862@trevor.secretlab.ca>
References: <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
	<540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com>
	<540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com>
	<20140908112112.GK26030@arm.com>
	<CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
	<CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
	<CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
	<CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
	<20140910143144.GF7960@sirena.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:41981 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbaIKJGL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 05:06:11 -0400
Received: by mail-wg0-f45.google.com with SMTP id z12so5392526wgg.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2014 02:06:10 -0700 (PDT)
In-Reply-To: <20140910143144.GF7960@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>
Cc: Doug Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Wed, 10 Sep 2014 15:31:44 +0100, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Sep 10, 2014 at 06:06:46AM -0700, Olof Johansson wrote:
> > On Mon, Sep 8, 2014 at 12:40 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> 
> > > Well, lets see... We've got a real user complaining about a platform
> > > that used to work on mainline, and no longer does. The only loophole
> > > for ignoring breakage is if there nobody cares that it is broken. That
> > > currently isn't the case. So even though it's based on a patch that
> > > has "DO NOT SUBMIT" in large friendly letters on the front cover, it
> > > doesn't change the situation that mainline has a regression.
> 
> > Yeah, I'm with you on this Grant, it doesn't matter what the patch is
> > labelled as.
> 
> > One way to deal with this could be to add a quirk at boot time --
> > looking for the simplefb and if found, modifies the regulators to keep
> > them on. That'd go in the kernel, not in firmware.
> 
> Well, we should also be fixing simplefb to manage the resources it uses
> though that doesn't clean up after the broken DTs that are currently
> deployed.
> 
> As well as the regulators we'll also need to fix the clocks.  If we're
> going to start adding these fixups perhaps we want to consider having a
> wrapper stage that deals with rewriting DTs prior to trying to use them?
> I'm not sure if it makes much difference but there's overlap with other
> tools like the ATAGs conversion wrapper and building separately would
> let the fixup code run early without directly going into the early init
> code (which seems a bit scary).

We've already got a dt fixup hook in the machine struct, created for
exactly this reason. Fixing an incorrect DT provided by firmware:

arch/arm/include/asm/mach/arch.h:
struct machine_desc {
	...
	void (*dt_fixup)(void);
	...

g.
