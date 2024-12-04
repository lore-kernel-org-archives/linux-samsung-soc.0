Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EFB64A;
	Wed,  4 Dec 2024 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334313; cv=none; b=iqAfDZscEZlw5gSeqTaV+rx5hdwT4CycKLgsDcL0iQFXAxMwEq6yXj/cEeF1gcp3h7zUQFMCFkvUTZxSceFCPn5u3joWEezOIf+Sdg9JX9QVl2bt+JUIQqkfhVd/QTSzCiiL1hXUyxvJs7BYi9xYhh5h7P3gcmvqLe7m1kDT7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334313; c=relaxed/simple;
	bh=wf6CEilJbwd8lHy0ndxTActmOsu8tzbKBpEHpl727pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9TAjXhDMkwIturjKrMMwArW5bea8yjJz7XLtX0nbBn0wDA2dpFCZyiP2Yh0jmf+/PJyjN1iFlpcqhX8zHK1Fl7BvufSW2Wt+TJg12Wr92XYBHytkeMhzdMbnuhT6pf7pt+sbl+QxW4fziBAwTe8b5ruPUHjY4GAuqwEdICJCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGp82C19; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGp82C19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F212BC4CECD;
	Wed,  4 Dec 2024 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733334312;
	bh=wf6CEilJbwd8lHy0ndxTActmOsu8tzbKBpEHpl727pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGp82C19f3rwQXalbvgRLx+83VFRM0kwVocrV4Q+uR9oSQx1BbAty3iyusJbjALfc
	 8YAXRKrF3WC/G8vZnfHYC/nWis90Dxf1KdQZa30WkKxc94E8S5XWEScb1IZQs9libG
	 D6RDPBPiq1qxorKq/5bqV6bnyAK3AOEoVWVrQMdDhg5vTCIYzsXYTa0WP4lbmY8Mnj
	 0uix7MA9b1yz/oy55arLQrplfZD0qjaadl/4XjHTpOcHyL3n4Vk5dc0w9WjZfprGI9
	 VGLNn7kQffoQDf5Kxl06xPbWLiGZncwYlH11HebBmOeLlL0YidaljtuxhIVEEC6KXa
	 JAnxEEAHvnvLQ==
Date: Wed, 4 Dec 2024 17:45:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos990-pmu compatible
Message-ID: <20241204-flyover-freckles-241e17dc2262@spud>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="goWN9glBiQhpQ2Qv"
Content-Disposition: inline
In-Reply-To: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>


--goWN9glBiQhpQ2Qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 03:55:58PM +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 PMU. It's compatible
> with the Exynos7 PMU design. It handles system reboot, as well as
> other system control registers (i.e registers for the USB PHY).
>=20
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--goWN9glBiQhpQ2Qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1CVJAAKCRB4tDGHoIJi
0mUeAQDYQ4nkN/nPls385/Cfaq+RGGyLfxIq0/BrJdSoN9IglQD/XZYhF1NfKp7Q
jT6zhIMDGugUT/G4n+VglbsyNkAZNQ0=
=bhAe
-----END PGP SIGNATURE-----

--goWN9glBiQhpQ2Qv--
