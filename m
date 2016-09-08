From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: analogix_dp: detect Sink PSR state
 after configuring the PSR
Date: Thu, 8 Sep 2016 10:12:11 -0400
Message-ID: <CAOw6vb+apDfnqLtr3TDNxEzKe_kREeabevh4B6Z9wRquLRn6ag@mail.gmail.com>
References: <1473306506-4283-1-git-send-email-ykk@rock-chips.com> <1473306526-4340-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f180.google.com ([209.85.161.180]:34416 "EHLO
        mail-yw0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933313AbcIHOMg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Sep 2016 10:12:36 -0400
Received: by mail-yw0-f180.google.com with SMTP id g192so29179838ywh.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Sep 2016 07:12:35 -0700 (PDT)
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com. [209.85.161.172])
        by smtp.gmail.com with ESMTPSA id c138sm4483450ywb.19.2016.09.08.07.12.32
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Sep 2016 07:12:33 -0700 (PDT)
Received: by mail-yw0-f172.google.com with SMTP id u124so15928552ywg.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Sep 2016 07:12:32 -0700 (PDT)
In-Reply-To: <1473306526-4340-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

On Wed, Sep 7, 2016 at 11:48 PM, Yakir Yang <ykk@rock-chips.com> wrote:
> Make sure the request PSR state could effect in analogix_dp_send_psr_spd()
> function, or printing the error Sink PSR state if we failed to effect
> the request PSR setting.
>


Let's change to:

Make sure the request PSR state takes effect in analogix_dp_send_psr_spd()
function, or print the sink PSR error state if we failed to apply the
requested PSR
setting.

> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v2:
> - A bunch of good fixes from Sean
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 25 ++++++++++++++++++++--
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 5fe3982..c0ce16a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -116,8 +116,7 @@ int analogix_dp_enable_psr(struct device *dev)
>         psr_vsc.DB0 = 0;
>         psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
>
> -       analogix_dp_send_psr_spd(dp, &psr_vsc);
> -       return 0;
> +       return analogix_dp_send_psr_spd(dp, &psr_vsc);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
>
> @@ -139,8 +138,7 @@ int analogix_dp_disable_psr(struct device *dev)
>         psr_vsc.DB0 = 0;
>         psr_vsc.DB1 = 0;
>
> -       analogix_dp_send_psr_spd(dp, &psr_vsc);
> -       return 0;
> +       return analogix_dp_send_psr_spd(dp, &psr_vsc);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index a15f076..6c07a50 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -247,8 +247,8 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
>  void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
>  void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
>  void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
> -                             struct edp_vsc_psr *vsc);
> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
> +                            struct edp_vsc_psr *vsc);
>  ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>                              struct drm_dp_aux_msg *msg);
>  #endif /* _ANALOGIX_DP_CORE_H */
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index a4d17b8..09d703b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -1004,10 +1004,12 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>         writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
>  }
>
> -void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
> -                             struct edp_vsc_psr *vsc)
> +int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
> +                            struct edp_vsc_psr *vsc)
>  {
> +       unsigned long timeout;
>         unsigned int val;
> +       u8 sink;
>
>         /* don't send info frame */
>         val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
> @@ -1048,6 +1050,25 @@ void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>         val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>         val |= IF_EN;
>         writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
> +
> +       timeout = jiffies + msecs_to_jiffies(DP_TIMEOUT_LOOP_COUNT);

Mismatched units here. DP_TIMEOUT_LOOP_COUNT is defined as number of
retries, whereas you're using it as number of ms. Fortunately, the
retry number is so high that this works out :)

In a separate patch preceding this one, can you change
DP_TIMEOUT_LOOP_COUNT to DP_TIMEOUT_LOOP_MS and alter the other
timeout loops to use time_before() like this one instead of blindly
looping 100 times? After that, you can use DP_TIMEOUT_LOOP_MS here.

> +       while (time_before(jiffies, timeout)) {
> +               val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
> +               if (val != 1) {
> +                       dev_err(dp->dev, "PSR_STATUS read failed ret=%d", val);
> +                       return val;

Ok, since this is my snippet this comment is my fault, and I apologize
for that :). However, this could return 0. If drm_dp_dpcd_readb
returns 0, you probably want to retry (same as -EBUSY).

> +               }
> +
> +               if (vsc->DB1 && sink == DP_PSR_SINK_ACTIVE_RFB ||
> +                   !vsc->DB1 && sink == DP_PSR_SINK_INACTIVE)
> +                       break;
> +
> +               usleep_range(1000, 1500);
> +       }
> +
> +       dev_warn(dp->dev, "Failed to effect PSR: %x", sink);

Nit: I think you want to say "PSR failed to take effect" or "Failed to
apply PSR"

Sean

> +
> +       return -ETIMEDOUT;
>  }
>
>  ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
> --
> 1.9.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
