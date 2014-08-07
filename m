From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 07 Aug 2014 19:49:03 +0900
Message-ID: <53E3599F.3020301@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com> <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12184 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754413AbaHGKtG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 06:49:06 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9X00B31NDRNHC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Aug 2014 19:49:03 +0900 (KST)
In-reply-to: <20140807090859.GD13315@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wrote:
> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wrote=
:
>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.co=
m>:
> [...]
>>>>> As far as I can tell non-continuous mode simply means that the ho=
st can
>>>>> turn off the HS clock after a high-speed transmission. I think An=
drzej
>>>>> mentioned this already in another subthread, but this is an optio=
nal
>>>>> mode that peripherals can support if they have extra circuitry th=
at
>>>>> provides an internal clock. Peripherals that don't have such circ=
uitry
>>>>> may rely on the HS clock to perform in between transmissions and
>>>>> therefore require the HS clock to be always on (continuous mode).=
 That's
>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises tha=
t the
>>>>> peripheral supports non-continuous mode and therefore the host ca=
n turn
>>>>> the HS clock off after high-speed transmissions.
>>>>
>>>> What I don't make sure is this sentence. With
>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations=
=2E
>>>> One is,
>>>> 1. host controller will generates signals if a bit of a register
>>>> related to non-contiguous clock mode is set or unset.
>>>> 2. And then video data is transmitted to panel in HS mode.
>>>> 3. And then D-PHY detects LP-11 signal (positive and negative lane=
 all
>>>> are high).
>>>> 4. And then D-PHY disables HS clock of host controller.
>>>> 5. At this time, operation mode of host controller becomes LPM.
>>>>
>>>> Other is,
>>>> 1. host controller will generates signals if a bit of a register
>>>> related to non-contiguous clock mode is set or unset.
>>>> 2. And then D-PHY detects LP-11 signal (positive and negative lane=
 all
>>>> are high).
>>>> 3. And then video data is transmitted to panel in LPM.
>>>> 4. At this time, operation mode of host controller becomes LPM.
>>>>
>>>> It seems that you says latter case.
>>>
>>> No. High speed clock and low power mode are orthogonal. Non-continu=
ous
>>> mode simply means that the clock lane enters LP-11 between HS
>>> transmissions (see 5.6 "Clock Management" of the DSI specification)=
=2E
>>>
>>
>> It seems that clock lane enters LP-11 regardless of HS clock enabled=
 if
>> non-continous mode is used. Right?
>=20
> No, I think as long as HS clock is enabled the clock lane won't enter
> LP-11. Non-continuous mode means that the controller can disable the =
HS
> clock between HS transmissions. So in non-continuous mode the clock l=
ane
> can enter LP-11 because the controller disables the HS clock.

It makes me a little bit confusing. You said "if HS clock is enabled,
the the clock lane won't enter LP-11" But you said again "the clock lan=
e
can enter LP-11 because the controller disables the HS clock" What is
the meaning?

>=20
> In continuous mode, then the clock will never be disabled, hence the
> clock lane will never enter LP-11.
>=20
>> And also it seems that non-continous mode is different from LPM at a=
ll
>> because with non-continuous mode, command data is transmitted to pan=
el
>> in HS mode, but with LPM, command data is transmitted to panel in LP
>> mode. Also right?
>=20
> No. I think you can send command data to the peripheral in low power
> mode in both continuous and non-continuous clock modes.
>=20
>> If so, shouldn't the host driver disable HS clock, in case of LP mod=
e,
>> before the host driver transmits command data?
>=20
> No. If the peripheral doesn't support non-continuous mode, then the H=
S
> clock must never be turned off. On the other hand, if the peripheral
> supports non-continuous mode, then the DSI host should automatically
> disable the HS clock between high-speed transmissions. That means if =
a
> packet is transmitted in low power mode the DSI host will not be
> transmitting in high-speed mode and therefore disable the HS clock.

What is LPM you think? I thought LPM is LP-11 and HS clock disabled. So
for LPM transfer, lanes should be LP-11 state and also HS clock of the
host controller should be disabled.

Your comment, "if a packet is transmitted in low power mode the DSI hos=
t
will not be transmitting in high-speed mode and therefor disable the HS
clock" would mean same as my question.

>=20
> Obviously if the controller can't do that automatically then it might=
 be
> necessary to explicitly do that in the driver. But I doubt that any D=
SI
> controller wouldn't be able to do that automatically. On Tegra we hav=
e a
> control bit that enables non-continuous mode:
>=20
> 	DSI_HS_CLK_CTRL: control for the HS clock lane
> 	  - 0 =3D CONTINUOUS: HS clock is on all the time
> 	  - 1 =3D TX_ONLY: HS clock is only active during HS transmissions

MIPI-DSI of Exynos SoC also has similar bit but the spec doesn't
describe it enough. Thanks for information.

I will try to get more information about above comments from HW guys if
I can contact them.

Thanks,
Inki Dae

>=20
>> And  it seems that only one of these two flags, MSG_LPM and NON-CONT=
INUOUS,
>> should be set by panel driver because with NON-CONTINUOUS clock mode=
, host
>> controller generate clock and data lane signals regardless of contro=
lling
>> HS clock.
>=20
> No. Non-continuous mode is something that's specific to the periphera=
l
> and is always valid, whereas the MSG_LPM flag is only used to mark a
> packet to be transmitted in low power mode (as opposed to high speed
> mode). For peripherals that don't support non-continuous mode the
> NON_CONTINUOUS flag needs to be set. But the driver for the periphera=
l
> can still initiate low power mode packet transmissions by setting the
> MSG_LPM flag.
>=20
> Thierry
>=20
