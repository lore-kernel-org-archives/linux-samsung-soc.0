Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02A1FC0EA;
	Mon, 26 May 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269736; cv=none; b=GpWhFO6yd799ZjWu4aIeudt0L2pKbHM4L8FJunp7XZJQ88TUVPMpP3e4b58/eAl2PdAteaox4lsw4awL6aQmMfKyhC7U9KBnVQ3SPovyzv3mo/lRmkFCiDQY7VTdXF9molY12o27bzwu6hiRVnS9r/eBze0GaXTbe8a/3EXtFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269736; c=relaxed/simple;
	bh=n4iAyfmAHDQbsS1EO/JqRd7baMPaf1ePJ1/X2CCfYFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaW422HdPRdJAo7jYDqYXmemIIeCx3OblTj435pN07QaPefG5IugE5+rT99XWDj8yF326CWjt+sgOXYpzf6XWnAr62RYDUp+qDV88q7Koa4V6evvrEii1kAlvUfu8TTPRpt0aRvb64t1jHlCVsJBe1HDAiCKjQKfDM4ajWfWDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVKOUmfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVKOUmfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADEDC4CEE7;
	Mon, 26 May 2025 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748269736;
	bh=n4iAyfmAHDQbsS1EO/JqRd7baMPaf1ePJ1/X2CCfYFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVKOUmfKS5yHfU1rOTLdJ9hNKl948oPmJYsPatXW9hjyV1EuSKEpDwXhAhwZr7Lbe
	 s4sG8xFzbB9G2vhptfRjlryu/iPI9Wb5J5lJIfZgXcJKaAMw707Y9iDGmfPIBDvfVT
	 yuTYQFcrjsA98u+OMFtaDuKjPidNXBFAslwQ8a8IefnLHGgpaG3rV4kD63YkHOPSUP
	 pRoTt2sDxDlsAu80a3na03FsoyANsa0jsQ4ERSPeOyoFSqJSd3fRD+IuGY8HkZxOT5
	 ppDfz0iMbv8scEjdao7dWoamDFMuZJCt6jDFWMOR22J1kDjwqK/Bwx2u/xKHEAR2iX
	 vWsGJRylscVhQ==
Date: Mon, 26 May 2025 15:28:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain
 google,pmu-intr-gen-syscon
Message-ID: <20250526-hardware-periscope-08c2d4d4608c@spud>
References: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xJlw5npM/QZjJtIy"
Content-Disposition: inline
In-Reply-To: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>


--xJlw5npM/QZjJtIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 09:06:31PM +0200, Krzysztof Kozlowski wrote:
> PMU interrupt generation block is not present in older Samsung Exynos
> SoCs, so restrict the property to Google GS101 only.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xJlw5npM/QZjJtIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDR6owAKCRB4tDGHoIJi
0oihAPoDZbCU9o7lQHTuSr2zLVT5NPnXmxkQ4B1eqoQvLv3b5AEA+3563CoFF2lt
t2UeGUATSyYgk+O2mKtMzhhAyeZ3hQo=
=reNG
-----END PGP SIGNATURE-----

--xJlw5npM/QZjJtIy--
