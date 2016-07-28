From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v1 2/2] drm/bridge: analogix_dp: turn off the panel when
 eDP need to disable
Date: Thu, 28 Jul 2016 11:28:45 +0800
Message-ID: <57997BED.4050600@rock-chips.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
 <1469106886-4979-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmail.com>
 <57917011.6000108@rock-chips.com>
 <CAOw6vbLXDuEW1egN3N8XxXdW8hdrY8W9T-v_d6hWDnRcRqZe_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:51122 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758525AbcG1D3A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 23:29:00 -0400
In-Reply-To: <CAOw6vbLXDuEW1egN3N8XxXdW8hdrY8W9T-v_d6hWDnRcRqZe_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

Sean,

Oops, sorry about miss your suggest :(

On 07/22/2016 11:03 PM, Sean Paul wrote:
> On Thu, Jul 21, 2016 at 9:00 PM, Yakir Yang <ykk@rock-chips.com> wrote:
>> Sean,
>>
>> Thanks for your fast respond :-)
>>
>> But this patch is not the latest one, I have upgraded this to "v1.1" version
>> to fix the eDP can't be disabled problem:
>>      [PATCH v1.1 2/2] drm/bridge: analogix_dp: turn off the panel when eDP
>> need to disable
>>          Changes in v1.1: - unprepare the panel at the end of
>> bridge->disable() function
>>
>> In spite of this, I would take your comments with my "v1.1" patch.
>>
>> On 07/21/2016 10:28 PM, Sean Paul wrote:
>>
>> On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>>
>> Some panels (like Sharp LQ123P1JX31) need to be turn off when eDP
>> controller stop to send valid video signal, otherwhise panel would
>> go burn in, and keep flicker and flicker.
>>
>> So it's better to turn off the panel when eDP need to disable, and
>> we need to turn on the panel in connector->detect() callback, so
>> that driver would detect panel status rightly.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 32715da..ea059b3 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -961,6 +961,14 @@ analogix_dp_detect(struct drm_connector *connector,
>> bool force)
>>   {
>>          struct analogix_dp_device *dp = to_dp(connector);
>>
>> +       /*
>> +        * Panle would prepare for several times here, but don't worry it
>>
>> s/Panle/Panel/
>>
>>
>> Done
>>
>> +        * would only enable the hardware at the first prepare time.
>>
>> Errr, this shouldn't go in detect. How about putting this in
>> bridge_enable instead?
>>
>>
>> Nope, if we put this in bridge_enable, then eDP would never be enabled.
>> Here're the calling flow.
>>
>> --> analogix_dp_probe
>>    --> analogix_dp_bind  # we still haven't prepared the panel here, that
>> means panel have been powered up
>>      --> analogix_dp_detect  # Oops, losing panel valid hotplug signal, cause
>> panel have been powered up
>>      --> ** Keep detecting **
>
> Yeah, after playing around with the patch yesterday I discovered this
> for myself. I still don't think detect() should be changing hardware
> state. Perhaps you could add a matching unprepare() after you attempt
> to detect the panel?

Hmm, I don't understand the meaning of "add a matching unprepare()".

I didn't see there is an unprepare() callback in drm_crtc_helper.h, would
you like to share some simple code :-D

Thanks,
- Yakir

> Sean
>
>> +        */
>> +       if (dp->plat_data->panel)
>> +               if (drm_panel_prepare(dp->plat_data->panel))
>>
>> Personally, I don't like doing work in a conditional since you're
>> throwing the return code away. Could you break this out into:
>>
>> ret = drm_panel_prepare(dp->plat_data->panel);
>> if (ret)
>>    DRM_ERROR("failed to setup the panel ret=%d\n", ret);
>>
>>
>> Okay
>>
>>
>> +                       DRM_ERROR("failed to setup the panel\n");
>> +
>>          if (analogix_dp_detect_hpd(dp))
>>                  return connector_status_disconnected;
>>
>> @@ -1063,7 +1071,8 @@ static void analogix_dp_bridge_disable(struct
>> drm_bridge *bridge)
>>                  return;
>>
>>          if (dp->plat_data->panel) {
>> -               if (drm_panel_disable(dp->plat_data->panel)) {
>> +               if (drm_panel_disable(dp->plat_data->panel) ||
>> +                   drm_panel_unprepare(dp->plat_data->panel)) {
>>
>> Same comment here, please break this out into separate statements for
>> better readability/logging.
>>
>>
>> Okay,
>>
>>
>> Thanks,
>> - Yakir
>>
>>
>>                          DRM_ERROR("failed to disable the panel\n");
>>                          return;
>>                  }
>> @@ -1333,13 +1342,6 @@ int analogix_dp_bind(struct device *dev, struct
>> drm_device *drm_dev,
>>
>>          phy_power_on(dp->phy);
>>
>> -       if (dp->plat_data->panel) {
>> -               if (drm_panel_prepare(dp->plat_data->panel)) {
>> -                       DRM_ERROR("failed to setup the panel\n");
>> -                       return -EBUSY;
>> -               }
>> -       }
>> -
>>          analogix_dp_init_dp(dp);
>>
>>          ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
>> --
>> 1.9.1
>>
>>
>>
>>
>>
>
>
