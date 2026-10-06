Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF8305683;
	Tue,  6 Oct 2026 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259708; cv=none; b=UucBzWJ3Bq3IM6q52n9dQ8YZOc4UyJon9jDlQa6xVKXgaYptWKF0FS/nbutPZE7i5pEsz6mTbJX7c5W9SPUhkBogGeWCXOYkKcjPeoe6Lg+HN430OtAkV8JfkdG1S4350l9du8ZmP14ejmsXqtX3KSf+vYUS6TUdorFnWqriFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259708; c=relaxed/simple;
	bh=CiP2CXmlRiiTIGrOHYR5b+krmYPKC3wy3+K0rd51roM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yzzf+4DhPkvYDswl/roV718g4jqAK6gop3532cxmZD2JjxMYFU0OQjh2Y0/gnuPWGx0pExVPbm5Em/irjxjiOtO1zwEKcmRRyuTotSmA8F8JknB05hdsOo4xYVh48ChRK/U5UzX7zLLJJ0Bx2sYPYJpih+tytCvzZ2oaFD6Su/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbRsy+3K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbRsy+3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6032B1F000FF;
	Tue,  6 Oct 2026 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259707;
	bh=RD8Ga2O8ARY1QtYUhUhQvuqFRUYNcYjPCatI11JRIN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PbRsy+3K3LGQmLw61u6nsXvfQG1eZ/iuVzupYDaEUN/YzOXYkfC2nB1tLYeDWex0M
	 7jJqOIV2U0tVkE7KIbL6y9HYH3pBLXYMM9RVZIluPpKlf4j14DJbkgoQUgW2yITJqg
	 Dd9ebEUVcd6EfgRGebjzj8ce1lV5sGl1PNZbtvbFASceHpl6MENDIa8sMtt2c7GUiu
	 Xu71htWKgoyUatYMJ4EVjsBsMPCg45MSvp0aX9AZ1TZL0v4K/P048Klvws5oZqTqn8
	 1pDZiWynwLQgEo3/OpHBgzXI93EdUuSsxmR2U/ETDmNzhgfPmGrvRjoR/byi5XKJvu
	 tXd3W4ggv5j+Q==
Date: Tue, 6 Oct 2026 06:08:21 +0200
From: Brian Masney <masneyb@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.4
Message-ID: <asR0NZ1VyI8k2NHo@x1g10>
References: <20261005102459.35529-2-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005102459.35529-2-krzk@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Mon, Oct 05, 2026 at 12:24:44PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.4
> 
> for you to fetch changes up to 13634cde9771811488847ef76cd64a785599fdb5:
> 
>   clk: samsung: acpm: add Exynos850 support (2026-09-20 17:11:54 +0200)
> 
> ----------------------------------------------------------------
> Samsung SoC clock drivers changes for v7.4
> 
> 1. New drivers for a new SoC: Exynos5515.
> 2. ACPM driver: add support for Exynos850 (beside existing Google
>    GS101).
> 
> ----------------------------------------------------------------
> Aiden Isik (3):
>       dt-bindings: clock: Add Exynos5515 SoC
>       clk: samsung: clk-pll: Add support for pll_309
>       clk: samsung: Introduce Exynos5515 clock driver
> 
> Alexey Klimov (2):
>       clk: samsung: acpm: introduce driver data for SoC-specific clocks
>       clk: samsung: acpm: add Exynos850 support

Merged into clk-next.

Brian
