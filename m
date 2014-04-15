From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH RFC 0/2] drm/exynos: refactoring drm device init/deinit
Date: Tue, 15 Apr 2014 16:23:38 +0900
Message-ID: <00af01cf587b$9f09e040$dd1da0c0$%dae@samsung.com>
References: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
 <CAAQKjZMz56YjHtjBrEwOkxbyvdp1t9o9rCU9cFiR7GZOXVsKCw@mail.gmail.com>
 <534BA252.7060208@samsung.com>
 <050a01cf57d1$4fee1c60$efca5520$%dae@samsung.com> <534BC744.4090406@gmail.com>
 <052001cf57e9$2ad4cf60$807e6e20$%dae@samsung.com> <534BEB14.9030802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <534BEB14.9030802@gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Andrzej Hajda' <a.hajda@samsung.com>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, "'moderated list:ARM/S5P EXYNOS AR...'" <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, 'Russell King' <rmk@arm.linux.org.uk>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Tomasz Figa [mailto:tomasz.figa@gmail.com]
> Sent: Monday, April 14, 2014 11:05 PM
> To: Inki Dae; 'Andrzej Hajda'
> Cc: 'Kyungmin Park'; 'moderated list:ARM/S5P EXYNOS AR...'; 'Russell
King';
> dri-devel@lists.freedesktop.org; 'Marek Szyprowski'
> Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device
> init/deinit
> 
> On 14.04.2014 15:55, Inki Dae wrote:
> > Hi Tomasz,
> >
> > Always thanks for your opinions.
> >
> >> -----Original Message-----
> >> From: linux-samsung-soc-owner@vger.kernel.org
> >> [mailto:linux-samsung-soc- owner@vger.kernel.org] On Behalf Of Tomasz
> >> Figa
> >> Sent: Monday, April 14, 2014 8:32 PM
> >> To: Inki Dae; 'Andrzej Hajda'
> >> Cc: 'Kyungmin Park'; 'moderated list:ARM/S5P EXYNOS AR...'; 'Russell
> > King';
> >> dri-devel@lists.freedesktop.org; 'Marek Szyprowski'
> >> Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device
> >> init/deinit
> >>
> >> Hi Inki,
> >>
> >> On 14.04.2014 13:04, Inki Dae wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Andrzej Hajda [mailto:a.hajda@samsung.com]
> >>>> Sent: Monday, April 14, 2014 5:55 PM
> >>>> To: Inki Dae
> >>>> Cc: dri-devel@lists.freedesktop.org; moderated list:ARM/S5P EXYNOS
> >>>> AR...; Kyungmin Park; Marek Szyprowski
> >>>> Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device
> >>>> init/deinit
> >>>>
> >>>> On 04/12/2014 04:18 PM, Inki Dae wrote:
> >>>>> Hi Andrzej,
> >>>>>
> >>>>> Thanks for your contributions.
> >>>>>
> >>>>> 2014-04-11 23:11 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> >>>>>> Hi Inki,
> >>>>>>
> >>>>>> This patchset refactors drm device initialization. Details are
> >>>>>> described in respective patches. It is an alternative to DT
> >>>>>> supernode
> >>>> concept.
> >>>>>>
> >>>>>> The first patch uses linker sections to get rid of ifdef macros,
> >>>>>> it is not
> >>>>> That's a good idea. :) We could avoid ugly #ifdef ~ #endif with
> >>>>> this
> >>> way.
> >>>>>
> >>>>>> essential for 2nd patch but it makes code more readable. Similar
> >>>>>> approach is used by irqchip, clks and clk_sources.
> >>>>> But 2nd patch doesn't seem reasnoable to me. Your approach is same
> >>>>> as existing one conceptually. I think we need to handle drm driver
> >>>>> in a different way from irqchip, clks and clk_sources.
> >>>>>
> >>>>> DRM driver means one integrated graphics card but in most embedded
> >>>>> systems, graphics and display relevant devices have separated
> >>>>> hardware resources. So we would need abstractional integrated
> >>>>> hardware, display-subsystem, super device. That is why I are
> >>>>> trying to use super device approach, and conceptually it would be
> >>>>> right solution. It wouldn't be not good to combine those separated
> >>>>> hardware somehow using specific codes.
> >>>>
> >>>> Conceptually both approaches are the same: we have number of
> >>>> devices which should be ready before we can start super-device and
> >>>> if any device is to be removed super-device should be removed before.
> >>>> The difference is in 'details':
> >>>> - super-node approach have list of components provided explicitly
> >>>> in DT special node,
> >>>> - in this approach list of components is constructed from devices
> >>>> present in the system.
> >>>>
> >>>> Creating special DT node with information which is available anyway
> >>>> seems to be redundant and against DT rules.
> >>>>
> >>>
> >>> CCing Russell King,
> >>>
> >>> What is the special DT node? You mean device node from ports property?
> >>>
> >>> It is supposed  to use super device and its properties in mainline
> >>> so I don't see what it is against DT rules. If they are really
> >>> against DT rules, why component framework is in mainline?
> >>
> >> Component framework in mainline doesn't have anything in common with
DT.
> >> All it does is providing tools for handling cases where a subsystem
> >> can be initialized only after all components are available. It
> >> doesn't define any means of getting the list of components, it's a
> >> task for the user of this framework to provide it.
> >>
> >>>
> >>> As you said above, conceptually both approaches may be the same but
> >>> your approach has no any abstract hardware meaning one integrated
> >>> hardware. And if conceptually both approaches are the same, it would
> >>> be good to use existing infrastructure, component framework so there
> >>> is no any reason to add and use specific codes.
> >>
> >> What do you mean by "abstract hardware"? Physically, in the SoC,
> >> there is no single integrated hardware block, but multiple IPs and
> >> they need to be described this way in DT. There is nothing that
> >> prevents using them separately if a user doesn't want to use Exynos
> >> DRM. Exynos DRM is a
> >
> > I don't think that super device approach prevents using existing
> > device nodes separately. If a user doesn't want to use Exynos DRM, he
> > cannot declare the super node and each IP would work well in existing
> > way. There would be nothing to change existing device nodes.
> >
> 
> I agree that it wouldn't interfere with other possible use cases, but it
> is still leaking Linux- and use case- specific data to DT, which should be
> both OS and use case- agnostic. Especially when the goal to be achieved
> doesn't even require doing so (see Andrzej's enumeration using driver
> model objects directly).
> 
> >> Linux-specific thing and its details should not be leaked into DT,
> >> which is a _hardware_ description method.
> >>
> >>>
> >>> And component framework says,
> >>> "Subsystems such as ALSA, DRM and others require a single card-level
> >>> device structure to represent a subsystem. However, firmware tends
> >>> to describe the individual devices and the connections between them.
> >>> Therefore, we need a way to gather up the individual component
> >>> devices together, and indicate when we have all the component
> devices."
> >>
> >> Note following things:
> >>
> >> - Nothing in the quote above says that an additional DT node must be
> > added.
> >> The framework works on generic driver model level, above the
> >> description level (such as DT).
> >
> > And also the component framework says,
> >
> > "
> >    We do this in DT by providing a "superdevice" node which specifies
> > the components, eg:
> >          imx-drm {
> >                  compatible = "fsl,drm";
> >                  crtcs = <&ipu1>;
> >                  connectors = <&hdmi>;
> >          };
> > "
> >
> > So I think it is intended to use super device node and its property
> > except names specific to Linux, *drm, crtc, and connectors.
> >
> 
> This is just an example, used by fsl DRM bindings, which is a bit
> unfortunate IMHO, but maybe their case was more complex than Exynos DRM.
> 

