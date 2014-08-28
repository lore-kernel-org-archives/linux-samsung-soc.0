From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for
 EXYNOS7
Date: Thu, 28 Aug 2014 18:43:17 +0100
Message-ID: <20140828174317.GC18005@leverpostej>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-3-git-send-email-ch.naveen@samsung.com>
 <20140828035639.GB4972@localhost>
 <20140828094846.GD14650@leverpostej>
 <CAOesGMjY8wfAcq2fLgs=ZWHdiWtFqxr+ncUKTje0SnXqO-CCgQ@mail.gmail.com>
 <20140828170306.GQ14650@leverpostej>
 <53FF6668.4080502@arm.com>
 <CAL_JsqKB-gganC6H1XBzUbFzXk8zy08U4X3mFWhxNWZO=upJPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:39067 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751783AbaH1RoB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 13:44:01 -0400
Content-Disposition: inline
In-Reply-To: <CAL_JsqKB-gganC6H1XBzUbFzXk8zy08U4X3mFWhxNWZO=upJPQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>, Olof Johansson <olof@lixom.net>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Aug 28, 2014 at 06:33:13PM +0100, Rob Herring wrote:
> On Thu, Aug 28, 2014 at 12:27 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > On 28/08/14 18:03, Mark Rutland wrote:
> >
> >> From 67104ad5a56e4c18f9c41f06af028b7561740afd Mon Sep 17 00:00:00 2001
> >> From: Mark Rutland <mark.rutland@arm.com>
> >> Date: Thu, 28 Aug 2014 17:41:03 +0100
> >> Subject: [PATCH] Doc: dt: arch_timer: discourage clock-frequency use
> >>
> >> The ARM Generic Timer (AKA the architected timer, arm_arch_timer)
> >> features a CPU register (CNTFRQ) which firmware is intended to
> >> initialize, and non-secure software can read to determine the frequency
> >> of the timer. On CPUs with secure state, this register cannot be written
> >> from non-secure states.
> >>
> >> The firmware of early SoCs featuring the timer did not correctly
> >> initialize CNTFRQ correctly on all CPUs, requiring the frequency to be
> >> described in DT as a workaround. This workaround is not complete however
> >> as CNTFRQ is exposed to all software in a privileged non-secure mode,
> >> including KVM guests. The firmware and DTs for recent SoCs have followed
> >
> > I believe Xen is also affected by this.
> >
> >> the example set by these early SoCs.
> >>
> >> This patch updates the arch timer binding documentation to make it
> >> clearer that the use of the clock-frequency property is a poor
> >> work-around. The MMIO generic timer binding is similarly updated, though
> >> this is less of a concern as there is generally no need to expose the
> >> MMIO timers to guest OSs.
> >>
> >> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Marc Zyngier <marc.zyngier@arm.com>
> >
> > Short of more explicit threats:
> 
> Why not also add WARNs (and mark for stable). People tend to notice
> and fix those. If not the vendors, those pesky customers always
> complain (the same ones that get concerned about BogoMIPS values being
> too low).

I had a go a while back but it was a bit painful becuase the MMIO and
cpu timer code is intertwined, and a clock-frequency property on the
MMIO timers isn't all that problematic (though admittedly still a
workaround for FW not initialising something it was intended to).

I was hoping I'd have the chance to split the driver in two first, so as
to sidestep that. I'll take another look.

Mark.
