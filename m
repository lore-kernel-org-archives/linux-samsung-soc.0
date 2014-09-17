From: Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Wed, 17 Sep 2014 18:45:17 +0530
Message-ID: <CAEC9eQOjpP_AE_KdveB=jswK-NKmsNrU3VOs3Mtq8eGYcZYEfA@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<2567411.1uGei9I2NP@avalon>
	<CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
	<3764548.s4ysdtHE5z@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3764548.s4ysdtHE5z@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 17, 2014 at 2:57 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> Hi Ajay,
>
> On Wednesday 17 September 2014 14:37:30 Ajay kumar wrote:
>> On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart wrote:
>> > Hi Ajay,
>> >
>> > Thank you for the patch.
>> >
>> > I think we're moving in the right direction, but we're not there yet.
>> >
>> > On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
>> >> This patch tries to seperate drm_bridge implementation
>> >> into 2 parts, a drm part and a non_drm part.
>> >>
>> >> A set of helper functions are defined in this patch to make
>> >> bridge driver probe independent of the drm flow.
>> >>
>> >> The bridge devices register themselves on a lookup table
>> >> when they get probed by calling "drm_bridge_add_for_lookup".
>> >>
>> >> The parent encoder driver waits till the bridge is available in the
>> >> lookup table(by calling "of_drm_find_bridge") and then continues with
>> >> its initialization.
>> >
>> > Before the introduction of the component framework I would have said this
>> > is the way to go. Now, I think bridges should register themselves as
>> > components, and the DRM master driver should use the component framework
>> > to get a reference to the bridges it needs.
>>
>> Well, I have modified the bridge framework exactly the way Thierry wanted it
>> to be, I mean the same way the current panel framework is.
>> And, I don't think there is a problem with that.
>> What problem are you facing with current bridge implementation?
>> What is the advantage of using the component framework to register bridges?
>
> There are several advantages.
>
> - The component framework has been designed with this exact problem in mind,
> piecing multiple components into a display device. This patch set introduces
> yet another framework, without any compelling reason as far as I can see.
Without this bridge registration framework, there is no way you can pass on a
drm_device pointer to the bridge driver. That is why we added a lookup
framework.

> Today DRM drivers already need to use three different frameworks (component,
> I2C slave encoder and panel), and we're adding a fourth one to make the mess
> even messier. This is really a headlong rush, we need to stop and fix the
> design mistakes.
>
> - The component framework solves the probe ordering problem. Bridges can use
> deferred probing, but when a bridge requires a resources (such as a clock for
> instance) provided by the display controller, this will break.
This is exactly the way sti drm uses bridge I think. It uses component framework
to wait till the master device initializes and then passes on a
drm_device pointer
to the component devices. But please know that it is feasible in case of sti,
because the bridge they use must be a embedded chip on the SOC, but not a
third party device.
And, the case which you mentioned(clock instance need to be passed to
bridge driver)
happens only in the case of bridges embedded on the SOC, but not a
third party device.
So, you are always allowed to use component framework for that.

But, assume the bridge chip is a third party device(ex: ptn3460 or ps8622) which
sits on an i2c bus. In that case, your approach poses the foll problems:
The way master and components are binded varies from platform to platform.
i.e the way exynos consolidates and adds the components is very much
different the way msm/sti/armada does the same!
So, when one needs to use a third party device as a bridge, they will end up
hacking up their drm layer to support this third party device.

With my approach, only the corresponding encoder driver needs to
know about the bridge, that too just the phandle to bridge node.
The platform specific drm layer can still be unaware of the bridge and stuff.

With your approach, the way we would specify the bridge node will change
from platform to platform resulting in non-uniformity. Also, the platform
specific drm layer needs to be aware of the bridge.

And, I assume these are the reasons why drm_panel doesn't use component
framework. Because all the panels are often third party and hence can be reused
across platforms, and so are ptn3460/ps8622.

>> >> The encoder driver should call "drm_bridge_attach_encoder" to pass on
>> >> the drm_device and the encoder pointers to the bridge object.
>> >>
>> >> Now that the drm_device pointer is available, the encoder then calls
>> >> "bridge->funcs->post_encoder_init" to allow the bridge to continue
>> >> registering itself with the drm core.
>> >
>> > This is what really bothers me with DRM bridge.
>> >
>> > The framework assumes that a bridge will always bridge an encoder and a
>> > connector. Beside lacking support for chained bridges, this creates an
>> > artificial split between bridges and encoders by modeling the same
>> > components using drm_encoder or drm_bridge depending on their position in
>> > the video output pipeline.
>> >
>> > I would like to see drm_bridge becoming more self-centric, removing the
>> > awareness of the upstream encoder and downstream connector. I'll give this
>> > a try, but it will conflict with this patch, so I'd like to share
>> > opinions and coordinate efforts sooner than later if possible.
>>
>> I am not really able to understand how you want "drm_bridge" to be.
>> As of now, there are many platforms using drm_bridge and they don't
>> have a problem with current implementation.
>> Regarding chained bridges: Can't you add this once my patchset is merged?
>> As an additional feature?
>
> Yes, as I mentioned in another e-mail this can be fixed later. I want to start
> discussing it though.
>> To be honest, I have spent quite sometime for working on this patchset.
>> All I started with was to add drm_panel support to drm_bridge.
>> When I sent the first patchset for that, Daniel, Rob and Thierry raised a
>> concern that current bridge framework itself is not proper and hence
>> they asked me to fix that first. And we have reached till here based on
>> their comments only.
>>
>> Without this patchset, you cannot bring an X server
>> based display on snow and peach_pit. Also, day by day the number of
>> platforms using drm_bridge is increasing.
>
> That's exactly why I'd like to use the component framework now, as the
> conversion will become more complex as time goes by.
As I have explained above, using component framework for third
party bridges is a bad idea. And all other private bridges, already use the
component framework(ex: sti). So, ideally this point should not be a blocker
for this patchset to get in. :)

Ajay
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
