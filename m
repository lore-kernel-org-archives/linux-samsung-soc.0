From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: detect Sink PSR state after
 configuring the PSR
Date: Wed, 7 Sep 2016 11:50:29 +0800
Message-ID: <f28814d9-905b-1007-8550-011d49c68d5a@rock-chips.com>
References: <1472206752-19967-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbKVkbqo9ZeCOgpBw9aGceF_vu93hMVThj2nwVM0x+rv-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.136]:33124 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755567AbcIGDul (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 23:50:41 -0400
In-Reply-To: <CAOw6vbKVkbqo9ZeCOgpBw9aGceF_vu93hMVThj2nwVM0x+rv-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

Sean,

Thanks for your comments.

On 09/07/2016 03:51 AM, Sean Paul wrote:
> On Fri, Aug 26, 2016 at 6:19 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> Make sure the request PSR state could effect in analogix_dp_send_psr_spd()
>> function, or printing the error Sink PSR state if we failed to effect
>> the request PSR setting.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 26 ++++++++++++++++++++--
>>   3 files changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index efac8ab..5a37de8 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -115,8 +115,7 @@ int analogix_dp_enable_psr(struct device *dev)
>>          psr_vsc.DB0 = 0;
>>          psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
>>
>> -       analogix_dp_send_psr_spd(dp, &psr_vsc);
>> -       return 0;
>> +       return analogix_dp_send_psr_spd(dp, &psr_vsc);
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
>>
>> @@ -138,8 +137,7 @@ int analogix_dp_disable_psr(struct device *dev)
>>          psr_vsc.DB0 = 0;
>>          psr_vsc.DB1 = 0;
>>
>> -       analogix_dp_send_psr_spd(dp, &psr_vsc);
>> -       return 0;
>> +       return analogix_dp_send_psr_spd(dp, &psr_vsc);
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index 473b980..f617a9d 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -283,7 +283,7 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
>>   void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
>>   void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
>>   void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
>> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> -                             struct edp_vsc_psr *vsc);
>> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> +                            struct edp_vsc_psr *vsc);
>>
>>   #endif /* _ANALOGIX_DP_CORE_H */
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index 52c1b6b..505e9d8 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -1328,9 +1328,11 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>>          writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
>>   }
>>
>> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> -                             struct edp_vsc_psr *vsc)
>> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> +                            struct edp_vsc_psr *vsc)
>>   {
>> +       unsigned long timeout;
>> +       unsigned char sink;
> u8
Done
>>          unsigned int val;
>>
>>          /* don't send info frame */
>> @@ -1372,4 +1374,24 @@ void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>>          val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>          val |= IF_EN;
>>          writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +
>> +       timeout = jiffies + msecs_to_jiffies(100);
> Pull 100 out into a #define
Done
>> +       while (1) {
>> +               analogix_dp_read_byte_from_dpcd(dp, DP_PSR_STATUS, &sink);
> You should be checking return value here.
Done
>> +
>> +               if (vsc->DB1 && sink == DP_PSR_SINK_ACTIVE_RFB)
>> +                       break;
>> +
>> +               if (!vsc->DB1 && sink == DP_PSR_SINK_INACTIVE)
>> +                       break;
>> +
>> +               if (time_after(jiffies, timeout)) {
>> +                       dev_warn(dp->dev, "Failed to effect PSR: %x", sink);
>> +                       return -EBUSY;
> -ETIMEDOUT is more appropriate
Done
>> +               }
>> +
>> +               usleep_range(1000, 1500);
>> +       }
> The while(1) loop is a little scary. I'd rather do:
>
> while (time_before(jiffies, timeout)) {
>                 ret = analogix_dp_read_byte_from_dpcd(dp, DP_PSR_STATUS, &sink);
>                 if (ret != 1) {
>                         DRM_DEV_ERROR(dp->dev, "PSR_STATUS read failed
> ret=%d", ret);
>                         return ret;
>                 }
>
>                 if (vsc->DB1 && sink == DP_PSR_SINK_ACTIVE_RFB ||
>                     !vsc->DB1 && sink == DP_PSR_SINK_INACTIVE)
>                         return 0;
>
>                 usleep_range(1000, 1500);
> }
>
> dev_warn(dp->dev, "Failed to effect PSR: %x", sink);
> return -ETIMEDOUT;

Thanks for your code.

- Yakir

>
>
>> +
>> +       return 0;
>>   }
>> --
>> 1.9.1
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
