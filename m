From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Tue, 12 Aug 2014 22:08:19 +0900
Message-ID: <53EA11C3.9020506@samsung.com>
References: <20140807065801.GD17340@ulmo> <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com> <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com> <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com> <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com> <53E42BCB.5090608@samsung.com>
 <20140808070311.GA5387@ulmo> <53E47E23.1050302@samsung.com>
 <53E4921D.3090907@samsung.com> <53E49AF4.5020403@samsung.com>
 <53E86C31.2020702@samsung.com> <53EA006A.5060109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25526 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbaHLNIV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 09:08:21 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NA70098I35VCD00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Aug 2014 22:08:19 +0900 (KST)
In-reply-to: <53EA006A.5060109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, treding@nvidia.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 08=EC=9B=94 12=EC=9D=BC 20:54, YoungJun Cho wrote:
> Hi Inki, Andrzej
>=20
> On 08/11/2014 04:09 PM, Inki Dae wrote:
>> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:40, Andrzej Hajda wrote:
>>> On 08/08/2014 11:02 AM, Andrzej Hajda wrote:
>>>> On 08/08/2014 09:37 AM, Inki Dae wrote:
>>>>> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 16:03, Thierry Reding wr=
ote:
>>>>>> On Fri, Aug 08, 2014 at 10:45:47AM +0900, Inki Dae wrote:
>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:55, Thierry Reding =
wrote:
>>>>>>>> On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Redin=
g wrote:
>>>>>>>>>> On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Red=
ing wrote:
>>>>>>>>>>>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
>>>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry R=
eding wrote:
>>>>>>>>>>>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote=
:
>>>>>>>>>>>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry=
 Reding wrote:
>>>>>>>>>>>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wro=
te:
>>>>>>>>>>>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding
>>>>>>>>>>>>>>>>> <thierry.reding@gmail.com>:
>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>>> As far as I can tell non-continuous mode simply mean=
s
>>>>>>>>>>>>>>>>>> that the host can
>>>>>>>>>>>>>>>>>> turn off the HS clock after a high-speed transmissio=
n.
>>>>>>>>>>>>>>>>>> I think Andrzej
>>>>>>>>>>>>>>>>>> mentioned this already in another subthread, but thi=
s
>>>>>>>>>>>>>>>>>> is an optional
>>>>>>>>>>>>>>>>>> mode that peripherals can support if they have extra
>>>>>>>>>>>>>>>>>> circuitry that
>>>>>>>>>>>>>>>>>> provides an internal clock. Peripherals that don't
>>>>>>>>>>>>>>>>>> have such circuitry
>>>>>>>>>>>>>>>>>> may rely on the HS clock to perform in between
>>>>>>>>>>>>>>>>>> transmissions and
>>>>>>>>>>>>>>>>>> therefore require the HS clock to be always on
>>>>>>>>>>>>>>>>>> (continuous mode). That's
>>>>>>>>>>>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it
>>>>>>>>>>>>>>>>>> advertises that the
>>>>>>>>>>>>>>>>>> peripheral supports non-continuous mode and therefor=
e
>>>>>>>>>>>>>>>>>> the host can turn
>>>>>>>>>>>>>>>>>> the HS clock off after high-speed transmissions.
>>>>>>>>>>>>>>>>> What I don't make sure is this sentence. With
>>>>>>>>>>>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possib=
le
>>>>>>>>>>>>>>>>> operations.
>>>>>>>>>>>>>>>>> One is,
>>>>>>>>>>>>>>>>> 1. host controller will generates signals if a bit of=
 a
>>>>>>>>>>>>>>>>> register
>>>>>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>>>>>>>>>>>>> 2. And then video data is transmitted to panel in HS =
mode.
>>>>>>>>>>>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and
>>>>>>>>>>>>>>>>> negative lane all
>>>>>>>>>>>>>>>>> are high).
>>>>>>>>>>>>>>>>> 4. And then D-PHY disables HS clock of host controlle=
r.
>>>>>>>>>>>>>>>>> 5. At this time, operation mode of host controller
>>>>>>>>>>>>>>>>> becomes LPM.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Other is,
>>>>>>>>>>>>>>>>> 1. host controller will generates signals if a bit of=
 a
