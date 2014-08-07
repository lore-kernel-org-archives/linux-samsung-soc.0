From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 07 Aug 2014 22:05:44 +0900
Message-ID: <53E379A8.1020506@samsung.com>
References: <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com> <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com> <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22326 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757665AbaHGNFq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 09:05:46 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9X002X8TPL2D90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Aug 2014 22:05:45 +0900 (KST)
In-reply-to: <20140807110925.GA31594@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding wrote:
> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wrote=
:
>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wro=
te:
>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.=
com>:
>>> [...]
>>>>>>> As far as I can tell non-continuous mode simply means that the =
host can
>>>>>>> turn off the HS clock after a high-speed transmission. I think =
Andrzej
>>>>>>> mentioned this already in another subthread, but this is an opt=
ional
>>>>>>> mode that peripherals can support if they have extra circuitry =
that
>>>>>>> provides an internal clock. Peripherals that don't have such ci=
rcuitry
>>>>>>> may rely on the HS clock to perform in between transmissions an=
d
>>>>>>> therefore require the HS clock to be always on (continuous mode=
). That's
>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises t=
hat the
>>>>>>> peripheral supports non-continuous mode and therefore the host =
can turn
>>>>>>> the HS clock off after high-speed transmissions.
>>>>>>
>>>>>> What I don't make sure is this sentence. With
>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operatio=
ns.
>>>>>> One is,
>>>>>> 1. host controller will generates signals if a bit of a register
>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>> 2. And then video data is transmitted to panel in HS mode.
>>>>>> 3. And then D-PHY detects LP-11 signal (positive and negative la=
ne all
>>>>>> are high).
>>>>>> 4. And then D-PHY disables HS clock of host controller.
>>>>>> 5. At this time, operation mode of host controller becomes LPM.
>>>>>>
>>>>>> Other is,
>>>>>> 1. host controller will generates signals if a bit of a register
>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>> 2. And then D-PHY detects LP-11 signal (positive and negative la=
ne all
>>>>>> are high).
>>>>>> 3. And then video data is transmitted to panel in LPM.
>>>>>> 4. At this time, operation mode of host controller becomes LPM.
>>>>>>
>>>>>> It seems that you says latter case.
>>>>>
>>>>> No. High speed clock and low power mode are orthogonal. Non-conti=
nuous
>>>>> mode simply means that the clock lane enters LP-11 between HS
>>>>> transmissions (see 5.6 "Clock Management" of the DSI specificatio=
n).
>>>>>
>>>>
>>>> It seems that clock lane enters LP-11 regardless of HS clock enabl=
ed if
>>>> non-continous mode is used. Right?
>>>
>>> No, I think as long as HS clock is enabled the clock lane won't ent=
er
>>> LP-11. Non-continuous mode means that the controller can disable th=
e HS
>>> clock between HS transmissions. So in non-continuous mode the clock=
 lane
>>> can enter LP-11 because the controller disables the HS clock.
>>
>> It makes me a little bit confusing. You said "if HS clock is enabled=
,
>> the the clock lane won't enter LP-11" But you said again "the clock =
lane
>> can enter LP-11 because the controller disables the HS clock" What i=
s
>> the meaning?
>=20
> It means that if the HS clock is enabled, then the clock lane is not =
in
> LP-11. When the HS clock stops, then the clock lane enters LP-11.
>=20
>>> In continuous mode, then the clock will never be disabled, hence th=
e
>>> clock lane will never enter LP-11.
>>>
>>>> And also it seems that non-continous mode is different from LPM at=
 all
>>>> because with non-continuous mode, command data is transmitted to p=
anel
>>>> in HS mode, but with LPM, command data is transmitted to panel in =
LP
>>>> mode. Also right?
>>>
>>> No. I think you can send command data to the peripheral in low powe=
r
>>> mode in both continuous and non-continuous clock modes.
>>>
>>>> If so, shouldn't the host driver disable HS clock, in case of LP m=
ode,
>>>> before the host driver transmits command data?
>>>
>>> No. If the peripheral doesn't support non-continuous mode, then the=
 HS
>>> clock must never be turned off. On the other hand, if the periphera=
l
>>> supports non-continuous mode, then the DSI host should automaticall=
y
>>> disable the HS clock between high-speed transmissions. That means i=
f a
>>> packet is transmitted in low power mode the DSI host will not be
>>> transmitting in high-speed mode and therefore disable the HS clock.
>>
>> What is LPM you think? I thought LPM is LP-11 and HS clock disabled.=
 So
>> for LPM transfer, lanes should be LP-11 state and also HS clock of t=
he
>> host controller should be disabled.
>=20
> No. I don't think any transmissions can happen when all lanes are in
> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a packe=
t
> should be transmitted in low power mode (see LP Transmission in 2.1
> "Definitions" of the MIPI DSI specification).
>=20

Hm.. I see. I meant,

if (flags & MIPI_DSI_MSG_USE_LPM)
       disable HS clock <- required.

transmit command data <- in LPM.

Thanks,
Inki Dae

> For low power transmissions, only data lane 0 is used (with a clock
> embedded in the signal), therefore the clock lane (driven by the HS
> clock) can be in LP-11.
>=20
> Thierry
>=20
