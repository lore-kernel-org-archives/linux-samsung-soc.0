Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF16369D7A;
	Thu, 20 Aug 2026 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249642; cv=none; b=F4no7aRgKl6qUcZHuzReFUcI622n8p/QUDXxLGTmdSfn6ZS2ZMb8Hh1+UM+EmvTIoCCyEOThu4uPqIK+3U+r//f/9y1iK3MJZa3laQBTaEx3Rza947qqaJHGLgRQp6edecAiiskasM4oKFyejbU8KQ+6ewPiYrsivgc9HePrqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249642; c=relaxed/simple;
	bh=DHW9cNS1bAzJSHh0Hf7sojpp13ovZ/n31IWZ0I9IVHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb++FctoGuMKEp0iKiMTaMxlmVIRRAv3pIs6S2vytsRxzohOYahzCE3wiTUu0owDoecGWv/smYbtMMbY73+dVGhpSu0Dybuh6trrjTEY4RKyWJ0yMq0hmQSwH9v7yBPUzQGAfJxQ6s1RKDtSKFMQpcexfdNfvZp22yX9dj2xK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYRMzIlK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYRMzIlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EA41F000E9;
	Thu, 20 Aug 2026 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249639;
	bh=DHW9cNS1bAzJSHh0Hf7sojpp13ovZ/n31IWZ0I9IVHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JYRMzIlKcxDf+F4AXqznL1V8BWSzeQhMO/JGUugdCwiZnW2F0FSMcDytVhZ+2L19u
	 wWitX7KE2A0AY/ptHXfmM05a+FMV1buaJQLCaa3Lpy5BAp89bQuKSuv5UzG4IyuLtN
	 pOICXVh6B/LrwEFnN00+NAzhs883Hwdb/OdjydrwXuB0QzCpoiV1OZSK2y80aQi8N0
	 WHIXyZbLx+WnfPBiV8qHpayErFwSfRQ2KvQOtiV4oAkquR0WZzEjbZMacsngpkl0k9
	 KuWIH8SC1lKMHn5UyvjTNOBZ/EQyVy99jECcpUH5JmyAVUrq4+JxUMk2MnIP2tbbxS
	 s8uk2eEjvC2hg==
Date: Thu, 20 Aug 2026 19:13:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: arm,mali-bifrost: add
 exynos850-mali compatible
Message-ID: <20260820-blemish-cancel-c1698ef90d32@spud>
References: <20260820110620.1881-1-tturner@lineageos.org>
 <20260820140439.83220-1-tturner@lineageos.org>
 <20260820140439.83220-2-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6NvgXej4M7dQyR6J"
Content-Disposition: inline
In-Reply-To: <20260820140439.83220-2-tturner@lineageos.org>

--6NvgXej4M7dQyR6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6NvgXej4M7dQyR6J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodD4wAKCRB4tDGHoIJi
0hgsAQD9tdhZ0vEgSmGESeOTwyNP/Qb3m2OcwQ8Mk1w67393VgEA7LJHdNYc9QRk
CaK4hmHy7P3dc2epag9tzRNOocpoWgg=
=4BUq
-----END PGP SIGNATURE-----

--6NvgXej4M7dQyR6J--
