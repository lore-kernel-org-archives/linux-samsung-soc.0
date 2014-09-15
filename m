From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support driver model
Date: Mon, 15 Sep 2014 20:37:57 +0300
Message-ID: <2567411.1uGei9I2NP@avalon>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38054 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753190AbaIORhz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 13:37:55 -0400
In-Reply-To: <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Sean Cross <xobs@kosagi.com>, Thierry Reding <thierry.reding@gmail.com>

Hi Ajay,

Thank you for the patch.

I think we're moving in the right direction, but we're not there yet.

On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
> This patch tries to seperate drm_bridge implementation
> into 2 parts, a drm part and a non_drm part.
> 
> A set of helper functions are defined in this patch to make
> bridge driver probe independent of the drm flow.
> 
> The bridge devices register themselves on a lookup table
> when they get probed by calling "drm_bridge_add_for_lookup".
> 
> The parent encoder driver waits till the bridge is available in the
> lookup table(by calling "of_drm_find_bridge") and then continues with
> its initialization.

Before the introduction of the component framework I would have said this is 
the way to go. Now, I think bridges should register themselves as components, 
and the DRM master driver should use the component framework to get a 
reference to the bridges it needs.

> The encoder driver should call "drm_bridge_attach_encoder" to pass on
> the drm_device and the encoder pointers to the bridge object.
> 
> Now that the drm_device pointer is available, the encoder then calls
> "bridge->funcs->post_encoder_init" to allow the bridge to continue
> registering itself with the drm core.

This is what really bothers me with DRM bridge.

The framework assumes that a bridge will always bridge an encoder and a 
connector. Beside lacking support for chained bridges, this creates an 
artificial split between bridges and encoders by modeling the same components 
using drm_encoder or drm_bridge depending on their position in the video 
output pipeline.

I would like to see drm_bridge becoming more self-centric, removing the 
awareness of the upstream encoder and downstream connector. I'll give this a 
try, but it will conflict with this patch, so I'd like to share opinions and 
coordinate efforts sooner than later if possible.

> Also, non driver model based ptn3460 driver is removed in this patch.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 --
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/bridge/Kconfig                     |   12 +-
>  drivers/gpu/drm/bridge/Makefile                    |    2 -
>  drivers/gpu/drm/bridge/ptn3460.c                   |  343 -----------------
>  drivers/gpu/drm/drm_bridge.c                       |   89 +++++
>  drivers/gpu/drm/drm_crtc.c                         |    9 +-
>  drivers/gpu/drm/exynos/Kconfig                     |    3 +-
>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   57 ++--
>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +-
>  include/drm/bridge/ptn3460.h                       |   37 ---
>  include/drm/drm_crtc.h                             |   16 +-
>  13 files changed, 147 insertions(+), 453 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
>  delete mode 100644 drivers/gpu/drm/bridge/ptn3460.c
>  create mode 100644 drivers/gpu/drm/drm_bridge.c
>  delete mode 100644 include/drm/bridge/ptn3460.h

-- 
Regards,

Laurent Pinchart
