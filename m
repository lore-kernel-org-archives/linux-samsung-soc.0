From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V2 1/2] ARM: dts: Add DT changes for display on snow
Date: Thu, 28 Aug 2014 15:28:39 +0100
Message-ID: <20140828142839.GK14650@leverpostej>
References: <1409150908-12801-1-git-send-email-ajaykumar.rs@samsung.com>
 <20140827150146.GB9737@leverpostej>
 <CAEC9eQMKfso-rmMdqyDZeCdaxf21O1fqN6Z2YrS=njqGHh5d5Q@mail.gmail.com>
 <20140828091509.GA14650@leverpostej>
 <CAEC9eQN+EJmrG70O+2Sg5GD0OHudhqo5beGDN8K4_kmOKKPOmw@mail.gmail.com>
 <20140828131017.GD14388@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:36848 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750764AbaH1O3n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 10:29:43 -0400
Content-Disposition: inline
In-Reply-To: <20140828131017.GD14388@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "kgene.kim@gmail.com" <kgene.kim@gmail.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "seanpaul@google.com" <seanpaul@google.com>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "joshi@samsung.com" <joshi@samsung.com>, "prashanth.g@samsung.com" <prashanth.g@samsung.com>

On Thu, Aug 28, 2014 at 02:10:18PM +0100, Thierry Reding wrote:
> On Thu, Aug 28, 2014 at 03:04:32PM +0530, Ajay kumar wrote:
> > On Thu, Aug 28, 2014 at 2:45 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> > > On Thu, Aug 28, 2014 at 06:34:33AM +0100, Ajay kumar wrote:
> > >> On Wed, Aug 27, 2014 at 8:31 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> > >> > On Wed, Aug 27, 2014 at 03:48:27PM +0100, Ajay Kumar wrote:
> > >> >> Add DT nodes for ptn3460 bridge chip and panel.
> > >> >> Add backlight enable pin and backlight power supply for pwm-backlight.
> > >> >> Also add bridge phandle needed by dp to enable display on snow.
> > >> >>
> > >> >> Note that, snow doesn't support "chunghwa,claa101wb01" panel,
> > >> >> but still we choose to reuse the binding since "chunghwa,claa101wb01"
> > >> >> has similar LCD timings.
> > >> >
> > >> > What does it actually have?
> > >> >
> > >> > It's fine to have "chunghwa,claa101wb01" as a fallback but we should
> > >> > have an identifier for the actual display, too.
> > >> Actual display used is "AUO,B116XTN0", for which no data currently exists
> > >> in panel file. Instead of adding a new panel_desc for B116XTN0,
> > >> why not we reuse existing ones? what is the "identifier" you are talking about?
> > >
> > > The compatible string.
> > >
> > > So in the dts we'd have compatible = "au0,b116xtn0", "chunghwa,claa101wb01";
> > Sorry, hardware engineer says actual LCD name is "auo,b116xw03".
> > 
> > > That way if we need specific data we can add it later.
> > I think we can add a new panel_desc for "auo,b116xw03".
> > Because its actual LCD dimension is 256x144, but "chungwa, claa101wb01" has
> > LCD dimension 223x125.
> > What is Thierry's opinion on adding this new LCD?
> 
> I think you should simply add a new panel_desc for the panel. It may use
> similar timings, but it's likely not "compatible" in the way required by
> device tree. As you say, dimensions are different and those may have an
> influence on the DPI setting. There's really no reason why this should
> share the panel_desc with another panel.
> 
> Thierry

This sounds sane to me.

Mark.
