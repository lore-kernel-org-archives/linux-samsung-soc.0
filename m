From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Mon, 11 Aug 2014 16:09:37 +0900
Message-ID: <53E86C31.2020702@samsung.com>
References: <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com> <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com> <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com> <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com> <53E42BCB.5090608@samsung.com>
 <20140808070311.GA5387@ulmo> <53E47E23.1050302@samsung.com>
 <53E4921D.3090907@samsung.com> <53E49AF4.5020403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55984 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbaHKHJk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 03:09:40 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NA400F4PRW1L750@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Aug 2014 16:09:38 +0900 (KST)
In-reply-to: <53E49AF4.5020403@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org, treding@nvidia.com, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:40, Andrzej Hajda wrote:
> On 08/08/2014 11:02 AM, Andrzej Hajda wrote:
>> On 08/08/2014 09:37 AM, Inki Dae wrote:
>>> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 16:03, Thierry Reding wrot=
e:
>>>> On Fri, Aug 08, 2014 at 10:45:47AM +0900, Inki Dae wrote:
>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:55, Thierry Reding wr=
ote:
>>>>>> On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Reding =
wrote:
>>>>>>>> On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Redin=
g wrote:
>>>>>>>>>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Red=
ing wrote:
>>>>>>>>>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
>>>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry R=
eding wrote:
>>>>>>>>>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote=
:
>>>>>>>>>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.redi=
ng@gmail.com>:
>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>> As far as I can tell non-continuous mode simply means =
that the host can
>>>>>>>>>>>>>>>> turn off the HS clock after a high-speed transmission.=
 I think Andrzej
>>>>>>>>>>>>>>>> mentioned this already in another subthread, but this =
is an optional
>>>>>>>>>>>>>>>> mode that peripherals can support if they have extra c=
ircuitry that
>>>>>>>>>>>>>>>> provides an internal clock. Peripherals that don't hav=
e such circuitry
>>>>>>>>>>>>>>>> may rely on the HS clock to perform in between transmi=
ssions and
>>>>>>>>>>>>>>>> therefore require the HS clock to be always on (contin=
uous mode). That's
>>>>>>>>>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it adv=
ertises that the
>>>>>>>>>>>>>>>> peripheral supports non-continuous mode and therefore =
the host can turn
>>>>>>>>>>>>>>>> the HS clock off after high-speed transmissions.
>>>>>>>>>>>>>>> What I don't make sure is this sentence. With
>>>>>>>>>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible=
 operations.
>>>>>>>>>>>>>>> One is,
>>>>>>>>>>>>>>> 1. host controller will generates signals if a bit of a=
 register
>>>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>>>>>>>>>>> 2. And then video data is transmitted to panel in HS mo=
de.
>>>>>>>>>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and ne=
gative lane all
>>>>>>>>>>>>>>> are high).
>>>>>>>>>>>>>>> 4. And then D-PHY disables HS clock of host controller.
>>>>>>>>>>>>>>> 5. At this time, operation mode of host controller beco=
mes LPM.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Other is,
>>>>>>>>>>>>>>> 1. host controller will generates signals if a bit of a=
 register
>>>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>>>>>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and ne=
gative lane all
>>>>>>>>>>>>>>> are high).
>>>>>>>>>>>>>>> 3. And then video data is transmitted to panel in LPM.
>>>>>>>>>>>>>>> 4. At this time, operation mode of host controller beco=
mes LPM.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It seems that you says latter case.
>>>>>>>>>>>>>> No. High speed clock and low power mode are orthogonal. =
Non-continuous
>>>>>>>>>>>>>> mode simply means that the clock lane enters LP-11 betwe=
en HS
>>>>>>>>>>>>>> transmissions (see 5.6 "Clock Management" of the DSI spe=
cification).
>>>>>>>>>>>>>>
>>>>>>>>>>>>> It seems that clock lane enters LP-11 regardless of HS cl=
ock enabled if
>>>>>>>>>>>>> non-continous mode is used. Right?
>>>>>>>>>>>> No, I think as long as HS clock is enabled the clock lane =
won't enter
>>>>>>>>>>>> LP-11. Non-continuous mode means that the controller can d=
isable the HS
>>>>>>>>>>>> clock between HS transmissions. So in non-continuous mode =
the clock lane
>>>>>>>>>>>> can enter LP-11 because the controller disables the HS clo=
ck.
>>>>>>>>>>> It makes me a little bit confusing. You said "if HS clock i=
s enabled,
>>>>>>>>>>> the the clock lane won't enter LP-11" But you said again "t=
he clock lane
>>>>>>>>>>> can enter LP-11 because the controller disables the HS cloc=
k" What is
>>>>>>>>>>> the meaning?
>>>>>>>>>> It means that if the HS clock is enabled, then the clock lan=
e is not in
>>>>>>>>>> LP-11. When the HS clock stops, then the clock lane enters L=
P-11.
>>>>>>>>>>
>>>>>>>>>>>> In continuous mode, then the clock will never be disabled,=
 hence the
