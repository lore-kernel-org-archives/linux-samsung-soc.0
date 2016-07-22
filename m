From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v1 2/2] drm/bridge: analogix_dp: turn off the panel when
 eDP need to disable
Date: Fri, 22 Jul 2016 11:03:57 -0400
Message-ID: <CAOw6vbLXDuEW1egN3N8XxXdW8hdrY8W9T-v_d6hWDnRcRqZe_A@mail.gmail.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
 <1469106886-4979-1-git-send-email-ykk@rock-chips.com> <CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmail.com>
 <57917011.6000108@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.161.182]:34494 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244AbcGVPET (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2016 11:04:19 -0400
Received: by mail-yw0-f182.google.com with SMTP id z8so83872490ywa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2016 08:04:19 -0700 (PDT)
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com. [209.85.161.178])
        by smtp.gmail.com with ESMTPSA id n18sm5553705ywn.36.2016.07.22.08.04.18
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jul 2016 08:04:18 -0700 (PDT)
Received: by mail-yw0-f178.google.com with SMTP id r9so105895761ywg.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2016 08:04:18 -0700 (PDT)
In-Reply-To: <57917011.6000108@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

On Thu, Jul 21, 2016 at 9:00 PM, Yakir Yang <ykk@rock-chips.com> wrote:
> Sean,
>
> Thanks for your fast respond :-)
>
> But this patch is not the latest one, I have upgraded this to "v1.1" version
> to fix the eDP can't be disabled problem:
>     [PATCH v1.1 2/2] drm/bridge: analogix_dp: turn off the panel when eDP
> need to disable
>         Changes in v1.1: - unprepare the panel at the end of
> bridge->disable() function
>
> In spite of this, I would take your comments with my "v1.1" patch.
>
> On 07/21/2016 10:28 PM, Sean Paul wrote:
>
> On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>
> Some panels (like Sharp LQ123P1JX31) need to be turn off when eDP
> controller stop to send valid video signal, otherwhise panel would
> go burn in, and keep flicker and flicker.
>
> So it's better to turn off the panel when eDP need to disable, and
> we need to turn on the panel in connector->detect() callback, so
> that driver would detect panel status rightly.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 32715da..ea059b3 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -961,6 +961,14 @@ analogix_dp_detect(struct drm_connector *connector,
> bool force)
>  {
>         struct analogix_dp_device *dp = to_dp(connector);
>
> +       /*
> +        * Panle would prepare for several times here, but don't worry it
>
> s/Panle/Panel/
>
>
> Done
>
> +        * would only enable the hardware at the first prepare time.
>
> Errr, this shouldn't go in detect. How about putting this in
> bridge_enable instead?
>
>
> Nope, if we put this in bridge_enable, then eDP would never be enabled.
> Here're the calling flow.
>
> --> analogix_dp_probe
>   --> analogix_dp_bind  # we still haven't prepared the panel here, that
> means panel have been powered up
>     --> analogix_dp_detect  # Oops, losing panel valid hotplug signal, cause
> panel have been powered up
>     --> ** Keep detecting **


Yeah, after playing around with the patch yesterday I discovered this
for myself. I still don't think detect() should be changing hardware
state. Perhaps you could add a matching unprepare() after you attempt
to detect the panel?

Sean

>
> +        */
> +       if (dp->plat_data->panel)
> +               if (drm_panel_prepare(dp->plat_data->panel))
>
> Personally, I don't like doing work in a conditional since you're
> throwing the return code away. Could you break this out into:
>
> ret = drm_panel_prepare(dp->plat_data->panel);
> if (ret)
>   DRM_ERROR("failed to setup the panel ret=%d\n", ret);
>
>
> Okay
>
>
> +                       DRM_ERROR("failed to setup the panel\n");
> +
>         if (analogix_dp_detect_hpd(dp))
>                 return connector_status_disconnected;
>
> @@ -1063,7 +1071,8 @@ static void analogix_dp_bridge_disable(struct
> drm_bridge *bridge)
>                 return;
>
>         if (dp->plat_data->panel) {
> -               if (drm_panel_disable(dp->plat_data->panel)) {
> +               if (drm_panel_disable(dp->plat_data->panel) ||
> +                   drm_panel_unprepare(dp->plat_data->panel)) {
>
> Same comment here, please break this out into separate statements for
> better readability/logging.
>
>
> Okay,
>
>
> Thanks,
> - Yakir
>
>
>                         DRM_ERROR("failed to disable the panel\n");
>                         return;
>                 }
> @@ -1333,13 +1342,6 @@ int analogix_dp_bind(struct device *dev, struct
> drm_device *drm_dev,
>
>         phy_power_on(dp->phy);
>
> -       if (dp->plat_data->panel) {
> -               if (drm_panel_prepare(dp->plat_data->panel)) {
> -                       DRM_ERROR("failed to setup the panel\n");
> -                       return -EBUSY;
> -               }
> -       }
> -
>         analogix_dp_init_dp(dp);
>
>         ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
> --
> 1.9.1
>
>
>
>
>
