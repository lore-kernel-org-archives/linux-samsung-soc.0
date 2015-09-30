From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v5 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Wed, 30 Sep 2015 15:19:13 +0800
Message-ID: <560B8CF1.7050102@rock-chips.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <1442907477-3283-1-git-send-email-ykk@rock-chips.com>
 <560B73D4.30109@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1682225768=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <560B73D4.30109@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, emil.l.velikov@gmail.com, dianders@chromium.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1682225768==
Content-Type: multipart/alternative;
 boundary="------------060309070205000208040600"

This is a multi-part message in MIME format.
--------------060309070205000208040600
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 09/30/2015 01:32 PM, Krzysztof Kozlowski wrote:
> On 22.09.2015 16:37, Yakir Yang wrote:
>> Both hsync/vsync polarity and interlace mode can be parsed from
>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>> by the video code.
>>
>> But presumably Exynos still relies on the DT properties, so take
>> good use of mode_fixup() in to achieve the compatibility hacks.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v5:
>> - Switch video timing type to "u32", so driver could use "of_property_read_u32"
>>    to get the backword timing values.
> Okay
>
>> Krzysztof suggest me that driver could use
>>    the "of_property_read_bool" to get backword timing values, but that interfacs
>>    would modify the original drm_display_mode timing directly (whether those
>>    properties exists or not).
> Hmm, I don't understand. You have a:
> 	struct video_info {
> 		bool h_sync_polarity;
> 		bool v_sync_polarity;
> 		bool interlaced;
> 	};
>
> so what is wrong with:
> 	dp_video_config->h_sync_polarity =
> 		of_property_read_bool(dp_node, "hsync-active-high");
>
> Is it exactly the same binding as previously?

Yes, it is the same binding as previously. But just a note that we already
mark those DT binding as deprecated.

+-interlaced:            deprecated prop that can parsed frm drm_display_mode.
+-vsync-active-high:     deprecated prop that can parsed frm drm_display_mode.
+-hsync-active-high:     deprecated prop that can parsed frm drm_display_mode.


For now those values should come from "struct drm_display_mode",
and we already parsed them out from "drm_display_mode" before
driver provide the backward compatibility.

Let's used the "hsync-active-high" example:
     As for now the code would like:
     static void analogix_dp_bridge_mode_set(...)
     {
         // Parsed timing value from "drm_display_mode"
         video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);

         // Try to detect the deprecated property, providing
         // the backward compatibility
         of_property_read_u32(dp_node, "hsync-active-high",
                                  &video->h_sync_polarity);

         /*
          * In this case, if "hsync-active-high" property haven't been
          * found, then the video timing "h_sync_polarity" would keep
          * no change, keeping the parsed value from "drm_display_mode"
          */
     }

     But if keep the "of_property_read_bool", then code would like:
     static void analogix_dp_bridge_mode_set(...)
     {
         // Parsed timing value from "drm_display_mode"
         video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);

         // Try to detect the deprecated property, providing
         // the backward compatibility
video->h_sync_polarity =
of_property_read_bool(dp_node, "hsync-active-high");

         /*
          * In this case, if "hsync-active-high" property haven't been
          * found, then the video timing "h_sync_polarity" would just
          * modify to "false". That is the place we don't want, cause
          * it would always modify the timing value parsed from
          * "drm_display_mode"
          */
     }


Thanks,
- Yakir

