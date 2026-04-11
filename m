Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CA32BF4B;
	Sat, 11 Apr 2026 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950037; cv=none; b=oSeus2/3VIDl0sBMOg5eH1DsBIHlbZIt5tT/+rEjBRhNI4hX7e6YH99DACossMGzzkwcA1MNyK480ZRocn9tybTfounSYvYDcIbKvdYbgT6tUFgLrcbYuVQnDArl4EDIpiG1p+TSPOMQ1oZR9uAbUpMgS7RQUD3EodNIELrGaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950037; c=relaxed/simple;
	bh=LXHkZxih1G2uTel5Anfkx7VPplnJc6y3RzsjrAFOjk8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=G1xv6YPgVAoRya9xjuR8mn1nkAQo7VBc3MOdinUCZsLnyL8mby25zAQVpku1YsBQu2GkdTHgxPrZ17YfPQ0TN56E0N8KGLNljzfpGzE3e3JE1ZN/jxNG8spqFa+78mYpk1dHkFkButWEHFSnAurDKJ4airFZ4F0ogOzKM++w0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0VJ5rh5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0VJ5rh5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2048BC116C6;
	Sat, 11 Apr 2026 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775950037;
	bh=LXHkZxih1G2uTel5Anfkx7VPplnJc6y3RzsjrAFOjk8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X0VJ5rh5Q72yvEaU/sDf20IVA1nppYAPQ34nBsLxWHl7GutpmyhSaU1N0U6wDAufD
	 GkNpVQr1+z+MwrS9h1D4fDyZFOJPcw59wHqMJZbeK+H+lXhjcOP7MAUVZ9Y+0IfbhP
	 LqyfQfCPJAL8kem4pJr4SLnLLtoiCa3TjfsbBmlKN3OfMkupyd9BXrdvlhj4UR830h
	 zJkDKg+asS0/83IswP9A9CNbid396PhHTygO6eY3OxyEgV7ujjVUGl8oi2HUJQdix4
	 gkkv3r6adHb4hPWnLsxHsQ1QrN6nIS2/vurdFAA1d99hHn7qFE+aYorsytc3JQR1gD
	 TkVOJGt7RWuqw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409122504.71017-2-krzk@kernel.org>
References: <20260409122504.71017-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 11 Apr 2026 16:27:15 -0700
Message-ID: <177595003527.5403.10199735016466496186@lazor>
User-Agent: alot/0.12

Quoting Krzysztof Kozlowski (2026-04-09 05:25:03)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.1
>=20
> for you to fetch changes up to e57c36bc1a3e459239ead492ebce731a88a264b1:
>=20
>   clk: samsung: exynos850: Add APM-to-AP mailbox clock (2026-03-24 13:43:=
19 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
