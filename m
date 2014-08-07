From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Thu, 07 Aug 2014 16:09:29 +0900
Message-ID: <53E32629.5030500@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
 <53D6715A.5040604@samsung.com> <53D7182E.6040308@samsung.com>
 <53D78803.2020002@samsung.com> <53D78EAC.30008@samsung.com>
 <53D79EAD.7020207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20831 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753502AbaHGHJd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 03:09:33 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9X0017GD7ULC60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Aug 2014 16:09:30 +0900 (KST)
In-reply-to: <53D79EAD.7020207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, treding@nvidia.com

On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 22:16, Andrzej Hajda wrote:
> On 07/29/2014 02:08 PM, Inki Dae wrote:
>> On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 20:39, Andrzej Hajda wrote:
>>> On 07/29/2014 05:42 AM, Inki Dae wrote:
>>>> On 2014=EB=85=84 07=EC=9B=94 29=EC=9D=BC 00:50, Andrzej Hajda wrot=
e:
>>>>> On 07/28/2014 04:00 AM, Inki Dae wrote:
>>>>>> This patch adds LPM transfer support for video or command data.
>>>>>>
>>>>>> With this patch, Exynos MIPI DSI controller can transfer command=
 or
>>>>>> video data with HS or LP mode in accordance with mode_flags set
>>>>>> by LCD Panel driver.
>>>>>>
>>>>>> Changelog v2: Enable High Speed clock only in case of stand by r=
equest.
>>>>>>
>>>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++=
++++--
>>>>>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/g=
pu/drm/exynos/exynos_drm_dsi.c
>>>>>> index 5e78d45..1bed105 100644
>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> @@ -493,8 +493,11 @@ static int exynos_dsi_enable_clock(struct e=
xynos_dsi *dsi)
>>>>>>  			| DSIM_ESC_PRESCALER(esc_div)
>>>>>>  			| DSIM_LANE_ESC_CLK_EN_CLK
>>>>>>  			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
>>>>>> -			| DSIM_BYTE_CLK_SRC(0)
>>>>>> -			| DSIM_TX_REQUEST_HSCLK;
>>>>>> +			| DSIM_BYTE_CLK_SRC(0);
>>>>>> +
>>>>>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM))
>>>>>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>>>>>> +
>>>>>>  	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>>>>>> =20
>>>>>>  	return 0;
>>>>>> @@ -553,6 +556,18 @@ static void exynos_dsi_set_phy_ctrl(struct =
exynos_dsi *dsi)
>>>>>>  	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>>>>>>  }
>>>>>> =20
>>>>>> +static void exynos_dsi_enable_hs_clock(struct exynos_dsi *dsi,
>>>>>> +					bool enable)
>>>>>> +{
>>>>>> +	u32 reg =3D readl(dsi->reg_base + DSIM_CLKCTRL_REG);
>>>>>> +
>>>>>> +	reg &=3D ~DSIM_TX_REQUEST_HSCLK;
>>>>>> +	if (enable)
>>>>>> +		reg |=3D DSIM_TX_REQUEST_HSCLK;
>>>>>> +
>>>>>> +	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>>>>>> +}
>>>>>> +
>>>>> I have tested DSIM_TX_REQUEST_HSCLK bit on trats device(video mod=
e HS) -
>>>>> it works with and without the bit set.
>>>> If you can test thmorstat board, you will face with that its panel=
 is
>>>> not worked.
>>> So it means this panel requires proper driving of this bit, but it =
does
>>> not prove it is
>>> LPM related.
>>>
>>>>> So I start to suspect this bit is not just for simply enable/disa=
ble HS
>>>>> clock as function name suggests, do you know what is its
>>>>> exact meaning? The specs are quite succinct on it.
>>>> HSCLK only has meaning when it is used with CmdLpdt and TxLpdt bit=
s.
>>> This sounds very strange. DSI specs and D-PHY specs says clearly
>>> that LPM transmissions are unrelated to HS clock [1][2]. Even timin=
g
>>> diagrams
>>> in Exynos specs shows no dependency of LPM transmissions on HS cloc=
k.
>>> And the
>>> description of TxRequestHsClk bit says "HS clock request for HS tra=
nsfer
>>> at clock lane (Turn
>>> on HS clock)".
>> There are three System power states of D-PHY, Low-Power mode, High-S=
peed
>> mode and Ultra-Low Power mode. High-Speed mode needs 80Mbps ~ 1Gbps =
per
>> Lane. Therefore, to use HS mode, HS clock should be enabled. On the
>> other hand, LP mode needs only 10MHz (max).
>>
>> So do you really think LP mode will be worked well with HS clock
>> enabled? The purpose of LP mode is to reduce power consumption while
>> transmitting data. Can you reduce the power consumption in LP mode w=
ith
>> HS clock enabled?
>=20
> As MIPI specs says "All DSI transmitters and receivers shall support
> continuous clock
> behavior on the Clock Lane, and optionally may support non-continuous
> clock behavior"
> and "For continuous clock behavior, the Clock Lane remains in high-sp=
eed
> mode generating
> active clock signals between HS data packet transmissions".
> This means that HS clock should be on even in LP mode, unless panel
> supports non-continuous clock

