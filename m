From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: dts: specify all the per-cpu interrupts of arch
 timer for exynos5440
Date: Thu, 24 Jan 2013 13:16:34 +0000
Message-ID: <51013432.3080903@arm.com>
References: <1358818887-16870-1-git-send-email-kgene.kim@samsung.com> <20130122101554.GA18876@e106331-lin.cambridge.arm.com> <063f01cdf8ec$926cda30$b7468e90$@samsung.com> <20130123103614.GD32237@e106331-lin.cambridge.arm.com> <50FFC1B0.8000601@ti.com> <51012C4B.5080300@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:47486 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975Ab3AXNQk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 08:16:40 -0500
In-Reply-To: <51012C4B.5080300@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Mark Rutland <Mark.Rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Tony Lindgren' <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Benoit,

On 24/01/13 12:42, Benoit Cousson wrote:
> Hi Santosh,
> 
> On 01/23/2013 11:55 AM, Santosh Shilimkar wrote:
>> Looping Marc, Benoit
>>
>> On Wednesday 23 January 2013 04:06 PM, Mark Rutland wrote:
>>> On Tue, Jan 22, 2013 at 10:05:18PM +0000, Kukjin Kim wrote:
>>>> Mark Rutland wrote:
>>>>>
>>>> + devicetree-discuss, Grant Likely, Rob Herring and Tony Lindgren
>>>>
>>>>> On Tue, Jan 22, 2013 at 01:41:27AM +0000, Kukjin Kim wrote:
>>>>>> From: Thomas Abraham <thomas.ab@samsung.com>
>>>>>>
>>>>>> Need to be changed requirements in the 'cpus' node for exynos5440
>>>>>> to specify all the per-cpu interrupts of arch timer.
>>>>>
>>>>> The node(s) for the arch timer should not be in the cpus/cpu@N nodes.
>>>>> Instead, there should be one node (in the root of the tree).
>>>>>
>>>> Well, I don't think so. As per my understanding, the local timers are
>>>> attached to every ARM cores (cpus) and it generates certain interrupt
>>>> to the
>>>> GIC. So the correct representation for this in device tree is to
>>>> include the
>>>> interrupts in the cpu nodes in dts file. Your comments  refer to a
>>>> limitation in the Linux kernel implementation of the arch_timer and it
>>>> should not result in representing the hardware details incorrectly in
>>>> the
>>>> dts file.
>>>
>>> I disagree. The "correct representation" is whatever the devicetree
>>> binding
>>> documentation describes. It does not describe placing timer nodes in
>>> the cpu
>>> nodes.
>>>
>> This seems to be exact same topic what is getting discussed here [1]
>> Technically DT is suppose to represent how the hardware is rather than
>> how the bindings are done.
>>
>> But as Marc pointed out, the approach taken currently is to not
>> duplicate the banked information. The thread [1] isn't concluded
>> yet but looks like we might want to avoid duplicating the information
>> considering, more of such duplication needs to follow. e.g gic i/f
>>
>> Am still waiting on what Benoit has to say ?
> 
> I agree with you :-)
> 
> I'm not sure the binding was properly done to reflect the HW accurately.
> 
> A local timer for my point of view should be located in the cpu node
> like a L1 cache. Or at least referenced in each cpu by a phandle.
>
> What was the rational to put it in the root?

The rational was to follow what we already do for most (all?) banked
resources. We already have TWD, GIC and PMU that have a root node,
avoiding duplicated resources. I think consistency is an important thing
to have.

If we decide to move everything into CPU nodes and duplicate all the
banked resources, fine. But that has impacts that reach far beyond the
simple case of the timer.

In particular, good luck with the GIC distributor interface, where the
32 first interrupts are per CPU. This would also mandate a redesign of
the way we specify a PPI, as the CPU mask in the third field doesn't
mean a thing anymore.

If you insist on having a phandle to a timer node, fine by me.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
