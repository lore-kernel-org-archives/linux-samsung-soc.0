From: kgene@kernel.org
Subject: RE: [PATCH] ARM: dts: specify all the per-cpu interrupts of arch timer
 for exynos5440
Date: Mon, 04 Feb 2013 14:25:37 -0800
Message-ID: <11ec01ce0326$90bcb590$b23620b0$@kernel.org>
References: <1358818887-16870-1-git-send-email-kgene.kim@samsung.com>
 <20130122101554.GA18876@e106331-lin.cambridge.arm.com>
 <063f01cdf8ec$926cda30$b7468e90$@samsung.com>
 <20130123103614.GD32237@e106331-lin.cambridge.arm.com>
 <50FFC1B0.8000601@ti.com> <51012C4B.5080300@ti.com> <51013432.3080903@arm.com>
 <5108C9C9.4010409@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28875 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755014Ab3BDWZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 17:25:55 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHP0032YVMYKT80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 07:25:52 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHP0047GVMZVP10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 07:25:50 +0900 (KST)
In-reply-to: <5108C9C9.4010409@ti.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Santosh Shilimkar' <santosh.shilimkar@ti.com>, 'Benoit Cousson' <b-cousson@ti.com>
Cc: 'Marc Zyngier' <marc.zyngier@arm.com>, 'Mark Rutland' <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, 'Tony Lindgren' <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, 'Grant Likely' <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.ab@samsung.com>, linux-arm-kernel@lists.infradead.org

Santosh Shilimkar wrote:
> 
> Benoit,
> 
> On Thursday 24 January 2013 06:46 PM, Marc Zyngier wrote:
> > Hi Benoit,
> >
> > On 24/01/13 12:42, Benoit Cousson wrote:
> >> Hi Santosh,
> >>
> >> On 01/23/2013 11:55 AM, Santosh Shilimkar wrote:
> >>> Looping Marc, Benoit
> >>>
> >>> On Wednesday 23 January 2013 04:06 PM, Mark Rutland wrote:
> >>>> On Tue, Jan 22, 2013 at 10:05:18PM +0000, Kukjin Kim wrote:
> >>>>> Mark Rutland wrote:
> >>>>>>
> >>>>> + devicetree-discuss, Grant Likely, Rob Herring and Tony Lindgren
> >>>>>
> >>>>>> On Tue, Jan 22, 2013 at 01:41:27AM +0000, Kukjin Kim wrote:
> >>>>>>> From: Thomas Abraham <thomas.ab@samsung.com>
> >>>>>>>
> >>>>>>> Need to be changed requirements in the 'cpus' node for
> exynos5440
> >>>>>>> to specify all the per-cpu interrupts of arch timer.
> >>>>>>
> >>>>>> The node(s) for the arch timer should not be in the cpus/cpu@N
> nodes.
> >>>>>> Instead, there should be one node (in the root of the tree).
> >>>>>>
> >>>>> Well, I don't think so. As per my understanding, the local timers
are
> >>>>> attached to every ARM cores (cpus) and it generates certain
interrupt
> >>>>> to the
> >>>>> GIC. So the correct representation for this in device tree is to
> >>>>> include the
> >>>>> interrupts in the cpu nodes in dts file. Your comments  refer to a
> >>>>> limitation in the Linux kernel implementation of the arch_timer and
it
> >>>>> should not result in representing the hardware details incorrectly
in
> >>>>> the
> >>>>> dts file.
> >>>>
> >>>> I disagree. The "correct representation" is whatever the devicetree
> >>>> binding
> >>>> documentation describes. It does not describe placing timer nodes in
> >>>> the cpu
> >>>> nodes.
> >>>>
> >>> This seems to be exact same topic what is getting discussed here [1]
> >>> Technically DT is suppose to represent how the hardware is rather than
> >>> how the bindings are done.
> >>>
> >>> But as Marc pointed out, the approach taken currently is to not
> >>> duplicate the banked information. The thread [1] isn't concluded
> >>> yet but looks like we might want to avoid duplicating the information
> >>> considering, more of such duplication needs to follow. e.g gic i/f
> >>>
> >>> Am still waiting on what Benoit has to say ?
> >>
> >> I agree with you :-)
> >>
> >> I'm not sure the binding was properly done to reflect the HW
accurately.
> >>
> >> A local timer for my point of view should be located in the cpu node
> >> like a L1 cache. Or at least referenced in each cpu by a phandle.
> >>
> >> What was the rational to put it in the root?
> >
> > The rational was to follow what we already do for most (all?) banked
> > resources. We already have TWD, GIC and PMU that have a root node,
> > avoiding duplicated resources. I think consistency is an important thing
> > to have.
> >
> > If we decide to move everything into CPU nodes and duplicate all the
> > banked resources, fine. But that has impacts that reach far beyond the
> > simple case of the timer.
> >
> > In particular, good luck with the GIC distributor interface, where the
> > 32 first interrupts are per CPU. This would also mandate a redesign of
> > the way we specify a PPI, as the CPU mask in the third field doesn't
> > mean a thing anymore.
> >
> > If you insist on having a phandle to a timer node, fine by me.
> >
> Can you please comment on it so that we can conclude this thread ?
> I would like to update my patches and hence the push.
> 
Hmm...it's time to decide for now.

Let me add timer node for ARM arch timer at this moment. Then if any change
is required, will do it later.

If any objection, let me know. If not, I will queue following patch for
v3.9.

Thanks.

- Kukjin

---------8<------------------------------8<---------------------------------
-

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: re-organized cpu node for exynos5440

This patch adds timer node and re-organizes cpu node for exynos5440.

Acked-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   37
+++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
index 1e7a2b0..5c5a699 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -24,40 +24,37 @@
 	};
 
 	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		cpu@0 {
 			compatible = "arm,cortex-a15";
-			timer {
-				compatible = "arm,armv7-timer";
-				interrupts = <1 13 0xf08>;
-				clock-frequency = <1000000>;
-			};
+			reg = <0>;
 		};
 		cpu@1 {
 			compatible = "arm,cortex-a15";
-			timer {
-				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
-				clock-frequency = <1000000>;
-			};
+			reg = <1>;
 		};
 		cpu@2 {
 			compatible = "arm,cortex-a15";
-			timer {
-				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
-				clock-frequency = <1000000>;
-			};
+			reg = <2>;
 		};
 		cpu@3 {
 			compatible = "arm,cortex-a15";
-			timer {
-				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
-				clock-frequency = <1000000>;
-			};
+			reg = <3>;
 		};
 	};
 
+	timer {
+		compatible = "arm,cortex-a15-timer",
+			     "arm,armv7-timer";
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+		clock-frequency = <50000000>;
+	};
+
 	serial@B0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
-- 
1.7.10.4
