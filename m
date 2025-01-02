Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF018871A;
	Thu,  2 Jan 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853123; cv=none; b=eZoazbqH1Q2iyrbfbBhzMDG4CZjt7qEwBCSrCWmaamzL+yAJMofESyGKHAzmJiT9lhBwpapQtezKXoEEKOUhEsGVrWBjF+NOYNL1ghfEcyw1AaS+xRV6gwNSIWvrNkMTzWMrn/rCrRO+DYjG+xYB+a+ro/ti29I1baMINw8ooCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853123; c=relaxed/simple;
	bh=C7YvJI+LRX99ZvSR/QdEs5wQX3nlcDWIY1IzztElFaw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=THOL4vEW85KPSaxFTXllWjyD+7F8jd3vjeeWMMoPzjkBQGgbESPYq1MlxwtzgkW2ufn5IPx81cDYfqpTIbqO3vUfd8zgSEoYswBop1f3+mrkAKJ3xL6vqeqjIayp0n5yRSyCas77veF8R5px2aWJTch1TTkBDjL9218Z0cpXM20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TavFKDdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TavFKDdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381AEC4CED0;
	Thu,  2 Jan 2025 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735853123;
	bh=C7YvJI+LRX99ZvSR/QdEs5wQX3nlcDWIY1IzztElFaw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TavFKDdUK83JGvt8Jlclh+USHp1iPYjJ/7eO8nvN6yUua5m28qt2jx7m8ErgCt3ru
	 5jsoueII4K+e2Bm2vupTPp1lfOM26cX3IJ8sgQsfOKdjI7WcyTcsOiaS453s5+sifd
	 0LNVzouNOZpxb9TqQtmlP13WLwxMBRU9l2mMYc2ffmvVlYNFOnGBixwocdzEOj8B7/
	 Q5B8JFn71+PIeoc2oFeyuHXUuXZsbL+cu4Wvwyuqp3zBCiURobwVqFUwqeVXGjBoDX
	 fVAWgvFk2E6tlW5OYQ6D0VcBpqicdiTXkczyodH3x8opD8XPEv4t6yl3uOqzFMYCnQ
	 9fKsIK+xOuslQ==
Message-ID: <59579b370f7b9bebf45da98b57ff016d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
References: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 02 Jan 2025 13:25:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2024-12-31 05:19:53)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.14
>=20
> for you to fetch changes up to bdd03ebf721f70df1458a720b25998a489f63297:
>=20
>   clk: samsung: Introduce Exynos990 clock controller driver (2024-12-14 1=
1:39:02 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
