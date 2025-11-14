Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE372627;
	Fri, 14 Nov 2025 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763092155; cv=none; b=ioS4wRarRc8r7iu9CdTWssgg/ZFm7hJk6+4G2i9ENchFRo5ekbzc5OsuJZ+TJfCYbpN/x1nP1egz1HNAD2CimP3mBFG9gpNLxAfQYAEh7FLFn7DqxIv6t07hbIgBQrtHKB0WES8Ki9Up3mc9scAG4mP3UCZZCVEvKUGt2V+g5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763092155; c=relaxed/simple;
	bh=ehOt0d3Y8WEVeEy/LYTyszW35k4ORWoBCUm7F1SdGXM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RrhLREkNCLlQ4eB+ndXyf41AgocD4xJ9SKHvQscAxUtkgaPS03p3itNnvt3dMV3qqUFsh+1xb5f+XaoOl7Bwjt6I2ol1VnWCN4kpym9jfmjko+EF9lHv6/T5KhilpFdBs5NqLD7H46+81pAyhmwwGA9dgnXks9lFojbHJPoZW6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9PB6Af3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9PB6Af3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6EFC4CEF5;
	Fri, 14 Nov 2025 03:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763092154;
	bh=ehOt0d3Y8WEVeEy/LYTyszW35k4ORWoBCUm7F1SdGXM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F9PB6Af33v6Wx8/utgZdOFV8kA8AsnHCy/zh+AmKC5LXPhvR7zG5gJ8LyyxxCv9MO
	 fHpSvtZXPDf2iqpR6NDiCNeD3DGtvYa7NAv3pGBPOt/rW/G+YcBibyGO0u+EPWLiu0
	 buX05zJOI66stYizhsGqAUyNzueKIncnyevFxyUyZbeOh2er99QBPPLu2KhADql5jh
	 /3Ov8/hjNVz3RzxAiWgkpJr7Zctk4i56igaPkUrrwAg9c3uUE1vKnMi3skbtrUMvKj
	 xAcyI69+exms3nfKsgJ+Jo7Dh3gBdba8k/9JO6j5X2W66igYpbh1rLCWUhpl1i9Pa1
	 93EaWipQdsQjQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org> <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL 3/4] samsung: drivers for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Nov 2025 19:49:11 -0800
Message-ID: <176309215194.11952.10938476100582043995@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-11-10 04:13:41)
> Hi,
>=20
> Topic branch for Samsung firmware and clock drivers.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-drivers-firmware-clk-6.19
>=20
> for you to fetch changes up to 6837c006d4e72d6add451411bcf407e0dea4ad25:
>=20
>   firmware: exynos-acpm: add empty method to allow compile test (2025-10-=
22 07:49:38 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
