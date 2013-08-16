From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V5] ARM: dts: Change i2s compatible string on exynos5250
Date: Fri, 16 Aug 2013 09:48:28 +0200
Message-ID: <2100011.uIh4j153YZ@flatron>
References: <1376627178-28649-1-git-send-email-padma.v@samsung.com> <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2162605.LRUKj4zDsu"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:43507 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753068Ab3HPHsh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 03:48:37 -0400
In-Reply-To: <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Padmavathi Venna <padma.v@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, padma.kvr@gmail.com, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>


--nextPart2162605.LRUKj4zDsu
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Olof,

On Thursday 15 of August 2013 21:48:32 Olof Johansson wrote:
> On Thu, Aug 15, 2013 at 9:26 PM, Padmavathi Venna <padma.v@samsung.com> 
wrote:
> > This patch removes quirks from i2s node and change the i2s
> > compatible names.
> > 
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > ---
> > 
> > Changes since V4:
> >         - Mark Brown reverted the below two patches due to below build
> >         failure with>         
> >           exynos_defconfig.
> >           
> >                 "ARM: dts: exynos5250: move common i2s properties to
> >                 exynos5 dtsi"
> >                 "ARM: dts: Change i2s compatible string on exynos5250"
> >           
> >           build error:
> >           DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
> >           ERROR (phandle_references): Reference to non-existent node
> >           or label "pdma1" ERROR (phandle_references): Reference to
> >           non-existent node or label "pdma1" ERROR
> >           (phandle_references): Reference to non-existent node or
> >           label "pdma0" ERROR (phandle_references): Reference to
> >           non-existent node or label "pdma0"> 
> > But with out "ARM: dts: Change i2s compatible string on exynos5250"
> > will break the i2s driver.
> > 
> > So posting this patch now and will take care of posting other patch
> > later after dependent patches got merged.
> > 
> >  arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
> >  1 files changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > b/arch/arm/boot/dts/exynos5250.dtsi index ef57277..376090f 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -405,7 +405,7 @@
> > 
> >         };
> >         
> >         i2s0: i2s@03830000 {
> > 
> > -               compatible = "samsung,i2s-v5";
> > +               compatible = "samsung,s5pv210-i2s";
> 
> Device tree reviewers, this is something to look out for in the
> future. Some samsung platforms/drivers use "samsung,<chip>-<ip>",
> others "samsung,<ip>-<chip>". I don't personally care much one way or
> another, but it really should be consistent.

Hmm, I just did a quick git grep over arch/arm/boot/dts and could not 
really find the "samsung,<ip>-<chip>" pattern.

Except MFC (and without Padma's patch also I2S), which used "samsung,<ip>-
<ip version>, all the compatible values I can see are based on 
"samsung,<chip>-<ip>" pattern.

I believe we discussed this issue several times already and finally agreed 
to use "samsung,<chip>-<ip>" for any new compatible values.

Best regards,
Tomasz

--nextPart2162605.LRUKj4zDsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSDdlPAAoJEIv3Hb8G/Xru/MAQAIEiH8OvzFdsK/29J/XABTWb
VDiLL0o9blut0zUYQ1LHlF4tPlS2ix66y1B8ws7iqHC10RTD47wIN7EijlPkezP1
M0YRJQiYhnfZ6kaVq/pIIdvVRQYHYXXw1eI2xax4TYGUlzpuKD8ETczcDcBIa1OC
muAWGB5brnPxUn76LjTGMpvhNfX++xDlVTfUUyhPAyrnGSiWLoSPSzM/1oQy+Ftr
BgrAw51bykmJdsCAzAg+sbtQifynTv5dgMShKUG55OXoeSKJxz+zkf8/D2doVACn
cBIyyQoOK3MkR5j+BBLo+bujY58EIzFK4rZhXAdAi0u7fTDVMXvx/Xt3Ts8I76S6
55ibXYNtYEJ+dlY3RiZU6GFXI5Gc9KBj7OQU+b4W+8nOG+b1ik60yrOUoS4zxJvr
2PgWvQc8lea9olfra2i8OGzlyxJocCVBRQwfsVzwyngiL9yhfjmlji2vais5CT/b
57IPL5pmYvMhYOeXGnsh4ZIpRbL7KYLF7fSbR2rMxDMLirQuB++zmJ9ZehVV+up8
eHTpOfEbypRb9rssR3Cb2QthAu/CcJWfbyoAkaCOoIvSVwC/3sSyuLkQe9/UI/TG
S5VgmqLKfsjXGOB+YtcWjLnSxlnpfFiyOUPteMGr+OTLJNauoXKMsbP7qCalMPv5
GbXjWx+AsPVFhx3piFou
=6bJp
-----END PGP SIGNATURE-----

--nextPart2162605.LRUKj4zDsu--
