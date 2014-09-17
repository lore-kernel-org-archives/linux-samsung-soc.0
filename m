From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Wed, 17 Sep 2014 14:37:30 +0530
Message-ID: <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
	<2567411.1uGei9I2NP@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:63561 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842AbaIQJHb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 05:07:31 -0400
In-Reply-To: <2567411.1uGei9I2NP@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Cross <xobs@kosagi.com>

Hi Laurent,

On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Ajay,
>
> Thank you for the patch.
>
> I think we're moving in the right direction, but we're not there yet.
>
> On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
>> This patch tries to seperate drm_bridge implementation
>> into 2 parts, a drm part and a non_drm part.
>>
>> A set of helper functions are defined in this patch to make
>> bridge driver probe independent of the drm flow.
>>
>> The bridge devices register themselves on a lookup table
>> when they get probed by calling "drm_bridge_add_for_lookup".
>>
>> The parent encoder driver waits till the bridge is available in the
>> lookup table(by calling "of_drm_find_bridge") and then continues with
>> its initialization.
>
> Before the introduction of the component framework I would have said this is
> the way to go. Now, I think bridges should register themselves as components,
> and the DRM master driver should use the component framework to get a
> reference to the bridges it needs.
Well, I have modified the bridge framework exactly the way Thierry wanted it
to be, I mean the same way the current panel framework is.
And, I don't think there is a problem with that.
What problem are you facing with current bridge implementation?
What is the advantage of using the component framework to register bridges?

>> The encoder driver should call "drm_bridge_attach_encoder" to pass on
>> the drm_device and the encoder pointers to the bridge object.
>>
>> Now that the drm_device pointer is available, the encoder then calls
>> "bridge->funcs->post_encoder_init" to allow the bridge to continue
>> registering itself with the drm core.
>
> This is what really bothers me with DRM bridge.
>
> The framework assumes that a bridge will always bridge an encoder and a
> connector. Beside lacking support for chained bridges, this creates an
> artificial split between bridges and encoders by modeling the same components
> using drm_encoder or drm_bridge depending on their position in the video
> output pipeline.
>
> I would like to see drm_bridge becoming more self-centric, removing the
> awareness of the upstream encoder and downstream connector. I'll give this a
> try, but it will conflict with this patch, so I'd like to share opinions and
> coordinate efforts sooner than later if possible.
I am not really able to understand how you want "drm_bridge" to be.
As of now, there are many platforms using drm_bridge and they don't
have a problem with current implementation.
Regarding chained bridges: Can't you add this once my patchset is merged?
As an additional feature?

To be honest, I have spent quite sometime for working on this patchset.
All I started with was to add drm_panel support to drm_bridge.
When I sent the first patchset for that, Daniel, Rob and Thierry raised a
concern that current bridge framework itself is not proper and hence
they asked me to fix that first. And we have reached till here based on
their comments only.

Without this patchset, you cannot bring an X server
based display on snow and peach_pit. Also, day by day the number of
platforms using drm_bridge is increasing. And, I don't really see a problem
with the current approach(which is exactly the same way panel framework is).
And, I am no decision maker here. I would expect the top guys to comment!

Ajay

>> Also, non driver model based ptn3460 driver is removed in this patch.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 --
>>  drivers/gpu/drm/Makefile                           |    1 +
>>  drivers/gpu/drm/bridge/Kconfig                     |   12 +-
>>  drivers/gpu/drm/bridge/Makefile                    |    2 -
>>  drivers/gpu/drm/bridge/ptn3460.c                   |  343 -----------------
>>  drivers/gpu/drm/drm_bridge.c                       |   89 +++++
>>  drivers/gpu/drm/drm_crtc.c                         |    9 +-
>>  drivers/gpu/drm/exynos/Kconfig                     |    3 +-
>>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   57 ++--
>>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +-
>>  include/drm/bridge/ptn3460.h                       |   37 ---
>>  include/drm/drm_crtc.h                             |   16 +-
>>  13 files changed, 147 insertions(+), 453 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
>>  delete mode 100644 drivers/gpu/drm/bridge/ptn3460.c
>>  create mode 100644 drivers/gpu/drm/drm_bridge.c
>>  delete mode 100644 include/drm/bridge/ptn3460.h
>
> --
> Regards,
>
> Laurent Pinchart
>
