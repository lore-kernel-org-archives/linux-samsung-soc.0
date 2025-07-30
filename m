Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1578137923;
	Wed, 30 Jul 2025 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753877222; cv=none; b=oZRCpaUuP1MA9YAnaDRSkckBPEUNOYlkPJ4A4D9N8+I1yTHJN2Gn4g8sXZe3y1morvb59oplV6cRH4Ja+RHpqCVGQaIx1hnY1ttCSkSS53waqFD5paLuxxRaJBMZ0UEn+7rcoXOfv/KvTFtDN51XpBerfeSoBgQpWbDeD3QqPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753877222; c=relaxed/simple;
	bh=UAlwXj6kfP7UY5hHsuyt2FmGgbAGE/8hs7di0Xjh+zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxpzNXGkkVvRpmE+Kt0Bl1ucih+fpqwGjb00D2HmwrwW+vltevivab9jhNhEXl9lj6XDdZdJj02c42rFYzY9e/TxVQJ5SxqH/SfPgd6D7IiekKboS7xbYia0jL+KUVrNM10dFYFDNaKP15uSdypPk9LPEJXGM1Re5d5CKqYTrzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbYB3XeZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbYB3XeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DEBC4CEE7;
	Wed, 30 Jul 2025 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753877221;
	bh=UAlwXj6kfP7UY5hHsuyt2FmGgbAGE/8hs7di0Xjh+zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbYB3XeZ63LjIa4mIK/kIzB3ietbIkR4+XYzyU+sS/HFLQXYElYWvckFG3DUeRYtH
	 3MlLUgzmxwzof/5G66HMGeHtdZ/eXTw6WbsTRHD0iN/qkBADmQqC7RVhKga5Yx1n/E
	 HUGcrkp2k64TOcW06cXNKCE45UAO6rGs1VOIZXdOxrguD98Fe6HJBcMym+n6wA5VYU
	 y8lfIuaBSfDzCjwEcleVKkU0+1sLLa2KgA8AVfOOTCcxM+Dm93rTXS8jaW/jXHdHcZ
	 7nMfege2qXduEqqNch3NvcPz27Oqkejrn/ovt6lgMMgnt4CxAa6OlbFhyZmVJXY3uI
	 pO5TuZShtruBQ==
Date: Wed, 30 Jul 2025 13:06:55 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] ASoC: samsung: abox: Add IPC generic support for
 message forwarding
Message-ID: <b2b4c9fa-b9e5-4141-88f1-7115a792e84f@sirena.org.uk>
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9@epcas2p4.samsung.com>
 <20250721023052.3586000-5-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+nQYwSBVzcCsd7GK"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-5-ew.kim@samsung.com>
X-Cookie: Linux is obsolete


--+nQYwSBVzcCsd7GK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 11:30:47AM +0900, ew kim wrote:

> +EXPORT_SYMBOL(abox_ipc_generic_get_pcm_dev_handler_callback);

ASoC is all EXPORT_SYMBOL_GPL() so if you're providing access to ASoC
things you should also use that.

--+nQYwSBVzcCsd7GK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKCt8ACgkQJNaLcl1U
h9DJCAf+Mq/QYtzKhfpxOJCQ7iWo/LoBaZ12wufsoTLRtyXuvr4NekImjp47z/us
QQQwzPuVVr/K9TDBEZu2QXb/M/uOwY0do7sWlDzOx2keRi6ciWvUSMQwDlZDy82K
7Fz5epoFoQTFggvr2zPNeui85mx7TK9a6rpVTOITiT39crckqhTkxFTFdP6pytCN
FtWv+ZhsLYY3vbTy+1uHPdIkUDTjqQVzMdtKlb60n+neG5dfTUj21nUSVZa9uhoS
F+eRaPnG6+AR/jmAKxoqStiVruaE04fXplN4DiaJ7fn1RQNT39TbsEL3i04/dw6n
+oIvRdy+m9qg8NEy2hBzS8W4G0c4MQ==
=Vhdj
-----END PGP SIGNATURE-----

--+nQYwSBVzcCsd7GK--
