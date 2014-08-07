From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Thu, 7 Aug 2014 08:58:02 +0200
Message-ID: <20140807065801.GD17340@ulmo>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com>
 <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com>
 <20140806074357.GA13788@ulmo>
 <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:48680 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754103AbaHGG6G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 02:58:06 -0400
Received: by mail-we0-f172.google.com with SMTP id x48so3701710wes.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2014 23:58:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAAQKjZNei31upmmHB_HaVQo8=mRpiBKa4-gri8ftpuWDbS2eew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 02:09:19AM +0900, Inki Dae wrote:
> 2014-08-06 16:43 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> > On Wed, Aug 06, 2014 at 04:11:54PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 05=EC=9D=BC 20:12, Thierry Reding wrote:
> > [...]
> >> > I think that low power mode is more often used for command transmiss=
ion
> >> > (in host-driven mode). I'm not sure how much sense it really makes to
> >> > transmit video data in low power mode. It also seems like low power =
mode
> >> > is what all peripherals need to support (if they can do command mode=
).
> >> > Hence I'd like to propose the attached patch that makes all command
> >> > messages use low power mode.
> >>
> >> To use low power mode, I think SoC drivers should add more codes:
> >> checking xxx_MSG_LPM, and maybe disabling HS clock. My patch does
> >> exactly that,
> >> http://www.spinics.net/lists/linux-samsung-soc/msg34866.html
> >
> > I agree in general that DSI host drivers need to check the flags to make
> > a decision about which mode to enable. But your patch also introduces
> > additional flags that I don't think are necessary (at least for any of
> > the use-cases discussed so far).
> >
> > As I understand it the MIPI_DSI_MODE_CMD_LPM and MIPI_DSI_MODE_VIDEO_LPM
> > flags that you introduce would advertise that the device only supports
> > low power mode for command or video modes respectively. However, I doubt
>=20
> Not so. My intention is to add LPM support for video and command data
> transfers because mipi-dsi framework enforces implicitly using HS mode
> for by default.

No, it doesn't enforce anything at this point. Everyone is free to use
whatever they see fit. Drivers that require low power mode for command
transmission can set the MIPI_DSI_MSG_USE_LPM flag in messages. For
video there's no way to specify what a given peripheral uses, so DSI
host controller drivers are free to do whatever they want.

So for command data we already have a means, and for video data I don't
think it makes sense to use low power mode. Therefore I don't think
these new flags are necessary.

> > that there really are devices that only support low power video mode. It
> > wouldn't make much sense because you'd get a maximum of 10 MHz for the
> > clock, which is about 1.6 frames per second at 1920x1080 resolution (not
> > counting blanking). And even with lower resolutions such as 1024x768 it
> > would be somewhere around 4 frames per second. And I think it's
> > reasonable to assume that we'll see that kind of resolution become very
> > rare in the future.
> >
> > So my point is that devices which support video mode will always support
> > high speed mode for video transmission too. Similarly, if a device
> > supports command mode, then it will likely support it in low-power mode,
> > and optionally in high speed mode too.
> >
> >> And what I and Andrzej don't make sure is non-continuous clock mode. Do
> >> you know how non-continuous clock mode is related to HS clock?
> >
> > As far as I can tell non-continuous mode simply means that the host can
> > turn off the HS clock after a high-speed transmission. I think Andrzej
> > mentioned this already in another subthread, but this is an optional
> > mode that peripherals can support if they have extra circuitry that
> > provides an internal clock. Peripherals that don't have such circuitry
> > may rely on the HS clock to perform in between transmissions and
> > therefore require the HS clock to be always on (continuous mode). That's
> > what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises that the
> > peripheral supports non-continuous mode and therefore the host can turn
> > the HS clock off after high-speed transmissions.
>=20
> What I don't make sure is this sentence. With
> MIPI_DSI_CLOCK_NON_CONTIUOUS flag, I guess two possible operations.
> One is,
> 1. host controller will generates signals if a bit of a register
> related to non-contiguous clock mode is set or unset.
> 2. And then video data is transmitted to panel in HS mode.
> 3. And then D-PHY detects LP-11 signal (positive and negative lane all
> are high).
> 4. And then D-PHY disables HS clock of host controller.
> 5. At this time, operation mode of host controller becomes LPM.
>=20
> Other is,
> 1. host controller will generates signals if a bit of a register
> related to non-contiguous clock mode is set or unset.
> 2. And then D-PHY detects LP-11 signal (positive and negative lane all
> are high).
> 3. And then video data is transmitted to panel in LPM.
> 4. At this time, operation mode of host controller becomes LPM.
>=20
> It seems that you says latter case.

