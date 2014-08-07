From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 7 Aug 2014 15:55:03 +0200
Message-ID: <20140807135500.GA27417@ulmo.nvidia.com>
References: <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo>
 <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com>
 <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com>
 <53E379A8.1020506@samsung.com>
 <20140807131713.GB1540@ulmo.nvidia.com>
 <53E38191.1050308@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:48116 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757587AbaHGNzJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 09:55:09 -0400
Received: by mail-pa0-f50.google.com with SMTP id et14so5455762pad.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Aug 2014 06:55:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E38191.1050308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 10:39:29PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 22:17, Thierry Reding wrote:
> > On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding wrote:
> >>> On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wrote:
> >>>>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >>>>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wro=
te:
> >>>>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.=
com>:
> >>>>> [...]
> >>>>>>>>> As far as I can tell non-continuous mode simply means that the =
host can
> >>>>>>>>> turn off the HS clock after a high-speed transmission. I think =
Andrzej
> >>>>>>>>> mentioned this already in another subthread, but this is an opt=
ional
> >>>>>>>>> mode that peripherals can support if they have extra circuitry =
that
> >>>>>>>>> provides an internal clock. Peripherals that don't have such ci=
rcuitry
> >>>>>>>>> may rely on the HS clock to perform in between transmissions and
> >>>>>>>>> therefore require the HS clock to be always on (continuous mode=
). That's
> >>>>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises t=
hat the
> >>>>>>>>> peripheral supports non-continuous mode and therefore the host =
can turn
> >>>>>>>>> the HS clock off after high-speed transmissions.
> >>>>>>>>
> >>>>>>>> What I don't make sure is this sentence. With
> >>>>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operatio=
ns.
> >>>>>>>> One is,
> >>>>>>>> 1. host controller will generates signals if a bit of a register
> >>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>> 2. And then video data is transmitted to panel in HS mode.
> >>>>>>>> 3. And then D-PHY detects LP-11 signal (positive and negative la=
ne all
> >>>>>>>> are high).
> >>>>>>>> 4. And then D-PHY disables HS clock of host controller.
> >>>>>>>> 5. At this time, operation mode of host controller becomes LPM.
> >>>>>>>>
> >>>>>>>> Other is,
> >>>>>>>> 1. host controller will generates signals if a bit of a register
> >>>>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>>>> 2. And then D-PHY detects LP-11 signal (positive and negative la=
ne all
> >>>>>>>> are high).
> >>>>>>>> 3. And then video data is transmitted to panel in LPM.
> >>>>>>>> 4. At this time, operation mode of host controller becomes LPM.
> >>>>>>>>
> >>>>>>>> It seems that you says latter case.
> >>>>>>>
> >>>>>>> No. High speed clock and low power mode are orthogonal. Non-conti=
nuous
> >>>>>>> mode simply means that the clock lane enters LP-11 between HS
> >>>>>>> transmissions (see 5.6 "Clock Management" of the DSI specificatio=
n).
> >>>>>>>
> >>>>>>
> >>>>>> It seems that clock lane enters LP-11 regardless of HS clock enabl=
ed if
> >>>>>> non-continous mode is used. Right?
> >>>>>
> >>>>> No, I think as long as HS clock is enabled the clock lane won't ent=
er
> >>>>> LP-11. Non-continuous mode means that the controller can disable th=
e HS
> >>>>> clock between HS transmissions. So in non-continuous mode the clock=
 lane
> >>>>> can enter LP-11 because the controller disables the HS clock.
> >>>>
> >>>> It makes me a little bit confusing. You said "if HS clock is enabled,
> >>>> the the clock lane won't enter LP-11" But you said again "the clock =
lane
> >>>> can enter LP-11 because the controller disables the HS clock" What is
> >>>> the meaning?
> >>>
> >>> It means that if the HS clock is enabled, then the clock lane is not =
in
> >>> LP-11. When the HS clock stops, then the clock lane enters LP-11.
> >>>
> >>>>> In continuous mode, then the clock will never be disabled, hence the
> >>>>> clock lane will never enter LP-11.
> >>>>>
> >>>>>> And also it seems that non-continous mode is different from LPM at=
 all
> >>>>>> because with non-continuous mode, command data is transmitted to p=
anel
> >>>>>> in HS mode, but with LPM, command data is transmitted to panel in =
LP
> >>>>>> mode. Also right?
> >>>>>
> >>>>> No. I think you can send command data to the peripheral in low power
> >>>>> mode in both continuous and non-continuous clock modes.
> >>>>>
> >>>>>> If so, shouldn't the host driver disable HS clock, in case of LP m=
ode,
> >>>>>> before the host driver transmits command data?
> >>>>>
> >>>>> No. If the peripheral doesn't support non-continuous mode, then the=
 HS
