Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C01BD9C9;
	Fri, 23 Jan 2026 02:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134642; cv=none; b=VJPHMPUNVpVVfkzrOaYO2yOMx+f38mnupmhFU23mueWmllUddt2BxM1nnxYpyoqgjtwJDG3RZ4zUOjA4qazZEvrPtUh64KBRZ2P/IYcYBqfV09HcmaUZ4Z3ZnT7lxJ6J9S2TfVQX141k/Xw8XhzJBwOXuJc3kCJZBGEuWGHEPSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134642; c=relaxed/simple;
	bh=jVrEQlUVE+DpbMHieJe37nHILdx8CqAQ9VOT89oe2co=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IHmwlcWcAy9uoeENN6QQZq9e1nQMNMs2a3+OrjRP5s2o1RdP63crXbnSO6cPw+6gt1i0aBu03vepQbeXFiMW2GYw21dU5Rm9Ntokbj2WouqfM/zJkq66o1G4YgZ8nCw6IdypWhkAFSeQCwTJSdkMxtZPGLDGhMW1+wD+oEcprgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjcYP/ov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjcYP/ov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEE1C116C6;
	Fri, 23 Jan 2026 02:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769134639;
	bh=jVrEQlUVE+DpbMHieJe37nHILdx8CqAQ9VOT89oe2co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tjcYP/ovcuUZkZ7+y16bkfwn0zZsRUjx+mFgEOHZSXzIszdATS3wJOgliy+gcHOKQ
	 gyKdPqwNmN/c9fjvHctlpLnnZa3FYM4VmkkZTCa39Qvy55AH1yGyXjqhpSAlCtjubn
	 mCyr/5bjFkQ9mAZZDT6cHZQQqjQP1iZHdgsyGFquZhmIW/5FXKp+COjgNzTgi92UR7
	 O8szrPYrmDB21ZF+VnlpGPt6WyxvNLek/u0M5p8q6ebfVMOyBgSR1k803/969yvwpz
	 trMi8D8DiWsXAd8o5P82HcjgbU1h52r0FvaF+90m3/E+ovJSmBzq83kLVb/6dxmrY3
	 gTOXV+gJgZWsA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260122083920.20271-2-krzk@kernel.org>
References: <20260122083920.20271-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: clock for v6.20/v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 Jan 2026 19:17:17 -0700
Message-ID: <176913463789.4027.16250770249580323384@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2026-01-22 01:39:20)
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.20
>=20
> for you to fetch changes up to 4b18a3ef2230e38439c9c3a0e3fa4a2b5edcc5cd:
>=20
>   clk: samsung: gs101: add support for Display Process Unit (DPU) clocks =
(2026-01-17 20:30:38 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
