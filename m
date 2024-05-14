Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAC1DFD1;
	Tue, 14 May 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715721138; cv=none; b=kRITa4qBiLgzwxLNEulhsHQ7T1uOlWnIdImOnIavcB9bGkneu9gkw9pzRH8YDf5PSeKlGI/0gTrCuuS0EkQzDpn6jVrHXjv9EKKUvwn4uKDpm2SXimFsvKCgWdHMHyhNknMiY8wRFRmi8vO0ZdUeZtE0idEgBsmAPiHJWeTc2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715721138; c=relaxed/simple;
	bh=UyCf2gxOf2W6QtrpR8rjzzIMkckYknSHaNnua2jwqXY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=g6SNLVysu5nt8nyhsm4Qp8NLYJNhKxpKG1WyyJQ98po5IQ/HwqrfLfBwfUJzBwsnZ7RYM0ORTigNduRAP9jZdrYnWC0S6uUZTIc9NCxbmraPMX4d8Bw6mAluQMcVpzN1BNXW7iYU68EjVY7etoCdzDP2IuRJiNeEAJS5EOiANFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPKdMNGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPKdMNGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99A7C2BD10;
	Tue, 14 May 2024 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715721138;
	bh=UyCf2gxOf2W6QtrpR8rjzzIMkckYknSHaNnua2jwqXY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VPKdMNGg57box3oUqpj3v6ptKzrzMoRedpLF40dxQ+kX2ZLXy45By60FwRBz7A8gd
	 5/WD0iXxHtC+QknUO88wLAv2eW5HloxoJlFSNM2hsply/cE5OTCv3pO6YWQhrPmTiv
	 fZcZjS93mYEzwYohGxZXoPxKmv/jxorf2YEzidmudtFCvRjbNqz2nWQmUShv7xjCKa
	 WgP+lBrm6c9B4QB9wWmP7+O3W7U19VQEQV0jR/qhAgZkctaimuRe6vxrKeT7LE+4Kl
	 pVuqSp0OIY7ctAmdxEOR/45ToDF6/OE3UbRyMNWkaFme4rr6M02QYBCIZBw1G3VqGP
	 rVs27JSb74xqA==
Message-ID: <f7a877622829db499bf2bc65fe9ffbff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240510065901.535124-1-m.szyprowski@samsung.com>
References: <CGME20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8@eucas1p2.samsung.com> <20240510065901.535124-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: Don't register clkdev lookup for the fixed rate clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Sam Protsenko <semen.protsenko@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 14 May 2024 14:12:15 -0700
User-Agent: alot/0.10

Quoting Marek Szyprowski (2024-05-09 23:59:01)
> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
> clkdev entries") revealed that clock lookup is registered for all fixed
> clocks. The mentioned commit added a check if the registered name is not
> too long. This fails for some clocks registered for Exynos542x SoCs famil=
y.
> This lookup is a left-over from early common clock framework days, not
> really needed nowadays, so remove it to avoid further issues.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Applied to clk-next
