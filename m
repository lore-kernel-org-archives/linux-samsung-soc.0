Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C21D27A5;
	Mon,  7 Oct 2024 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312986; cv=none; b=uweRSbGNJMliJqLgb+ssR0f5PYCQ+MzroweT05ft3Rz+CG3tvOvTkxns2hHNxmgok+6pzkkTKphx1+eusVTaeIB9yh+u+S4Xq01ie+ebrMjmqgbAvhj044Lw5WGrU4eUc/crOBaUVyrL7FgGbBnZMCP1HQ/2L/DdDALgz9WsGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312986; c=relaxed/simple;
	bh=zeF3160NjATD2WPZ80CPwRJFL88hNk+j58n6wIZsUFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC/FyPtiID9ByenTRDs5F4eGB5OZidCOPI9QutkNeYqsEfUHkDT/7OHR1lZLeOaSolQR+T5hVgPeA4/dhkk8vJjeqAUBs4X1hOKJUidpiDWWv+q9keO69wmE1spPHvPXfKPuoRSMOd/VnWuZiDRBT7Y7RzxgUscb6G+skRUW9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoCbRFs2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoCbRFs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7920C4CEC6;
	Mon,  7 Oct 2024 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728312986;
	bh=zeF3160NjATD2WPZ80CPwRJFL88hNk+j58n6wIZsUFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoCbRFs29OsUnwMnX+sgehOEu5FSNC1cgllC4NGe+kWbps8W1miRvfLcw/nssmIKe
	 OZOsUFvgP8/QM6TSU1JjtC+X+gU+LdOhK9+UEDky+BRco3zmHYzWj95mS1qxMxK51M
	 Irm10j82yEIAYvl+/TSEJAI0+lziqKMMUzpfRkz96qASQz8eZDVmfLvqhdsnq8lxYt
	 X+wLOU07m1fLfzs670v1UfdFmIXlnvm1Ob9jyFwu5LEOVQqrns35KGt5r+eiae6u71
	 tCxTQV2JGZ33520ZuJVXFafPxQdXNQiAvzYlC52XITz5XYI+04ALkipDJJ3XGaZpWh
	 s/z2zoiVxBZiA==
Date: Mon, 7 Oct 2024 15:56:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] regulator: add s2dos05 regulator support
Message-ID: <ZwP2jpgdESV1XJ5D@finisterre.sirena.org.uk>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
 <20241007-starqltechn_integration_upstream-v6-3-264309aa66de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Axje3svqzA3lXkgf"
Content-Disposition: inline
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-3-264309aa66de@gmail.com>
X-Cookie: Editing is a rewording activity.


--Axje3svqzA3lXkgf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 07, 2024 at 05:50:01PM +0300, Dzmitry Sankouski wrote:
> S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> panel/touchscreen.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Axje3svqzA3lXkgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD9o0ACgkQJNaLcl1U
h9A0EAf/dpPsphk0Yr1O4jvk54AsQFmDDa6Nxi5eDr9CRSG+cLsTR4bOIAZa11wi
xax79qo706cJNuxVqP8N+ysoC+f15Hd6u4/jVwTLYpds1OzPMPxmNCbIx5KsydFy
iI6AwvZIcpNNa8rsS7ngT6A+grO681E9K8tcbBic64V9wOeg3H2r27TswiJJNvVw
Ir59JSRvVCQuyhImJOofRCelT4RiZClgvT0p9JHJDs90Ku+v6ftm5FNBugV77NF+
gkYWSaDN/LIPqbic0LEcnU6jUND/4KLw2TOKqtpeIb0mN9+9l46N++L8/nxon5ay
O/B/Cbc4vFyDhFIkuz3NEhpJ6wUPOg==
=hNcS
-----END PGP SIGNATURE-----

--Axje3svqzA3lXkgf--
