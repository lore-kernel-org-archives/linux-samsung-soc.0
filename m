From: Mark Brown <broonie@debian.org>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 19:56:05 +0100
Message-ID: <20160523185605.GD8206@sirena.org.uk>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <20160523174643.GA33973@sesse.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="80KdhljSN0pKc7w4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60018 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752239AbcEWS4O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 14:56:14 -0400
Content-Disposition: inline
In-Reply-To: <20160523174643.GA33973@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org


--80KdhljSN0pKc7w4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2016 at 07:46:43PM +0200, Steinar H. Gunderson wrote:
> On Mon, May 23, 2016 at 07:06:17PM +0200, Steinar H. Gunderson wrote:

> > Then, there's the issue of why the messages come for each deferred probe
> > attempt. It seems from your message this is about something in the
> > declaration of the device tree; I don't understand the nuances here, but I
> > suppose it's pretty easy?

> FWIW, from reading drivers/usb/phy/phy-generic.c, it looks like vcc-supply on
> the USB phy is supposed to be optional.

No, not unless the device can operate without power which seems
improbable.  Optional supplies are for supplies which may be physically
absent, not to shut up warnings from partially specified system
descriptions.  If there is an optional supply with no configuration of
the device to operate in a different mode without that supply it is most
likely that the API is being abused.  The API is there to support users
with things like optional external reference voltages that may be
missing in some system designs, it's not there to support broken system
integrations.

--80KdhljSN0pKc7w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXQ1JEAAoJECTWi3JdVIfQsWIH/j8NST4t/5HiYzcF88XHiLy+
QqONMi/1QSjcLbK80eGOBp8zM//Dqdakd4ymM/0jAfZ4JLMfUoC1i8nrSoa7aVjP
lDbJr/4dupf96R7vrp+xEoVgo42cMeTQjl6XQ7NGTbU0/eqDijFaqTFW7X7P4a/d
K2OtUHRjLR2LNMrnDATYIZV+v4irRTzNQq9/lCaERNX43eagqxTjVx5d5C+3EXJC
avEGUiA3I7vi5JFyK+Mtc1Mh1BA9PniPnEE18SMKJMnFUMvLkZXej5ZGMeXGJza0
8xNJH+8IRUgesF3Dy8rrMls7PEq9iIF+7NvkWCwe1Fr5aT1ow67LQLwIZAqMqUo=
=4Ijd
-----END PGP SIGNATURE-----

--80KdhljSN0pKc7w4--
