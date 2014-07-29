From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Tue, 29 Jul 2014 12:42:38 +0900
Message-ID: <53D7182E.6040308@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
 <53D6715A.5040604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55258 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968AbaG2Dml (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 23:42:41 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9G00EBTFN3XKA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jul 2014 12:42:39 +0900 (KST)
In-reply-to: <53D6715A.5040604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, treding@nvidia.com

On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 00:50, Andrzej Hajda wrote:
> On 07/28/2014 04:00 AM, Inki Dae wrote:
>> This patch adds LPM transfer support for video or command data.
>>
>> With this patch, Exynos MIPI DSI controller can transfer command or
>> video data with HS or LP mode in accordance with mode_flags set
>> by LCD Panel driver.
>>
>> Changelog v2: Enable High Speed clock only in case of stand by reque=
st.
>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++=
--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_dsi.c
>> index 5e78d45..1bed105 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -493,8 +493,11 @@ static int exynos_dsi_enable_clock(struct exyno=
s_dsi *dsi)
>>  			| DSIM_ESC_PRESCALER(esc_div)
>>  			| DSIM_LANE_ESC_CLK_EN_CLK
>>  			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
>> -			| DSIM_BYTE_CLK_SRC(0)
>> -			| DSIM_TX_REQUEST_HSCLK;
>> +			| DSIM_BYTE_CLK_SRC(0);
>> +
>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM))
>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>> +
>>  	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>> =20
>>  	return 0;
>> @@ -553,6 +556,18 @@ static void exynos_dsi_set_phy_ctrl(struct exyn=
os_dsi *dsi)
>>  	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>>  }
>> =20
>> +static void exynos_dsi_enable_hs_clock(struct exynos_dsi *dsi,
>> +					bool enable)
>> +{
>> +	u32 reg =3D readl(dsi->reg_base + DSIM_CLKCTRL_REG);
>> +
>> +	reg &=3D ~DSIM_TX_REQUEST_HSCLK;
>> +	if (enable)
>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>> +
>> +	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>> +}
>> +
>=20
> I have tested DSIM_TX_REQUEST_HSCLK bit on trats device(video mode HS=
) -
> it works with and without the bit set.

If you can test thmorstat board, you will face with that its panel is
not worked.

> So I start to suspect this bit is not just for simply enable/disable =
HS
> clock as function name suggests, do you know what is its
> exact meaning? The specs are quite succinct on it.

HSCLK only has meaning when it is used with CmdLpdt and TxLpdt bits.

> On the other side I have found DSIM_TX_LPDT_LP and DSIM_CMD_LPDT_LP b=
its
> in DSIM_ESCMODE register
> which seems to be related to flags you have introduced:
> - DSIM_CMD_LPDT_LP - transmit commands in LP mode,
> - DSIM_TX_LPDT_LP - transmit data in LP mode.

As I mentioned already at other email thread, DSIM_TX_LPDT_LP specifies
that host can transmit command and also image data to Panel in Low Powe=
r
Mode. So these flags are specific to MIPI-DSI controller of Exynos.

> The former is already triggered by MIPI_DSI_MSG_USE_LPM flag. Why do =
not

This flag is set only when command msg transmission is requested by
Panel driver. So we would need separated flags, MIPI_DSI_MODE_CMD_LPM
and MIPI_DSI_MODE_VIDEO_LPM, to notify how host controller should
transmit command and also image.

Thanks,
Inki Dae

> you use the latter?
>=20
> Regards
> Andrzej
>=20
>>  static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>>  {
>>  	u32 reg;
>> @@ -705,6 +720,9 @@ static void exynos_dsi_set_display_enable(struct=
 exynos_dsi *dsi, bool enable)
>>  {
>>  	u32 reg;
>> =20
>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM) && enable)
>> +		exynos_dsi_enable_hs_clock(dsi, true);
>> +
>>  	reg =3D readl(dsi->reg_base + DSIM_MDRESOL_REG);
>>  	if (enable)
>>  		reg |=3D DSIM_MAIN_STAND_BY;
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
