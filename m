From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC PATCH] ASoC: Samsung: Register the audio platform device
Date: Mon, 26 Nov 2012 14:49:44 +0000
Message-ID: <20121126144943.GM9411@opensource.wolfsonmicro.com>
References: <1352894960-17434-1-git-send-email-padma.v@samsung.com>
 <1352894960-17434-2-git-send-email-padma.v@samsung.com>
 <CAAgF-BdHm_VFB-xsZ6kpAu5+9+1yMNVVGM_og+H3QghWQuf8+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GeONROBiaq1zPAtT"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59636 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754526Ab2KZOtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 09:49:46 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BdHm_VFB-xsZ6kpAu5+9+1yMNVVGM_og+H3QghWQuf8+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com


--GeONROBiaq1zPAtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 26, 2012 at 08:15:12PM +0530, Padma Venkat wrote:
> On Wed, Nov 14, 2012 at 5:39 PM, Padmavathi Venna <padma.v@samsung.com> wrote:

> > +module_init(smdk_audio_init);
> > +module_exit(smdk_audio_exit);

> Ping. Any comments on this patch?

Don't send contentless pings and delete irrelevant context from replies.
Please refer to the feedback I sent in response to Sangbeom's pull
request - in short, this isn't the way to do this - do what the other
platforms do.

--GeONROBiaq1zPAtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQs4F/AAoJELSic+t+oim9sRUP/iajPpRYrQUgv8CWJ+fYKzXi
FHOHuSlXV1aN/DfSWtREGZVTPPlHo5wN4G67miqJf2vWmdakdMlUOi4sYdIKDmug
dNP/euAcbosYNS3n7C8GLueI2VAYxmgB1jkEEw+7k/d7lmu5riMpQfupISpxHlbr
wp4VygWWcVtLmqRAzVqOYucpzV67rpU/fwqKtFZvQ6Icl4nZZwAy55aIGOzaqekc
ARMdc1MY8r/EqtuoK1za/FKagdVX3kwbiRVOvE1LzCohohCg8RUkmahaDzDmrOjF
dzO/Y2+2xvNvkrDIRqfzDylKDKJ174f3/liJJPJ84qYK7Qi/VcF1aKBVQH6Wy7cO
8bUigFrZJri34cNZdfKYZSIEEBmnmnGr06PnuII9QX4MPCmEIZBSdEhLf/6uBbh2
TKjw050j11Ffgxe9I83mr3BOy0a76PCItGI4/p75gsha+ST2lxEuq1LZKqO1HxXv
pqZEucfs/ULA3RgNAtJykZBfD2lK8Bx+eYWDpHzoQR7hXIFQnG++SBFwKFpFcv0b
1DRtpXHFUXzkFEjvihdlKmhCr3DE6YaYf/9q9H9Kvv0AIxISYfjruYmScU6V2CE5
3aZJ4xKjRSiOTg+ftZijVgexd3H/dIF/ECKcn7VRHnOxJy8vzGmZDBPfI2pwaCRx
bOmssElZ246BJLHNoeE4
=jBzo
-----END PGP SIGNATURE-----

--GeONROBiaq1zPAtT--
