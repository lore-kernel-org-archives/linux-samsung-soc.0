From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: specify all the per-cpu interrupts of arch timer
 for exynos5440
Date: Tue, 22 Jan 2013 14:05:18 -0800
Message-ID: <063f01cdf8ec$926cda30$b7468e90$@samsung.com>
References: <1358818887-16870-1-git-send-email-kgene.kim@samsung.com>
 <20130122101554.GA18876@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22133 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955Ab3AVWFi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 17:05:38 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH100AD3S1C5T80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jan 2013 07:05:37 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH100FD1S1APE20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jan 2013 07:05:36 +0900 (KST)
In-reply-to: <20130122101554.GA18876@e106331-lin.cambridge.arm.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Rutland' <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.ab@samsung.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, 'Tony Lindgren' <tony@atomide.com>

Mark Rutland wrote:
>
+ devicetree-discuss, Grant Likely, Rob Herring and Tony Lindgren
 
> On Tue, Jan 22, 2013 at 01:41:27AM +0000, Kukjin Kim wrote:
> > From: Thomas Abraham <thomas.ab@samsung.com>
> >
> > Need to be changed requirements in the 'cpus' node for exynos5440
> > to specify all the per-cpu interrupts of arch timer.
> 
> The node(s) for the arch timer should not be in the cpus/cpu@N nodes.
> Instead, there should be one node (in the root of the tree).
> 
Well, I don't think so. As per my understanding, the local timers are
attached to every ARM cores (cpus) and it generates certain interrupt to the
GIC. So the correct representation for this in device tree is to include the
interrupts in the cpu nodes in dts file. Your comments  refer to a
limitation in the Linux kernel implementation of the arch_timer and it
should not result in representing the hardware details incorrectly in the
dts file.

> If this works currently it's only because the driver picks up one of the
nodes,
> and luckily it's the same as the others. This is not guaranteed to work in
> future, and will likely break.
> 
It is up to the Linux kernel implementation of arch_timer to handle the
hardware details in dts file accordingly.

> >
> > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos5440.dtsi |   20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos5440.dtsi
> b/arch/arm/boot/dts/exynos5440.dtsi
> > index 5406689..c5bd8ed 100644
> > --- a/arch/arm/boot/dts/exynos5440.dtsi
> > +++ b/arch/arm/boot/dts/exynos5440.dtsi
> > @@ -28,7 +28,10 @@
> >  			compatible = "arm,cortex-a15";
> >  			timer {
> >  				compatible = "arm,armv7-timer";
> > -				interrupts = <1 13 0xf08>;
> > +				interrupts = <1 13 0xf08>,
> > +					     <1 14 0xf08>,
> > +					     <1 11 0xf08>,
> > +					     <1 10 0xf08>;
> 
> Also, this interrupts list is updated differently to all the other nodes.
Typo?
> 
Hmm, I think this should be fine. If any concerns, please let me know in
detail.

[...]

Thanks.

- Kukjin
