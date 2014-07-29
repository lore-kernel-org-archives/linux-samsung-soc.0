From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Tue, 29 Jul 2014 21:08:12 +0900
Message-ID: <53D78EAC.30008@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
 <53D6715A.5040604@samsung.com> <53D7182E.6040308@samsung.com>
 <53D78803.2020002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8210 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823AbaG2MIO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 08:08:14 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9H00E6Y31OWM70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jul 2014 21:08:12 +0900 (KST)
In-reply-to: <53D78803.2020002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, treding@nvidia.com

On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 20:39, Andrzej Hajda wrote:
> On 07/29/2014 05:42 AM, Inki Dae wrote:
>> On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 00:50, Andrzej Hajda wrote:
>>> On 07/28/2014 04:00 AM, Inki Dae wrote:
>>>> This patch adds LPM transfer support for video or command data.
>>>>
>>>> With this patch, Exynos MIPI DSI controller can transfer command o=
r
>>>> video data with HS or LP mode in accordance with mode_flags set
>>>> by LCD Panel driver.
>>>>
>>>> Changelog v2: Enable High Speed clock only in case of stand by req=
uest.
>>>>
>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++=
++--
>>>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu=
/drm/exynos/exynos_drm_dsi.c
>>>> index 5e78d45..1bed105 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -493,8 +493,11 @@ static int exynos_dsi_enable_clock(struct exy=
nos_dsi *dsi)
>>>>  			| DSIM_ESC_PRESCALER(esc_div)
>>>>  			| DSIM_LANE_ESC_CLK_EN_CLK
>>>>  			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
>>>> -			| DSIM_BYTE_CLK_SRC(0)
>>>> -			| DSIM_TX_REQUEST_HSCLK;
>>>> +			| DSIM_BYTE_CLK_SRC(0);
>>>> +
>>>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM))
>>>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>>>> +
>>>>  	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>>>> =20
>>>>  	return 0;
>>>> @@ -553,6 +556,18 @@ static void exynos_dsi_set_phy_ctrl(struct ex=
ynos_dsi *dsi)
>>>>  	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>>>>  }
>>>> =20
>>>> +static void exynos_dsi_enable_hs_clock(struct exynos_dsi *dsi,
>>>> +					bool enable)
>>>> +{
>>>> +	u32 reg =3D readl(dsi->reg_base + DSIM_CLKCTRL_REG);
>>>> +
>>>> +	reg &=3D ~DSIM_TX_REQUEST_HSCLK;
>>>> +	if (enable)
>>>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>>>> +
>>>> +	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>>>> +}
>>>> +
>>> I have tested DSIM_TX_REQUEST_HSCLK bit on trats device(video mode =
HS) -
>>> it works with and without the bit set.
>> If you can test thmorstat board, you will face with that its panel i=
s
>> not worked.
>=20
> So it means this panel requires proper driving of this bit, but it do=
es
> not prove it is
> LPM related.
>=20
>>> So I start to suspect this bit is not just for simply enable/disabl=
e HS
>>> clock as function name suggests, do you know what is its
>>> exact meaning? The specs are quite succinct on it.
>> HSCLK only has meaning when it is used with CmdLpdt and TxLpdt bits.
>=20
> This sounds very strange. DSI specs and D-PHY specs says clearly
> that LPM transmissions are unrelated to HS clock [1][2]. Even timing
> diagrams
> in Exynos specs shows no dependency of LPM transmissions on HS clock.
> And the
> description of TxRequestHsClk bit says "HS clock request for HS trans=
fer
> at clock lane (Turn
> on HS clock)".

There are three System power states of D-PHY, Low-Power mode, High-Spee=
d
mode and Ultra-Low Power mode. High-Speed mode needs 80Mbps ~ 1Gbps per
Lane. Therefore, to use HS mode, HS clock should be enabled. On the
other hand, LP mode needs only 10MHz (max).

So do you really think LP mode will be worked well with HS clock
enabled? The purpose of LP mode is to reduce power consumption while
transmitting data. Can you reduce the power consumption in LP mode with
HS clock enabled?

Thanks,
Inki Dae

>=20
> Maybe different flag should be used to describe your panel requiremen=
ts
> regarding this bit.
>=20
> It would be good to see the real initialization sequence in form of
> pseudo-code or better in the driver.
>=20
>=20
> [1]: MIPI DSI: "Note that in Low Power signaling mode, LP clock is
> functionally embedded in the data signals. When LP
> data transmission ends, the clock effectively stops and subsequent LP
> clocks are not available to the
> peripheral. The peripheral shall not require additional bits, bytes, =
or
> packets from the host processor in
> order to complete processing or pipeline movement of received data in=
 LP
> mode transmissions. There are a
> variety of ways to meet this requirement. For example, the peripheral
> may generate its own clock or it may
> require the host processor to keep the HS serial clock running."
>=20
> [2]: MIPI D-PHY: "The data is self-clocked by the applied bit encodin=
g
> and does not rely on the Clock Lane".
>=20
> Regards
> Andrzej
>=20
>>
>>> On the other side I have found DSIM_TX_LPDT_LP and DSIM_CMD_LPDT_LP=
 bits
>>> in DSIM_ESCMODE register
>>> which seems to be related to flags you have introduced:
>>> - DSIM_CMD_LPDT_LP - transmit commands in LP mode,
>>> - DSIM_TX_LPDT_LP - transmit data in LP mode.
>> As I mentioned already at other email thread, DSIM_TX_LPDT_LP specif=
ies
>> that host can transmit command and also image data to Panel in Low P=
ower
>> Mode. So these flags are specific to MIPI-DSI controller of Exynos.
>>
>>> The former is already triggered by MIPI_DSI_MSG_USE_LPM flag. Why d=
o not
>> This flag is set only when command msg transmission is requested by
>> Panel driver. So we would need separated flags, MIPI_DSI_MODE_CMD_LP=
M
>> and MIPI_DSI_MODE_VIDEO_LPM, to notify how host controller should
>> transmit command and also image.
>>
>> Thanks,
>> Inki Dae
>>
>>> you use the latter?
>>>
>>> Regards
>>> Andrzej
>>>
>>>>  static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>>>>  {
>>>>  	u32 reg;
>>>> @@ -705,6 +720,9 @@ static void exynos_dsi_set_display_enable(stru=
ct exynos_dsi *dsi, bool enable)
>>>>  {
>>>>  	u32 reg;
>>>> =20
>>>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM) && enable)
>>>> +		exynos_dsi_enable_hs_clock(dsi, true);
>>>> +
>>>>  	reg =3D readl(dsi->reg_base + DSIM_MDRESOL_REG);
>>>>  	if (enable)
>>>>  		reg |=3D DSIM_MAIN_STAND_BY;
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