>>>>>>>>>>>> clock lane will never enter LP-11.
>>>>>>>>>>>>
>>>>>>>>>>>>> And also it seems that non-continous mode is different fr=
om LPM at all
>>>>>>>>>>>>> because with non-continuous mode, command data is transmi=
tted to panel
>>>>>>>>>>>>> in HS mode, but with LPM, command data is transmitted to =
panel in LP
>>>>>>>>>>>>> mode. Also right?
>>>>>>>>>>>> No. I think you can send command data to the peripheral in=
 low power
>>>>>>>>>>>> mode in both continuous and non-continuous clock modes.
>>>>>>>>>>>>
>>>>>>>>>>>>> If so, shouldn't the host driver disable HS clock, in cas=
e of LP mode,
>>>>>>>>>>>>> before the host driver transmits command data?
>>>>>>>>>>>> No. If the peripheral doesn't support non-continuous mode,=
 then the HS
>>>>>>>>>>>> clock must never be turned off. On the other hand, if the =
peripheral
>>>>>>>>>>>> supports non-continuous mode, then the DSI host should aut=
omatically
>>>>>>>>>>>> disable the HS clock between high-speed transmissions. Tha=
t means if a
>>>>>>>>>>>> packet is transmitted in low power mode the DSI host will =
not be
>>>>>>>>>>>> transmitting in high-speed mode and therefore disable the =
HS clock.
>>>>>>>>>>> What is LPM you think? I thought LPM is LP-11 and HS clock =
disabled. So
>>>>>>>>>>> for LPM transfer, lanes should be LP-11 state and also HS c=
lock of the
>>>>>>>>>>> host controller should be disabled.
>>>>>>>>>> No. I don't think any transmissions can happen when all lane=
s are in
>>>>>>>>>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify tha=
t a packet
>>>>>>>>>> should be transmitted in low power mode (see LP Transmission=
 in 2.1
>>>>>>>>>> "Definitions" of the MIPI DSI specification).
>>>>>>>>>>
>>>>>>>>> Hm.. I see. I meant,
>>>>>>>>>
>>>>>>>>> if (flags & MIPI_DSI_MSG_USE_LPM)
>>>>>>>>>        disable HS clock <- required.
>>>>>>>>>
>>>>>>>>> transmit command data <- in LPM.
>>>>>>>> No. Disabling the HS clock is not required for LPM mode. In fa=
ct if the
>>>>>>>> peripheral specifies that it doesn't support non-continuous mo=
de then
>>>>>>>> the HS clock must *never* be disabled as long as the periphera=
l is in
>>>>>>>> use.
>>>>>>>>
>>>>>>>> MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unr=
elated and
>>>>>>>> need to be considered separately.
>>>>>>> I mentioned already LPM and NON_CONTINUOUS are unrelated.
>>>>>>>
>>>>>>> It seems that you say the only way to transfer command data in =
LPM is
>>>>>>> non-continuous clock mode.
>>>>>> No, that's not what I'm saying.
>>>>>>
>>>>>>> However, you said and also the spec says, "Non-continuous mode =
simply
>>>>>>> means that the clock lane enters LP-11 between HS transmissions=
".
>>>>>>> Doesn't *between HS transmissions" mean the command data is tra=
nsmitted
>>>>>>> in HS, *not in LPM*, and clock lane enters LP-11 between them?
>>>>>> Not necessarily. You can transmit command packets in high-speed =
mode,
>>>>>> but you don't have to. If you transmit packets in low power mode=
, then
>>>>> That would may why we are mentioning same comments repeatedly.
>>>>>
>>>>> In my case, host driver waits for the lane stop state (LP-11), an=
d then
>>>>> disables HS clock to transmit command data in LPM. Of course, I'm=
 not
