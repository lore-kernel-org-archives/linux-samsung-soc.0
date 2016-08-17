From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Ensure the panel is properly
 prepared/unprepared
Date: Wed, 17 Aug 2016 10:38:10 +0530
Message-ID: <57B3F13A.80900@codeaurora.org>
References: <1469819791-31860-1-git-send-email-seanpaul@chromium.org>
 <1470682398-18982-1-git-send-email-seanpaul@chromium.org>
 <977b849f-17c9-22c5-7534-6cb1b43ee3d2@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53947 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590AbcHQFIW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 01:08:22 -0400
In-Reply-To: <977b849f-17c9-22c5-7534-6cb1b43ee3d2@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Sean Paul <seanpaul@chromium.org>
Cc: yzq@rock-chips.com, inki.dae@samsung.com, treding@nvidia.com, heiko@sntech.de, jingoohan1@gmail.com, javier@osg.samsung.com, marcheu@chromium.org, tfiga@chromium.org, dianders@chromium.org, airlied@linux.ie, daniel.vetter@ffwll.ch, k.kozlowski@samsung.com, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org



On 08/09/2016 08:05 AM, Yakir Yang wrote:
> + Archit
>
>
> On 08/09/2016 02:53 AM, Sean Paul wrote:
>> Instead of just preparing the panel on bind, actually prepare/unprepare
>> during modeset/disable. The panel must be prepared in order to read hpd
>> status and edid, so we need to keep state around the prepares in order
>> to ensure we don't accidentally turn the panel off at the wrong time.
>>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Reviewed-by: Yakir Yang <ykk@rock-chips.com>
>
> And I also tested this patch on RK3399 Kevin board, panel works rightly,
> so:
> Tested-by: Yakir Yang <ykk@rock-chips.com>
>
> Also add Archit into CC list, guess this patch should go through his
> drm_bridge's tree.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

