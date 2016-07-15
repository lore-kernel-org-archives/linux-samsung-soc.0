From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 3/4] drm/bridge: analogix_dp: add the PSR function
 support
Date: Fri, 15 Jul 2016 18:47:24 +0800
Message-ID: <5788BF3C.2010104@rock-chips.com>
References: <1468469704-12440-1-git-send-email-ykk@rock-chips.com>
 <1468469753-12679-1-git-send-email-ykk@rock-chips.com>
 <20160714152324.GC13857@seanpaul0.roam.corp.google.com>
 <5788ADA9.1080400@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1823255738=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5788ADA9.1080400@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, daniel.vetter@ffwll.ch, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1823255738==
Content-Type: multipart/alternative;
 boundary="------------060700040801090306090400"

This is a multi-part message in MIME format.
--------------060700040801090306090400
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Sean,

On 07/15/2016 05:32 PM, Yakir Yang wrote:
> Sean,
>
> On 07/14/2016 11:23 PM, Sean Paul wrote:
>> On Thu, Jul 14, 2016 at 12:15:53PM +0800, Yakir Yang wrote:
>>> The full name of PSR is Panel Self Refresh, panel device could refresh
>>> itself with the hardware framebuffer in panel, this would make lots of
>>> sense to save the power consumption.
>>>
>>> This patch have exported two symbols for platform driver to implement
>>> the PSR function in hardware side:
>>> - analogix_dp_active_psr()
>>> - analogix_dp_inactive_psr()
>>>
>>> Signed-off-by: Yakir Yang<ykk@rock-chips.com>
>>> ---
>>> Changes in v4:
>>> - Downgrade the PSR version print message to debug level. (Sean)
>>> - Return 'void' instead of 'int' in analogix_dp_enable_sink_psr(). (Sean)
>>> - Delete the unused read dpcd operations in analogix_dp_enable_sink_psr(). (Sean)
>>> - Delete the arbitrary usleep_range in analogix_dp_enable_psr_crc. (Sean).
>>> - Clean up the hardcoded values in analogix_dp_send_psr_spd(). (Sean)
>>> - Rename "active/inactive" to "enable/disable". (Sean, Dominik)
>>> - Keep set the PSR_VID_CRC_FLUSH gate in analogix_dp_enable_psr_crc().
>>>
>>> Changes in v3:
>>> - split analogix_dp_enable_psr(), make it more clearly
>>>      analogix_dp_detect_sink_psr()
>>>      analogix_dp_enable_sink_psr()
>>> - remove some nosie register setting comments
>>>
>>> Changes in v2:
>>> - introduce in v2, splite the common Analogix DP changes out
>>>
>>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 60 ++++++++++++++++++++++
>>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++
>>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 49 ++++++++++++++++++
>>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  | 28 ++++++++++
>>>   include/drm/bridge/analogix_dp.h                   |  3 ++
>>>   5 files changed, 144 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index 32715da..1fec91a 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -97,6 +97,62 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
>>>   	return 0;
>>>   }
>>>   
>>> +int analogix_dp_enable_psr(struct device *dev)
>>> +{
>>> +	struct analogix_dp_device *dp = dev_get_drvdata(dev);
>>> +
>>> +	if (!dp->psr_support)
>>> +		return -EINVAL;
>>> +
>>> +	analogix_dp_send_psr_spd(dp, EDP_VSC_PSR_STATE_ACTIVE |
>>> +				 EDP_VSC_PSR_CRC_VALUES_VALID);
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
>>> +
>>> +int analogix_dp_disable_psr(struct device *dev)
>>> +{
>>> +	struct analogix_dp_device *dp = dev_get_drvdata(dev);
>>> +
>>> +	if (!dp->psr_support)
>>> +		return -EINVAL;
>>> +
>>> +	analogix_dp_send_psr_spd(dp, 0);
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
>>> +
>>> +static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
>>> +{
>>> +	unsigned char psr_version;
>>> +
>>> +	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_SUPPORT, &psr_version);
>>> +	dev_dbg(dp->dev, "Panel PSR version : %x\n", psr_version);
>>> +
>>> +	return (psr_version & DP_PSR_IS_SUPPORTED) ? true : false;
>>> +}
>>> +
>>> +static void analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
>>> +{
>>> +	unsigned char psr_en;
>>> +
>>> +	/* Disable psr function */
>>> +	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
>>> +	psr_en &= ~DP_PSR_ENABLE;
>>> +	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>>> +
>>> +	/* Main-Link transmitter remains active during PSR active states */
>>> +	psr_en = DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
>>> +	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>>> +
>>> +	/* Enable psr function */
>>> +	psr_en = DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
>>> +		 DP_PSR_CRC_VERIFICATION;
>>> +	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
>>> +
>>> +	analogix_dp_enable_psr_crc(dp);
>>> +}
>>> +
>>>   static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid_data)
>>>   {
>>>   	int i;
>>> @@ -921,6 +977,10 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>>>   
>>>   	/* Enable video */
>>>   	analogix_dp_start_video(dp);
>>> +
>>> +	dp->psr_support = analogix_dp_detect_sink_psr(dp);
>>> +	if (dp->psr_support)
>>> +		analogix_dp_enable_sink_psr(dp);
>>>   }
>>>   
>>>   int analogix_dp_get_modes(struct drm_connector *connector)
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>>> index b456380..6ca5dde 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>>> @@ -177,6 +177,7 @@ struct analogix_dp_device {
>>>   	int			hpd_gpio;
>>>   	bool                    force_hpd;
>>>   	unsigned char           edid[EDID_BLOCK_LENGTH * 2];
>>> +	bool			psr_support;
>>>   
>>>   	struct analogix_dp_plat_data *plat_data;
>>>   };
>>> @@ -278,4 +279,7 @@ int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp);
>>>   void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
>>>   void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
>>>   void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
>>> +void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
>>> +void analogix_dp_send_psr_spd(struct analogix_dp_device *dp, int db1);
>>> +
>>>   #endif /* _ANALOGIX_DP_CORE_H */
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>> index 48030f0..26446ae 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>> @@ -26,6 +26,9 @@
>>>   #define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
>>>   #define INT_STA_MASK		INT_HPD
>>>   
>>> +static u32 psr_spd_hbx[] = { 0x00, 0x07, 0x02, 0x08 };
>>> +static u32 psr_spd_pbx[] = { 0x00, 0x16, 0xCE, 0x5D };
>> These need to be const. Can you also please add a comment explaining where you
>> got the values from?
>
> A, after reading the eDP 1.4 spec, HBx values are come from spec, and 
> I also found there is no need to configure the PBx registers (cause 
> spec haven't mentioned it, and my panel still works without it).

Something wrong, I can remove the PBx setting, otherwise panel wouldn't 
enter into PSR active mode.

BR,
- Yakir

>
> *
> HB2: Revision Number*
> Support for 04h and 05h values added in eDP v1.4a.
> 01h = VSC SDP supports only 3D stereo.
> 02h = 3D stereo + PSR.
> 03h = 3D stereo + PSR2.
> 04h = 3D stereo + PSR/PSR2 + Y-coordinate.
> 05h = -3D stereo- + PSR/PSR2 + Y-coordinate + Pixel 
> Encoding/Colorimetry Format indication.
>
> *HB3: Number of Valid Data Bytes*
> 01h = VSC SDP supports only 3D stereo (HB2 = 01h).
> 08h = VSC SDP supporting 3D stereo + PSR (HB2 = 02h).
> 0Ch = VSC SDP supporting 3D stereo + PSR2 (HB2 = 03h), without 
> Y-coordinate of first scan
> line in the SU region.
> 0Eh = VSC SDP supporting 3D stereo + PSR2 (HB2 = 04h), with 
> Y-coordinate of first scan line
> in the SU region.
> 13h = VSC SDP supporting 3D stereo, + PSR2, + Pixel 
> Encoding/Colorimetry Format indication (HB2 = 05h).
>
>
>>> +
>>>   void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable)
>>>   {
>>>   	u32 reg;
>>> @@ -1322,3 +1325,49 @@ void analogix_dp_disable_scrambling(struct analogix_dp_device *dp)
>>>   	reg |= SCRAMBLING_DISABLE;
>>>   	writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
>>>   }
>>> +
>>> +void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>>> +{
>>> +	writel(PSR_VID_CRC_FLUSH | PSR_VID_CRC_ENABLE,
>>> +	       dp->reg_base + ANALOGIX_DP_CRC_CON);
>>> +}
>>> +
>
> And I found I need to remove the  PSR_VID_CRC_FLUSH enable flag, cause 
> it would caused PSR failed.
>
> Thanks,
> - Yakir
>
>>> +void analogix_dp_send_psr_spd(struct analogix_dp_device *dp, int db1)
>>> +{
>>> +	unsigned int val;
>>> +	unsigned int i;
>>> +
>>> +	/* don't send info frame */
>>> +	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +	val &= ~IF_EN;
>>> +	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +
>>> +	/* configure single frame update mode */
>>> +	writel(PSR_FRAME_UP_TYPE_BURST | PSR_CRC_SEL_HARDWARE,
>>> +	       dp->reg_base + ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL);
>>> +
>>> +	/* configure VSC HB0~HB3 and PB0~PB3 */
>>> +	for (i = 0; i < 4; i++)
>>> +		writel(psr_spd_hbx[i], dp->reg_base + ANALOGIX_DP_SPD_HB + i*4);
>>> +	for (i = 0; i < 4; i++)
>>> +		writel(psr_spd_pbx[i], dp->reg_base + ANALOGIX_DP_SPD_PB + i*4);
>>> +
>>> +	/* configure DB0 / DB1 values */
>>> +	writel(0x0, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB0);
>>> +	writel(db1, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB1);
>>> +
>>> +	/* set reuse spd inforframe */
>>> +	val = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
>>> +	val |= REUSE_SPD_EN;
>>> +	writel(val, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
>>> +
>>> +	/* mark info frame update */
>>> +	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +	val = (val | IF_UP) & ~IF_EN;
>>> +	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +
>>> +	/* send info frame */
>>> +	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +	val |= IF_EN;
>>> +	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
>>> +}
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>>> index cdcc6c5..fd232b2 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
>>> @@ -22,6 +22,8 @@
>>>   #define ANALOGIX_DP_VIDEO_CTL_8			0x3C
>>>   #define ANALOGIX_DP_VIDEO_CTL_10		0x44
>>>   
>>> +#define ANALOGIX_DP_SPDIF_AUDIO_CTL_0		0xD8
>>> +
>>>   #define ANALOGIX_DP_PLL_REG_1			0xfc
>>>   #define ANALOGIX_DP_PLL_REG_2			0x9e4
>>>   #define ANALOGIX_DP_PLL_REG_3			0x9e8
>>> @@ -30,6 +32,15 @@
>>>   
>>>   #define ANALOGIX_DP_PD				0x12c
>>>   
>>> +#define ANALOGIX_DP_IF_TYPE			0x244
>>> +#define ANALOGIX_DP_IF_PKT_DB1			0x254
>>> +#define ANALOGIX_DP_IF_PKT_DB2			0x258
>>> +#define ANALOGIX_DP_SPD_HB			0x2F8
>>> +#define ANALOGIX_DP_SPD_PB			0x308
>>> +#define ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL	0x318
>>> +#define ANALOGIX_DP_VSC_SHADOW_DB0		0x31C
>>> +#define ANALOGIX_DP_VSC_SHADOW_DB1		0x320
>>> +
>>>   #define ANALOGIX_DP_LANE_MAP			0x35C
>>>   
>>>   #define ANALOGIX_DP_ANALOG_CTL_1		0x370
>>> @@ -103,6 +114,8 @@
>>>   
>>>   #define ANALOGIX_DP_SOC_GENERAL_CTL		0x800
>>>   
>>> +#define ANALOGIX_DP_CRC_CON			0x890
>>> +
>>>   /* ANALOGIX_DP_TX_SW_RESET */
>>>   #define RESET_DP_TX				(0x1 << 0)
>>>   
>>> @@ -151,6 +164,7 @@
>>>   #define VID_CHK_UPDATE_TYPE_SHIFT		(4)
>>>   #define VID_CHK_UPDATE_TYPE_1			(0x1 << 4)
>>>   #define VID_CHK_UPDATE_TYPE_0			(0x0 << 4)
>>> +#define REUSE_SPD_EN				(0x1 << 3)
>>>   
>>>   /* ANALOGIX_DP_VIDEO_CTL_8 */
>>>   #define VID_HRES_TH(x)				(((x) & 0xf) << 4)
>>> @@ -167,6 +181,12 @@
>>>   #define REF_CLK_27M				(0x0 << 0)
>>>   #define REF_CLK_MASK				(0x1 << 0)
>>>   
>>> +/* ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL */
>>> +#define PSR_FRAME_UP_TYPE_BURST			(0x1 << 0)
>>> +#define PSR_FRAME_UP_TYPE_SINGLE		(0x0 << 0)
>>> +#define PSR_CRC_SEL_HARDWARE			(0x1 << 1)
>>> +#define PSR_CRC_SEL_MANUALLY			(0x0 << 1)
>>> +
>>>   /* ANALOGIX_DP_LANE_MAP */
>>>   #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
>>>   #define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)
>>> @@ -376,4 +396,12 @@
>>>   #define VIDEO_MODE_SLAVE_MODE			(0x1 << 0)
>>>   #define VIDEO_MODE_MASTER_MODE			(0x0 << 0)
>>>   
>>> +/* ANALOGIX_DP_PKT_SEND_CTL */
>>> +#define IF_UP					(0x1 << 4)
>>> +#define IF_EN					(0x1 << 0)
>>> +
>>> +/* ANALOGIX_DP_CRC_CON */
>>> +#define PSR_VID_CRC_FLUSH			(0x1 << 2)
>>> +#define PSR_VID_CRC_ENABLE			(0x1 << 0)
>>> +
>>>   #endif /* _ANALOGIX_DP_REG_H */
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>>> index 261b86d..9cd8838 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -38,6 +38,9 @@ struct analogix_dp_plat_data {
>>>   			 struct drm_connector *);
>>>   };
>>>   
>>> +int analogix_dp_enable_psr(struct device *dev);
>>> +int analogix_dp_disable_psr(struct device *dev);
>>> +
>>>   int analogix_dp_resume(struct device *dev);
>>>   int analogix_dp_suspend(struct device *dev);
>>>   
>>> -- 
>>> 1.9.1
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>


