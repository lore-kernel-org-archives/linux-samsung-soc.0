From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V5] ARM: dts: Change i2s compatible string on exynos5250
Date: Fri, 16 Aug 2013 09:53:23 +0200
Message-ID: <1812843.09c8C6xn0E@flatron>
References: <1376627178-28649-1-git-send-email-padma.v@samsung.com> <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com> <13f801ce9a43$823571b0$86a05510$@org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5358050.6ETECvUmk9"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:54020 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab3HPHxd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 03:53:33 -0400
In-Reply-To: <13f801ce9a43$823571b0$86a05510$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, 'Mark Brown' <broonie@kernel.org>, 'Tushar Behera' <tushar.behera@linaro.org>


--nextPart5358050.6ETECvUmk9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Kukjin,

On Friday 16 of August 2013 14:43:17 Kukjin Kim wrote:
> Olof Johansson wrote:
> > On Thu, Aug 15, 2013 at 9:26 PM, Padmavathi Venna
> > <padma.v@samsung.com>
> > 
> > wrote:
> > > This patch removes quirks from i2s node and change the i2s
> > > compatible names.
> > > 
> > > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > > ---
> > > 
> > > Changes since V4:
> > >         - Mark Brown reverted the below two patches due to below
> > >         build
> > 
> > failure with
> > 
> > >           exynos_defconfig.
> > >           
> > >                 "ARM: dts: exynos5250: move common i2s properties to
> 
> exynos5
> 
> > dtsi"
> > 
> > >                 "ARM: dts: Change i2s compatible string on
> > >                 exynos5250"
> > >           
> > >           build error:
> > >           DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
> > >           ERROR (phandle_references): Reference to non-existent node
> > >           or
> > 
> > label "pdma1"
> > 
> > >           ERROR (phandle_references): Reference to non-existent node
> > >           or
> > 
> > label "pdma1"
> > 
> > >           ERROR (phandle_references): Reference to non-existent node
> > >           or
> > 
> > label "pdma0"
> > 
> > >           ERROR (phandle_references): Reference to non-existent node
> > >           or
> > 
> > label "pdma0"
> > 
> > > But with out "ARM: dts: Change i2s compatible string on exynos5250"
> > > will> 
> > break the i2s
> > 
> > > driver.
> > > 
> > > So posting this patch now and will take care of posting other patch
> > 
> > later after dependent
> > 
> > > patches got merged.
> > > 
> > >  arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
> > >  1 files changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > 
> > b/arch/arm/boot/dts/exynos5250.dtsi
> > 
> > > index ef57277..376090f 100644
> > > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > > @@ -405,7 +405,7 @@
> > > 
> > >         };
> > >         
> > >         i2s0: i2s@03830000 {
> > > 
> > > -               compatible = "samsung,i2s-v5";
> > > +               compatible = "samsung,s5pv210-i2s";
> > 
> > Device tree reviewers, this is something to look out for in the
> > future. Some samsung platforms/drivers use "samsung,<chip>-<ip>",
> > others "samsung,<ip>-<chip>". I don't personally care much one way or
> > another, but it really should be consistent.
> 
> Hmm...I think, if "samsung,<ip name>-<ip version>" is possible, it would
> be nice. I remember there are no versions in datasheet for some IPs but
> something have like i2s and mfc. So "samsung,<ip>-<version>" is used
> for only i2s and mfc. But actually there are versions for Samsung IPs,
> no comments for that in datasheet. So I think, if Samsung can provide
> the specific version of Samsung IPs, we can use that like other
> platforms. I will prepare some table for that after meeting with
> Samsung hardware IP team so that samsung platform use one format
> "samsung,<ip>-<version>".

Sorry, I don't think this is a good idea, unless you can force the IP team 
to release a version table containing version of _every_ IP for _every_ 
released SoC, including those historical ones, like S3C24xx and S3C64xx. 
Of course such tables should be available publicly.

In addition, there might be other funny things going on with IPs and their 
surroundings, that could make a need to create several separate compatible 
values for the same IP revision, but on different SoCs, because it was 
integrated in a slightly different way.

I believe we have choses the "samsung,<chip>-<ip>" scheme to avoid being 
dependent upon data that is not always publicly available, which is more 
future- (and past-) proof and also solves the integration problem.

Best regards,
Tomasz

--nextPart5358050.6ETECvUmk9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSDdp2AAoJEIv3Hb8G/Xrulz4P/A4G9KUXc2LG9cX5wHq6fcrl
helNeBmbwECxT26m9eLYuA4EtCLWhFxV8QR0B3xzBuA+1xttQffP6aPH7OKJnqL7
n5zu3M7JjO/AI4ZXibAwtdPrF4q7iwO7eUobthh+jcdaCzfNBcZpgDtPzED9zWEk
SnkNEa35wkQrfmOI5U3T9lwOGFb0E+koTgtkhoWBB+/7835FduAqsWl3aJgaIg4W
30WfgG3bKACUvpmabXJJM+rw22l8XC9Ox5ufYrAIa532MyfCVVMQxcEeURJeHwUC
ntdQLlBuUCwRhrVC0VLV4k++Mv3qREcNsabdXCvM+s7KSB9YF9utOvOrHFqSJQVr
KxpXls0mWv49yvQiE1nEKb/p7qDSJzCt8LdPo5MKzUvSAbAu46FR3UdRWOMtKfqK
fjD1ujO/+hdrmYyJkWR0F2usrC6kXD13g+64D81bAmHtoVPYDdPO4LCnz/TgdPMy
sNAAPd4zkq0ckqN7kl4h5MlYIhGqkW9DPdFK9Nj4WtKIrZt8HzoRnYpXyPMZx2HS
hi7Gj8XQpB46VDn2YQMep6FmaObEoIDTtXzn2RsquPJO87N4wFeC7Fh7Nq+/ueWv
YerMAozOMIicgG3ILIKc29qDvH1lPM16932rw/g7p0ZLSXStu1ZBvJk2WPbzrzxS
behUuFAxV9x9a72x3Ajv
=VbL4
-----END PGP SIGNATURE-----

--nextPart5358050.6ETECvUmk9--
