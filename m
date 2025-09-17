Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614B2FB09A;
	Wed, 17 Sep 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137357; cv=none; b=TBctQDtOzvVzn+2ch1xHC/0N+YHF6dAWoqe9/TSy5npZgrXvqejbgJA2Yy9HwrlspkCpsLBi+4M5UnmipKQcQJsTpJaXNpuAgYLVtk5ogxzouXHms5YPkyf4kWFbqN4i4XiTWaYzJdGOdetyNjLeTqQEIKMNgaRfI8CXeSXJLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137357; c=relaxed/simple;
	bh=PwNSmdi+KZptf6b6MK55g50B3mbRbByQWSDIfsJFSMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEH7zVOSMD+c6VM4i9gpK6tQUqVyCPscteIwNB9duGX8ZZ5VppN8BtnTQZYDsYlF5xL3PvWgcDhS7C0xuc4gs1npcdwJX5m3YmHZb1PiRJwqhssG2bY4/SMR/Eyg+7tDBnnVTKP14C5+m/V5MraNoOv4qEDTE7Oy5oeY2TAz4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzFgPD9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzFgPD9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE73C4CEE7;
	Wed, 17 Sep 2025 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137356;
	bh=PwNSmdi+KZptf6b6MK55g50B3mbRbByQWSDIfsJFSMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzFgPD9IWTdKPsaTt18Ghq7Sh1MfkRZHqJSBHqcEg2CkyJGEopiUmzN5oO1gqS1Al
	 34Mw8dSikLk+oc4gvm0WnwR4ah6sYEsJsG1A4GbRKFHD1bOFzraH2ef5ECAkcrooJz
	 D8JN1s2Sk7whLwHcaI+n4gZ0fEqMPUYg0kW892MK9Zu7/9VuG2G9bAEgYYUymXUb2n
	 McG7RZgucCKu4hu3MIy18JRmSXXRbq2ZRG4h9bpGdS3MIoTgWZs7dU4vSS/nQth1Q7
	 JJIJq1eBaa9tO0+zEOM14ekJDaRT89Qj6ad6O7FkN5e/oDi2I77hfu7D8WxDaUchJF
	 MR4nOsZkyt+Kw==
Date: Wed, 17 Sep 2025 20:29:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	krzk@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, ksk4725@coasia.com,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, smn1196@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH] dt-bindings: timer: exynos4210-mct: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-credible-refined-0e3e244ee9c1@spud>
References: <CGME20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc@epcas5p3.samsung.com>
 <20250917071311.1404-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JN60OKxJv97kyLy2"
Content-Disposition: inline
In-Reply-To: <20250917071311.1404-1-ravi.patel@samsung.com>


--JN60OKxJv97kyLy2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JN60OKxJv97kyLy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMBQAKCRB4tDGHoIJi
0gqTAPsFO9w+7JD4IB/fAJAhSZhGgnOF48FKI1HkhpszyX/AqAD+NOEkyGMMFp9K
scg8d9Hj8Q5MWrEH1LUvTFW+1N1OPgE=
=0ePc
-----END PGP SIGNATURE-----

--JN60OKxJv97kyLy2--