--------------060700040801090306090400
Content-Type: multipart/related;
 boundary="------------070107090105050509010702"


--------------070107090105050509010702
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Sean,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 07/15/2016 05:32 PM, Yakir Yang
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:5788ADA9.1080400@rock-chips.com" type=3D"cite=
">
      <meta content=3D"text/html; charset=3Dwindows-1252"
        http-equiv=3D"Content-Type">
      Sean,<br>
      <br>
      <div class=3D"moz-cite-prefix">On 07/14/2016 11:23 PM, Sean Paul
        wrote:<br>
      </div>
      <blockquote
        cite=3D"mid:20160714152324.GC13857@seanpaul0.roam.corp.google.com=
"
        type=3D"cite">
        <pre wrap=3D"">On Thu, Jul 14, 2016 at 12:15:53PM +0800, Yakir Ya=
ng wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">The full name of PSR is Panel Self Refresh, pane=
l device could refresh
itself with the hardware framebuffer in panel, this would make lots of
sense to save the power consumption.

This patch have exported two symbols for platform driver to implement
the PSR function in hardware side:
- analogix_dp_active_psr()
- analogix_dp_inactive_psr()

Signed-off-by: Yakir Yang <a moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt=
;</a>
---
Changes in v4:
- Downgrade the PSR version print message to debug level. (Sean)
- Return 'void' instead of 'int' in analogix_dp_enable_sink_psr(). (Sean)
- Delete the unused read dpcd operations in analogix_dp_enable_sink_psr()=
. (Sean)
- Delete the arbitrary usleep_range in analogix_dp_enable_psr_crc. (Sean)=
.
- Clean up the hardcoded values in analogix_dp_send_psr_spd(). (Sean)
- Rename "active/inactive" to "enable/disable". (Sean, Dominik)
- Keep set the PSR_VID_CRC_FLUSH gate in analogix_dp_enable_psr_crc().

