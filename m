From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: dts: specify all the per-cpu interrupts of arch
 timer for exynos5440
Date: Wed, 23 Jan 2013 16:25:44 +0530
Message-ID: <50FFC1B0.8000601@ti.com>
References: <1358818887-16870-1-git-send-email-kgene.kim@samsung.com> <20130122101554.GA18876@e106331-lin.cambridge.arm.com> <063f01cdf8ec$926cda30$b7468e90$@samsung.com> <20130123103614.GD32237@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:47372 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754672Ab3AWKyx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jan 2013 05:54:53 -0500
In-Reply-To: <20130123103614.GD32237@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Tony Lindgren' <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <marc.zyngier@arm.com>, Benoit Cousson <b-cousson@ti.com>

Looping Marc, Benoit

On Wednesday 23 January 2013 04:06 PM, Mark Rutland wrote:
> On Tue, Jan 22, 2013 at 10:05:18PM +0000, Kukjin Kim wrote:
>> Mark Rutland wrote:
>>>
>> + devicetree-discuss, Grant Likely, Rob Herring and Tony Lindgren
>>
>>> On Tue, Jan 22, 2013 at 01:41:27AM +0000, Kukjin Kim wrote:
>>>> From: Thomas Abraham <thomas.ab@samsung.com>
>>>>
>>>> Need to be changed requirements in the 'cpus' node for exynos5440
>>>> to specify all the per-cpu interrupts of arch timer.
>>>
>>> The node(s) for the arch timer should not be in the cpus/cpu@N nodes.
>>> Instead, there should be one node (in the root of the tree).
>>>
>> Well, I don't think so. As per my understanding, the local timers are
>> attached to every ARM cores (cpus) and it generates certain interrupt to the
>> GIC. So the correct representation for this in device tree is to include the
>> interrupts in the cpu nodes in dts file. Your comments  refer to a
>> limitation in the Linux kernel implementation of the arch_timer and it
>> should not result in representing the hardware details incorrectly in the
>> dts file.
>
> I disagree. The "correct representation" is whatever the devicetree binding
> documentation describes. It does not describe placing timer nodes in the cpu
> nodes.
>
This seems to be exact same topic what is getting discussed here [1]
Technically DT is suppose to represent how the hardware is rather than
how the bindings are done.

But as Marc pointed out, the approach taken currently is to not 
duplicate the banked information. The thread [1] isn't concluded
yet but looks like we might want to avoid duplicating the information
considering, more of such duplication needs to follow. e.g gic i/f

Am still waiting on what Benoit has to say ?

Regards,
Santosh

[1] http://www.spinics.net/lists/linux-omap/msg85110.html
