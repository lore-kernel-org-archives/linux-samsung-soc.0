Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E972F94B3;
	Thu, 17 Jul 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752768466; cv=none; b=GPl9RVyTQ4huFuoDVtVy1lX5Mcot3AB9UXZ+wdGma0ipb0syDZVjgMy2rNDnq8DpwJwSQjrefe2IR06xKTh4Xdj9or5hPcfrqh6OPFkTNQQEl0ZKzQ9botfJn1og8J0QXxmVRfqUjDDd5slLGbTbv9DYcqgzmPhK0rvR5KVLgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752768466; c=relaxed/simple;
	bh=v2chc4+o3ov/exmstx/9bcH/3+pU/JelIQvVtGcGpKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjypQzc/HD6gW3KVbWrQ68B1f67oLm3sUcS+2DOuJHQnGulNEQRPAR7DbjGRwCMUtqkwVHtHkXVuABbiQduriXjfC7qPzAXA3cliHbnIbYbQA4LZFtJqw9afGq3qzuSzlUZmuAYKA237TTm8xcZw/EhaZ6CbpWShcwFD4wVHcg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAGbOtcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAGbOtcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9C4C4CEE3;
	Thu, 17 Jul 2025 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752768465;
	bh=v2chc4+o3ov/exmstx/9bcH/3+pU/JelIQvVtGcGpKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tAGbOtcCosdWnAwvYWLIP6j9NNA0Oh8fPZuQfeQp2nrIbcJAIr3XtHb0wuWbR7n4u
	 yLxiveozlVpyX6XqI5j8YUB8rAEOqVUhZ1sa3I0IcmhcgBzqdnD2CQJq61f6QpNKxd
	 N6Ri74yoaGJNmNTBKNQADjr/LNPxE3NnGR7rc60iFDKAz3u547ZfM/Cfhlf1w71BHj
	 kTkpToPdIYgM5YkS8fdURbD77B4NjZeLhlOHyyMEhnC0ng0G89M9eJVV0nHe8H10ed
	 NXGxBM3TUJxfPrHcu/LKVd/moLANn+C1cQVle3thDipCi+jbT+gfZj35NdMBjqxZzr
	 ZkMhVur7WtfTg==
Date: Thu, 17 Jul 2025 17:07:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
Message-ID: <2fddbe2b-2ffa-4d3d-8750-6ba8f5b140d7@sirena.org.uk>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
 <7bec6fc2-6643-4ddf-9475-8ead4b312912@gmail.com>
 <CABTCjFBTY4NV2yKyRO31MacGFAnJ4T-viDLrXkPs9z66VU6nyQ@mail.gmail.com>
 <3e640051-35e5-4eb8-aa00-cb57abcbb919@gmail.com>
 <CABTCjFDQoQcrkYwBhaH0bzdxHd6OsGh1J+iFqme5R3HfLdeq3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mam4tI5vOlRazw+P"
Content-Disposition: inline
In-Reply-To: <CABTCjFDQoQcrkYwBhaH0bzdxHd6OsGh1J+iFqme5R3HfLdeq3g@mail.gmail.com>
X-Cookie: May I ask a question?


--Mam4tI5vOlRazw+P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 05:36:45PM +0300, Dzmitry Sankouski wrote:
> =D1=87=D1=82, 17 =D0=B8=D1=8E=D0=BB. 2025=E2=80=AF=D0=B3. =D0=B2 14:33, I=
vaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>:
> > On 7/17/25 11:12, Dzmitry Sankouski wrote:

> > > It's already merged, see
> > > https://lore.kernel.org/all/20240617-starqltechn_integration_upstream=
-v5-2-ea1109029ba5@gmail.com/

> > I don't see patch 3/3 being merged anywhere, nor is it in my linux-next=
 clone
> > from today. Do you _not_ need it anymore?

> Indeed, that commit is not present, that's strange. I'll reset that patch=
 later.

There's outstanding review comments to fix...

--Mam4tI5vOlRazw+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh5H8wACgkQJNaLcl1U
h9ARcAf/elpz9PNu1x8pXer8UpwQEurVm+O8iiofRhkoXqhXGwabdS65PARe/lCw
bxgLFeB9kK9Pi7ZlRoGquzebixgcY4DvL740wCok9vj4ewAvKAkqym9CqgWdXUFs
lLlgoE5j+Nah2Uh9AhIbsPigWiWHMWBnLqqcmxkBUsLKdUibLcPs6/hRbwE8fKxA
HPB7omLn+JSCctWQZ8ij8men+1jd2/5Q1gaVZrzVRRkufyG/tspY6gBPXUlROfGR
qf+SxrUtgt6DPvXlq3swJQSjiXacgXOJNF8B5dWkUqhdtNduwNYcpEDO+jj34Zdf
pi03mPuCHWwijgGwRrQ0IpFqwT1/Yw==
=iPEz
-----END PGP SIGNATURE-----

--Mam4tI5vOlRazw+P--
