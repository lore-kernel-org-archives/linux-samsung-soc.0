From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 7/8] ARM: dts: wm8994: Add wm8994 support on smdk5420
Date: Mon, 29 Jul 2013 14:43:11 +0100
Message-ID: <20130729134311.GX9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-8-git-send-email-padma.v@samsung.com>
 <20130726151902.GL9858@sirena.org.uk>
 <CAAgF-Be8SNxTZv1yFCwH6yJ-O_3R4reh=3y+pSCLJYW7S9TkUg@mail.gmail.com>
 <CAAgF-Bexp_fGT8KV+TQ0_kZLJBtq7UK=TG4eYRA6qpTSL+scxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EbAMXmY8hHYE2yOw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45757 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462Ab3G2Nnh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:43:37 -0400
Content-Disposition: inline
In-Reply-To: <CAAgF-Bexp_fGT8KV+TQ0_kZLJBtq7UK=TG4eYRA6qpTSL+scxg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org, Tomasz Figa <tomasz.figa@gmail.com>


--EbAMXmY8hHYE2yOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2013 at 05:31:16PM +0530, Padma Venkat wrote:
> On Sat, Jul 27, 2013 at 6:46 AM, Padma Venkat <padma.kvr@gmail.com> wrote:

> >>> +     vdd: fixed-regulator@0 {
> >>> +             compatible = "regulator-fixed";
> >>> +             regulator-name = "vdd-supply";

> >> These names look wrong - they should reflect the names in the schematic
> >> as they're for human comprehensibility.  This may just be a case of
> >> dropping the -supply.

> When I posted the same patch for smdk5250, you asked me to club all
> the same supply regulators. So I clubbed AVDD2 and CPVDD. So any other
> better name for representing both supplies?

No, I'd have told you to combine things taht come from the same supply
on the board - things like the speaker supplies for example aren't going
to be coming from separate places.  The names should reflect whatever
the names on the schemaric are, like I say that's probably just removing
the -supply.

> >> documentation update the other day, it's in my tree now) but it's not
> >> essential and I suspect it needs some work on the clock driver side
> >> still.

> > OK. I will check this.

> As per schemata, input clock to MCLK1 is an oscillator clock with
> 16.9MHz and MCLK2 not showing any input clock. So here I need to add a
> fixed rate clock with 16.9MHz as MCLK1 in the smdk board file.

> Is it correct?

Yes, in the DTS (or to XCLKOUT on the AP?).

--EbAMXmY8hHYE2yOw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR9nFrAAoJELSic+t+oim9VXgQAJj6brR4sOv48dN6vX8rmKW0
OcT8mbEckhpHlf8mNE4KJS8Y7AaktBwuwDQ5KVxwRw4CAa5pMeiQnX+l7HuuNUeA
wOU1iiYvZaUtx2C+3IliwaNr21nVLYZmjX5V3J9cBYn/ezLJG9GMs1yR6q6RmxTL
ZEUr39wiG+GyXMYeCUa4W3pRme0DWn6XwMRjsBm8kN16OqXJGXtVImkQdhGKJ77h
h2ek3F9VitmJJDrcb8Rnnct2iMr6J+crNk+vi0OsLPebNrYaX1HNAnPK+WHreoVl
ULyPtq5MAzmgU23Jwe0Jg23k8NY65zya6Vkmdos8TU5lBESMhQGefI53ztUAFfSN
/H5Zr+9HGrDMM4t14Fij1hBy2niTx0I4Aqac6itky0KQXaAt5lJYskRZuJbURvog
lmpK2B3MuqaYziiidNcpOYXWJLBAfL567hTpRZAsCgvGo6/KG2U/4c6K3ZMaL62R
radsF4wGhtKIRDG21dQnKEa2fG0WYs7ndCpdeDBUawflQDiRPk+MHo8haWcNewso
4d3hjI5GK4UNoMxH2FVIz4U4pI1Be9M6+SoDVUZV7DkVQiTwVPUfKRBcAAN0XGsV
iH7S+fne6/1wg8wBTFP/eN475sXft4m8JRWyKv8KmKqg9aEncmyZMk8Ke6k3tc1U
UhaNgdG7X0BN7Y06cY55
=7Ldy
-----END PGP SIGNATURE-----

--EbAMXmY8hHYE2yOw--