>>>>>>>>>>>>>>>>> register
>>>>>>>>>>>>>>>>> related to non-contiguous clock mode is set or unset.
>>>>>>>>>>>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and
>>>>>>>>>>>>>>>>> negative lane all
>>>>>>>>>>>>>>>>> are high).
>>>>>>>>>>>>>>>>> 3. And then video data is transmitted to panel in LPM=
=2E
>>>>>>>>>>>>>>>>> 4. At this time, operation mode of host controller
>>>>>>>>>>>>>>>>> becomes LPM.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> It seems that you says latter case.
>>>>>>>>>>>>>>>> No. High speed clock and low power mode are orthogonal=
=2E
>>>>>>>>>>>>>>>> Non-continuous
>>>>>>>>>>>>>>>> mode simply means that the clock lane enters LP-11
>>>>>>>>>>>>>>>> between HS
>>>>>>>>>>>>>>>> transmissions (see 5.6 "Clock Management" of the DSI
>>>>>>>>>>>>>>>> specification).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It seems that clock lane enters LP-11 regardless of HS
>>>>>>>>>>>>>>> clock enabled if
>>>>>>>>>>>>>>> non-continous mode is used. Right?
>>>>>>>>>>>>>> No, I think as long as HS clock is enabled the clock lan=
e
>>>>>>>>>>>>>> won't enter
>>>>>>>>>>>>>> LP-11. Non-continuous mode means that the controller can
>>>>>>>>>>>>>> disable the HS
>>>>>>>>>>>>>> clock between HS transmissions. So in non-continuous mod=
e
>>>>>>>>>>>>>> the clock lane
>>>>>>>>>>>>>> can enter LP-11 because the controller disables the HS c=
lock.
>>>>>>>>>>>>> It makes me a little bit confusing. You said "if HS clock
>>>>>>>>>>>>> is enabled,
>>>>>>>>>>>>> the the clock lane won't enter LP-11" But you said again
>>>>>>>>>>>>> "the clock lane
>>>>>>>>>>>>> can enter LP-11 because the controller disables the HS
>>>>>>>>>>>>> clock" What is
>>>>>>>>>>>>> the meaning?
>>>>>>>>>>>> It means that if the HS clock is enabled, then the clock
>>>>>>>>>>>> lane is not in
>>>>>>>>>>>> LP-11. When the HS clock stops, then the clock lane enters
>>>>>>>>>>>> LP-11.
>>>>>>>>>>>>
>>>>>>>>>>>>>> In continuous mode, then the clock will never be disable=
d,
>>>>>>>>>>>>>> hence the
>>>>>>>>>>>>>> clock lane will never enter LP-11.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> And also it seems that non-continous mode is different
>>>>>>>>>>>>>>> from LPM at all
>>>>>>>>>>>>>>> because with non-continuous mode, command data is
>>>>>>>>>>>>>>> transmitted to panel
>>>>>>>>>>>>>>> in HS mode, but with LPM, command data is transmitted t=
o
>>>>>>>>>>>>>>> panel in LP
>>>>>>>>>>>>>>> mode. Also right?
>>>>>>>>>>>>>> No. I think you can send command data to the peripheral =
in
>>>>>>>>>>>>>> low power
>>>>>>>>>>>>>> mode in both continuous and non-continuous clock modes.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> If so, shouldn't the host driver disable HS clock, in
>>>>>>>>>>>>>>> case of LP mode,
>>>>>>>>>>>>>>> before the host driver transmits command data?
>>>>>>>>>>>>>> No. If the peripheral doesn't support non-continuous mod=
e,
>>>>>>>>>>>>>> then the HS
>>>>>>>>>>>>>> clock must never be turned off. On the other hand, if th=
e
>>>>>>>>>>>>>> peripheral
>>>>>>>>>>>>>> supports non-continuous mode, then the DSI host should
>>>>>>>>>>>>>> automatically
>>>>>>>>>>>>>> disable the HS clock between high-speed transmissions.
>>>>>>>>>>>>>> That means if a
>>>>>>>>>>>>>> packet is transmitted in low power mode the DSI host wil=
l
>>>>>>>>>>>>>> not be
>>>>>>>>>>>>>> transmitting in high-speed mode and therefore disable th=
e
>>>>>>>>>>>>>> HS clock.
>>>>>>>>>>>>> What is LPM you think? I thought LPM is LP-11 and HS cloc=
k
>>>>>>>>>>>>> disabled. So
>>>>>>>>>>>>> for LPM transfer, lanes should be LP-11 state and also HS
>>>>>>>>>>>>> clock of the
>>>>>>>>>>>>> host controller should be disabled.
>>>>>>>>>>>> No. I don't think any transmissions can happen when all
>>>>>>>>>>>> lanes are in
>>>>>>>>>>>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify
>>>>>>>>>>>> that a packet
>>>>>>>>>>>> should be transmitted in low power mode (see LP Transmissi=
on
>>>>>>>>>>>> in 2.1
>>>>>>>>>>>> "Definitions" of the MIPI DSI specification).
>>>>>>>>>>>>
>>>>>>>>>>> Hm.. I see. I meant,
>>>>>>>>>>>
>>>>>>>>>>> if (flags & MIPI_DSI_MSG_USE_LPM)
>>>>>>>>>>>         disable HS clock <- required.
>>>>>>>>>>>
>>>>>>>>>>> transmit command data <- in LPM.
>>>>>>>>>> No. Disabling the HS clock is not required for LPM mode. In
>>>>>>>>>> fact if the
>>>>>>>>>> peripheral specifies that it doesn't support non-continuous
>>>>>>>>>> mode then
>>>>>>>>>> the HS clock must *never* be disabled as long as the
>>>>>>>>>> peripheral is in
>>>>>>>>>> use.
>>>>>>>>>>
>>>>>>>>>> MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are
>>>>>>>>>> unrelated and
>>>>>>>>>> need to be considered separately.
>>>>>>>>> I mentioned already LPM and NON_CONTINUOUS are unrelated.
>>>>>>>>>
>>>>>>>>> It seems that you say the only way to transfer command data i=
n
>>>>>>>>> LPM is
>>>>>>>>> non-continuous clock mode.
>>>>>>>> No, that's not what I'm saying.
>>>>>>>>
>>>>>>>>> However, you said and also the spec says, "Non-continuous mod=
e
>>>>>>>>> simply
>>>>>>>>> means that the clock lane enters LP-11 between HS transmissio=
ns".
>>>>>>>>> Doesn't *between HS transmissions" mean the command data is
>>>>>>>>> transmitted
>>>>>>>>> in HS, *not in LPM*, and clock lane enters LP-11 between them=
?
>>>>>>>> Not necessarily. You can transmit command packets in high-spee=
d
>>>>>>>> mode,
>>>>>>>> but you don't have to. If you transmit packets in low power
>>>>>>>> mode, then
>>>>>>> That would may why we are mentioning same comments repeatedly.
>>>>>>>
>>>>>>> In my case, host driver waits for the lane stop state (LP-11),
>>>>>>> and then
>>>>>>> disables HS clock to transmit command data in LPM. Of course, I=
'm
>>>>>>> not
>>>>>>> sure that yet it's correct way.
>>>>>> That's confusing. How can the lane go to LP-11 when the clock is
>>>>>> still
>>>>>> running?
>>>>> Actually, we are doing so. If the clock is still running then dsi
>>>>> driver
>>>>> will wait for stop state of the clock and data lanes. Know that
>>>>> this is
>>>>> valid only when initial time - just one time since power up.
>>>>>
>>>>>     /* Check clock and data lane state are stop state */
>>>>>     timeout =3D 100;
>>>>>     do {
>>>>>         if (timeout-- =3D=3D 0) {
>>>>>             dev_err(dsi->dev, "waiting for bus lanes timed out\n"=
);
>>>>>             return -EFAULT;
>>>>>         }
>>>>>
>>>>>         reg =3D readl(dsi->reg_base + DSIM_STATUS_REG);
>>>>>         if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
>>>>>             !=3D DSIM_STOP_STATE_DAT(lanes_mask))
>>>>>             continue;
>>>>>     } while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)=
));
>>>>
>>>> This is only in initialization phase of DSI. 'If' inside the loop =
is
>>>> quite clear
>>>> - it checks for LP11 on all requested data lanes. 'while' check is
>>>> little bit suspicious.
>>>> It seems to be only for non-continuous clock behavior, on the othe=
r
>>>> side
>>>> it is according to guidelines
>>>> in specs.
>>>
>>> After reviewing it again 'while' check looks OK :), sorry for noise=
=2E
>>> Loop exits w/o timeout either HS_CLK is ready (continuous clock
>>> behavior) either HS_CLK is stopped (non-continuous clock behavior).
>>>
>>> Regards
>>> Andrzej
>>>
>>>>
>>>> Inki, have you tried to take an assumption your panel requires
>>>> continuous clock behavior and exynos
>>>> dsi driver currently supports only non-continuous clock behavior, =
so it
>>>> needs some fixes to make it work.
>>
>> I'm not sure yet. All I can say is that the panel works well only wi=
th
>> clearing DSIM_TX_REQUEST_HSCLK and DSIM_CMD_LPDT_LP.
>> And more thing, we need to check that disabling these two flags mean=
s
>> non-continuous clock mode or just low power transfer.
>> I think these two flags all should be also disabled in case peripher=
al
>> doesn't support non-continuous clock but want to transmit data in lo=
w
>> power.
>> In this case, what should we call this mode?
>>
>>>> Exynos specs are very unclear on the subject so it is hard to gues=
s how
>>>> the registers should be configured
>>
>> For this, Youngjun are trying to contact HW guys.
>>
>=20
> I asked H/W guy exynos dsi configuration.
>=20
> 1. For HS mode operation
>     =3D> Sets DSIM_TX_REQUEST_HSCLK
>     =3D> Waits till DSIM_TX_READY_HS_CLK is set
>=20
> 2. For LP mode operation(especially transferring command)
>     =3D> Sets DSIM_CMD_LPDT_LP
>     * Note: Don't use DSIM_TX_LPDT_LP for stability
>=20
> 3. For non-continuous clock control
>     =3D> Enable: Unsets the 30th bit(Clklane_Stop/Start) in
>         DSIM_CONFIG (default)
>     =3D> Disable: Sets the 30th bit(Clklane_Stop/Start) in
>         DSIM_CONFIG
>=20
> So we need implementation to control non-continuous clock operation.
>=20