> Best regards,
> Krzysztof
>
>> Changes in v4:
>> - Provide backword compatibility with samsung. (Krzysztof)
>>
>> Changes in v3:
>> - Dynamic parse video timing info from struct drm_display_mode and
>>    struct drm_display_info. (Thierry)
>>
>> Changes in v2: None
>>
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 144 +++++++++++++--------
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  14 +-
>>   3 files changed, 104 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 1e3c8d3..6be139b 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -890,8 +890,8 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>>   		return;
>>   	}
>>   
>> -	ret = analogix_dp_set_link_train(dp, dp->video_info->lane_count,
>> -					 dp->video_info->link_rate);
>> +	ret = analogix_dp_set_link_train(dp, dp->video_info.lane_count,
>> +					 dp->video_info.link_rate);
>>   	if (ret) {
>>   		dev_err(dp->dev, "unable to do link train\n");
>>   		return;
>> @@ -1030,6 +1030,85 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>>   }
>>   
>> +static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
>> +					struct drm_display_mode *orig_mode,
>> +					struct drm_display_mode *mode)
>> +{
>> +	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct drm_display_info *display_info = &dp->connector->display_info;
>> +	struct video_info *video = &dp->video_info;
>> +	struct device_node *dp_node = dp->dev->of_node;
>> +	int vic;
>> +
>> +	/* Input video interlaces & hsync pol & vsync pol */
>> +	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>> +	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
>> +	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
>> +
>> +	/* Input video dynamic_range & colorimetry */
>> +	vic = drm_match_cea_mode(mode);
>> +	if ((vic == 6) || (vic == 7) || (vic == 21) || (vic == 22) ||
>> +	    (vic == 2) || (vic == 3) || (vic == 17) || (vic == 18)) {
>> +		video->dynamic_range = CEA;
>> +		video->ycbcr_coeff = COLOR_YCBCR601;
>> +	} else if (vic) {
>> +		video->dynamic_range = CEA;
>> +		video->ycbcr_coeff = COLOR_YCBCR709;
>> +	} else {
>> +		video->dynamic_range = VESA;
>> +		video->ycbcr_coeff = COLOR_YCBCR709;
>> +	}
>> +
>> +	/* Input vide bpc and color_formats */
>> +	switch (display_info->bpc) {
>> +	case 12:
>> +		video->color_depth = COLOR_12;
>> +		break;
>> +	case 10:
>> +		video->color_depth = COLOR_10;
>> +		break;
>> +	case 8:
>> +		video->color_depth = COLOR_8;
>> +		break;
>> +	case 6:
>> +		video->color_depth = COLOR_6;
>> +		break;
>> +	default:
>> +		video->color_depth = COLOR_8;
>> +		break;
>> +	}
>> +	if (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +		video->color_space = COLOR_YCBCR444;
>> +	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +		video->color_space = COLOR_YCBCR422;
>> +	else if (display_info->color_formats & DRM_COLOR_FORMAT_RGB444)
>> +		video->color_space = COLOR_RGB;
>> +	else
>> +		video->color_space = COLOR_RGB;
>> +
>> +	/*
>> +	 * NOTE: those property parsing code is used for providing backward
>> +	 * compatibility for samsung platform.
>> +	 * Due to we used the "of_property_read_u32" interfaces, when this
>> +	 * property isn't present, the "video_info" can keep the original
>> +	 * values and wouldn't be modified.
>> +	 */
>> +	of_property_read_u32(dp_node, "samsung,color-space",
>> +			     &video->color_space);
>> +	of_property_read_u32(dp_node, "samsung,dynamic-range",
>> +			     &video->dynamic_range);
>> +	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
>> +			     &video->ycbcr_coeff);
>> +	of_property_read_u32(dp_node, "samsung,color-depth",
>> +			     &video->color_depth);
>> +	of_property_read_u32(dp_node, "hsync-active-high",
>> +			     &video->h_sync_polarity);
>> +	of_property_read_u32(dp_node, "vsync-active-high",
>> +			     &video->v_sync_polarity);
>> +	of_property_read_u32(dp_node, "interlaced",
>> +			     &video->interlaced);
>> +}
>> +
>>   static void analogix_dp_bridge_nop(struct drm_bridge *bridge)
>>   {
>>   	/* do nothing */
>> @@ -1040,6 +1119,7 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>>   	.disable = analogix_dp_bridge_disable,
>>   	.pre_enable = analogix_dp_bridge_nop,
>>   	.post_disable = analogix_dp_bridge_nop,
>> +	.mode_set = analogix_dp_bridge_mode_set,
>>   	.attach = analogix_dp_bridge_attach,
>>   };
>>   
>> @@ -1070,62 +1150,24 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
>>   	return 0;
>>   }
>>   
>> -static struct video_info *analogix_dp_dt_parse_pdata(struct device *dev)
>> +static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>   {
>> -	struct device_node *dp_node = dev->of_node;
>> -	struct video_info *dp_video_config;
>> -
>> -	dp_video_config = devm_kzalloc(dev, sizeof(*dp_video_config),
>> -				       GFP_KERNEL);
>> -	if (!dp_video_config)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	dp_video_config->h_sync_polarity =
>> -		of_property_read_bool(dp_node, "hsync-active-high");
>> -
>> -	dp_video_config->v_sync_polarity =
>> -		of_property_read_bool(dp_node, "vsync-active-high");
>> -
>> -	dp_video_config->interlaced =
>> -		of_property_read_bool(dp_node, "interlaced");
>> -
>> -	if (of_property_read_u32(dp_node, "samsung,color-space",
>> -				 &dp_video_config->color_space)) {
>> -		dev_err(dev, "failed to get color-space\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	if (of_property_read_u32(dp_node, "samsung,dynamic-range",
>> -				 &dp_video_config->dynamic_range)) {
>> -		dev_err(dev, "failed to get dynamic-range\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	if (of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
>> -				 &dp_video_config->ycbcr_coeff)) {
>> -		dev_err(dev, "failed to get ycbcr-coeff\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	if (of_property_read_u32(dp_node, "samsung,color-depth",
>> -				 &dp_video_config->color_depth)) {
>> -		dev_err(dev, "failed to get color-depth\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> +	struct device_node *dp_node = dp->dev->of_node;
>> +	struct video_info *video_info = &dp->video_info
>>   
>>   	if (of_property_read_u32(dp_node, "samsung,link-rate",
>> -				 &dp_video_config->link_rate)) {
>> +				 &video_info->link_rate)) {
>>   		dev_err(dev, "failed to get link-rate\n");
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>   	}
>>   
>>   	if (of_property_read_u32(dp_node, "samsung,lane-count",
>> -				 &dp_video_config->lane_count)) {
>> +				 &video_info->lane_count)) {
>>   		dev_err(dev, "failed to get lane-count\n");
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>   	}
>>   
>> -	return dp_video_config;
>> +	return 0;
>>   }
>>   
>>   int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>> @@ -1158,9 +1200,9 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>   	 */
>>   	dp->plat_data = plat_data;
>>   
>> -	dp->video_info = analogix_dp_dt_parse_pdata(&pdev->dev);
>> -	if (IS_ERR(dp->video_info))
>> -		return PTR_ERR(dp->video_info);
>> +	ret = analogix_dp_dt_parse_pdata(dp);
>> +	if (ret)
>> +		return ret;
>>   
>>   	dp->phy = devm_phy_get(dp->dev, "dp");
>>   	if (IS_ERR(dp->phy)) {
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index 9a90a18..730486d 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -120,9 +120,9 @@ enum dp_irq_type {
>>   struct video_info {
>>   	char *name;
>>   
>> -	bool h_sync_polarity;
>> -	bool v_sync_polarity;
>> -	bool interlaced;
>> +	u32 h_sync_polarity;
>> +	u32 v_sync_polarity;
>> +	u32 interlaced;
>>   
>>   	enum color_space color_space;
>>   	enum dynamic_range dynamic_range;
>> @@ -154,7 +154,7 @@ struct analogix_dp_device {
>>   	unsigned int		irq;
>>   	void __iomem		*reg_base;
>>   
>> -	struct video_info	*video_info;
>> +	struct video_info	video_info;
>>   	struct link_train	link_train;
>>   	struct work_struct	hotplug_work;
>>   	struct phy		*phy;
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index a388c0a..861097a 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -1084,15 +1084,15 @@ void analogix_dp_set_video_color_format(struct analogix_dp_device *dp)
>>   	u32 reg;
>>   
>>   	/* Configure the input color depth, color space, dynamic range */
>> -	reg = (dp->video_info->dynamic_range << IN_D_RANGE_SHIFT) |
>> -		(dp->video_info->color_depth << IN_BPC_SHIFT) |
>> -		(dp->video_info->color_space << IN_COLOR_F_SHIFT);
>> +	reg = (dp->video_info.dynamic_range << IN_D_RANGE_SHIFT) |
>> +		(dp->video_info.color_depth << IN_BPC_SHIFT) |
>> +		(dp->video_info.color_space << IN_COLOR_F_SHIFT);
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_2);
>>   
>>   	/* Set Input Color YCbCr Coefficients to ITU601 or ITU709 */
>>   	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
>>   	reg &= ~IN_YC_COEFFI_MASK;
>> -	if (dp->video_info->ycbcr_coeff)
>> +	if (dp->video_info.ycbcr_coeff)
>>   		reg |= IN_YC_COEFFI_ITU709;
>>   	else
>>   		reg |= IN_YC_COEFFI_ITU601;
>> @@ -1229,17 +1229,17 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp)
>>   
>>   	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   	reg &= ~INTERACE_SCAN_CFG;
>> -	reg |= (dp->video_info->interlaced << 2);
>> +	reg |= (dp->video_info.interlaced << 2);
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   
>>   	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   	reg &= ~VSYNC_POLARITY_CFG;
>> -	reg |= (dp->video_info->v_sync_polarity << 1);
>> +	reg |= (dp->video_info.v_sync_polarity << 1);
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   
>>   	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   	reg &= ~HSYNC_POLARITY_CFG;
>> -	reg |= (dp->video_info->h_sync_polarity << 0);
>> +	reg |= (dp->video_info.h_sync_polarity << 0);
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
>>   
>>   	reg = AUDIO_MODE_SPDIF_MODE | VIDEO_MODE_SLAVE_MODE;
>>
>
>
>


--------------060309070205000208040600
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Krzysztof,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 09/30/2015 01:32 PM, Krzysztof
      Kozlowski wrote:<br>
    </div>
    <blockquote cite=3D"mid:560B73D4.30109@samsung.com" type=3D"cite">
      <pre wrap=3D"">On 22.09.2015 16:37, Yakir Yang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Both hsync/vsync polarity and interlace mode can b=
e parsed from
drm display mode, and dynamic_range and ycbcr_coeff can be judge
by the video code.

But presumably Exynos still relies on the DT properties, so take
good use of mode_fixup() in to achieve the compatibility hacks.

Signed-off-by: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
Changes in v5:
- Switch video timing type to "u32", so driver could use "of_property_rea=
d_u32"
  to get the backword timing values.=20
</pre>
      </blockquote>
      <pre wrap=3D"">
Okay

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Krzysztof suggest me that driver could use
  the "of_property_read_bool" to get backword timing values, but that int=
erfacs
  would modify the original drm_display_mode timing directly (whether tho=
se
  properties exists or not).
</pre>
      </blockquote>
      <pre wrap=3D"">
Hmm, I don't understand. You have a:
	struct video_info {
		bool h_sync_polarity;
		bool v_sync_polarity;
		bool interlaced;
	};

so what is wrong with:
	dp_video_config-&gt;h_sync_polarity =3D
		of_property_read_bool(dp_node, "hsync-active-high");

Is it exactly the same binding as previously?
</pre>
    </blockquote>
    <br>
    Yes, it is the same binding as previously. But just a note that we
    already<br>
    mark those DT binding as deprecated.<br>
    <pre wrap=3D"">+-interlaced:            deprecated prop that can pars=
ed frm drm_display_mode.
+-vsync-active-high:     deprecated prop that can parsed frm drm_display_=
mode.
+-hsync-active-high:     deprecated prop that can parsed frm drm_display_=
mode.</pre>
    <br>
    For now those values should come from "struct drm_display_mode",<br>
    and we already parsed them out from "drm_display_mode" before<br>
    driver provide the backward compatibility. <br>
    <br>
    Let's used the "hsync-active-high" example:<br>
    =A0=A0=A0 As for now the code would like:<br>
    <font face=3D"Courier New, Courier, monospace">=A0=A0=A0 static void
      analogix_dp_bridge_mode_set(...) <br>
      =A0=A0=A0 {<br>
      =A0=A0=A0 =A0=A0=A0 // Parsed timing value from "drm_display_mode"<=
br>
      =A0=A0=A0 =A0=A0=A0 video-&gt;h_sync_polarity =3D !!(mode-&gt;flags=
 &amp;
      DRM_MODE_FLAG_NHSYNC);<br>
      <br>
      =A0=A0=A0 =A0=A0=A0 // Try to detect the deprecated property, provi=
ding<br>
      =A0=A0=A0 =A0=A0=A0 // the backward compatibility<br>
      =A0=A0=A0 =A0=A0=A0 of_property_read_u32(dp_node, "hsync-active-hig=
h",<br>
      =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=
 =A0=A0=A0=A0 &amp;video-&gt;h_sync_polarity);
      =A0=A0=A0 <br>
      <br>
      =A0=A0=A0 =A0=A0=A0 /*<br>
      =A0=A0=A0=A0 =A0=A0=A0 * In this case, if "hsync-active-high" prope=
rty haven't
      been<br>
      =A0=A0=A0 =A0=A0=A0=A0 * found, then the video timing "h_sync_polar=
ity" would=A0
      keep<br>
      =A0=A0=A0 =A0=A0=A0=A0 * no change, keeping the parsed value from
      "drm_display_mode"<br>
      =A0=A0=A0=A0 =A0=A0=A0 */=A0 =A0=A0=A0 <br>
      =A0=A0=A0 } =A0=A0 </font><br>
    <br>
    =A0=A0=A0 But if keep the "of_property_read_bool", then code would li=
ke:<br>
    <font face=3D"Courier New, Courier, monospace">=A0=A0=A0 static void
      analogix_dp_bridge_mode_set(...) <br>
      =A0=A0=A0 {<br>
      =A0=A0=A0 =A0=A0=A0 // Parsed timing value from "drm_display_mode"<=
br>
      =A0=A0=A0 =A0=A0=A0 video-&gt;h_sync_polarity =3D !!(mode-&gt;flags=
 &amp;
      DRM_MODE_FLAG_NHSYNC);<br>
      <br>
      =A0=A0=A0 =A0=A0=A0 // Try to detect the deprecated property, provi=
ding<br>
      =A0=A0=A0 =A0=A0=A0 // the backward compatibility<br>
      =A0=A0=A0 =A0=A0=A0 </font><font face=3D"Courier New, Courier, mono=
space"><font
        face=3D"Courier New, Courier, monospace">video-&gt;h_sync_polarit=
y
        =3D <br>
        =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 </font>of_prope=
rty_read_bool(dp_node,
      "hsync-active-high"); =A0=A0=A0 <br>
      <br>
    </font><font face=3D"Courier New, Courier, monospace"><font
        face=3D"Courier New, Courier, monospace">=A0=A0=A0 =A0=A0=A0 /*<b=
r>
        =A0=A0=A0=A0 =A0=A0=A0 * In this case, if "hsync-active-high" pro=
perty haven't
        been<br>
        =A0=A0=A0 =A0=A0=A0=A0 * found, then the video timing "h_sync_pol=
arity" would
        just<br>
        =A0=A0=A0 =A0=A0=A0=A0 * modify to "false". That is the place we =
don't want,
        cause<br>
        =A0=A0=A0 =A0=A0=A0=A0 * it would always modify the timing value =
parsed from<br>
        =A0=A0=A0 =A0=A0=A0=A0 * "drm_display_mode"<br>
        =A0=A0=A0=A0 =A0=A0=A0 */=A0=A0 </font><br>
      =A0=A0=A0 } =A0=A0 </font><br>
    <br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:560B73D4.30109@samsung.com" type=3D"cite">
      <pre wrap=3D"">
Best regards,
Krzysztof

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">
Changes in v4:
- Provide backword compatibility with samsung. (Krzysztof)

Changes in v3:
- Dynamic parse video timing info from struct drm_display_mode and
  struct drm_display_info. (Thierry)

Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 144 +++++++++++++--=
------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  14 +-
 3 files changed, 104 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1e3c8d3..6be139b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -890,8 +890,8 @@ static void analogix_dp_commit(struct analogix_dp_dev=
ice *dp)
 		return;
 	}
=20
-	ret =3D analogix_dp_set_link_train(dp, dp-&gt;video_info-&gt;lane_count=
,
-					 dp-&gt;video_info-&gt;link_rate);
+	ret =3D analogix_dp_set_link_train(dp, dp-&gt;video_info.lane_count,
+					 dp-&gt;video_info.link_rate);
 	if (ret) {
 		dev_err(dp-&gt;dev, "unable to do link train\n");
 		return;
@@ -1030,6 +1030,85 @@ static void analogix_dp_bridge_disable(struct drm_=
bridge *bridge)
 	dp-&gt;dpms_mode =3D DRM_MODE_DPMS_OFF;
 }
=20
+static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_display_mode *orig_mode,
+					struct drm_display_mode *mode)
+{
+	struct analogix_dp_device *dp =3D bridge-&gt;driver_private;
+	struct drm_display_info *display_info =3D &amp;dp-&gt;connector-&gt;dis=
play_info;
+	struct video_info *video =3D &amp;dp-&gt;video_info;
+	struct device_node *dp_node =3D dp-&gt;dev-&gt;of_node;
+	int vic;
+
+	/* Input video interlaces &amp; hsync pol &amp; vsync pol */
+	video-&gt;interlaced =3D !!(mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLAC=
E);
+	video-&gt;v_sync_polarity =3D !!(mode-&gt;flags &amp; DRM_MODE_FLAG_NVS=
YNC);
+	video-&gt;h_sync_polarity =3D !!(mode-&gt;flags &amp; DRM_MODE_FLAG_NHS=
YNC);
+
+	/* Input video dynamic_range &amp; colorimetry */
+	vic =3D drm_match_cea_mode(mode);
+	if ((vic =3D=3D 6) || (vic =3D=3D 7) || (vic =3D=3D 21) || (vic =3D=3D =
22) ||
+	    (vic =3D=3D 2) || (vic =3D=3D 3) || (vic =3D=3D 17) || (vic =3D=3D =
18)) {
+		video-&gt;dynamic_range =3D CEA;
+		video-&gt;ycbcr_coeff =3D COLOR_YCBCR601;
+	} else if (vic) {
+		video-&gt;dynamic_range =3D CEA;
+		video-&gt;ycbcr_coeff =3D COLOR_YCBCR709;
+	} else {
+		video-&gt;dynamic_range =3D VESA;
+		video-&gt;ycbcr_coeff =3D COLOR_YCBCR709;
+	}
+
+	/* Input vide bpc and color_formats */
+	switch (display_info-&gt;bpc) {
+	case 12:
+		video-&gt;color_depth =3D COLOR_12;
+		break;
+	case 10:
+		video-&gt;color_depth =3D COLOR_10;
+		break;
+	case 8:
+		video-&gt;color_depth =3D COLOR_8;
+		break;
+	case 6:
+		video-&gt;color_depth =3D COLOR_6;
+		break;
+	default:
+		video-&gt;color_depth =3D COLOR_8;
+		break;
+	}
+	if (display_info-&gt;color_formats &amp; DRM_COLOR_FORMAT_YCRCB444)
+		video-&gt;color_space =3D COLOR_YCBCR444;
+	else if (display_info-&gt;color_formats &amp; DRM_COLOR_FORMAT_YCRCB422=
)
+		video-&gt;color_space =3D COLOR_YCBCR422;
+	else if (display_info-&gt;color_formats &amp; DRM_COLOR_FORMAT_RGB444)
+		video-&gt;color_space =3D COLOR_RGB;
+	else
+		video-&gt;color_space =3D COLOR_RGB;
+
+	/*
+	 * NOTE: those property parsing code is used for providing backward
+	 * compatibility for samsung platform.
+	 * Due to we used the "of_property_read_u32" interfaces, when this
+	 * property isn't present, the "video_info" can keep the original
+	 * values and wouldn't be modified.
+	 */
+	of_property_read_u32(dp_node, "samsung,color-space",
+			     &amp;video-&gt;color_space);
+	of_property_read_u32(dp_node, "samsung,dynamic-range",
+			     &amp;video-&gt;dynamic_range);
+	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
+			     &amp;video-&gt;ycbcr_coeff);
+	of_property_read_u32(dp_node, "samsung,color-depth",
+			     &amp;video-&gt;color_depth);
+	of_property_read_u32(dp_node, "hsync-active-high",
+			     &amp;video-&gt;h_sync_polarity);
+	of_property_read_u32(dp_node, "vsync-active-high",
+			     &amp;video-&gt;v_sync_polarity);
+	of_property_read_u32(dp_node, "interlaced",
+			     &amp;video-&gt;interlaced);
+}
+
 static void analogix_dp_bridge_nop(struct drm_bridge *bridge)
 {
 	/* do nothing */
@@ -1040,6 +1119,7 @@ static const struct drm_bridge_funcs analogix_dp_br=
idge_funcs =3D {
 	.disable =3D analogix_dp_bridge_disable,
 	.pre_enable =3D analogix_dp_bridge_nop,
 	.post_disable =3D analogix_dp_bridge_nop,
+	.mode_set =3D analogix_dp_bridge_mode_set,
 	.attach =3D analogix_dp_bridge_attach,
 };
=20
@@ -1070,62 +1150,24 @@ static int analogix_dp_create_bridge(struct drm_d=
evice *drm_dev,
 	return 0;
 }
=20
-static struct video_info *analogix_dp_dt_parse_pdata(struct device *dev)
+static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 {
-	struct device_node *dp_node =3D dev-&gt;of_node;
-	struct video_info *dp_video_config;
-
-	dp_video_config =3D devm_kzalloc(dev, sizeof(*dp_video_config),
-				       GFP_KERNEL);
-	if (!dp_video_config)
-		return ERR_PTR(-ENOMEM);
-
-	dp_video_config-&gt;h_sync_polarity =3D
-		of_property_read_bool(dp_node, "hsync-active-high");
-
-	dp_video_config-&gt;v_sync_polarity =3D
-		of_property_read_bool(dp_node, "vsync-active-high");
-
-	dp_video_config-&gt;interlaced =3D
-		of_property_read_bool(dp_node, "interlaced");
-
-	if (of_property_read_u32(dp_node, "samsung,color-space",
-				 &amp;dp_video_config-&gt;color_space)) {
-		dev_err(dev, "failed to get color-space\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,dynamic-range",
-				 &amp;dp_video_config-&gt;dynamic_range)) {
-		dev_err(dev, "failed to get dynamic-range\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
-				 &amp;dp_video_config-&gt;ycbcr_coeff)) {
-		dev_err(dev, "failed to get ycbcr-coeff\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,color-depth",
-				 &amp;dp_video_config-&gt;color_depth)) {
-		dev_err(dev, "failed to get color-depth\n");
-		return ERR_PTR(-EINVAL);
-	}
+	struct device_node *dp_node =3D dp-&gt;dev-&gt;of_node;
+	struct video_info *video_info =3D &amp;dp-&gt;video_info
=20
 	if (of_property_read_u32(dp_node, "samsung,link-rate",
-				 &amp;dp_video_config-&gt;link_rate)) {
+				 &amp;video_info-&gt;link_rate)) {
 		dev_err(dev, "failed to get link-rate\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
=20
 	if (of_property_read_u32(dp_node, "samsung,lane-count",
-				 &amp;dp_video_config-&gt;lane_count)) {
+				 &amp;video_info-&gt;lane_count)) {
 		dev_err(dev, "failed to get lane-count\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
=20
-	return dp_video_config;
+	return 0;
 }
=20
 int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
@@ -1158,9 +1200,9 @@ int analogix_dp_bind(struct device *dev, struct drm=
_device *drm_dev,
 	 */
 	dp-&gt;plat_data =3D plat_data;
=20
-	dp-&gt;video_info =3D analogix_dp_dt_parse_pdata(&amp;pdev-&gt;dev);
-	if (IS_ERR(dp-&gt;video_info))
-		return PTR_ERR(dp-&gt;video_info);
+	ret =3D analogix_dp_dt_parse_pdata(dp);
+	if (ret)
+		return ret;
=20
 	dp-&gt;phy =3D devm_phy_get(dp-&gt;dev, "dp");
 	if (IS_ERR(dp-&gt;phy)) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.h
index 9a90a18..730486d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -120,9 +120,9 @@ enum dp_irq_type {
 struct video_info {
 	char *name;
=20
-	bool h_sync_polarity;
-	bool v_sync_polarity;
-	bool interlaced;
+	u32 h_sync_polarity;
+	u32 v_sync_polarity;
+	u32 interlaced;
=20
 	enum color_space color_space;
 	enum dynamic_range dynamic_range;
@@ -154,7 +154,7 @@ struct analogix_dp_device {
 	unsigned int		irq;
 	void __iomem		*reg_base;
=20
-	struct video_info	*video_info;
+	struct video_info	video_info;
 	struct link_train	link_train;
 	struct work_struct	hotplug_work;
 	struct phy		*phy;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
index a388c0a..861097a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -1084,15 +1084,15 @@ void analogix_dp_set_video_color_format(struct an=
alogix_dp_device *dp)
 	u32 reg;
=20
 	/* Configure the input color depth, color space, dynamic range */
-	reg =3D (dp-&gt;video_info-&gt;dynamic_range &lt;&lt; IN_D_RANGE_SHIFT)=
 |
-		(dp-&gt;video_info-&gt;color_depth &lt;&lt; IN_BPC_SHIFT) |
-		(dp-&gt;video_info-&gt;color_space &lt;&lt; IN_COLOR_F_SHIFT);
+	reg =3D (dp-&gt;video_info.dynamic_range &lt;&lt; IN_D_RANGE_SHIFT) |
+		(dp-&gt;video_info.color_depth &lt;&lt; IN_BPC_SHIFT) |
+		(dp-&gt;video_info.color_space &lt;&lt; IN_COLOR_F_SHIFT);
 	writel(reg, dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_2);
=20
 	/* Set Input Color YCbCr Coefficients to ITU601 or ITU709 */
 	reg =3D readl(dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_3);
 	reg &amp;=3D ~IN_YC_COEFFI_MASK;
-	if (dp-&gt;video_info-&gt;ycbcr_coeff)
+	if (dp-&gt;video_info.ycbcr_coeff)
 		reg |=3D IN_YC_COEFFI_ITU709;
 	else
 		reg |=3D IN_YC_COEFFI_ITU601;
@@ -1229,17 +1229,17 @@ void analogix_dp_config_video_slave_mode(struct a=
nalogix_dp_device *dp)
=20
 	reg =3D readl(dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
 	reg &amp;=3D ~INTERACE_SCAN_CFG;
-	reg |=3D (dp-&gt;video_info-&gt;interlaced &lt;&lt; 2);
+	reg |=3D (dp-&gt;video_info.interlaced &lt;&lt; 2);
 	writel(reg, dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
=20
 	reg =3D readl(dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
 	reg &amp;=3D ~VSYNC_POLARITY_CFG;
-	reg |=3D (dp-&gt;video_info-&gt;v_sync_polarity &lt;&lt; 1);
+	reg |=3D (dp-&gt;video_info.v_sync_polarity &lt;&lt; 1);
 	writel(reg, dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
=20
 	reg =3D readl(dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
 	reg &amp;=3D ~HSYNC_POLARITY_CFG;
-	reg |=3D (dp-&gt;video_info-&gt;h_sync_polarity &lt;&lt; 0);
+	reg |=3D (dp-&gt;video_info.h_sync_polarity &lt;&lt; 0);
 	writel(reg, dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_10);
=20
 	reg =3D AUDIO_MODE_SPDIF_MODE | VIDEO_MODE_SLAVE_MODE;

</pre>
      </blockquote>
      <pre wrap=3D"">



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060309070205000208040600--


--===============1682225768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1682225768==--
