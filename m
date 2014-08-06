From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Wed, 6 Aug 2014 09:43:58 +0200
Message-ID: <20140806074357.GA13788@ulmo>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com>
 <20140805111223.GA27340@ulmo>
 <53E1D53A.9050703@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:49312 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753855AbaHFHoC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Aug 2014 03:44:02 -0400
Received: by mail-we0-f179.google.com with SMTP id u57so2197585wes.24
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2014 00:44:01 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E1D53A.9050703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, treding@nvidia.com


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 04:11:54PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 05=EC=9D=BC 20:12, Thierry Reding wrote:
[...]
> > I think that low power mode is more often used for command transmission
> > (in host-driven mode). I'm not sure how much sense it really makes to
> > transmit video data in low power mode. It also seems like low power mode
> > is what all peripherals need to support (if they can do command mode).
> > Hence I'd like to propose the attached patch that makes all command
> > messages use low power mode.
>=20
> To use low power mode, I think SoC drivers should add more codes:
> checking xxx_MSG_LPM, and maybe disabling HS clock. My patch does
> exactly that,
> http://www.spinics.net/lists/linux-samsung-soc/msg34866.html

I agree in general that DSI host drivers need to check the flags to make
a decision about which mode to enable. But your patch also introduces
additional flags that I don't think are necessary (at least for any of
the use-cases discussed so far).

As I understand it the MIPI_DSI_MODE_CMD_LPM and MIPI_DSI_MODE_VIDEO_LPM
flags that you introduce would advertise that the device only supports
low power mode for command or video modes respectively. However, I doubt
that there really are devices that only support low power video mode. It
wouldn't make much sense because you'd get a maximum of 10 MHz for the
clock, which is about 1.6 frames per second at 1920x1080 resolution (not
counting blanking). And even with lower resolutions such as 1024x768 it
would be somewhere around 4 frames per second. And I think it's
reasonable to assume that we'll see that kind of resolution become very
rare in the future.

So my point is that devices which support video mode will always support
high speed mode for video transmission too. Similarly, if a device
supports command mode, then it will likely support it in low-power mode,
and optionally in high speed mode too.

> And what I and Andrzej don't make sure is non-continuous clock mode. Do
> you know how non-continuous clock mode is related to HS clock?

As far as I can tell non-continuous mode simply means that the host can
turn off the HS clock after a high-speed transmission. I think Andrzej
mentioned this already in another subthread, but this is an optional
mode that peripherals can support if they have extra circuitry that
provides an internal clock. Peripherals that don't have such circuitry
may rely on the HS clock to perform in between transmissions and
therefore require the HS clock to be always on (continuous mode). That's
what the MIPI_DSI_CLOCK_NON_CONTINUOUS flag is: it advertises that the
peripheral supports non-continuous mode and therefore the host can turn
the HS clock off after high-speed transmissions.

If a device doesn't specify that flag then the host needs to keep the HS
clock running all the time.

> > The .transfer() function was really designed with initialization
> > commands in mind, so it doesn't deal with mixing video data and commands
> > anyway and for initialization low-power mode should be fast enough. The
> > downside is that it may not be optimal for some peripherals, but it
> > gives us a good solution for the general case since it should support
> > all devices.
> >=20
> > If we absolutely must have faster initialization, or if we come across a
> > device that can only initialize in high speed mode, then I think we
> > should introduce a new flag to allow DSI host controllers to optimize in
> > those cases.
>=20
> Originally, mipi-dsi framework enforces implicitly using HS mode for
> video and command data as default so I added LPM relevant flags - for
> video and also command data

Yes, it transmits in HS mode by default. Quite frankly, I'm not sure if
that's really the right default. Given that .transfer() is meant for
sending synchronous commands, low-power mode would probably be a better
default.

> - for host driver can consider Low Power Mode. However, your patch makes
> it use Low Power Mode for command data as default.

Not as default. It just means that all messages that are sent using the
standard functions use low-power mode. Drivers could still override the
default by constructing the messages themselves.

> So your patch would mean that default transfer mode for command data is
> Low Power Mode, but HS mode for video data.

Exactly. For the reasons specified above, I'd expect peripherals to
always support command transmissions in low-power mode, whereas I'd
equally expect them to support video transmission in high-speed mode.

Therefore I think the default should be to send commands in low-power
mode and video data in high speed mode (by default), because those are
the normal cases. If we ever encounter a device that requires something
different we can always introduce an additional flag/quirk at that
point.

> Do you intend to control transfer mode - HS or LPM - only for command
> data? If so, we would need only one flag, i.e., MIPI_DSI_MODE_HS.

We already have that flag, it's called MIPI_DSI_MSG_USE_LPM. Given the
above discussion I think it may still be worthwhile to invert the
meaning of the flag and rename it MIPI_DSI_MSG_USE_HS, so that all
messages are indeed sent in low power mode by default.

Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4dy9AAoJEN0jrNd/PrOhipEQAK2ms2AUKJ5I39TKHDyJU92v
XZ39DsXdL7K4pb4/HxJ7JeFozJLu1Rf6/iRpaDQCpNb0vOcQ0Pi3PdmLv5/2rnjg
PhvRBpmv86RbwEWH1c9RtF2029yepYbulhyoV6JR+xTYJhNU6chbW/giE+vPyhHu
+J3otjp4Am2BxXwpOR59rsAa4KYGl5ULialj8M8t6DTPVfVAL9U78OTXnSk4yTbd
x7RHGNx/O3HsrQ9GYZAvAWNffbbmXM5VAgLz4sRNRabykSvfXiZvgDNQSCLs9qK+
dQq4AAzG7pCBKAA82+r4F9URR4jCQxVrUjotZj6Ygs9MavjEM4LSpuP7AdCZq4y2
wFexzGebTn6VJMA9HDRnteQOPj5BiopjNIRAQWvDmq40JO1f0bNiN6hKLX52dM0V
LDozP7mSwtsPliMM4xtjeIQC5JCV66OSpvjc8wUqDkmm8mJWbLnj/PgAr+9d/KU5
ZqdyJjZ3aGJ1aCKy4SvyIA31a7iXFwBn9Cl/bLjocaUVWELbqoHaTkGoHhyQ84+P
7oBBgL24Bdco63OAT2VZuajMV78Nj74XPDtZaJn8PFhnFakGqB58fF/XTk9guRwL
zB56QzElSPgM5Tirbz4bGMqSq7KGA5mEQ4xGquiNkmcFLLXd3jUETIu4jBe9aYQW
ZwBtOVh3xq5sdmOGGOGu
=tXfP
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