Thanks for confirmation. :)

I had posted a new patch series for low power transmission and
non-continuous clock support but as above, we should control
Clklane_Stop/Start bit to use non-continuous clock mode. I will fix and
re-send them soon.

Thanks,
Inki Dae

> Thank you.
> Best regards YJ
>=20
>> Thanks,
>> Inki Dae
>>
>>>> to have continuous/non-continuous clock behavior.
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>>
>>>>>>> In Tegra, What to do for it?
>>>>>> There are two bits in two separate registers for this:
>>>>>>
>>>>>>     DSI_HOST_CONTROL:
>>>>>>       bit 5: DSI_HIGH_SPEED_TRANS: DSI high speed transmission o=
f
>>>>>>                                    packets
>>>>>>         - 0 =3D LOW: low speed
>>>>>>         - 1 =3D HIGH: high speed
>>>>>>
>>>>>>     DSI_CONTROL:
>>>>>>       bit 20: DSI_HS_CLK_CTRL: Control for the HS clock lane
>>>>>>         - 0 =3D CONTINUOUS: HS clock is on all the time
>>>>>>         - 1 =3D TX_ONLY: HS clock is only active during HS
>>>>>>                        transmissions
>>>>>>
>>>>>> So if the peripheral supports non-continuous mode of operation w=
e set
>>>>>> the DSI_HS_CLK_CTRL bit, otherwise we clear it to make sure the =
clock
>>>>>> remains on all the time.
>>>>>>
>>>>>> When a packet is to be transmitted in high speed mode, we set th=
e
>>>>>> DSI_HIGH_SPEED_TRANS bit. For low power mode transmissions that
>>>>>> bit is
>>>>>> cleared.
>>>>> That is exactly what I want. In your case, if you want to transmi=
t
>>>>> command data in Low Power Mode in case of supporting non-continuo=
us
>>>>> clock mode, then you would set DSI_HS_CLK_CTRL (TX_ONLY), and als=
o you
>>>>> would clear DSI_HIGH_SPEED_TRANS (LOW).
>>>>>
>>>>> So I guess,
>>>>>
>>>>> if (flags & MIPI_DSI_MODE_NON_CONTINUOUS) {
>>>>>          disable DSI_HIGH_SPEED_TRANS;   <- LOW
>>>>>          enable DSI_HS_CLK_CTRL; <- TX_ONLY
>>>>> }
>>>>>
>>>>> transmit command data <- in LPM.
>>>>>
>>>>> However, what if the peripheral doesn't support non-continuous bu=
t
>>>>> want
>>>>> to transmit command data in LPM? Is that  impossible?
>>>>>
>>>>> Thanks,
>>>>> Inki Dae
>>>>>
>>>>>> Thierry
>>>>>>
>>>>>
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
