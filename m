Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B201200B89;
	Wed, 27 Nov 2024 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725276; cv=none; b=tfeJqXnP2sGnJ4RzwG6Wq5Aa7gk5BGWvNNGZIHHSIenC/sr2NU4vSZ/EmqLw5c7AaF3VP4I4K9pqTxBuL27vJwqbya6YO3qJglBe0a/+2vE5GByb9fyLCQIsTcXBuAvT6IFpIMpgcu6W+Ki/q03RxzbGytbQYaywxjVy3qjELnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725276; c=relaxed/simple;
	bh=hB9Xh72VW9EY+zK59eMd1FIwzbZov0foAMkTJrept4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC9gK/1i/w70LhtwJjvvYIcElUqWEmwV/YKb22R7AQ0opIt0zRJKKEzaGEu8DgUn1IGLremjVtC0rHCuEVQWhgF0omUj+DIQbo/iBhu86d2xaOXY5Tll+u0F4Nv+X1PMmqzrmLFjgFrs82OCEXXvWzCrgeOnL6Z0uu0UVNk3vqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9leOM0c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9leOM0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26921C4CECC;
	Wed, 27 Nov 2024 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732725275;
	bh=hB9Xh72VW9EY+zK59eMd1FIwzbZov0foAMkTJrept4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9leOM0c59TbObqiL7+ozbJjH+pRogDcMZald3bYtsytIBPo/9hxKdBD8ixnrtz+l
	 p4SrWcQRxuIlMdi3vL37Wfy2OEwgIREgB8vFAe5s6ty24kjdqG/VS9yMzJJgtxXZzK
	 EkwwUfvcy1RLoZ1dFraUB5XG1INf0TMlRCexal6JacrXTH5h+ejGET89D3FG27i3Rx
	 kW1zIYLGgP6vc9M6knzHeVOwt6TK7v4VyvO4JjERv7oezhYt3kKZlWp+i3TsWAqQQV
	 vC8OWd+rTirsFnxqPUeCE9qfylWQzRt0XLx/L+9yHVpt72YNX1FE4/cHjPHGtmZEgz
	 CJl/sjUuhQJqw==
Date: Wed, 27 Nov 2024 16:34:29 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add optional
 orientation-switch
Message-ID: <20241127-expedited-worried-89e3603eb0e3@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
 <20241127-unturned-powdered-d9d1b695732d@spud>
 <20241127-pushing-baboon-4afafcf8322f@spud>
 <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZR1J5D9xohh12xiE"
Content-Disposition: inline
In-Reply-To: <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>


--ZR1J5D9xohh12xiE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 04:27:09PM +0000, Andr=E9 Draszik wrote:
> Hi Conor,
>=20
> Thanks for your review.
>=20
> On Wed, 2024-11-27 at 16:02 +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 04:00:59PM +0000, Conor Dooley wrote:
> > > On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=E9 Draszik wrote:
> > > > orientation-switch is the standard declaration to inform the Type-C
> > > > mux
> > > > layer that a remote-endpoint is capable of processing orientation
> > > > change messages.
> > > >=20
> > > > Add as an optional since not all versions of this phy currently
> > > > support
> > > > or even need the orientation-switch.
> > > >=20
> > > > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> > >=20
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Actually, this patch unconditionally adds the property to the binding.
> > Is it valid for !gs101?
>=20
> Good point. I've only made it required for gs101 in the next patch, but a=
s-
> is, somebody could still add it (in error) in !gs101 cases.

> I guess it's best to squash patches 3 and 4 in that case, and update it to
> disallow for !gs101.

SGTM, go ahead.

--ZR1J5D9xohh12xiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dKFQAKCRB4tDGHoIJi
0tYOAP9rTl2TqNpo8uGk6OWIn9r76xINLkrcaIkMySG1Pa/oQAEArFBtipMlzKaR
UVQkQlpV6fOug4+hBcQK5BIJfyo3YwU=
=Vv35
-----END PGP SIGNATURE-----

--ZR1J5D9xohh12xiE--