No. High speed clock and low power mode are orthogonal. Non-continuous
mode simply means that the clock lane enters LP-11 between HS
transmissions (see 5.6 "Clock Management" of the DSI specification).

For low power mode the clock is embedded in the signal on the data lane
and therefore independent of the high speed clock.

A peripheral device will set the MIPI_DSI_CLOCK_NON_CONTINUOUS flag if
it supports non-continuous mode of operation. That is, it has own
circuitry to generate a clock that can be used for clocked operations
between high-speed transmissions (when the HS clock isn't available).

> I really know that with non-contiguous clock mode, HS clock of host
> controller can be disabled. My question is who controls HS clock in
> this case. D-PHY or host controller?

I suspect it's usually the host controller. But does it matter? From a
software perspective we usually only access the host controller, so the
D-PHY is usually completely hidden (except maybe for some registers in
the host controller to configure it).

> In other words, with LPM and MIPI_DSI_CLOCK_NON_CONTIUOUS flags,
> should the host driver check these two flags to disable HS clock? or
> In this case, does the D-PHY disable HS clock regardless of host
> driver?

Like I said, low power mode and non-continuous clock are not directly
related. Peripherals may require the HS clock to be always on and still
use low power mode for transmissions.

> >> Do you intend to control transfer mode - HS or LPM - only for command
> >> data? If so, we would need only one flag, i.e., MIPI_DSI_MODE_HS.
> >
> > We already have that flag, it's called MIPI_DSI_MSG_USE_LPM. Given the
> > above discussion I think it may still be worthwhile to invert the
> > meaning of the flag and rename it MIPI_DSI_MSG_USE_HS, so that all
> > messages are indeed sent in low power mode by default.
>=20
> Yes, it may be reasonable. But I'm not sure that there is no any issue
> in case of transmitting always video data in HS mode.

Like I said, with low power mode you can't meet the bandwidth
requirements of any reasonable resolution and framerate, so I would
assume that video data can always be transmitted in HS mode. So even if
some device required video data transmission to use low power mode, then
that should be considered the oddball peripheral and it could be handled
by an extra flag.

By default we should still assume high-speed mode for video data packet
transmissions. We can address those quirks when we actually encounter
peripherals that don't work under those assumptions.

Thierry

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4yN4AAoJEN0jrNd/PrOhwuEP/1XY93snAs+X2pv6+TJs2dFl
AIxVO047yQdlRnuv1ttVHV0UMpF5S7oWQaUABpmmHQ0SqpxKZOd/l1i4JY/RJ60X
2S4UGUVYnOqcVXzkbvL1r/6QqOV1rNXZ9Fc0NOwzW09ahSzBEvVqwKmNFGsDrFU4
HNRMTAR/uqlG3aC1Yt369JHPFB9tAoSEvvIIhlJW+H+Uq/K/1su6KGREcNOUEjzB
o1t4R1O+CG0Ko+62B3N3eQ1Znq9qipYyHnuk/2Ineo6jdMRS+5gJaOX6lTzRRu0K
HW6lV1FfGOg4ABlajL9oREIq7LYbs5xEk2KtTGugy64IM9xXUb7oI90g6bIPCfoR
xeVhL5UsLak3q3B40Wg5U22r0OE6Ar4F8epz8h5TE1B5m25pcL5gnGes+FLs0mab
8yzWPuwN6lDg1bamxxoLGy//udyuB57CkJ49hNtg3M/g1H97r2rGDehxVl9NtRuw
woIZNAWOUaYjenxke4a1zV9AT99Zf3DbOHQjZQ1QTr/d6m2pYVVE0tGM3L0063e+
1xWKC3wxr7zd5We5m+oMhLlPn3jhk2ZNVUHjsyaNzmtXJuaccTRfgSEtJWX41BUR
7+WNbuf+GOwcqvJaib8ytgMMUs7d10GU0DKBvswWnSbGCIdtFBQdy1Pl/T4a9mM8
o+ZmmYCMaM3w3ps3p8X9
=50+J
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
