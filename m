Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD4D374EA;
	Tue, 17 Sep 2024 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726607991; cv=none; b=R6oWD6wG1b+vWmHSaj6G4ICX/W4eaQOQao/ApMIUeJ7EOMhyypica+ok6yw481HwHa401uYE6SMTCrzowWOX9NgZPaXFc0B61NBX4hB7KiyPNo1iKVhaX5Yk08LrPnXRnRYiqkG6mvRPrjZhnTLmP37LUwcWgMVNTEO6Q4NKtyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726607991; c=relaxed/simple;
	bh=19cw6zZQnCL1Bd8cjqmQv07SG13S1pvml2RAS/6079Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8WuID/bpfg695jtu3LKxpCVLdO2uw+kEcXB6mvly3x3EP/r1qw/H5wMbG1y85oV8Usevc6HnHgcI/FOZHc+5nn8kt1AqbDega/TRD4tAZbV9iv1/vVzIq1dlIM766s3j4spBPlVhYv6BDO4f4+9I9dVH7pxu4ffuS6q+u+ognk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfPVKvzp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfPVKvzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD86C4CEC5;
	Tue, 17 Sep 2024 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726607991;
	bh=19cw6zZQnCL1Bd8cjqmQv07SG13S1pvml2RAS/6079Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfPVKvzpVxZaOjs6873tkODB8DNV2a1E6aZBNy8THW7mfTr+ocmetwfaUhEU9ndWT
	 1IZ2m7bbwCfpYEGRG3PlRDr8JNeHplvjdl5iVStvWa942CGaUT5Cgvac4GqLYQO+H9
	 oXUrOea+4ZapzIVMAY1JgmjCtrqK3Xnn5LuUnxmiMUhBMTjSXdn+MXrcxZQT7sR1SU
	 iKUaijv0/ds5I9fLSpADxwbxBoUOjMM6sA8e/dmLfn2VlrAHUG7SFYiMJTI4UjY84g
	 F/Bmj8756t2UepygavD4gOCTygo3JcwZndNE1WNgCfCTxKhICUJ4oy/6bUVOrrDVOM
	 CHaM7lB4JOsFA==
Date: Tue, 17 Sep 2024 22:19:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] MAINTAINERS: add myself for Google Tensor SoC
Message-ID: <20240917-pentagon-veteran-952cdac50e6c@squawk>
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
 <20240916-max20339-dts-v1-3-2f7ed7c24e83@linaro.org>
 <CADrjBPoOZu_79OaXaq=5KzUT=eEhRdESwK7Np74Nsjx7cTRm8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ClZoFYlarA2I48nY"
Content-Disposition: inline
In-Reply-To: <CADrjBPoOZu_79OaXaq=5KzUT=eEhRdESwK7Np74Nsjx7cTRm8g@mail.gmail.com>


--ClZoFYlarA2I48nY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 08:42:03PM +0100, Peter Griffin wrote:
> Hi Andr=E9,
>=20
> On Mon, 16 Sept 2024 at 17:58, Andr=E9 Draszik <andre.draszik@linaro.org>=
 wrote:
> >
> > Add myself as maintainer for the Google Tensor SoC alongside Peter.
> >
> > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2cdd7cacec86..b6edb21b4f2d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9669,6 +9669,7 @@ T:        git git://git.kernel.org/pub/scm/linux/=
kernel/git/chrome-platform/linux.git
> >  F:     drivers/firmware/google/
> >
> >  GOOGLE TENSOR SoC SUPPORT
> > +M:     Andr=E9 Draszik <andre.draszik@linaro.org>
>=20
> Please update this to: -
>=20
> +R:     Andr=E9 Draszik <andre.draszik@linaro.org>
>=20
> The definition of which is
>=20
> R: Designated *Reviewer*: FullName <address@domain>
> These reviewers should be CCed on patches.

I find this email really weird. If you discussed something off-list and
Andre misunderstood that you wanted him as a reviewer not a maintainer,
that's fine - but you need to explain why to the rest of us. If it were
not for the fact you share an employer, I'd find this to be a kinda rude
way of denying someone co-maintainer status.

--ClZoFYlarA2I48nY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZunydwAKCRB4tDGHoIJi
0g8MAP9vzQIab4yoFF2S8dlflBDMtFEpaXoOJ9P68KtWhnokQwEA3uKe70t2le+L
HDDr4hG7THiFy8nJNo1GVR1mq0jaCgc=
=JH5Y
-----END PGP SIGNATURE-----

--ClZoFYlarA2I48nY--
