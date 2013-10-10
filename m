From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/5] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 10 Oct 2013 10:37:08 +0100
Message-ID: <20131010093708.GC21581@sirena.org.uk>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
 <1380670860-17621-4-git-send-email-seanpaul@chromium.org>
 <CAAQKjZN_r-=-sj=Vb-o-KUS4ab5=cjCq1ni3VZeMeVc3NL=MMg@mail.gmail.com>
 <CAOw6vbLiJLLKn=gb1=j5TBeM0ijEK13+goG-=mw7MZTyNT1kpQ@mail.gmail.com>
 <CAAQKjZPwyKCpju4Ndd+MB_aN24-zA5xTHFsFsun2617h7YT6dw@mail.gmail.com>
 <CAOesGMgKastzdFHYQzyL8gxkBN=86wFZ4jbgP8BHxfkOuZvJxg@mail.gmail.com>
 <CAAQKjZMhovKLxNfnXnbF-6diM2zF1cWyi+xHGyL3v83vBh4p6g@mail.gmail.com>
 <20131009182905.GY21581@sirena.org.uk>
 <05c701cec56f$b79eea50$26dcbef0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d03Wvsl4acTHE0IU"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <05c701cec56f$b79eea50$26dcbef0$%dae@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sean Paul' <seanpaul@chromium.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--d03Wvsl4acTHE0IU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2013 at 01:18:05PM +0900, Inki Dae wrote:

> > > I still think the pin could be replaced with a regulator. But
> > > lvds-bridge node has "powerdown-gpio" property - it say this board
> > > will use gpio pin - specific to board.  So it seems no problem.

> > No, don't model things that aren't regulators as regulators - it's just
> > confusing from a usability standpoint and causes breakage when the pins
> > don't behave like regulators.

> It seems that there was your missing point. That _is not_ what I mentioned.
> I mean that other boards can use a regulator instead of gpio pin.

What I'm saying is no boards should use a regulator to control that
GPIO pin, obviously if they're controlling the actual regulators that's
fine but the reset signal should not be controlled via the regulator
API (there are some unfortunate cases where people have done that
already but let's not have any more).

--d03Wvsl4acTHE0IU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSVnVBAAoJELSic+t+oim9gEQP/1GHEMDVINGUFY2SpF1Vfzey
hByjoMy60N6KNCTmnMryf9AE3gxMmRKKhI3yLjPObXEBIt6qhtyzBb6M8csmidNJ
UNShBARw+LswoLGjxwWmN3XcO0+7bSJQ4KTcm6lONelZv8UG6tW5YKZRrR2viOwu
OQ0UL17QGTiYkdSgUo1s6viD4d7AFWZL93Gcs/W0UmLVxms6K12Cu/wgsRF9g9Jl
tnL8R2H1Ddn1uzEToALua+oM/jDNw7Lb3jeZrhYVwDbWCEPyePl9gE0Jh3fCiKYT
jrYDceWVv4z7G1l1tU2aAA2tnwWaUKuIspUIxWCStka30HjpXc2JdSUUXC7kvdyu
CHeVK8N7j6ETv9P+Eb+osdQ7K1bZJBMxrY6ABpUvhhWfrsrxiqOZcZXtsnzomrv4
yhZeR99u3bG9GA+wkmdUuFeOk/u5NhyFNMxrHpeEZ6AoVFZ+ubisgLkQYtabXZLe
4YdNuXz8ehu96YhdJ6keJJ+yu5Z4wASojpYeLxu9+XP8ZSTPsFHwd+diNwnY5YJH
JIKfCh1R8diuw0kobiuntgw3EDQ7GgCePoxkK8ySgHlz0Ol2nPq+9oUSbl5HoBwF
05Z6KWjj90Vbb4aOi+f75K/KzsAQhixnioJzXhnUDGcRb5WaOzy7Kdp97BjcF4Ao
oj3JL2VHbUpEPkZzrcID
=dV4p
-----END PGP SIGNATURE-----

--d03Wvsl4acTHE0IU--
