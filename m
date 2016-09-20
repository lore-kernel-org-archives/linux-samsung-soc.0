From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: analogix_dp: detect Sink PSR state
 after configuring the PSR
Date: Tue, 20 Sep 2016 10:22:34 +0800
Message-ID: <a2d8a2e5-7568-12b2-0541-5d58d3aafca6@rock-chips.com>
References: <1473306526-4340-1-git-send-email-ykk@rock-chips.com>
 <1473414302-390-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbJKggHaA9zeeiL2FUR7oraMRdVEocmLzrtBtM7mjBCVcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.136]:38746 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753407AbcITCWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 22:22:52 -0400
In-Reply-To: <CAOw6vbJKggHaA9zeeiL2FUR7oraMRdVEocmLzrtBtM7mjBCVcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

Hi Sean,

On 09/12/2016 09:52 PM, Sean Paul wrote:
> On Fri, Sep 9, 2016 at 5:45 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> Make sure the request PSR state takes effect in analogix_dp_send_psr_spd()
>> function, or print the sink PSR error state if we failed to apply the
>> requested PSR setting.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v3:
>> - Update commit message
>> - Add DP_TIMEOUT_PSR_LOOP_MS marcos
>> - Correct the return values of analogix_dp_send_psr_spd()
>>
>> Changes in v2:
>> - A bunch of good fixes from Sean
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  5 +++--
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 25 ++++++++++++++++++++--
>>   3 files changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 5fe3982..c0ce16a 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -116,8 +116,7 @@ int analogix_dp_enable_psr(struct device *dev)
>>          psr_vsc.DB0 = 0;
>>          psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
>>
>> -       analogix_dp_send_psr_spd(dp, &psr_vsc);
>> -       return 0;
>> +       return analogix_dp_send_psr_spd(dp, &psr_vsc);
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
>>
>> @@ -139,8 +138,7 @@ int analogix_dp_disable_psr(struct device *dev)
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
>> index d564e90..a27f1e3 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -20,6 +20,7 @@
>>   #define MAX_EQ_LOOP 5
>>
>>   #define DP_TIMEOUT_LOOP_MS                     msecs_to_jiffies(1)
>> +#define DP_TIMEOUT_PSR_LOOP_MS                 msecs_to_jiffies(300)
> Same comment here re: units.
>
> 300ms seems like a really long time. Why does it take this long?

This magic number '300ms' just come from my test, I haven't found the 
description in eDP 1.4a Spec about what exact time should Sink take to 
entry PSR.

- Yakir

> Sean
>
>
>>   /* DP_MAX_LANE_COUNT */
>>   #define DPCD_ENHANCED_FRAME_CAP(x)             (((x) >> 7) & 0x1)
>> @@ -248,8 +249,8 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
>>   void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
>>   void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
>>   void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
>> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> -                             struct edp_vsc_psr *vsc);
>> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> +                            struct edp_vsc_psr *vsc);
>>   ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>>                               struct drm_dp_aux_msg *msg);
>>   #endif /* _ANALOGIX_DP_CORE_H */
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index 15a4cf0..7fd4ed0 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -1004,10 +1004,12 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>>          writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
>>   }
>>
>> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> -                             struct edp_vsc_psr *vsc)
>> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>> +                            struct edp_vsc_psr *vsc)
>>   {
>> +       unsigned long timeout;
>>          unsigned int val;
>> +       u8 sink;
>>
>>          /* don't send info frame */
>>          val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> @@ -1048,6 +1050,25 @@ void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>>          val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>          val |= IF_EN;
>>          writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +
>> +       timeout = jiffies + DP_TIMEOUT_PSR_LOOP_MS;
>> +       while (time_before(jiffies, timeout)) {
>> +               val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
>> +               if (val != 1) {
>> +                       dev_err(dp->dev, "PSR_STATUS read failed ret=%d", val);
>> +                       return -EBUSY;
>> +               }
>> +
>> +               if ((vsc->DB1 && sink == DP_PSR_SINK_ACTIVE_RFB) ||
>> +                   (!vsc->DB1 && sink == DP_PSR_SINK_INACTIVE))
>> +                       return 0;
>> +
>> +               usleep_range(1000, 1500);
>> +       }
>> +
>> +       dev_warn(dp->dev, "Failed to apply PSR, sink state was [%x]", sink);
>> +
>> +       return -ETIMEDOUT;
>>   }
>>
>>   ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
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
