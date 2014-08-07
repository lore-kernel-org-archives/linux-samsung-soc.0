From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 7 Aug 2014 15:17:14 +0200
Message-ID: <20140807131713.GB1540@ulmo.nvidia.com>
References: <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com>
 <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
 <20140807065801.GD17340@ulmo>
 <53E32FF6.6050402@samsung.com>
 <20140807090859.GD13315@ulmo.nvidia.com>
 <53E3599F.3020301@samsung.com>
 <20140807110925.GA31594@ulmo.nvidia.com>
 <53E379A8.1020506@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:35741 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757438AbaHGNRU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 09:17:20 -0400
Received: by mail-pa0-f44.google.com with SMTP id eu11so5425513pac.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Aug 2014 06:17:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E379A8.1020506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 10:05:44PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 20:09, Thierry Reding wrote:
> > On Thu, Aug 07, 2014 at 07:49:03PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 18:09, Thierry Reding wrote:
> >>> On Thu, Aug 07, 2014 at 04:51:18PM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 07=EC=9D=BC 15:58, Thierry Reding wrote:
> >>>>> On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> >>>>>> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.co=
m>:
> >>> [...]
> >>>>>>> As far as I can tell non-continuous mode simply means that the ho=
st can
> >>>>>>> turn off the HS clock after a high-speed transmission. I think An=
drzej
> >>>>>>> mentioned this already in another subthread, but this is an optio=
nal
> >>>>>>> mode that peripherals can support if they have extra circuitry th=
at
> >>>>>>> provides an internal clock. Peripherals that don't have such circ=
uitry
> >>>>>>> may rely on the HS clock to perform in between transmissions and
> >>>>>>> therefore require the HS clock to be always on (continuous mode).=
 That's
> >>>>>>> what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises tha=
t the
> >>>>>>> peripheral supports non-continuous mode and therefore the host ca=
n turn
> >>>>>>> the HS clock off after high-speed transmissions.
> >>>>>>
> >>>>>> What I don't make sure is this sentence. With
> >>>>>> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations.
> >>>>>> One is,
> >>>>>> 1. host controller will generates signals if a bit of a register
> >>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>> 2. And then video data is transmitted to panel in HS mode.
> >>>>>> 3. And then D-PHY detects LP-11 signal (positive and negative lane=
 all
> >>>>>> are high).
> >>>>>> 4. And then D-PHY disables HS clock of host controller.
> >>>>>> 5. At this time, operation mode of host controller becomes LPM.
> >>>>>>
> >>>>>> Other is,
> >>>>>> 1. host controller will generates signals if a bit of a register
> >>>>>> related to non-contiguous clock mode is set or unset.
> >>>>>> 2. And then D-PHY detects LP-11 signal (positive and negative lane=
 all
> >>>>>> are high).
> >>>>>> 3. And then video data is transmitted to panel in LPM.
> >>>>>> 4. At this time, operation mode of host controller becomes LPM.
> >>>>>>
> >>>>>> It seems that you says latter case.
> >>>>>
> >>>>> No. High speed clock and low power mode are orthogonal. Non-continu=
ous
> >>>>> mode simply means that the clock lane enters LP-11 between HS
> >>>>> transmissions (see 5.6 "Clock Management" of the DSI specification).
> >>>>>
> >>>>
> >>>> It seems that clock lane enters LP-11 regardless of HS clock enabled=
 if