> >>>>> clock must never be turned off. On the other hand, if the peripheral
> >>>>> supports non-continuous mode, then the DSI host should automatically
> >>>>> disable the HS clock between high-speed transmissions. That means i=
f a
> >>>>> packet is transmitted in low power mode the DSI host will not be
> >>>>> transmitting in high-speed mode and therefore disable the HS clock.
> >>>>
> >>>> What is LPM you think? I thought LPM is LP-11 and HS clock disabled.=
 So
> >>>> for LPM transfer, lanes should be LP-11 state and also HS clock of t=
he
> >>>> host controller should be disabled.
> >>>
> >>> No. I don't think any transmissions can happen when all lanes are in
> >>> LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a packet
> >>> should be transmitted in low power mode (see LP Transmission in 2.1
> >>> "Definitions" of the MIPI DSI specification).
> >>>
> >>
> >> Hm.. I see. I meant,
> >>
> >> if (flags & MIPI_DSI_MSG_USE_LPM)
> >>        disable HS clock <- required.
> >>
> >> transmit command data <- in LPM.
> >=20
> > No. Disabling the HS clock is not required for LPM mode. In fact if the
> > peripheral specifies that it doesn't support non-continuous mode then
> > the HS clock must *never* be disabled as long as the peripheral is in
> > use.
> >=20
> > MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unrelated and
> > need to be considered separately.
>=20
> I mentioned already LPM and NON_CONTINUOUS are unrelated.
>=20
> It seems that you say the only way to transfer command data in LPM is
> non-continuous clock mode.

No, that's not what I'm saying.

> However, you said and also the spec says, "Non-continuous mode simply
> means that the clock lane enters LP-11 between HS transmissions".
> Doesn't *between HS transmissions" mean the command data is transmitted
> in HS, *not in LPM*, and clock lane enters LP-11 between them?

Not necessarily. You can transmit command packets in high-speed mode,
but you don't have to. If you transmit packets in low power mode, then
the HS clock isn't involved in the transmission and the clock lane may
enter LP-11 during the whole transmission (if non-continuous mode is
enabled).

> We have one lcd panel, nt35502a, which needs LPM transfer support
> because it should receive some initial commands with LPM by default
> hardware setting, and we faced with that the panel didn't work without
> disabling HS clock before transmitting command data. How can you explain
> that?

The specification clearly says that (5.6.1 "Clock Requirements"):

	All DSI transmitters and receivers shall support continuous
	clock behavior on the Clock Lane, and optionally may support
	non-continuous clock behavior.

So if you need to "disable HS clock" for command data to be successfully
transmitted, either the panel doesn't comply to the specification, or
whatever you do to "disable HS clock" doesn't do what you think it does.

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT44U0AAoJEN0jrNd/PrOhb1QQAIy1JY8zFOxJzZ5y2Kjd4AP+
myH2zDk/LMUpgo4KNqv7sCu6I5nhxxZtRicEOqpqNBGL+hDC2hPlgo5xtepH+M+B
JvNqyNXLQ7Le1FQPFpCptRz8Vz5PISs5p6ZFOs2WOQoy4fJqjMwWjT9yw15U4o1w
2eJ+iDBCKxnJu/vTmZCEFauk7JxBwO1+95jZIefxKK+o0L5c+60+IA8XnrqkZ26S
NooQCK45liwgyAKFRNrMeB+0Nof49VO1k2zis8HX7zxJunFwPwScM2ZVBacUw511
JMMVTaDi0yFHkimKcMakEL2XNW2VKgJNUxHRsjAtpxsVmASZA8A1rI7B5MzaDF3w
k1hAEo09jaFu/RDGqpGF+ipQC6E1AHDnZrZZ5HoZTtFyScCOuRflCEtVRGxrlqrU
gdwLz2/LfOrRA7oKR6b953jyfU3b9TiYXEXoeEmL8MHnN4HCNsiJvfRyktOzicq8
1phBjspqr7OLjREjHwUd1Av69tR19G8bymXmHXY6BpZMTGOQHfnCVDMj5Optu6FZ
UpXtEFAguONMwOUXX2Y/1IoUh+MPmj6WEAPZgn57CY+bPPaOBm8tALcR6omgHgYT
bvHxuDB+IbrUEyBAstS80dY6g+eQzML0Um4t8ELN/6fanrB1pz1vhiebeyYBXBFP
ch+cVHKBxWBr4xCDuQdR
=B5kg
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
