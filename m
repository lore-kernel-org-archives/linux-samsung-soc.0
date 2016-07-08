From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: analogix_dp: add the PSR function
 support
Date: Fri, 8 Jul 2016 10:26:27 +0800
Message-ID: <577F0F53.9060404@rock-chips.com>
References: <1467364685-21390-1-git-send-email-ykk@rock-chips.com>
 <1467364768-21741-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbJ4H9xzeaA-2OKsG+pGwdvehS91TZDPfUyq8R-=e70bPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:50324 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753538AbcGHC0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 22:26:37 -0400
In-Reply-To: <CAOw6vbJ4H9xzeaA-2OKsG+pGwdvehS91TZDPfUyq8R-=e70bPQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

Sean,

Thanks for your review.

On 07/02/2016 03:46 AM, Sean Paul wrote:
> On Fri, Jul 1, 2016 at 5:19 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> The full name of PSR is Panel Self Refresh, panel device could refresh
>> itself with the hardware framebuffer in panel, this would make lots of
>> sense to save the power consumption.
>>
>> This patch have exported two symbols for platform driver to implement
>> the PSR function in hardware side:
>> - analogix_dp_active_psr()
>> - analogix_dp_inactive_psr()
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v3:
>> - split analogix_dp_enable_psr(), make it more clearly
>>      analogix_dp_detect_sink_psr()
>>      analogix_dp_enable_sink_psr()
>> - remove some nosie register setting comments
>>
>> Changes in v2:
>> - introduce in v2, splite the common Analogix DP changes out
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 64 ++++++++++++++++++++++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 54 ++++++++++++++++++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  | 28 ++++++++++
>>   include/drm/bridge/analogix_dp.h                   |  3 +
>>   5 files changed, 153 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 32715da..b557097 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -97,6 +97,66 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
>>          return 0;
>>   }
>>
>> +int analogix_dp_active_psr(struct device *dev)
>> +{
>> +       struct analogix_dp_device *dp = dev_get_drvdata(dev);
>> +
>> +       if (!dp->psr_support)
>> +               return -EINVAL;
>> +
>> +       analogix_dp_send_psr_spd(dp, EDP_VSC_PSR_STATE_ACTIVE |
>> +                                EDP_VSC_PSR_CRC_VALUES_VALID);
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_active_psr);
>> +
>> +int analogix_dp_inactive_psr(struct device *dev)
>> +{
>> +       struct analogix_dp_device *dp = dev_get_drvdata(dev);
>> +
>> +       if (!dp->psr_support)
>> +               return -EINVAL;
>> +
>> +       analogix_dp_send_psr_spd(dp, 0);
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_inactive_psr);
>> +
>> +static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
>> +{
>> +       unsigned char psr_version;
>> +
>> +       analogix_dp_read_byte_from_dpcd(dp, DP_PSR_SUPPORT, &psr_version);
>> +       dev_info(dp->dev, "Panel PSR version : %x\n", psr_version);
>> +
> This info message is likely to be spammy since it's printed everytime
> the panel toggle on. Perhaps downgrade to debug level.

Okay, done.

>> +       return (psr_version & DP_PSR_IS_SUPPORTED) ? true : false;
>> +}
>> +
>> +static int analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
> Return type is int, but the function never fails and you don't check
> the return value when calling it. Seems like this should be void.

Done.

