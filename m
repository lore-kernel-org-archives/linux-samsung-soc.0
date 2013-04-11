From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Thu, 11 Apr 2013 17:28:27 +0100
Message-ID: <20130411162826.GG9243@opensource.wolfsonmicro.com>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <2359597.ofbj7Kvioz@flatron>
 <5357756.gKmBOZlWcd@flatron>
 <201304110035.47776.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UD9uuWeujuEvWfkY"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47830 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752796Ab3DKQ2c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 12:28:32 -0400
Content-Disposition: inline
In-Reply-To: <201304110035.47776.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de


--UD9uuWeujuEvWfkY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2013 at 12:35:47AM +0200, Arnd Bergmann wrote:

> Sorry for not replying earlier. My idea for the register level interface
> was to create a platform_device for each PWM, e.g. using the mfd_cell
> infrastructure. You can then pass a "struct regmap" as the platform
> data for each child of the timer node, and all the DT handling code
> can stay in the parent driver.

Dunno if it helps or not but there's also dev_get_regmap() if you're
passing the struct device around or can fish one out of thhe parent.

--UD9uuWeujuEvWfkY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRZuSgAAoJELSic+t+oim9SRYQAI6tkVO1YlHCCu157FkBEmu2
StBS/C7zfY1cSYIz62c6sBQIxjxFqLVDHZ0EzPY8kgA7XclPWbdI9b6tG/xnMJEW
b5pztpG37rrbAT4wgNa04pwOy/CO9WMxEMKPU5gQle4hs/IKGjdNo12jfLspVm9X
iX8N6eaJrMrvEr7r+6HaLoszp2GcRwxwiZUDoXkgLe21P6QRJwnAYAMNbW4XTcLV
HD14el6GftM9b4eTwltIqkSzeHeo2nCKbUDCRNXM6+bWLNjQtoVy7UuFw5HCBgv/
TDKerY/+deYrzlAo+CWHUSWwN8tcPfDJ87l5uURaBE6Ri9iiIH8RrkJfG6BpKo1U
mYEpeybEtrSu89jIR8oUSFILLskJomhKQh+IFfA1Mt9mpRMX8cb2YRJF2nTJxJHU
ZBWM4A5fKxUHvTHCe8ci7wLsS9UXnSv7r+UZf81ZIyDriZxZ4f1Im+PViTjsjE0g
fDRNwTdT3826QDZa00t/Rh3AGX/CiDG/ZdPDo03Sy+uS6q3tIPnhGmKNtNO3fo5L
6fA+tmM8vkeH4emQmiPBacDPL6d4oZ/Mz/TeJg83QDksN4UhIanRiJE+HGyy23RE
icYv+7vRb9oyKOxg7ZeZF3mk+Li7b+pkki9I95ozhcKZCWbPldva+9osFCdcLfQf
g2WgWqSIsGnRTyUHBAPe
=QH/f
-----END PGP SIGNATURE-----

--UD9uuWeujuEvWfkY--