Changes in v3:
- split analogix_dp_enable_psr(), make it more clearly
    analogix_dp_detect_sink_psr()
    analogix_dp_enable_sink_psr()
- remove some nosie register setting comments

Changes in v2:
- introduce in v2, splite the common Analogix DP changes out

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 60 ++++++++++++++++=
++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 49 ++++++++++++++++=
++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  | 28 ++++++++++
 include/drm/bridge/analogix_dp.h                   |  3 ++
 5 files changed, 144 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
index 32715da..1fec91a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -97,6 +97,62 @@ static int analogix_dp_detect_hpd(struct analogix_dp_d=
evice *dp)
 	return 0;
 }
=20
+int analogix_dp_enable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp =3D dev_get_drvdata(dev);
+
+	if (!dp-&gt;psr_support)
+		return -EINVAL;
+
+	analogix_dp_send_psr_spd(dp, EDP_VSC_PSR_STATE_ACTIVE |
+				 EDP_VSC_PSR_CRC_VALUES_VALID);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
+
+int analogix_dp_disable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp =3D dev_get_drvdata(dev);
+
+	if (!dp-&gt;psr_support)
+		return -EINVAL;
+
+	analogix_dp_send_psr_spd(dp, 0);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
+
+static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
+{
+	unsigned char psr_version;
+
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_SUPPORT, &amp;psr_version);
+	dev_dbg(dp-&gt;dev, "Panel PSR version : %x\n", psr_version);
+
+	return (psr_version &amp; DP_PSR_IS_SUPPORTED) ? true : false;
+}
+
+static void analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
+{
+	unsigned char psr_en;
+
+	/* Disable psr function */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &amp;psr_en);
+	psr_en &amp;=3D ~DP_PSR_ENABLE;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	/* Main-Link transmitter remains active during PSR active states */
+	psr_en =3D DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	/* Enable psr function */
+	psr_en =3D DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
+		 DP_PSR_CRC_VERIFICATION;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	analogix_dp_enable_psr_crc(dp);
+}
+
 static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid=
_data)
 {
 	int i;
@@ -921,6 +977,10 @@ static void analogix_dp_commit(struct analogix_dp_de=
vice *dp)
=20
 	/* Enable video */
 	analogix_dp_start_video(dp);
+
+	dp-&gt;psr_support =3D analogix_dp_detect_sink_psr(dp);
+	if (dp-&gt;psr_support)
+		analogix_dp_enable_sink_psr(dp);
 }
=20
 int analogix_dp_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.h
index b456380..6ca5dde 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -177,6 +177,7 @@ struct analogix_dp_device {
 	int			hpd_gpio;
 	bool                    force_hpd;
 	unsigned char           edid[EDID_BLOCK_LENGTH * 2];
+	bool			psr_support;
=20
 	struct analogix_dp_plat_data *plat_data;
 };
@@ -278,4 +279,7 @@ int analogix_dp_is_video_stream_on(struct analogix_dp=
_device *dp);
 void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
 void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
 void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
+void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
+void analogix_dp_send_psr_spd(struct analogix_dp_device *dp, int db1);
+
 #endif /* _ANALOGIX_DP_CORE_H */
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
index 48030f0..26446ae 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -26,6 +26,9 @@
 #define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
 #define INT_STA_MASK		INT_HPD
=20
+static u32 psr_spd_hbx[] =3D { 0x00, 0x07, 0x02, 0x08 };
+static u32 psr_spd_pbx[] =3D { 0x00, 0x16, 0xCE, 0x5D };
</pre>
        </blockquote>
        <pre wrap=3D"">These need to be const. Can you also please add a =
comment explaining where you
got the values from?
</pre>
      </blockquote>
      <br>
      A, after reading the eDP 1.4 spec, HBx values are come from spec,
      and I also found there is no need to configure the PBx registers
      (cause spec haven't mentioned it, and my panel still works without
      it).<br>
    </blockquote>
    <br>
    Something wrong, I can remove the PBx setting, otherwise panel
    wouldn't enter into PSR active mode.<br>
    <br>
    BR,<br>
    - Yakir <br>
    <br>
    <blockquote cite=3D"mid:5788ADA9.1080400@rock-chips.com" type=3D"cite=
">
      <img src=3D"cid:part2.00060604.06000206@rock-chips.com" alt=3D""
        height=3D"228" width=3D"652"><br>
      <b><br>
        HB2: Revision Number</b><br>
      Support for 04h and 05h values added in eDP v1.4a.<br>
      01h =3D VSC SDP supports only 3D stereo.<br>
      02h =3D 3D stereo + PSR.<br>
      03h =3D 3D stereo + PSR2.<br>
      04h =3D 3D stereo + PSR/PSR2 + Y-coordinate.<br>
      05h =3D -3D stereo- + PSR/PSR2 + Y-coordinate + Pixel
      Encoding/Colorimetry Format indication.<br>
      <br>
      <b>HB3: Number of Valid Data Bytes</b><br>
      01h =3D VSC SDP supports only 3D stereo (HB2 =3D 01h).<br>
      08h =3D VSC SDP supporting 3D stereo + PSR (HB2 =3D 02h).<br>
      0Ch =3D VSC SDP supporting 3D stereo + PSR2 (HB2 =3D 03h), without
      Y-coordinate of first scan<br>
      line in the SU region.<br>
      0Eh =3D VSC SDP supporting 3D stereo + PSR2 (HB2 =3D 04h), with
      Y-coordinate of first scan line<br>
      in the SU region.<br>
      13h =3D VSC SDP supporting 3D stereo, + PSR2, + Pixel
      Encoding/Colorimetry Format indication (HB2 =3D 05h).<br>
      <br>
      <br>
      <blockquote
        cite=3D"mid:20160714152324.GC13857@seanpaul0.roam.corp.google.com=
"
        type=3D"cite">
        <blockquote type=3D"cite">
          <pre wrap=3D"">+
 void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool e=