>> +{
>> +       unsigned char psr_en;
>> +
>> +       /* Disable psr function */
>> +       analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
>> +       psr_en &= ~DP_PSR_ENABLE;
>> +       analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>> +
>> +       /* Main-Link transmitter remains active during PSR active states */
>> +       analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
>> +       psr_en = DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
> Why read psr_en if you're just going to overwrite it? Perhaps you meant |= here.
>

Yes, it's my mistaken, no need to read the DP_PSR_EN_CFG, just configure 
it directly is enough.

>> +       analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>> +
>> +       /* Enable psr function */
>> +       analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
>> +       psr_en = DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
>> +                DP_PSR_CRC_VERIFICATION;
> Again, no need to read if you're just overwriting.

Yes, ditto

>> +       analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>> +
>> +       analogix_dp_enable_psr_crc(dp);
>> +
>> +       return 0;
>> +}
>> +
>>   static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid_data)
>>   {
>>          int i;
>> @@ -921,6 +981,10 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>>
>>          /* Enable video */
>>          analogix_dp_start_video(dp);
>> +
>> +       dp->psr_support = analogix_dp_detect_sink_psr(dp);
>> +       if (dp->psr_support)
>> +               analogix_dp_enable_sink_psr(dp);
>>   }
>>
>>   int analogix_dp_get_modes(struct drm_connector *connector)
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index b456380..6ca5dde 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -177,6 +177,7 @@ struct analogix_dp_device {
>>          int                     hpd_gpio;
>>          bool                    force_hpd;
>>          unsigned char           edid[EDID_BLOCK_LENGTH * 2];
>> +       bool                    psr_support;
>>
>>          struct analogix_dp_plat_data *plat_data;
>>   };
>> @@ -278,4 +279,7 @@ int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp);
>>   void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
>>   void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
>>   void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
>> +void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
>> +void analogix_dp_send_psr_spd(struct analogix_dp_device *dp, int db1);
>> +
>>   #endif /* _ANALOGIX_DP_CORE_H */
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index 48030f0..e8372c7 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -1322,3 +1322,57 @@ void analogix_dp_disable_scrambling(struct analogix_dp_device *dp)
>>          reg |= SCRAMBLING_DISABLE;
>>          writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
>>   }
>> +
>> +void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>> +{
>> +       writel(PSR_VID_CRC_FLUSH | PSR_VID_CRC_ENABLE,
>> +              dp->reg_base + ANALOGIX_DP_CRC_CON);
>> +
>> +       usleep_range(10, 20);
> Is this sleep arbitrary, or documented somewhere? Could you add a
> comment explaining how this was arrived at?
>

Yes, this sleep is arbitrary, there is no document about the

>> +
>> +       writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
>> +}
>> +
>> +void analogix_dp_send_psr_spd(struct analogix_dp_device *dp, int db1)
>> +{
>> +       unsigned int val;
>> +
>> +       /* don't send info frame */
>> +       val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +       val &= ~IF_EN;
>> +       writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +
>> +       /* configure single frame update mode */
>> +       writel(0x3, dp->reg_base + ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL);
>> +
>> +       /* configure VSC HB0 ~ HB3 */
>> +       writel(0x00, dp->reg_base + ANALOGIX_DP_SPD_HB0);
>> +       writel(0x07, dp->reg_base + ANALOGIX_DP_SPD_HB1);
>> +       writel(0x02, dp->reg_base + ANALOGIX_DP_SPD_HB2);
>> +       writel(0x08, dp->reg_base + ANALOGIX_DP_SPD_HB3);
>> +
>> +       /* configure VSC HB0 ~ HB3 */
>> +       writel(0x00, dp->reg_base + ANALOGIX_DP_SPD_PB0);
>> +       writel(0x16, dp->reg_base + ANALOGIX_DP_SPD_PB1);
>> +       writel(0xCE, dp->reg_base + ANALOGIX_DP_SPD_PB2);
>> +       writel(0x5D, dp->reg_base + ANALOGIX_DP_SPD_PB3);
>> +
>> +       /* configure DB0 / DB1 values */
>> +       writel(0x00, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB0);
> Lots of hardcoded values here. I think this could be cleaned up.

For "HB0~HB3", "PB0~PB3" and "DB1", I don't understand very well. Those 
seems to be a kind of head number, I got those magic values from our IC 
side. So I think those should be okay to keep the hardcode values here :-D

But for the "0x3" in "ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL", I would fix it 
with suitable macro.

>> +       writel(db1, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB1);
>> +
>> +       /* set reuse spd inforframe */
>> +       val = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
>> +       val |= REUSE_SPD_EN;
>> +       writel(val, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
>> +
>> +       /* mark info frame update */
>> +       val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +       val = (val | IF_UP) & ~IF_EN;
>> +       writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +
>> +       /* send info frame */
>> +       val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +       val |= IF_EN;
>> +       writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>> +}
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> index cdcc6c5..a2698e4 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>> @@ -22,6 +22,8 @@
>>   #define ANALOGIX_DP_VIDEO_CTL_8                        0x3C
>>   #define ANALOGIX_DP_VIDEO_CTL_10               0x44
>>
>> +#define ANALOGIX_DP_SPDIF_AUDIO_CTL_0          0xD8
>> +
>>   #define ANALOGIX_DP_PLL_REG_1                  0xfc
>>   #define ANALOGIX_DP_PLL_REG_2                  0x9e4
>>   #define ANALOGIX_DP_PLL_REG_3                  0x9e8
>> @@ -30,6 +32,21 @@
>>
>>   #define ANALOGIX_DP_PD                         0x12c
>>
>> +#define ANALOGIX_DP_IF_TYPE                    0x244
>> +#define ANALOGIX_DP_IF_PKT_DB1                 0x254
>> +#define ANALOGIX_DP_IF_PKT_DB2                 0x258
>> +#define ANALOGIX_DP_SPD_HB0                    0x2F8
>> +#define ANALOGIX_DP_SPD_HB1                    0x2FC
>> +#define ANALOGIX_DP_SPD_HB2                    0x300
>> +#define ANALOGIX_DP_SPD_HB3                    0x304
>> +#define ANALOGIX_DP_SPD_PB0                    0x308
>> +#define ANALOGIX_DP_SPD_PB1                    0x30C
>> +#define ANALOGIX_DP_SPD_PB2                    0x310
>> +#define ANALOGIX_DP_SPD_PB3                    0x314
>> +#define ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL      0x318
>> +#define ANALOGIX_DP_VSC_SHADOW_DB0             0x31C
>> +#define ANALOGIX_DP_VSC_SHADOW_DB1             0x320
>> +
>>   #define ANALOGIX_DP_LANE_MAP                   0x35C
>>
>>   #define ANALOGIX_DP_ANALOG_CTL_1               0x370
>> @@ -103,6 +120,8 @@
>>
>>   #define ANALOGIX_DP_SOC_GENERAL_CTL            0x800
>>
>> +#define ANALOGIX_DP_CRC_CON                    0x890
>> +
>>   /* ANALOGIX_DP_TX_SW_RESET */
>>   #define RESET_DP_TX                            (0x1 << 0)
>>
>> @@ -151,6 +170,7 @@
>>   #define VID_CHK_UPDATE_TYPE_SHIFT              (4)
>>   #define VID_CHK_UPDATE_TYPE_1                  (0x1 << 4)
>>   #define VID_CHK_UPDATE_TYPE_0                  (0x0 << 4)
>> +#define REUSE_SPD_EN                           (0x1 << 3)
>>
>>   /* ANALOGIX_DP_VIDEO_CTL_8 */
>>   #define VID_HRES_TH(x)                         (((x) & 0xf) << 4)
>> @@ -376,4 +396,12 @@
>>   #define VIDEO_MODE_SLAVE_MODE                  (0x1 << 0)
>>   #define VIDEO_MODE_MASTER_MODE                 (0x0 << 0)
>>
>> +/* ANALOGIX_DP_PKT_SEND_CTL */
>> +#define IF_UP                                  (0x1 << 4)
>> +#define IF_EN                                  (0x1 << 0)
>> +
>> +/* ANALOGIX_DP_CRC_CON */
>> +#define PSR_VID_CRC_FLUSH                      (0x1 << 2)
>> +#define PSR_VID_CRC_ENABLE                     (0x1 << 0)
>> +
>>   #endif /* _ANALOGIX_DP_REG_H */
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 261b86d..183a336 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -38,6 +38,9 @@ struct analogix_dp_plat_data {
>>                           struct drm_connector *);
>>   };
>>
>> +int analogix_dp_active_psr(struct device *dev);
>> +int analogix_dp_inactive_psr(struct device *dev);
> Why active/inactive instead of enable/disable, which is used everywhere else?

Done

Thanks,
- Yakir

>> +
>>   int analogix_dp_resume(struct device *dev);
>>   int analogix_dp_suspend(struct device *dev);
>>
>> --
>> 1.9.1
>>
>>
>
>
