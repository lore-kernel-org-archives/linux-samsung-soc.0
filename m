Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E72BD590;
	Sat, 13 Sep 2025 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757801271; cv=none; b=LL3byE0AFeToWvZidvTEt5V9Jq2/fMpeEQHB/1LxnsWaC1HQDf/g+YYH6y5brFCwTC907OIrUUSy6byBTzHsWT8BUxqJyUMXHnYfT8/zKl97VLrqAKgJggK58X8440xH1cPw6fmXVh1PUuoI50JL4kJGzPC5AsxOtP2m87sOLuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757801271; c=relaxed/simple;
	bh=KkO4nlDVPP7NGR+5TE4adbTvXwa7kqLzgbOu4m6ZriA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MZ+7QHh//t5hdlJdapvwF0upwsyUu3cuDhN/7AVkm2pdcXqtdHaoNUj0PPgPs8LdCAZzY+ae81pXnxrXC9nOALD9SdmOrZJsScBNCaM9dfSgg4NH9JmgLsLrvsVLbbXAH4E28PoQ4GrD7QXUmRDTY/n31raCZfOsq9xl6zwUBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpsZ7MBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpsZ7MBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AB0C4CEF7;
	Sat, 13 Sep 2025 22:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757801270;
	bh=KkO4nlDVPP7NGR+5TE4adbTvXwa7kqLzgbOu4m6ZriA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CpsZ7MBiWGo88QH09+zuGyg3NAqkbv0ewMeaXyBUE6PZ1o4O2fviYonVB6L01zmZN
	 h3x6z1XfeyrO47HBE5TvHQPnDgcfOQu8XYPHv3vD9WzjuZQnZX9qxMSuvTS6RfaI9T
	 EM+drg628Z+vNfyrsdm7jR+U1SFC71MNxPAW6wc4yHm2DBv5f+q90ECz8/89FSQudG
	 br9C4F5Boulr3f//Sqi1i6bLquFEs4i34kRjdBGZqHH6QCk/zKaXRn00QvoqKrBh/q
	 aY6CmcC/DYskGu6I1mCJpDp80UXb4KkLtKCHv+l44Oqle/X1qtnFa/KNbQhPmPMe0A
	 Ilgfs6Nu/mxcg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
References: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Sep 2025 15:07:49 -0700
Message-ID: <175780126993.4354.439527294817394688@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-09-09 11:35:04)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.18
>=20
> for you to fetch changes up to b3b314ef13e46dce1cdd97a856bd0250dac8feb9:
>=20
>   clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support (2025-09-0=
7 11:12:45 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
