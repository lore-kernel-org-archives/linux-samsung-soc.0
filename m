From: Mark Brown <broonie@kernel.org>
Subject: Re: exynos-drm-next todo work.
Date: Fri, 5 Jul 2013 19:12:41 +0100
Message-ID: <20130705181241.GH27646@sirena.org.uk>
References: <007401ce6bed$bc802920$35807b60$%dae@samsung.com>
 <CAPdUM4M4fyiKUES-BW4BKBL_0nfPjNY5Fk_H7i2FUWyxhSv_nA@mail.gmail.com>
 <007e01ce6ca8$35c23a70$a146af50$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5KSOmTRw8bduLOJz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:39317 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212Ab3GESMp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 14:12:45 -0400
Content-Disposition: inline
In-Reply-To: <007e01ce6ca8$35c23a70$a146af50$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Rahul Sharma' <r.sh.open@gmail.com>, linux-samsung-soc@vger.kernel.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>


--5KSOmTRw8bduLOJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2013 at 01:48:15PM +0900, Inki Dae wrote:

> > Related to HDMI sound support in Alsa, I have posted a working RFC
> > "exynos-hdmi to CDF complaint display driver". It registers a separate
> > sound card by registering hdmi audio codec dai and cpu-dai, as you
> > mentioned. But there is a problem with this approach that I2S being the
> > single cpu dai for HDMI and Speaker sound card, only one card can
> > support playback at a time.

> > I would like to work on this to provide a more refined solution.

> Thanks. However, I think it's not good to use the CDF framework to interface
> between ALSA SoC DAI driver and DRM HDMI driver. The purpose of the CDF
> framework is to provide common interfaces to display bus drivers to Linux
> framebuffer and DRM KMS based display controller drivers as long as I know.
> So my opinion is to implement ALSA Soc DAI driver-it seems like possible to
> use as is-based on a new common framework that the other can also use it.

You guys really want to be discussing this on the ALSA list and CCing
the ASoC maintainers...  I do note that OMAP and SH both have HDMI
support in mainline, whatever they're doing seems like a good place to
start.

--5KSOmTRw8bduLOJz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR1wyWAAoJELSic+t+oim9UTsP/22VW58SH2TLKAlQDLqxZMSp
KeTGxG6+RfYBVaCna8kBdAgGXNDpwAPOZIXj1czzEkEbx/VCGGsJTNCZVt5MJzam
1B+xtp3NixDdMxIIb07w8WSOsJM1xNectF8WwGDIqDviNcUvWzEdQ2o46BkO2ODu
QDVCrS4Rgo6PbpLNIZk5nsBiPmcUmjd2idKWngzuJZuQyvYnprgfg5K59eX7zog+
+Rm0T0TWp35NiHy0V8AwMhYkfTe92n7DVa7dUaQiP4i62t9H/T4ydkQoJKj3sLNr
am7yGufpwrS1WHq9yJAH6BjMq+XPT26camFT7BwnFad3S6+roeiQOidEapiBgTsQ
eWeL7jRLKy4DIU2IF3Ft7pfgHNrCzDaNBsGTgC/v0cNe7R3pZCbPe7DCUbu7P91+
Ay9d9zZ39/SDuJNa26SpmkO42sDko5L3eXCAbhHW309OlshZZPiN5/W3wIIc9s+g
HR95SHqExLPCvFGQ61IKshJG4DIeRrZ7Y3vDQdP3BoHBnDlquDAAcXGxjKtOFDOn
TzhUQpHV/6/xr8dCBIjTLGA9/zmU896dTYrq37A8cwebGWTMZ77D0wzsPIzNy9Gz
8zNBJLLXe1pVa8Rrw6Mi4N3JBnkxgCAN8487vpGwhFMLhD4/UdSENyUS5w/ozPCY
Yb6WbntU/LaWUaqfub8J
=jwuR
-----END PGP SIGNATURE-----

--5KSOmTRw8bduLOJz--