nable)
 {
 	u32 reg;
@@ -1322,3 +1325,49 @@ void analogix_dp_disable_scrambling(struct analogi=
x_dp_device *dp)
 	reg |=3D SCRAMBLING_DISABLE;
 	writel(reg, dp-&gt;reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
 }
+
+void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
+{
+	writel(PSR_VID_CRC_FLUSH | PSR_VID_CRC_ENABLE,
+	       dp-&gt;reg_base + ANALOGIX_DP_CRC_CON);
+}
+</pre>
        </blockquote>
      </blockquote>
      <br>
      And I found I need to remove the=A0 PSR_VID_CRC_FLUSH enable flag,
      cause it would caused PSR failed.<br>
      <br>
      Thanks,<br>
      - Yakir<br>
      <br>
      <blockquote
        cite=3D"mid:20160714152324.GC13857@seanpaul0.roam.corp.google.com=
"
        type=3D"cite">
        <blockquote type=3D"cite">
          <pre wrap=3D"">+void analogix_dp_send_psr_spd(struct analogix_d=
p_device *dp, int db1)
+{
+	unsigned int val;
+	unsigned int i;
+
+	/* don't send info frame */
+	val =3D readl(dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val &amp;=3D ~IF_EN;
+	writel(val, dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+
+	/* configure single frame update mode */
+	writel(PSR_FRAME_UP_TYPE_BURST | PSR_CRC_SEL_HARDWARE,
+	       dp-&gt;reg_base + ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL);
+
+	/* configure VSC HB0~HB3 and PB0~PB3 */
+	for (i =3D 0; i &lt; 4; i++)
+		writel(psr_spd_hbx[i], dp-&gt;reg_base + ANALOGIX_DP_SPD_HB + i*4);
+	for (i =3D 0; i &lt; 4; i++)
+		writel(psr_spd_pbx[i], dp-&gt;reg_base + ANALOGIX_DP_SPD_PB + i*4);
+
+	/* configure DB0 / DB1 values */
+	writel(0x0, dp-&gt;reg_base + ANALOGIX_DP_VSC_SHADOW_DB0);
+	writel(db1, dp-&gt;reg_base + ANALOGIX_DP_VSC_SHADOW_DB1);
+
+	/* set reuse spd inforframe */
+	val =3D readl(dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+	val |=3D REUSE_SPD_EN;
+	writel(val, dp-&gt;reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+
+	/* mark info frame update */
+	val =3D readl(dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val =3D (val | IF_UP) &amp; ~IF_EN;
+	writel(val, dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+
+	/* send info frame */
+	val =3D readl(dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val |=3D IF_EN;
+	writel(val, dp-&gt;reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.h
index cdcc6c5..fd232b2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -22,6 +22,8 @@
 #define ANALOGIX_DP_VIDEO_CTL_8			0x3C
 #define ANALOGIX_DP_VIDEO_CTL_10		0x44
=20
+#define ANALOGIX_DP_SPDIF_AUDIO_CTL_0		0xD8
+
 #define ANALOGIX_DP_PLL_REG_1			0xfc
 #define ANALOGIX_DP_PLL_REG_2			0x9e4
 #define ANALOGIX_DP_PLL_REG_3			0x9e8
@@ -30,6 +32,15 @@
=20
 #define ANALOGIX_DP_PD				0x12c
=20
+#define ANALOGIX_DP_IF_TYPE			0x244
+#define ANALOGIX_DP_IF_PKT_DB1			0x254
+#define ANALOGIX_DP_IF_PKT_DB2			0x258
+#define ANALOGIX_DP_SPD_HB			0x2F8
+#define ANALOGIX_DP_SPD_PB			0x308
+#define ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL	0x318
+#define ANALOGIX_DP_VSC_SHADOW_DB0		0x31C
+#define ANALOGIX_DP_VSC_SHADOW_DB1		0x320
+
 #define ANALOGIX_DP_LANE_MAP			0x35C
=20
 #define ANALOGIX_DP_ANALOG_CTL_1		0x370
@@ -103,6 +114,8 @@
=20
 #define ANALOGIX_DP_SOC_GENERAL_CTL		0x800
=20
+#define ANALOGIX_DP_CRC_CON			0x890
+
 /* ANALOGIX_DP_TX_SW_RESET */
 #define RESET_DP_TX				(0x1 &lt;&lt; 0)
=20
@@ -151,6 +164,7 @@
 #define VID_CHK_UPDATE_TYPE_SHIFT		(4)
 #define VID_CHK_UPDATE_TYPE_1			(0x1 &lt;&lt; 4)
 #define VID_CHK_UPDATE_TYPE_0			(0x0 &lt;&lt; 4)
+#define REUSE_SPD_EN				(0x1 &lt;&lt; 3)
=20
 /* ANALOGIX_DP_VIDEO_CTL_8 */
 #define VID_HRES_TH(x)				(((x) &amp; 0xf) &lt;&lt; 4)
@@ -167,6 +181,12 @@
 #define REF_CLK_27M				(0x0 &lt;&lt; 0)
 #define REF_CLK_MASK				(0x1 &lt;&lt; 0)
=20
+/* ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL */
+#define PSR_FRAME_UP_TYPE_BURST			(0x1 &lt;&lt; 0)
+#define PSR_FRAME_UP_TYPE_SINGLE		(0x0 &lt;&lt; 0)
+#define PSR_CRC_SEL_HARDWARE			(0x1 &lt;&lt; 1)
+#define PSR_CRC_SEL_MANUALLY			(0x0 &lt;&lt; 1)
+
 /* ANALOGIX_DP_LANE_MAP */
 #define LANE3_MAP_LOGIC_LANE_0			(0x0 &lt;&lt; 6)
 #define LANE3_MAP_LOGIC_LANE_1			(0x1 &lt;&lt; 6)
@@ -376,4 +396,12 @@
 #define VIDEO_MODE_SLAVE_MODE			(0x1 &lt;&lt; 0)
 #define VIDEO_MODE_MASTER_MODE			(0x0 &lt;&lt; 0)
=20
+/* ANALOGIX_DP_PKT_SEND_CTL */
+#define IF_UP					(0x1 &lt;&lt; 4)
+#define IF_EN					(0x1 &lt;&lt; 0)
+
+/* ANALOGIX_DP_CRC_CON */
+#define PSR_VID_CRC_FLUSH			(0x1 &lt;&lt; 2)
+#define PSR_VID_CRC_ENABLE			(0x1 &lt;&lt; 0)
+
 #endif /* _ANALOGIX_DP_REG_H */
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
index 261b86d..9cd8838 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -38,6 +38,9 @@ struct analogix_dp_plat_data {
 			 struct drm_connector *);
 };
=20
+int analogix_dp_enable_psr(struct device *dev);
+int analogix_dp_disable_psr(struct device *dev);
+
 int analogix_dp_resume(struct device *dev);
 int analogix_dp_suspend(struct device *dev);
=20
--=20
1.9.1


_______________________________________________
dri-devel mailing list
<a moz-do-not-send=3D"true" class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext" href=3D"https=
://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freede=
sktop.org/mailman/listinfo/dri-devel</a>
</pre>
        </blockquote>
        <pre wrap=3D"">

</pre>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------070107090105050509010702
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-ID: <part2.00060604.06000206@rock-chips.com>

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
wAGHuL/Z5MMP308dZrJg+vQf3XcUd4TyeFFo3bpdlWJYFsCLxPz588zaa6/vlgmMG/eey8ca
wW+//dpNDqy00qpVzq3UhHzGrroMxL+6BHW+CIiACNQMgcUXXyJVML+jSeTzzz92k+TIQQf1
TrnlM6l/8MFHOSWf39sxY9412267c6pIfn+9gk/iKqus5n6b8fLLJoX+/hdaX7a26JgIiIAI
iED5EZCSn+eYsca+R48j08465pjTTLduXVywvTvvvM6cddZl7gVgn3162AmB011wvRdfHGIn
BGa5iYF/A/XslrPm8B69rO+Pk19//Tku2U4w7JRak8/a/E6d/l0SQGaUfb5vvPGmdnLi/ycS
YguqoMR8xq663Rb/6hLU+SIgAiJQMwT4DWYJHG773qIerWnw4Luc99suu+ztFHMm9L00abJc
WvamTf//++zZs9KORT0FFl7439cu3gWySaG//4XWl60tOiYCIiACIlB+BKTkF2nM/Fp3ZvJZ
+41LPS8CO++8p3PRx2XfWwz22qu7daFfJFUzloA4CVvZn332v6Zly42qZAtbJMIHycv+7jNn
/urW5eM+yJIAXkCY6edFYL31NqhSXn1MiBu7TBwyjVU0v/hHiei7CIiACJQGAdbIb7PNTubZ
Zx937vP8NvrYOLSQ32oCrbJu//rrL7cT4z+meb19/fXnLqK+l6+++iz1/6qrrp7WSerKJXG/
K4X+/hdaX6426rgIiIAIiEB5Ecj961Ne/anx1rKdDdvg+A9B8e69998o+VROsB4UfC/duv0b
gA8rv1/LH3XV99F4mbknoI+P2tu27WYuGB9CMB0Ucz633jrQ7Lbb5ub004+yef+O7TOR93HL
R26//TFnsV9hhZXc94cfHua+33DD/bHnVmpivmMXxyHTWEXzin+UiL6LgAiIQOkQOP74M53H
HbFaevbc3bz11qvOhR4F/sgj90sF5uvV6xgXOI/Jcj8xfttt17glbwjb0d5ww79L9FZffS3n
IZevxP2uVOf3P1f9cfXlOkfHRUAEREAEyouALPl5jhdr67ffvnXsWczG+/X4PgNr81ZccSW7
n+6/6+nZL5cf77AQsA/B6t6u3Sp2f97drRXhLucJ0Lv3SW67nrvvvsGt52dt3+uvv+zc/rfc
cnsXVC9OCBI0fvyHbgu/li1bO1dDAvngphi1NMSdX4lp+Y5dHINMYxXNK/5RIvouAiIgAqVD
oE2b9i6+zgUXnOws+QccsH2VxqGwn3jiOal0trbt3r2LmTr1B+sJsIFp0WJNw3a0TA7gnUcE
fa9AVyksS0Km35VCf/+zVOUOZaov13k6LgIiIAIiUD4EZMmvxlih1KNkY7nfYoutrEV/iN1W
79/t9Hyx/ODvv///B9nzUfbD1e63X8+UK+D06VOtm/201GHW9/OSgQV/7NjRbt9dAuYdffSp
LuJ+JiFIEC8ebA/EywceB0wMFGJlyFRHOacnGbu4/mUbq3B+8Y+jpzQREAERKB0CRxxxonnw
wReq/C42arSkjZh/go2KP9KEl8R17rydefLJ18wmm2zudq9h4pzf2VatNnbR9rfccoeCOpfp
d6XQ3/9cjchUX67zdFwEREAERKB8CDSwil/26C+13JfVV1/DvP32BOceVykyYMAFbusdFMt3
350Ya0nHldy7/7E2MNp/XiQmTvzXPZAlAd6NPxOj3377xQbew3K/nFtrSNR/zm/WbEW3pKAU
ZdSokeaJJwZZVoNKsXmpNuUaKzLWBX92YLj66n7mvvuGljQ/NU4EREAESo0AMWyw0OP9xm9m
OG5OXFt9frzjVl65RVyWvNKy/a7k+/ufpOJs9SU5X3lEQAREoL4QQIfq0aOL+fDDsWXVZbnr
19BwEfV+woSv3Pq+22//j6uFvXUzucpj8ScgXibhxWP99TfMdLhKOt4Fm27aIZXOiwgfSfUJ
5BorahD/6nNWCSIgAiJQWwSWX34Fwyep5Js/V7nZflfy/f3PVRfHs9WX5HzlEQEREAERKG0C
UvJraHzYJ32PPTqmSudH+uyzr6ih2lSsCIiACIiACIiACIiACIiACIiACBgjJb+GrgJc4rt0
6eoC3rVosYZd39fHEOhHIgIiIAIiIAIiIAIiIAIiIAIiIAI1RUBKfg2RZV/6QYOeraHSVawI
iIAIiIAIiIAIiIAIiIAIiIAIVCVQOdHtqvZNKSIgAiIgAiIgAiIgAiIgAiIgAiJQrwhIya9X
w63OioAIiIAIiIAIiIAIiIAIiIAIVDIBKfmVPLrqmwiIgAiIgAiIgAiIgAiIgAiIQL0iICW/
Xg23OisCIiACIiACIiACIiACIiACIlDJBKTkV/Loqm8iIAIiIAIiIAIiIAIiIAIiIAL1ioCU
/Ho13OqsCIiACIiACIiACIiACIiACIhAJRNoEFgppQ42adLE9Op1rGnQoEEpNUttqQUCkydP
Mp999pHp0mWPWqit8qr46adp5t133zRdu+5feZ1Tj0RABERABERABERABESglgnMm/eHee65
x80PP0yu5ZqrV13D6p1e/LMXWWQR0759q7JT8ufOnWsmTpxYfCAFlrjmmmuaRo0aFXh23ZzW
qFFgpk//zo2/JH8CkyY1Mp9/Plb88kenM0RABERABERABERABESgCoHZs2ebV15ZrEp6qSeU
nJKPYtqzZ0+z0ELltZJg1KhR5v333zerr756nY/5pEmTrDW3q9lyyy3rvC35NGDkyJFmypQp
1pOjVz6nKe//CIwdO9aMHj1a/HRFiIAIiIAIiIAIiIAIiEARCMyYMcPceeedRSipdosoOSW/
drtf3NrWXXdds8EGGxS30AJKW3TRRQs4S6eIgAiIgAiIgAiIgAiIgAiIgAiUO4HyMpeXO221
XwREQAREQAREQAREQAREQAREQARqkICU/BqEq6JFQAREQAREQAREQAREQAREQAREoDYJSMmv
TdpFruvvv/8206ZNM3/99VeRS1Zx+RJgDAi8+Oeff+Z7aknkX7Bggfnqq6/Mr7/+6trD9zlz
5pRE25I04pNPPjGPP/54kqy1nqeU21YsGDyHbrvttmIVV/bllPvzoOwHQB0QAREQAREQgXpO
QGvyi3gBfPvttzb64ivmnXfeMQsvvLDZe++9TadOncxKK61kt134wbz++uvmhRdeMP/884/Z
ZpttzPbbb++UKdLffPNNs8QSSxii4i+11FLmt99+c8c6duxodtllF9OwYfpQffrpp+ahhx4y
m2yyifnwww/NnnvuaTbbbLMi9qZ+FfXII4+YPn36xHb6vffec+OSSQi6eOGFF5qddtrJEDzw
pJNOcoEPy0HYQfPiiy+2W4M8Z7baaivz/fffu2uvWbNm5phjjjHbbrttSXeDia7+/fubCy64
wOy6667mgAMOKJn21nXbuC4HDx5sHnvsMUOcjvXWW889U/h/v/32M8cee2yV50oh8J588kl3
7/zxxx+uzJqUjz76yD337rnnHsO1e9xxx5n999/fTUg9/PDDhvuYZ+/aa69tmjdv7tLnz59v
Nt98c3PUUUc5BjUt5fw8qGk2Kl8EREAEREAERKB2CDSwL0pB7VSVrJY11ljDTJgwoSyj67/9
9tvuJXKfffYxG2+8sbn88surdPrkk092Cv8TTzyROjZv3jynnKCkoyx6+eCDD8wVV1xh1l9/
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
4JkEpfHtt98277zzjmG8whKu6+uvv3ZLa+bOnetiEfDhfy8sj4mmZaqT9Oq0jXqZXIITdcLB
S7b+ZGtP9JiflPr222/zKjvX2PrCaLPnCLuoxF1D2frtz4cLExW5xHrhuCxJx5NrgSVVCNcT
10ymmBRxbc/VnnyPJ3m2JH1uhev+/fffzRtvvJHx3s23ncovAiIgAiIgAiJQmgSk5JfmuLhW
eQUMZR7LvaT2CIwdO9YstthiKQs9NWP1xkp/8803u4agGKNEWFfYtIatuOKKhgmBqOJce61P
XtMxxxzjJiM6dOhgrrzyypQijHfClltumVYQSj3eIyjoKPF2aY1b2+3FuoYb6wLuYhOgPLIW
uF+/fqnjKBi9evUy9957r/nhhx+cImuXqBjOQ/CkaNmypWGCgcmUrbfe2uy3337OKoti5YX7
grgV1157raHMY4891nz88cep4/4f6iHGBf2z7txm1VVXTZXDxAZ1cV8xrhtvvLGzbjO2dqmC
G9OXX345Vebo0aPdWvD77ruvSj3hhGK0jfb88ssvTslkLbV1T3dVZOtP1kbFHPz0009dauvW
rROVnWtso1XcddddzqvFLg0wBB70ku0aytTvaNn5fIdZrvG89dZbzfrrr28OPvhgd+1yXePd
suaaa5r//ve/idoe16bLL7/c7LLLLlk/J5xwQtypBT9b4p5bvoK33nrLPb/22Wcfs84665jP
P/88tm4lioAIiIAIiIAIVACBUltgUO5r8uFpXe8DqzQEd955Z5WPfbmKXR/JOWuttVZg3cWD
q6++OrBBrAJrbQvsy2fwyiuvxA7TZ599pjX5sWSqn3juuecGNiBdWkHWshocffTRgXWTdenE
QrCPgIB17WEZNGiQS3/ssceq35A8SihkTT7FDxw4MLDu+q7N3H/WjTu2Vqt8B1bpSR2zSxzc
tW4VRpdGPIABAwakjsOKMq1l1KUdeeSRgVVqUsetIuviF1j36lRaz549A+teHMCQ9ePWcu3y
2GUrqTxnnHFGYAMcpr4T04I4F+GYFpxLOTY4pctndwtweYi14OWII44I7LIat56b9c9WgXeH
+vbt63jMmDEjlZexTxLvoFhtow12sihVf5L+pDJH/mEMPBs4cF2Txjp6JEnZucYWrn5N/s8/
/+xiANhJripNynUNRftdpYBIQtya/Og5ScaTte12UsI9e4lj8Pzzz7t4KHYiyF07SK62R+ut
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
W6NGjQz7VjP+kvwJLLnkkqZhw4bilz86nSECIiACIiACIiACIiACVQhgeEY/LTcpOSUfReX4
448vS5jlNvil1t6RI0ea3377zZxwwgml1rSyaM/YsWPN+PHjxa8sRkuNFAEREAEREAEREAER
KHUCM2bMMI888kipN7NK+8pvWqJKF5QgAiIgAiIgAiIgAiIgAiIgAiIgAiIAASn5ug5EQARE
QAREQAREQAREQAREQAREoEIISMmvkIFUN0RABERABERABERABERABERABERASn4ZXwOsXyei
uqS4BObOnWsmTJiQV6F//fWXmThxovnzzz/zOq++ZobTDTfcYKZNm5YIQb75ExVaZpm++uor
M3jw4LJqddL7ItuzjGfcbbfdVlb9VmNFQAREQAREQAREoC4JSMkvIv1Ro0aZ3r17m+WXX940
b97cbQXItnDIF198YS666CKzwgoruOMnnniiee+99wznEGiQtDXWWMPsvffe5rDDDjO77rqr
2WGHHcxNN91URXEkAETXrl1NkyZNzCqrrGLWWWcd88YbbxSxJ/W7qCOOOML06NEjMQTGcKed
djKPPvqoG5fnnnsu8bl1mfGtt94yffr0cdfeqquuanbeeWez++67m80339ylf//99zXWPIIE
nnzyyY5ZEsk3f5Iy4/Jwb914441mww03dFziAq0wAXTttdealVZayRx++OHm1VdfjSuqqGnX
XHONad26tbnllluKWm5NFpbkvsj1LGNSo23btub888+vyaaqbBEQAREQAREQARGoLAJBicnq
q68e/P333yXWquTNmT9/fmCvkGD77bePPWmTTTYJ7FZxacfmzJnjzrEKVlr6Cy+8ECy++OLB
tttum8akW7duwcUXXxy8+eabgX3pD5ZZZplg6aWXDr799tvYOsslccSIEcEhhxxSp8198MEH
HfMtttgiUTusddWx/+STT1x+a3UM7BaAwbhx4xKdX8xMY8aMCfbYY4+8irR7f1a59j744AN3
TdmJqmDq1Kl5lZdP5nfeeSfgfkkq+eZPWm5cPuuVEdidPoIlllgigGucdOzYMbATIXGHaiRt
xx13DDp37lwjZRe70KT3RZJnmZ1wCpZbbrliN1HliYAIiIAIiIAIiEBOAj/99FNgDQ4585Va
Blnyizxns+iii5qFF17YWOUgtmT2go8eY9tAzokK1nws/q+99poZOnSoO2wvNLP11lubCy+8
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
3QcXZHs7AgomdSf3CjPtZ2tBbxFn4iBcBtZrJhA22GAD19XmzZtn7XKmcuNOyrf9Rx11VGr9
ffv27U3Lli3jis2Ylk/bfCGPPfaY+xcOfrIjYwU6IAIiIAIiIAIiIAIiIAJ5EJCSnwcsZa1s
AliTCYaWScljrX23bt2Mj9qOG/oll1ziXLy9PPjggy7Cfps2bcoCFlu4eQnvV9+zZ8/UWvzP
PvvMnHbaaWn9CYIgtb89QQa9Vbphw4bm999/NwQkZOkDkfUR2B177LFp2w9iwcfK37Vr19Ty
iHzLLbT94c7gdXHwwQe7pL59+6b1M/wl37bhGeAlvO0iyxUIVIjL/6233mrYRlAiAiIgAiIg
AiIgAiIgAsUi0LBYBakcESh3ArjqZ7PA42KOBRZ3cyzQKKkE2GOf806dOpllllnGufr369ev
LFC89dZb5r777ku1lUmOAQMGuP3hCS6IAkoeXO5vu+02p8gTkA+lH8u8V2JR1FnHz9r2adOm
OeWeoHph1/211lrL8dp+++2dSzyR9u+//34X3Z5ghsi7776bV7mFtt8vRQgPEgH4WJbADgpx
km/b2EowzHbMmDEu6CATIDNnznS7NOABEBfEMa5+pYmACIiACIiACIiACIhAUgINrHUqSJq5
NvLhajthwgSz0EJyMqgN3qVUBxZOlOa6ikz/8ccfGyLoZ9oujlsFRRArvb8+UXTZcg6LNfu/
1+V1O3bsWDfBMHTo0FIaVme9nzFjhnPJx/LOJADKLsENc7np12ZHiM7P+EtEQAREQAREQARE
QAREAAK8w2K44j27nESW/HIaLbW1RgmwzVs2Yf00e6uHBff+XOdlK7M+HMOF3yvzRK4nMGEp
ihT8UhwVtUkEREAEREAEREAERCBfAjKX50tM+UVABERABERABERABERABERABESgRAlIyS/R
gVGzREAEREAEREAEREAEREAEREAERCBfAlLy8yWm/CIgAiIgAiIgAiIgAiIgAiIgAiJQogSk
5JfowKhZIiACIiACIiACIiACIiACIiACIpAvASn5+RJTfhEQAREQAREQAREQAREQAREQAREo
UQJS8kt0YNQsERABERABERABERABERABERABEciXgJT8fIkpvwiIgAiIgAiIgAiIgAiIgAiI
gAiUKAEp+SU6MGqWCIiACIiACIiACIiACIiACIiACORLQEp+vsSUXwREQAREQAREQAREQARE
QAREQARKlICU/BIdGDVLBERABERABERABERABERABERABPIlICU/X2LKLwIiIAIiIAIiIAIi
IAIiIAIiIAIlSkBKfokOjJolAiIgAiIgAiIgAiIgAiIgAiIgAvkSkJKfLzHlFwEREAEREAER
EAER+L/2zgTujvHe44/WFSQkkX2TXSKuEiJUGlVKiihSutBerlC5sVwStZUbtQu3aLRF7aKK
fCS1tKgbscRSmoQIjZJIs8i+NWhp77nP9+l9zmfOvDPnzNneM+c9v//ncz7ve2aebb4zZ2b+
z395REAEREAERCClBKTkp/TEaFgiIAIiIAIiIAIiIAIiIAIiIAIiUCwBKfnFElN5ERABERAB
ERABERABERABERABEUgpASn5KT0xGpYINBKBt956yzz88MNlHfLf//53M336dPP2229n24na
lq8Tyi9evNh8+umn+YppnwiIgAiIgAiIgAiIgAikloCU/NSeGg1MBKpLYPbs2eaMM84wHTt2
ND179jSjRo0yRxxxhBk+fLjbvnTp0uoOwLb+j3/8w1x11VVmjz32MPfcc0/J/S1cuNAcc8wx
ZsyYMVklP2pbvg5efPFFc+ihh5oHH3zQjB492jz++OP5imufCIiACIiACIiACIiACKSSgJT8
VJ4WDUoEqk9gxIgRZvLkyWbdunVmzz33NE899ZR54oknzC233GKmTp3qlP1Vq1ZVdSCf//zn
zUUXXWT22muvsvoZNGiQueaaa3LaiNoW18l7773nJjimTJliLrjgAjfhcPzxx5s33ngjroq2
i4AIiIAIiIAIiIAIiEAqCUjJT+Vp0aBEoHkIbL/99gZFOygo3OPHjzcrV640t912W7MMpHXr
1mX3E9VG1Laoji655BIzZMgQs9tuu7nd3bp1MyNHjjQXXnhhVHFtEwEREAEREAEREAEREIHU
EpCSn9pTo4GJQO0IdO7c2XW+efPmyEEsWLDAPPvss2bNmjWR+zdu3Gheeukl88orr5i//e1v
kWUWLVpkZs6cWZS3QJJ2IzvLs5HxPfroo2bvvffOKcV3vBs2bNiQ3b5kyRJDmAPeD8uWLcvT
qnaJgAiIgAiIgAiIgAiIQG0ISMmvDXf1KgKpJUCc/COPPGK22morc/TRR+eME6UeN/ZZs2aZ
5557zvTu3dvcfPPNOWXuuusuVw/l+L777nPx/kwKeCG53UknnWRuuOEG89FHH5lx48aZ+fPn
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
ioAIiIAIiIAIiIAIiIAIiEDLJoAy37dvX2e9D7vvE7NPPD+KPkvuSZoSkJLflIm2iIAIiIAI
iIAIiIAIiIAIiIAI1JAAijzLLpNwD0WfbPxeWN0JZZ8lk8nAL8klICVfV4QIiIAIiIAIiIAI
iIAIiIAIiEAqCZB9n6WLWbI4qOiTsI8Pir5i9HNPnZT8VF7KGpQIiIAIiIAIiIAIiIAIiIAI
iAAEWDqvZ8+eTRR9v9weWfeDGfkbnZqU/Ea/AnT8IiACIiACIiACIiACIiACIlBhAijdlVS8
W7dubXr16mU++uijnHa32WYbl4Rv3bp1FT6C+m1u6/odukYuAiIgAiIgAiIgAiIgAiIgAiKQ
FgK4zbOe/ebNm83f//53lyCP+Pm2bdua9u3bO/f6cmT77bd3rvu46Ldp08aQjR9h+b2NGzca
9vNpdNnKzq5k0gSBDIosmyBpPAJkx2SZDJJrSIonQNIRbqjELUlEQAREQAREQAREQAREoDkJ
EC//j3/8wyneXvn2/XuVEyU/vK+UMfq+mEQIS7kTCcH26Iekf5s2bQp3k+rvqbPkd+3a1Sxa
tMjN+kgai8DMmTPNPffc4z6S4gnMnTvXTJo0yTz66KPFV1YNERABERABERABERABESiBAAr8
n//8Z7ecHdb1OD2OcrjaY9Hv0KFD2cr+ypUrXXtBy70fQ6dOnUo4kqZV1q5daw455JCmO1K+
RZp0yk+QhicCIiACIiACIiACIiACIiACaSWwZMkSt4wdyfHiFHzGjgWfSQCs4mvWrCk7Xh/v
bxLvBTPr4xWO2z7KfiOLlPxGPvs6dhEQAREQAREQAREQAREQAREokQDWdJLeobwnFSzvuMCX
q+gzoUB8Pv0Hl9Zr1aqVa7uRRUp+I599HbsIiIAIiIAIiIAIiIAIiIAIlECAdevJaL/DDjtk
a+OST8I9LPtY2D/55JNIq7pX9Mtd+g5LfpcuXZzbvhe2ofjTd6OKlPw6P/NkryS7pKSyBEgA
SG6IpMLNbPHixe6GJimPwJ/+9Cfzy1/+srxGqlib3BE33HCD+e1vf1vFXpo2zTU2ffp08/bb
b2d3cr395Cc/MatWrWpaIbDlrbfeMg8//HDeMtqZXgJJ7i9cC9yDeKkJy4oVK8wtt9wS3qzv
IiACIiACIlAWAaz4KPg+kR5J9/jgtt+9e3e3rj0fMutjued5FhQUfSYKylX06Y+2gs9A3PYb
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
Lbly880355S56667XD2U4/vuu8/F+zMp4IWH20knnWRuuOEGt7TLuHHjzPz58wuOv1C7BRuI
KYBLPjFtzIgHpUuXLu4h6V32r732WhfGQAbb0047zXGQiIAIiIAIiIAIiEAcAbLXB5VwyqGY
Y7SohHTq1KmJZ0BwebxK9KE26pOAlPz6PG8atQhUlACzvmSlx6JN8jli1FFoidsPCsr5WWed
ZU4//XRz6aWXOgX97LPPNu+8844rRmzYmWeeaY499lgX437TTTc5BfqBBx7INkMMPpZw4t+P
PPJI108h17Uk7ZYKZPXq1a5qWMlnfVmEiQ34XHHFFeb88883X/va19zx9OnTp9QuVU8EREAE
REAERKABCKDkx7ns835UrpCpP5xoj++y5JdLtv7rb13/h6AjEAERKJcACfaeeeYZc/XVV7um
3n33XeOVXN82rupPP/20GTp0aDbzPJMBCJnpd911V2f9J1u+9wCgXeL+vdv/2rVrneIfzKSP
Kxtt5pNC7earW2iffzgyzqD4mXfi53C142F88sknmxtvvNEtP4PCLxEBERABERABERCBfARY
xQiDQps2bbLFsOavX7/erVMfzo2Ur63wPmLz+QRFCn6YUmN+l5LfmOddRy0COQSwSmOhJ0v9
YYcdZs4991xz66235pTB5Z4HyWWXXdbkgRIsSDvE45Ptvm/fvs4tzT9wnn/+ebcGPS78QUmy
Tmu+dss5nT169HDVw65zuOUjuMIR93b55Zebiy++2MyYMcN5KygpXznUVVcEREAEREAEGoMA
RhOMHhgPvELP+xTfMX7wnhFW1JOSoY2ouuVMHCTtW+XSTUDu+uk+PxqdCDQrgVGjRpkJEya4
rPrTp0/P6RtFHQXdW++DO4PxZuedd56Lt7/uuuvMxIkT3Sy1F2LwEdz1i5V87RbbVrD8gAED
3Bi9277f9+GHH5ptttnGLS+IEGbw6quvOq8DvBUIZSgUZlDOuFRXBERABERABESg/gmghHfv
3t3lIQoKijjvVbwThV3ukx417yFRSn4S40nSPlSuPglIya/P86ZRi0DVCKDAsozeKaecYpYu
XZrtB3d85Morr8zpe/HixS6WH3nhhReccj9p0iRDnFhYBg4c6DaRtC8s+R5whdoNt1XMd6z0
Rx11lPM+CArJAJn0IJxg06ZNBi+EffbZx42dSYw333zTPPnkk8V0pbIiIAIiIAIiIAINSABX
fd4nwsYBlHG2YdEv1s2eRMZ4HRJW6IVJA/oizFHS2ASk5Df2+dfRNzgBHgZY4YOzy1ivSSzH
8i5jxozJxtP379/fKb333nuvGTt2rIvDx3V9/PjxLlkf4mPvvcKMNwAxZzyEsIIPHz7cLVVH
KABL0SG4ya9YscKsXLky9gFXqF3a8UvU8NDzErUtuzPwD14Cc+bMcWNAcKtjYoHQBIR2Jk+e
nK1BskGs/926dXPbHnvsMXPqqac2eXhnK+gfERABERABERCBhibAOwPvXcEl9QDiFX0S/bI/
iTAhwPsVynxQoSd/UPv27ZM0oTItnICU/BZ+gnV4IhBHACWbOHfk5Zdfdgnl3n//ffd9l112
cdnvX3/9dWfVJ74eazZL4h1wwAHmzjvvNCNHjjTnnHOOc11ndho5+OCDzbBhw1zWfZ+ID8X+
oYcecm7+uJSRTZ84+AMPPNAp/YyBeDUebljIoyz6hdrFtf766693Y7j99tvNa6+9ZqK2uQIR
wsQD9U488UT3l1UEGKd31afKzJkzzXHHHefCGMhZgKK/7777utamTZtm7rjjDrN8+fKI1rVJ
BERABERABESg0Qngnk8OJAwrQYMEXFD02ca7EIaNfFZ9Jgmw/FM+6KqPRwDvY1GelI3OvhGP
fyv7Qp1J04Fz8S9atCgyviRN49RYKk8AJYqs68HM65XvpeW2OHfuXOcm713nq3mkCxcudJb+
IUOGuAdTUHgw4eZPcj0eaMwqUzY4s4z3wLx589zDaPDgwW4JPiYW8iWKSdJuuceMx8EHH3zg
xhLMJUDfHAMTHYQncJ/yVnz63LJliztmH9JQ7jhUXwREQAREQAREoGUS4L2IdwkMHEFXe47W
q2VY51HWeRfx71ko9SjyfCgXtOB7133eX8LvZS2TYvMdFRMqhxxyiOE9u55E2fXr6WxprCKQ
EgJk4Y8TZpV79+6d3c3SdOHl6VDmsZ57SaIcJ2k3bkxJt/PA3X333ZsUp28etny6du3aZD/x
b0mOoUlFbRABERABERABEWgoArwT9evXzxkV+J8wSS9ecUeJ/+STT3LCANnnLfxBBZ9tWP8x
QEjBb6hLKe/Byl0/Lx7tFAEREAEREAEREAEREAEREIHKEcBoQK4jvARx3w87VgeVffbxiXLh
x4JPbiPCIH3oZOVGqZbqmYCU/Ho+exq7CIiACIiACIiACIiACIhA3RHAgs8yvij8JNELJ+Qr
dEC47RNmiAW/Xbt2hYprf4MRkJLfYCdchysCIiACIiACIiACIiACIlB7AoQDYoX3Vn2UfR9z
HzU6rPnspxzC0sSy4EeR0jbF5OsaEAEREAEREAEREAEREAEREIEaEcCaj8JOHD6J3nDBR6EP
xtiTtBghD1Dfvn2b5Duq0dDVbUoJSMlP6YnRsERABERABERABERABERABJqPgI97Dy5N13y9
G+e636tXL9cl8fYo/T5eH/f+bbfdtjmHo77qmICU/Do+eRq6CIiACIiACIiACIiACIhAaQR8
FnuS37G0nVfy2Y7FnOV/w8vcldZT8bWw4rPqj0QESiEgJb8UaqojAiIgAiIgAiIgAiIgAiJQ
twSIbd+wYYNLeEc2++BSdij5KP3r1q1zin6XLl1y1qWv24PWwBuGgJT8hjnVOlAREAEREAER
EAEREAEREIFNmza5zPRIlKUepb9Vq1buQzkU/p133lnr0OvSqRsCyq5fN6dKAxUBERABERAB
ERABERABESiVABZ6MtOjuH/+8593n0KChZ/17KPWqS9UN24/4yDBno+3jyun7SJQKoGt7MWV
KbVyNeqNGTPGDBo0qBpNq82UE1iyZImZP3++GT16dMpHms7hrVq1yrzwwgvm2GOPTecANSoR
EAEREAEREAERqCEBXPS9e354GD57PUn3sOQjbCMBHuvQJ5kQCLcZ9x1PAsaBp4Di7uMopWM7
53/FihXm/vvvT8eAEo4idUr+jBkzzJYtWxIOX8VaEgFueGvWrDEDBgxoSYfVbMdC0pilS5ea
wYMHN1uf6kgEREAEREAEREAE6oEALvdY5L0C78f86aefOkWezPW47vPdW+1RxDt37lwxN31v
wad9FHzGQ5/E/YfHVQ9MG2WMO+20kzn88MPr6nBTp+TXFT0NVgREQAREQAREQAREQAREINUE
sODjph9UpFG4N2/e7Nab79GjR46lnqXrKN+pU6echHzlHCT94bXKhELr1q2zTWHcZOk8xiBF
vxzCqhskICVf14MIiIAIiIAIiIAIiIAIiECLJIByvXr1aud6H1SiN27caLDQkjm/2sIYcPlm
8iCo4Pt+UfRx21cW/2qficZpX9n1G+dc60hFQAREQAREQAREQAREoKEIoFjjHh9U8FGqseCX
quBjjfcu/UkS+NE3/VEvSrDkEy4gS34UHW0rhYCU/FKoqY4IiIAIiIAIiIAIiIAIiEDqCRCL
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
AAAAAElFTkSuQmCC
--------------070107090105050509010702--

--------------060700040801090306090400--


--===============1823255738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1823255738==--