> >>>> non-continous mode is used. Right?
> >>>
> >>> No, I think as long as HS clock is enabled the clock lane won't enter
> >>> LP-11. Non-continuous mode means that the controller can disable the =
HS
> >>> clock between HS transmissions. So in non-continuous mode the clock l=
ane
> >>> can enter LP-11 because the controller disables the HS clock.
> >>
> >> It makes me a little bit confusing. You said "if HS clock is enabled,
> >> the the clock lane won't enter LP-11" But you said again "the clock la=
ne
> >> can enter LP-11 because the controller disables the HS clock" What is
> >> the meaning?
> >
> > It means that if the HS clock is enabled, then the clock lane is not in
> > LP-11. When the HS clock stops, then the clock lane enters LP-11.
> >
> >>> In continuous mode, then the clock will never be disabled, hence the
> >>> clock lane will never enter LP-11.
> >>>
> >>>> And also it seems that non-continous mode is different from LPM at a=
ll
> >>>> because with non-continuous mode, command data is transmitted to pan=
el
> >>>> in HS mode, but with LPM, command data is transmitted to panel in LP
> >>>> mode. Also right?
> >>>
> >>> No. I think you can send command data to the peripheral in low power
> >>> mode in both continuous and non-continuous clock modes.
> >>>
> >>>> If so, shouldn't the host driver disable HS clock, in case of LP mod=
e,
> >>>> before the host driver transmits command data?
> >>>
> >>> No. If the peripheral doesn't support non-continuous mode, then the HS
> >>> clock must never be turned off. On the other hand, if the peripheral
> >>> supports non-continuous mode, then the DSI host should automatically
> >>> disable the HS clock between high-speed transmissions. That means if a
> >>> packet is transmitted in low power mode the DSI host will not be
> >>> transmitting in high-speed mode and therefore disable the HS clock.
> >>
> >> What is LPM you think? I thought LPM is LP-11 and HS clock disabled. So
> >> for LPM transfer, lanes should be LP-11 state and also HS clock of the
> >> host controller should be disabled.
> >
> > No. I don't think any transmissions can happen when all lanes are in
> > LP-11 state. The MIPI_DSI_MSG_USE_LPM is used to specify that a packet
> > should be transmitted in low power mode (see LP Transmission in 2.1
> > "Definitions" of the MIPI DSI specification).
> >
>=20
> Hm.. I see. I meant,
>=20
> if (flags & MIPI_DSI_MSG_USE_LPM)
>        disable HS clock <- required.
>=20
> transmit command data <- in LPM.

No. Disabling the HS clock is not required for LPM mode. In fact if the
peripheral specifies that it doesn't support non-continuous mode then
the HS clock must *never* be disabled as long as the peripheral is in
use.

MIPI_DSI_MSG_USE_LPM and MIPI_DSI_CLOCK_NON_CONTINUOUS are unrelated and
need to be considered separately.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT43xZAAoJEN0jrNd/PrOhWZAP/A7CZZTTBvl56cEtXWsSKAA/
YqoVqbas8+PL2HInnEPuXGKhP8db0Q+eu2vgFLo8qOM9yB9Hvdu1m1bNSziZ4PoY
chiupVDPgrAt4qjGvMtwxVOIQstoUVXtIdk3pvKY0+va2aHp8qCV1MfpaE/h1dWc
5cR4iT20q73Xa7Z7e6gkv1f+wKkEp74JygRTrSXEIaLzbwUne4ZtOKgUr+blZ0Nj
5G48xmh5XLZCAhhijGfj4XFiPlBsELIk27YlMCgxJaAPixbF/PNenmDUiyrUEh2M
UBUkBz089aTCvQ773tx4ZsHpj7oOyzOx+bMbC6UIXHvuwfASWZkJ37WWor+/aJVs
bHvv3x7poICzqrXLbEs9UbNPSwrHVjeLpQpeI9/1gGcmpTd4ZAhyxtE9YKaeQY4T
KGlRYqN9jhmfaC942cpLHOycuKX4CD4MoTrm0RDGWeNOJKGG401kMTpxu0LV2doK
tGTZHr9I+8F+iDNYBaGq0XiFmmryePIWxxHrKAsmAOcyf1rETHG3ZOkZ0v/ty2/n
BfBF/g2q+hOzHaTefcKP2uMGHWBUZYCdk3w/pdPHM8+IEQNWOAWTERK9R4mDaMTV
Ixa+4b5C4UmRVj8J0xlymDHhv3LsLxibfWa6hSlDYnQ96zWirBEZZCpCEOrTJEAx
XdGk/TYK0TfVZN7NFIIW
=+Mk+
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
