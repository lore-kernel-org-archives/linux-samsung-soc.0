From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Wed, 7 Aug 2019 17:21:15 +0300
Message-ID: <4155482f-8f8f-a659-63ba-25701540b2c5@linaro.org>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
 <6e8b2081-2fb3-9ab8-37d1-8b5fe5fd8e11@linaro.org>
 <62557522be4924a01d3822d4734c30f2965c608b.camel@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <62557522be4924a01d3822d4734c30f2965c608b.camel@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, m.szyprowski@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Artur,

On 8/1/19 10:59, Artur Świgoń wrote:
> Hi Georgi,
> 
> On Fri, 2019-07-26 at 11:05 +0300, Georgi Djakov wrote:
>> Hi Artur,
>>
>> On 7/23/19 15:20, Artur Świgoń wrote:
>>> This patch adds interconnect functionality to the exynos-bus devfreq
>>> driver.
>>>
>>> The SoC topology is a graph (or, more specifically, a tree) and most of its
>>> edges are taken from the devfreq parent-child hierarchy (cf.
>>> Documentation/devicetree/bindings/devfreq/exynos-bus.txt). The previous
>>> patch adds missing edges to the DT (under the name 'parent'). Due to
>>> unspecified relative probing order, -EPROBE_DEFER may be propagated to
>>> guarantee that a child is probed before its parent.
>>>
>>> Each bus is now an interconnect provider and an interconnect node as well
>>> (cf. Documentation/interconnect/interconnect.rst), i.e. every bus registers
>>> itself as a node. Node IDs are not hardcoded but rather assigned at
>>> runtime, in probing order (subject to the above-mentioned exception
>>> regarding relative order). This approach allows for using this driver with
>>> various Exynos SoCs.
>>
>> I am not familiar with the Exynos bus topology, but it seems to me that it's not
>> represented correctly. An interconnect provider with just a single node (port)
>> is odd. I would expect that each provider consists of multiple master and slave
>> nodes. This data would be used by a framework to understand what are the links
>> and how the traffic flows between the IP blocks and through which buses.
> 
> To summarize the exynos-bus topology[1] used by the devfreq driver: There are
> many data buses for data transfer in Samsung Exynos SoC. Every bus has its own
> clock. Buses often share power lines, in which case one of the buses on the
> power line is referred to as 'parent' (or as 'devfreq' in the DT). In the
> particular case of Exynos4412[1][2], the topology can be expressed as follows:
> 
> bus_dmc
> -- bus_acp
> -- bus_c2c
> 
> bus_leftbus
> -- bus_rightbus
> -- bus_display
> -- bus_fsys
> -- bus_peri
> -- bus_mfc
> 
> Where bus_dmc and bus_leftbus probably could be referred to as masters, and the
> following indented nodes as slaves. Patch 08/11 of this RFC additionally adds
> the following to the DT:
> 
> bus_dmc
> -- bus_leftbus
> 
> Which makes the topology a valid tree.
> 
> The exynos-bus concept in devfreq[3] is designed in such a way that every bus is
> probed separately as a platform device, and is a largely independent entity.
>
> This RFC proposes an extension to the existing devfreq driver that basically
> provides a simple QoS to ensure minimum clock frequency for selected buses
> (possibly overriding devfreq governor calculations) using the interconnect
> framework.
> 
> The hierarchy is modelled in such a way that every bus is an interconnect node.
> On the other hand, what is considered an interconnect provider here is quite
> arbitrary, but for the reasons mentioned in the above paragraph, this RFC
> assumes that every bus is a provider of itself as a node. Using an alternative

IIUC, in case we want to transfer data between the display and the memory
controller, the path would look like this:

display --> bus_display --> bus_leftbus --> bus_dmc --> memory

But the bus_display for example would have not one, but two nodes (ports),
right?  One representing the link to the display controller and another one
representing the link to bus_leftbus? So i think that all the buses should
have at least two nodes, to represent each end of the wire.

> singleton provider approach was deemed more complicated since the 'dev' field in
> 'struct icc_provider' has to be set to something meaningful and we are tied to
> the 'samsung,exynos-bus' compatible string in the driver (and multiple instances
> of exynos-bus probed in indeterminate relative order).
> 

Sure, the rest makes sense to me.

Thanks,
Georgi
