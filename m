From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer support
Date: Thu, 7 Aug 2014 02:09:19 +0900
Message-ID: <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
	<1406512857-7213-2-git-send-email-inki.dae@samsung.com>
	<53D675D6.2000309@samsung.com>
	<20140805111223.GA27340@ulmo>
	<53E1D53A.9050703@samsung.com>
	<20140806074357.GA13788@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:63571 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbaHFRJV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Aug 2014 13:09:21 -0400
Received: by mail-wi0-f180.google.com with SMTP id n3so3590686wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2014 10:09:19 -0700 (PDT)
In-Reply-To: <20140806074357.GA13788@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> On Wed, Aug 06, 2014 at 04:11:54PM +0900, Inki Dae wrote:
>> On 2014=B3=E2 08=BF=F9 05=C0=CF 20:12, Thierry Reding wrote:
> [...]
>> > I think that low power mode is more often used for command transmi=
ssion
>> > (in host-driven mode). I'm not sure how much sense it really makes=
 to
>> > transmit video data in low power mode. It also seems like low powe=
r mode
>> > is what all peripherals need to support (if they can do command mo=
de).
>> > Hence I'd like to propose the attached patch that makes all comman=
d
>> > messages use low power mode.
>>
>> To use low power mode, I think SoC drivers should add more codes:
>> checking xxx_MSG_LPM, and maybe disabling HS clock. My patch does
>> exactly that,
>> http://www.spinics.net/lists/linux-samsung-soc/msg34866.html
>
> I agree in general that DSI host drivers need to check the flags to m=
ake
> a decision about which mode to enable. But your patch also introduces
> additional flags that I don't think are necessary (at least for any o=
f
> the use-cases discussed so far).
>
> As I understand it the MIPI_DSI_MODE_CMD_LPM and MIPI_DSI_MODE_VIDEO_=
LPM
> flags that you introduce would advertise that the device only support=
s
> low power mode for command or video modes respectively. However, I do=
ubt

Not so. My intention is to add LPM support for video and command data
transfers because mipi-dsi framework enforces implicitly using HS mode
for
by default.

> that there really are devices that only support low power video mode.=
 It
> wouldn't make much sense because you'd get a maximum of 10 MHz for th=
e
> clock, which is about 1.6 frames per second at 1920x1080 resolution (=
not
> counting blanking). And even with lower resolutions such as 1024x768 =
it
> would be somewhere around 4 frames per second. And I think it's
> reasonable to assume that we'll see that kind of resolution become ve=
ry
> rare in the future.
>
> So my point is that devices which support video mode will always supp=
ort
> high speed mode for video transmission too. Similarly, if a device
> supports command mode, then it will likely support it in low-power mo=
de,
> and optionally in high speed mode too.
>
>> And what I and Andrzej don't make sure is non-continuous clock mode.=
 Do
>> you know how non-continuous clock mode is related to HS clock?
>
> As far as I can tell non-continuous mode simply means that the host c=
an
> turn off the HS clock after a high-speed transmission. I think Andrze=
j
> mentioned this already in another subthread, but this is an optional
> mode that peripherals can support if they have extra circuitry that
> provides an internal clock. Peripherals that don't have such circuitr=
y
> may rely on the HS clock to perform in between transmissions and
> therefore require the HS clock to be always on (continuous mode). Tha=
t's
> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises that th=
e
> peripheral supports non-continuous mode and therefore the host can tu=
rn
> the HS clock off after high-speed transmissions.

What I don't make sure is this sentence. With
MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations.
One is,
1. host controller will generates signals if a bit of a register
related to non-contiguous clock mode is set or unset.
2. And then video data is transmitted to panel in HS mode.
3. And then D-PHY detects LP-11 signal (positive and negative lane all
are high).
4. And then D-PHY disables HS clock of host controller.
5. At this time, operation mode of host controller becomes LPM.

Other is,
1. host controller will generates signals if a bit of a register
related to non-contiguous clock mode is set or unset.
2. And then D-PHY detects LP-11 signal (positive and negative lane all
are high).
3. And then video data is transmitted to panel in LPM.
4. At this time, operation mode of host controller becomes LPM.

It seems that you says latter case.

I really know that with non-contiguous clock mode, HS clock of host
controller can be disabled. My question is who controls HS clock in
this case. D-PHY or host controller?
In other words, with LPM and MIPI_DSI_CLOCK_NON_CONTIUOUS flags,
should the host driver check these two flags to disable HS clock? or
In this case, does the D-PHY disable HS clock regardless of host
driver?

I think we should make sure that to handle LP and HS modes correctly.

>
> If a device doesn't specify that flag then the host needs to keep the=
 HS
> clock running all the time.
>
>> > The .transfer() function was really designed with initialization
>> > commands in mind, so it doesn't deal with mixing video data and co=
mmands
>> > anyway and for initialization low-power mode should be fast enough=
=2E The
>> > downside is that it may not be optimal for some peripherals, but i=
t
>> > gives us a good solution for the general case since it should supp=
ort
>> > all devices.
>> >
>> > If we absolutely must have faster initialization, or if we come ac=
ross a
>> > device that can only initialize in high speed mode, then I think w=
e
>> > should introduce a new flag to allow DSI host controllers to optim=
ize in
>> > those cases.
>>
>> Originally, mipi-dsi framework enforces implicitly using HS mode for
>> video and command data as default so I added LPM relevant flags - fo=
r
>> video and also command data
>
> Yes, it transmits in HS mode by default. Quite frankly, I'm not sure =
if
> that's really the right default. Given that .transfer() is meant for
> sending synchronous commands, low-power mode would probably be a bett=
er
> default.
>
>> - for host driver can consider Low Power Mode. However, your patch m=
akes
>> it use Low Power Mode for command data as default.
>
> Not as default. It just means that all messages that are sent using t=
he
> standard functions use low-power mode. Drivers could still override t=
he
> default by constructing the messages themselves.
>
>> So your patch would mean that default transfer mode for command data=
 is
>> Low Power Mode, but HS mode for video data.
>
> Exactly. For the reasons specified above, I'd expect peripherals to
> always support command transmissions in low-power mode, whereas I'd
> equally expect them to support video transmission in high-speed mode.
>
> Therefore I think the default should be to send commands in low-power
> mode and video data in high speed mode (by default), because those ar=
e
> the normal cases. If we ever encounter a device that requires somethi=
ng
> different we can always introduce an additional flag/quirk at that
> point.
>
>> Do you intend to control transfer mode - HS or LPM - only for comman=
d
>> data? If so, we would need only one flag, i.e., MIPI_DSI_MODE_HS.
>
> We already have that flag, it's called MIPI_DSI_MSG_USE_LPM. Given th=
e
> above discussion I think it may still be worthwhile to invert the
> meaning of the flag and rename it MIPI_DSI_MSG_USE_HS, so that all
> messages are indeed sent in low power mode by default.

Yes, it may be reasonable. But I'm not sure that there is no any issue
in case of transmitting always video data in HS mode.

Thanks,
Inki Dae

>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
