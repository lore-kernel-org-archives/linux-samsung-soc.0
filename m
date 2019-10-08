From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 12:50:25 +0100
Message-ID: <20191008115025.GF4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191008101709.13827-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 12:17:09PM +0200, Marek Szyprowski wrote:
> Commit f8702f9e4aa7 ("regulator: core: Use ww_mutex for regulators
> locking"), regardless of the subject, added additional call to
> regulator_balance_voltage() during regulator_enable(). This is basically
> a good idea, however it causes some issue for the regulators which are
> already enabled at boot and are critical for system operation (for example
> provides supply to the CPU).

If regulators are essential to system operation they should be marked as
always-on...

> CPUfreq or other drivers typically call regulator_enable() on such
> regulators during their probe, although the regulators are already enabled
> by bootloader. The mentioned patch however added a call to
> regulator_balance_voltage(), what in case of system boot, where no
> additional requirements are set yet, typically causes to limit the voltage
> to the minimal value defined at regulator constraints. This causes a crash
> of the system when voltage on the CPU regulator is set to the lowest
> possible value without adjusting the operation frequency. Fix this by
> adding a check if regulator is already enabled - if so, then skip the
> balancing procedure. The voltage will be balanced later anyway once the
> required voltage value is requested.

This then means that for users that might legitimately enable and
disable regulators that need to be constrained are forced to change the
voltage when they enable the regualtors in order to have their
constraints take effect which seems bad.  I'd rather change the the
cpufreq consumers to either not do the enable (since there really should
be an always-on constraint this should be redundant, we might need to
fix the core to take account of their settings though I think we lost
that) or to set the voltage to whatever they need prior to doing their
first enable, that seems more robust.

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ceAEACgkQJNaLcl1U
h9DWoAf/dbUB8lRI6R+Hiquem9S07NhSAZKa1EzqebKLcAZ9dLQMvsXS+i8xm+uY
fUCKtKGaxmGAq8NE3Mf9rrwR3J4xRt0HmJNcQjH7zlb+rq8Vg2m6dwr+Vk1sm+AK
gHX0zgtg8sCvTJekKSso8/kb/ac/qhKn7MZAryUFaXLvOWWdwGlPjl49BrqEAej0
GCem17IW9Xa8qZ3F+woV41hdO95n8HmTS9nj0NWhZGFUu9LCAea3cMp5QcQ6AUNS
099DSn2Y/opczEuevMQALSFMiAvBToZRUzO1+HuEfwjpxbKY1ErJ/yIMUySnZQI2
m+88vWiJU1TxV7C3gTg/cAeuEhr9FQ==
=dYbd
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
