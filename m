From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 7/8] ARM: dts: wm8994: Add wm8994 support on smdk5420
Date: Fri, 26 Jul 2013 16:19:02 +0100
Message-ID: <20130726151902.GL9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-8-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bxT+UToQLZc4yXbi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36989 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759106Ab3GZPTG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 11:19:06 -0400
Content-Disposition: inline
In-Reply-To: <1374845812-7803-8-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com


--bxT+UToQLZc4yXbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2013 at 07:06:51PM +0530, Padmavathi Venna wrote:
> This patch adds wm8994 codec node on i2c bus1 and the required
> regulator supplies and properties on smdk5420 board.

This isn't a device tree patch for WM8994, it's a patch for the
SMDK5420.

> +	vdd: fixed-regulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-supply";

These names look wrong - they should reflect the names in the schematic
as they're for human comprehensibility.  This may just be a case of
dropping the -supply.

> +		wm8994: wm8994@1a {
> +			compatible = "wlf,wm8994";
> +			reg = <0x1a>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			AVDD2-supply = <&vdd>;
> +			CPVDD-supply = <&vdd>;
> +			DBVDD-supply = <&dbvdd>;
> +			SPKVDD1-supply = <&spkvdd>;
> +			SPKVDD2-supply = <&spkvdd>;
> +		};

It would be helpful to also add a clock binding (I posted a binding
documentation update the other day, it's in my tree now) but it's not
essential and I suspect it needs some work on the clock driver side
still.

--bxT+UToQLZc4yXbi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8pNiAAoJELSic+t+oim9LkwP/RFLwDxx9/uaIfiHRrosKZsa
/MDgTaWLs8lEMqK3v1MTYeyjz4jRn71gbSF/3Wgzs5U4+HjjvlhL9p26kvUO7DBt
5dv7Bw7shCHbvq7B6gubYlRVEGtP7hXVjnatH9+s2Avfx8Nt8JHAszLAKPMU9qQL
EgyKVTCK+zXKQ65rcZXSHeLdEHmxBAah05S+Z6QxVUCdGU/hsCLK+5S5kZrDAWxG
tGV2zDFspiim7eymqHL29M/1cQA287uLyiebwsOW6FcryjMXkfNQJdTGBSZ+xuTC
tT91PVI6qm2vkZGylxBeUT81v1AboU6MCq8tLQPYcmAL7v9fZf9EWeFXpibtNel3
+qZ7oGTpn+0R3jOP1QjxFxsIX9IrEmwZ5LtdTj1dBwnQfvYOFDgH7nKFWZKRh02g
PMTGbGGh+Z3oUQC7NgjlRvlMJ1lhj1APndki/DTsle4URan0G04ji9G+JFP7kKop
tcuEpy/9JkamomU6I3PUkrdQ+5jk1l4PyKmJybqZTF8zAhaaxlARPJokQcI41cMq
cjm37PcCSEfXjLJoFIOii69pyu8E5Fn2SFl0LUWEP8jQYy+mE+SdbpX9nLBZxt49
IA9iFRS1Gh+scePj3Km9BwXWNtylhRRWjirgyvsDhYhvwS5OUSYhbSOHDK9C01dD
ob4ABdLoxH3ZStRUWp3J
=xvOi
-----END PGP SIGNATURE-----

--bxT+UToQLZc4yXbi--
