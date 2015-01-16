From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: exynos5: Move initialization code to
 subsys_initcall()
Date: Fri, 16 Jan 2015 13:35:29 +0100
Message-ID: <20150116123527.GG4885@ulmo.nvidia.com>
References: <1421031182-18992-1-git-send-email-jy0922.shim@samsung.com>
 <20150112075019.GB22880@pengutronix.de>
 <54B38946.3020406@samsung.com>
 <54B50BFF.7070101@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:46367 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072AbbAPMfd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 07:35:33 -0500
Content-Disposition: inline
In-Reply-To: <54B50BFF.7070101@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, kgene.kim@samsung.com, naveenkrishna.ch@gmail.com, broonie@kernel.org


--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 02:13:51PM +0200, Tomi Valkeinen wrote:
> On 12/01/15 10:43, Joonyoung Shim wrote:
> > +Cc Tomi Valkeinen,
> >=20
> > Hi Uwe,
> >=20
> > On 01/12/2015 04:50 PM, Uwe Kleine-K=C3=B6nig wrote:
> >> Hello,
> >>
> >> On Mon, Jan 12, 2015 at 11:53:02AM +0900, Joonyoung Shim wrote:
> >>> This is required in order to ensure that core system devices such as
> >>> voltage regulators attached via I2C are available early in boot.
> >> Deferred probing isn't an option? If so I suggest adding the reasoning
> >> in a comment to stop the next person converting it to that.
> >> (And if not, please fix accordingly to use deferred probing.)
> >>
> >=20
> > I couldn't get penguin logo since the commit 92b004d ("video/logo:
> > prevent use of logos after they have been freed") and i just tried old
> > way because i missed the flow to move to deferred probing.
> >=20
> > Fb driver probe seems to be ran between fb_logo_late_init late_initcall
> > and the freeing of the logos.
> >=20
> > Any ideas?
>=20
> Thierry mentioned on IRC that he encountered the same issue. And I
> encountered it also.
>=20
> So... I'd rather not revert the fix, as it's quite a nasty one, and it
> happens while console lock is held, so it looks like the machine just
> froze. But I don't know how it could be improved with the current kernel.
>=20
> We could make the logos non-initdata, but I don't much like that option.
> Or we could perhaps implement some new way to catch the freeing of initda=
ta.
>=20
> Any other ideas?

I think we could still make the logos non-initdata based on a Kconfig
symbol. Another option might be to copy the logo data to memory that's
not automatically freed after init, so that we get better control over
when it is released. I tried tracing the various parts that would need
this data, but couldn't find any place after which it isn't needed
anymore. Specifically it is code that can be executed on every console
switch, so we can't really get rid of it at any sensible time.

I'd argue that if it's needed at every VT switch where the framebuffer
console is activated, then we really can't get rid of it at all. Or we
don't display the logo at every switch and can free the backing memory
right after the first switch for example.

Thierry

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuQWPAAoJEN0jrNd/PrOhu7QP/2oRTrGa7pIqJKelis4xL1qr
m3CxOJhtfyv9+sc1G0fxjR0LNUmBdt1dKT3LZo1ruKkaMOp4Xyp8BMl2fc5FcIM+
vOaG7NfHS2YtNZUAO9B42NFMtE42XYVFFO0G87MT/z9RFLAXyOygXfefyZOhp6Pa
aKzbNKa2TiNivXnRnHWqGTE6ROtVydWvkpf9pyaZBevytxFpuhHamEadcA65mGbs
F5T6C/pz9//yFYXgWx3ed3SCdU8TqgI93eIUEl/8SgYWcWLU1Lu2bVPC3FVjK5to
X0vYNpkFFhrtQwjiIcC2yxoiFCb/MvUXyWIhWhG8tDUbXUZ3bn9GPRCxbH4WHoqy
2421MHOfWuNY71Mr87RIuiH+SYEbLURmyTkMlhirGB7lq1etED8del2YA2yexFwP
wAy4JOpgNZ2rtBXx0sjLB9U1vdH/gws9xBNOvg3gMePu1jewC5LRjLopsh7tU0BC
brZ528A/2mmXaETHFVgGGhjtG9fsKhQ4WZIGYwKIOSa9byAH79o66fatBUFi45UZ
YW7aB8UGkcQVopmZCZlec/QfOw3LoP7JqPCiDwcQpwdwAF0Ip3+AWr8LwtQX11EJ
CzWqyLx+e4IAyN/EAapCqBH49/UnN0S4mqqRbJy7HB7TA4ac7HKYCpyyxqo7mOm3
f78dkC3e7gKkBADjQOMt
=iJEP
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