We know what the spec says. As I mentioned already before and in other
threads, the important thing is how we should handle HS clock in
mipi-dsi framework and host driver.

To make sure that,
1. In case of supporting non-continuous clock mode, who should control
HS clock of host controller properly every time D-PHY detected LP-11? b=
y
D-PHY hw regardless of host driver? So  in this case, doesn't the host
driver need to check MSG_LPM flag and to control HS clock before host
controller transmits command data in LPM?
One more thing, in this case, is the operation mode HS mode or LP mode
while transmitting command data - there would be LP-11 signal between
command packets and operation mode would be entered to LP mode only whe=
n
D-PHY detected LP-11? Therefore, If HS mode,
MIPI_DSI_CLOCK_NON_CONTINUOUS would have different operation from
MSG_LPM because command data will be transmitted to panel in HS mode,
not in LP mode.

2. In case of not supporting non-continuous clock mode but requesting
MSG_LPM, should the host driver check the flag and control HS clock
properly before host controller transmits command data in LPM?

Thanks,
Inki Dae

> behavior. For signaling non-continuous clock capability there is
> MIPI_DSI_CLOCK_NON_CONTINUOUS flag already.
>=20
> Regards
> Andrzej
>=20
>>
>> Thanks,
>> Inki Dae
>>
>>> Maybe different flag should be used to describe your panel requirem=
ents
>>> regarding this bit.
>>>
>>> It would be good to see the real initialization sequence in form of
>>> pseudo-code or better in the driver.
>>>
>>>
>>> [1]: MIPI DSI: "Note that in Low Power signaling mode, LP clock is
>>> functionally embedded in the data signals. When LP
>>> data transmission ends, the clock effectively stops and subsequent =
LP
>>> clocks are not available to the
>>> peripheral. The peripheral shall not require additional bits, bytes=
, or
>>> packets from the host processor in
>>> order to complete processing or pipeline movement of received data =
in LP
>>> mode transmissions. There are a
>>> variety of ways to meet this requirement. For example, the peripher=
al
>>> may generate its own clock or it may
>>> require the host processor to keep the HS serial clock running."
>>>
>>> [2]: MIPI D-PHY: "The data is self-clocked by the applied bit encod=
ing
>>> and does not rely on the Clock Lane".
>>>
>>> Regards
>>> Andrzej
>>>
>>>>> On the other side I have found DSIM_TX_LPDT_LP and DSIM_CMD_LPDT_=
LP bits
>>>>> in DSIM_ESCMODE register
>>>>> which seems to be related to flags you have introduced:
>>>>> - DSIM_CMD_LPDT_LP - transmit commands in LP mode,
>>>>> - DSIM_TX_LPDT_LP - transmit data in LP mode.
>>>> As I mentioned already at other email thread, DSIM_TX_LPDT_LP spec=
ifies
>>>> that host can transmit command and also image data to Panel in Low=
 Power
>>>> Mode. So these flags are specific to MIPI-DSI controller of Exynos=
=2E
>>>>
>>>>> The former is already triggered by MIPI_DSI_MSG_USE_LPM flag. Why=
 do not
>>>> This flag is set only when command msg transmission is requested b=
y
>>>> Panel driver. So we would need separated flags, MIPI_DSI_MODE_CMD_=
LPM
>>>> and MIPI_DSI_MODE_VIDEO_LPM, to notify how host controller should
>>>> transmit command and also image.
>>>>
>>>> Thanks,
>>>> Inki Dae
>>>>
>>>>> you use the latter?
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>>  static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>>>>>>  {
>>>>>>  	u32 reg;
>>>>>> @@ -705,6 +720,9 @@ static void exynos_dsi_set_display_enable(st=
ruct exynos_dsi *dsi, bool enable)
>>>>>>  {
>>>>>>  	u32 reg;
>>>>>> =20
>>>>>> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM) && enable)
>>>>>> +		exynos_dsi_enable_hs_clock(dsi, true);
>>>>>> +
>>>>>>  	reg =3D readl(dsi->reg_base + DSIM_MDRESOL_REG);
>>>>>>  	if (enable)
>>>>>>  		reg |=3D DSIM_MAIN_STAND_BY;
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-s=
amsung-soc" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>=20
>=20
