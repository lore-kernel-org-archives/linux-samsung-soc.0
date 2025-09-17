Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3829BD88;
	Wed, 17 Sep 2025 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758136896; cv=none; b=gfXczbK+3DJ5QA7Ds4+zQxhxGa2aNgoGfN0rIOH2JcTH6QAt5ghCJxc5208aA8hDElp0fQOapbGmkbBJCpoopbF/JT4gK4dC22hdQNEAYyAHQk97o3Vr1R7PI4Kb7Prt6Im24xRA5tKkKb0qK6BDvJMkr1unRYYw1dmjTbufS6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758136896; c=relaxed/simple;
	bh=uK8VD28pj5HsQA2BIDc77NxRzzo0PVYvig7p9Rq5qx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYOXgZOhPEVyBZfOi0nFbqOL1Cqrf/Hl/1s06HRUWOf6HzZy6ej6F2gOsXt4a7/fIYPwU8APolp7BA4C+oLRpSioYnTn6tyvV7odGC8rClVwax1Z9T/Ya84aOEMww6T3Qv//A6QMY3dFpe8LWLxA0q18naigUvF899QmjdEJr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUDWAchD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUDWAchD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73474C4CEE7;
	Wed, 17 Sep 2025 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136895;
	bh=uK8VD28pj5HsQA2BIDc77NxRzzo0PVYvig7p9Rq5qx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUDWAchDuxejcbCy7Djo+l7J5pMHNe9+okeU2CCorrXCidCMI9adv8g5XJZxvEBuj
	 XVZ4+cGy4qay6XGmNXDOsVWqhiiqrNY8q0jV7ckBFODPQ1sLbAV1dMHk/vfe51srgd
	 D+6gwUyDsnynsP1ScAJubUaOeogZodPWGj/oVxc6eEWQpSHZ4S0p7qMuCVOsVi1geL
	 4DDJf/sY2rK9PLLQzl/242Rc0/ci3efF5YYo7VLwAu5c5/omcLw1M5q5+S2cQX+IAB
	 RAAZOIUV8xyEpy8U7/qd3L2VY6iVbfClW+N9korLKE4MgzWf7ad1WRznqwUm5POVJ1
	 DMI0o4tn60hNQ==
Date: Wed, 17 Sep 2025 20:21:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, ksk4725@coasia.com,
	smn1196@coasia.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH 4/7] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-overture-freely-8279720edce9@spud>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6@epcas5p1.samsung.com>
 <20250917085005.89819-5-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dRvbyashsTiNm1sK"
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-5-ravi.patel@samsung.com>


--dRvbyashsTiNm1sK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dRvbyashsTiNm1sK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKOAAKCRB4tDGHoIJi
0p78AQDSMTw2stqWHLzjK5+LTkdtN65qrrWqUWRI2Rf17tUVnQEArHJgpN7vG2Pl
lBmuPUXF4wfsNnyi465N6V7WOXUT7ww=
=GaZD
-----END PGP SIGNATURE-----

--dRvbyashsTiNm1sK--