I'm not sure that IMX are more complex than Exynos DRM but I think that
wouldn't be why IMX use super device approach.

> Note that core component framework code doesn't implement any DT bindings,
> just expects the platform to provide the list of components.
> 
> >>
> >> - Andrzej's method implements the same concept as component
> >> framework, except that:
> >>
> >>     a) it does so in a much more simple way (compare amount of code
> >> needed for Andrzej's approach and inside component framework),
> >>
> >>     b) doesn't require component initialization to be undone on every
> >> master bring-up failure,
> >>
> >>     c) uses the list of drivers known at compilation time to the
> >> Exynos DRM subsystem to build the list of devices to wait for
> >>
> >>     d) doesn't introduce any new DT bindings, for virtual,
> >> Linux-specific things,
> >>
> >>     e) doesn't duplicate compatible strings in an array used only to
> >> support systems that didn't have nodes required by those new DT
> >> bindings (as done in your exynos_drm_bind_lagacy_dt()),
> >>
> >>     f) doesn't require two-step initialization (probe() and bind()),
> >> as opposed to component subsystem.
> >>
> >> As you can see, it's a pure list of benefits, without any obvious
> >> drawbacks, except that some generic code (more or less applicable
> >> here) is not used.
> >>
> >> However, I wonder whether some of Andrzej's ideas couldn't be simply
> >> adopted by component framework (mostly b)) and Exynos DRM use of it
> >> (c), d), e)) to take best of both worlds and have both a good
> >> implementation and generic code reused.
> >>
> >
> > Andrzej's method may be more clear than super device approach in some
> > parts but we have already a infrastructure for it.
> >
> > So how about improving existing component framework if you think
> > Andrzej's method is same as super device approach, and is better than
> > it? If do so, we will use it naturally - no any reason not to use it.
> 
> I would be all for it.
> 
> I'm not against using the component framework at all - my primary concern
> is adding the need for supernode in DT, while it is completely
unnecessary,
> as demonstrated by Andrzej's implementation.

I know that we don't need super device approach necessarily to resolve the
probe order issue - really possible to resolve the issue only using specific
codes. However, Component framework is a generic way, and guides the use of
super node and its relevant property.

And if any critical issue with super node, this approach could be modified
simply to use only component framework without super node. Anyway, I'd like
to have more times for review it and to listen other opinions.

Thanks,
Inki Dae

> 
> Best regards,
> Tomasz