>>>>> sure that yet it's correct way.
>>>> That's confusing. How can the lane go to LP-11 when the clock is s=
till
>>>> running?
>>> Actually, we are doing so. If the clock is still running then dsi d=
river
>>> will wait for stop state of the clock and data lanes. Know that thi=
s is
>>> valid only when initial time - just one time since power up.
>>>
>>> 	/* Check clock and data lane state are stop state */
>>> 	timeout =3D 100;
>>> 	do {
>>> 		if (timeout-- =3D=3D 0) {
>>> 			dev_err(dsi->dev, "waiting for bus lanes timed out\n");
>>> 			return -EFAULT;
>>> 		}
>>>
>>> 		reg =3D readl(dsi->reg_base + DSIM_STATUS_REG);
>>> 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
>>> 		    !=3D DSIM_STOP_STATE_DAT(lanes_mask))
>>> 			continue;
>>> 	} while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));
>>
>> This is only in initialization phase of DSI. 'If' inside the loop is
>> quite clear
>> - it checks for LP11 on all requested data lanes. 'while' check is
>> little bit suspicious.
>> It seems to be only for non-continuous clock behavior, on the other =
side
>> it is according to guidelines
>> in specs.
>=20
> After reviewing it again 'while' check looks OK :), sorry for noise.
> Loop exits w/o timeout either HS_CLK is ready (continuous clock
> behavior) either HS_CLK is stopped (non-continuous clock behavior).
>=20
> Regards
> Andrzej
>=20
>>
>> Inki, have you tried to take an assumption your panel requires
>> continuous clock behavior and exynos
>> dsi driver currently supports only non-continuous clock behavior, so=
 it
>> needs some fixes to make it work.

I'm not sure yet. All I can say is that the panel works well only with
clearing DSIM_TX_REQUEST_HSCLK and DSIM_CMD_LPDT_LP.
And more thing, we need to check that disabling these two flags means
non-continuous clock mode or just low power transfer.
I think these two flags all should be also disabled in case peripheral
doesn't support non-continuous clock but want to transmit data in low p=
ower.
In this case, what should we call this mode?

>> Exynos specs are very unclear on the subject so it is hard to guess =
how
>> the registers should be configured

=46or this, Youngjun are trying to contact HW guys.

Thanks,
Inki Dae

>> to have continuous/non-continuous clock behavior.
>>
>> Regards
>> Andrzej
>>
>>>
>>>>> In Tegra, What to do for it?
>>>> There are two bits in two separate registers for this:
>>>>
>>>> 	DSI_HOST_CONTROL:
>>>> 	  bit 5: DSI_HIGH_SPEED_TRANS: DSI high speed transmission of
>>>> 	                               packets
>>>> 	    - 0 =3D LOW: low speed
>>>> 	    - 1 =3D HIGH: high speed
>>>>
>>>> 	DSI_CONTROL:
>>>> 	  bit 20: DSI_HS_CLK_CTRL: Control for the HS clock lane
>>>> 	    - 0 =3D CONTINUOUS: HS clock is on all the time
>>>> 	    - 1 =3D TX_ONLY: HS clock is only active during HS
>>>> 	                   transmissions
>>>>
>>>> So if the peripheral supports non-continuous mode of operation we =
set
>>>> the DSI_HS_CLK_CTRL bit, otherwise we clear it to make sure the cl=
ock
>>>> remains on all the time.
>>>>
>>>> When a packet is to be transmitted in high speed mode, we set the
>>>> DSI_HIGH_SPEED_TRANS bit. For low power mode transmissions that bi=
t is
>>>> cleared.
>>> That is exactly what I want. In your case, if you want to transmit
>>> command data in Low Power Mode in case of supporting non-continuous
>>> clock mode, then you would set DSI_HS_CLK_CTRL (TX_ONLY), and also =
you
>>> would clear DSI_HIGH_SPEED_TRANS (LOW).
>>>
>>> So I guess,
>>>
>>> if (flags & MIPI_DSI_MODE_NON_CONTINUOUS) {
>>>         disable DSI_HIGH_SPEED_TRANS;   <- LOW
>>>         enable DSI_HS_CLK_CTRL; <- TX_ONLY
>>> }
>>>
>>> transmit command data <- in LPM.
>>>
>>> However, what if the peripheral doesn't support non-continuous but =
want
>>> to transmit command data in LPM? Is that  impossible?
>>>
>>> Thanks,
>>> Inki Dae
>>>
>>>> Thierry
>>>>
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
