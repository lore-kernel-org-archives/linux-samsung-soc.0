Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BE2DCF4C;
	Sat, 17 Jan 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678481; cv=none; b=GBXlaGTX8bcvU12vHUNMaC6TvrPdGTclzhBThJ0qwDarWzeJG67N1p/VU5HGs8eg7UoTYJbRwZWhw7AU968Z6GTUP3UGiqpVNYkJPOCVWUor/dq1BxuZRGGhIbPyEh740zxCBad4bmgChAa0PBFP0QP0WVZYnCKsrLruJWJqXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678481; c=relaxed/simple;
	bh=FeOvqBq1LCt5Y3EfFFwB6cXnm/gCHkl94fPqysN+CNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jove+iY5AgkomqvHaXbXmfwhPKRwyLVrdix24hYsY0mFs1tSD2W5skJtk0G14LDz9zeL1BrEZEeduKV5y/m+U6B4U8vskIQ9yHCN5+/fMNPgW5ByQxjJMiYrKj0HyEWnoUiCuZLx8N++BTc2HVZCcS0L7mraQ/IR0dn1hBlW940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx68UQDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx68UQDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD77C4CEF7;
	Sat, 17 Jan 2026 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768678480;
	bh=FeOvqBq1LCt5Y3EfFFwB6cXnm/gCHkl94fPqysN+CNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kx68UQDo8hDbs4wzTHfuyE5A+jf2MbP7ZTgppDP3Ksern1DYLeZie+5l+ob130JSE
	 EyoETbM4/BRaAE1DzqjuTGgLfehvLUmTzL9xM3q0MHOTO29xGbNqN/nvRB0JrH5o7x
	 xFe9lBMLIJJtxSpZNjTdI6EB2CbmUiIF8oU+ilRUfSJZG1Mxkaw+OmilyCUHBiVtVA
	 InnSbn4wlok7oIu6ST+eBBgsuaPD/Ia4zZr90SumJgn6+pnl1+g8ag7vwAx3ghk+Yn
	 14jWhbktNg4fSvh9Wg5LB9ae/k6lwOlnC4D7MsTQ2WUeroxA9N5xK8K+7OOlFEaDBA
	 w3fTQrrxlwmjA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
Subject: Re: (subset) [PATCH 0/3] clk: samsung: auto clock gating fixes for
 PM
Message-Id: <176867847762.124121.8738642707805384066.b4-ty@kernel.org>
Date: Sat, 17 Jan 2026 20:34:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Fri, 09 Jan 2026 17:27:22 +0000, André Draszik wrote:
> The attached patches fix issues when CMUs have PM enabled and also a
> needless warning message on older Exynos platforms relating to
> automatic clock gating as reported by Marek.
> 
> Without these it's impossible to enable PM for a CMU when automatic
> clock gating is also enabled. While currently no platform uses both,
> patches to enable PM on gs101 are in the works but things stopped
> working after the auto clock gating changes. I've verified that with
> the patches here PM and runtime PM work again.
> 
> [...]

Applied, thanks!



Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