>
> Thanks,
> - Yakir
>
>> ---
>>
>> Changes in v2:
>>   - Added panel_is_modeset state/lock to avoid racing detect with
>> modeset (marcheu)
>>   - Added prepare/unprepare in .get_modes (yakir)
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 101
>> ++++++++++++++++++---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   3 +
>>   2 files changed, 93 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 32715da..47c449a 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -923,11 +923,63 @@ static void analogix_dp_commit(struct
>> analogix_dp_device *dp)
>>       analogix_dp_start_video(dp);
>>   }
>> +/*
>> + * This function is a bit of a catch-all for panel preparation,
>> hopefully
>> + * simplifying the logic of functions that need to prepare/unprepare
>> the panel
>> + * below.
>> + *
>> + * If @prepare is true, this function will prepare the panel.
>> Conversely, if it
>> + * is false, the panel will be unprepared.
>> + *
>> + * If @is_modeset_prepare is true, the function will disregard the
>> current state
>> + * of the panel and either prepare/unprepare the panel based on
>> @prepare. Once
>> + * it finishes, it will update dp->panel_is_modeset to reflect the
>> current state
>> + * of the panel.
>> + */
>> +static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>> +                     bool prepare, bool is_modeset_prepare)
>> +{
>> +    int ret = 0;
>> +
>> +    if (!dp->plat_data->panel)
>> +        return 0;
>> +
>> +    mutex_lock(&dp->panel_lock);
>> +
>> +    /*
>> +     * Exit early if this is a temporary prepare/unprepare and we're
>> already
>> +     * modeset (since we neither want to prepare twice or unprepare
>> early).
>> +     */
>> +    if (dp->panel_is_modeset && !is_modeset_prepare)
>> +        goto out;
>> +
>> +    if (prepare)
>> +        ret = drm_panel_prepare(dp->plat_data->panel);
>> +    else
>> +        ret = drm_panel_unprepare(dp->plat_data->panel);
>> +
>> +    if (ret)
>> +        goto out;
>> +
>> +    if (is_modeset_prepare)
>> +        dp->panel_is_modeset = prepare;
>> +
>> +out:
>> +    mutex_unlock(&dp->panel_lock);
>> +    return ret;
>> +}
>> +
>>   int analogix_dp_get_modes(struct drm_connector *connector)
>>   {
>>       struct analogix_dp_device *dp = to_dp(connector);
>>       struct edid *edid = (struct edid *)dp->edid;
>> -    int num_modes = 0;
>> +    int ret, num_modes = 0;
>> +
>> +    ret = analogix_dp_prepare_panel(dp, true, false);
>> +    if (ret) {
>> +        DRM_ERROR("Failed to prepare panel (%d)\n", ret);
>> +        return 0;
>> +    }
>>       if (analogix_dp_handle_edid(dp) == 0) {
>>           drm_mode_connector_update_edid_property(&dp->connector, edid);
>> @@ -940,6 +992,10 @@ int analogix_dp_get_modes(struct drm_connector
>> *connector)
>>       if (dp->plat_data->get_modes)
>>           num_modes += dp->plat_data->get_modes(dp->plat_data,
>> connector);
>> +    ret = analogix_dp_prepare_panel(dp, false, false);
>> +    if (ret)
>> +        DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>> +
>>       return num_modes;
>>   }
>> @@ -960,11 +1016,23 @@ enum drm_connector_status
>>   analogix_dp_detect(struct drm_connector *connector, bool force)
>>   {
>>       struct analogix_dp_device *dp = to_dp(connector);
>> +    enum drm_connector_status status = connector_status_disconnected;
>> +    int ret;
>> -    if (analogix_dp_detect_hpd(dp))
>> +    ret = analogix_dp_prepare_panel(dp, true, false);
>> +    if (ret) {
>> +        DRM_ERROR("Failed to prepare panel (%d)\n", ret);
>>           return connector_status_disconnected;
>> +    }
>> +
>> +    if (!analogix_dp_detect_hpd(dp))
>> +        status = connector_status_connected;
>> -    return connector_status_connected;
>> +    ret = analogix_dp_prepare_panel(dp, false, false);
>> +    if (ret)
>> +        DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>> +
>> +    return status;
>>   }
>>   static void analogix_dp_connector_destroy(struct drm_connector
>> *connector)
>> @@ -1035,6 +1103,16 @@ static int analogix_dp_bridge_attach(struct
>> drm_bridge *bridge)
>>       return 0;
>>   }
>> +static void analogix_dp_bridge_pre_enable(struct drm_bridge *bridge)
>> +{
>> +    struct analogix_dp_device *dp = bridge->driver_private;
>> +    int ret;
>> +
>> +    ret = analogix_dp_prepare_panel(dp, true, true);
>> +    if (ret)
>> +        DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>> +}
>> +
>>   static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
>>   {
>>       struct analogix_dp_device *dp = bridge->driver_private;
>> @@ -1058,6 +1136,7 @@ static void analogix_dp_bridge_enable(struct
>> drm_bridge *bridge)
>>   static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>>   {
>>       struct analogix_dp_device *dp = bridge->driver_private;
>> +    int ret;
>>       if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>>           return;
>> @@ -1077,6 +1156,10 @@ static void analogix_dp_bridge_disable(struct
>> drm_bridge *bridge)
>>       pm_runtime_put_sync(dp->dev);
>> +    ret = analogix_dp_prepare_panel(dp, false, true);
>> +    if (ret)
>> +        DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>> +
>>       dp->dpms_mode = DRM_MODE_DPMS_OFF;
>>   }
>> @@ -1165,9 +1248,9 @@ static void analogix_dp_bridge_nop(struct
>> drm_bridge *bridge)
>>   }
>>   static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>> +    .pre_enable = analogix_dp_bridge_pre_enable,
>>       .enable = analogix_dp_bridge_enable,
>>       .disable = analogix_dp_bridge_disable,
>> -    .pre_enable = analogix_dp_bridge_nop,
>>       .post_disable = analogix_dp_bridge_nop,
>>       .mode_set = analogix_dp_bridge_mode_set,
>>       .attach = analogix_dp_bridge_attach,
>> @@ -1254,6 +1337,9 @@ int analogix_dp_bind(struct device *dev, struct
>> drm_device *drm_dev,
>>       dp->dev = &pdev->dev;
>>       dp->dpms_mode = DRM_MODE_DPMS_OFF;
>> +    mutex_init(&dp->panel_lock);
>> +    dp->panel_is_modeset = false;
>> +
>>       /*
>>        * platform dp driver need containor_of the plat_data to get
>>        * the driver private data, so we need to store the point of
>> @@ -1333,13 +1419,6 @@ int analogix_dp_bind(struct device *dev, struct
>> drm_device *drm_dev,
>>       phy_power_on(dp->phy);
>> -    if (dp->plat_data->panel) {
>> -        if (drm_panel_prepare(dp->plat_data->panel)) {
>> -            DRM_ERROR("failed to setup the panel\n");
>> -            return -EBUSY;
>> -        }
>> -    }
>> -
>>       analogix_dp_init_dp(dp);
>>       ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index b456380..43108d7 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -178,6 +178,9 @@ struct analogix_dp_device {
>>       bool                    force_hpd;
>>       unsigned char           edid[EDID_BLOCK_LENGTH * 2];
>> +    struct mutex        panel_lock;
>> +    bool            panel_is_modeset;
>> +
>>       struct analogix_dp_plat_data *plat_data;
>>   };
>
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
