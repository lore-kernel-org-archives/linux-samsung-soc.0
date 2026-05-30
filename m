Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1712FD7D3;
	Sat, 30 May 2026 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780143542; cv=none; b=utcVF//4LYORVuzAGFzKW0kal8E7XN2PsHMvEy5Oy37Qowx8lEk/Qq+da2c3V/d3RgVA9A6wSPthVQdtIuLmTMRUY8x8Y28vMw3scz8R8DyftleCtyrevglm/08mlBfNXvfv5KX1BK+7CFcJi+Kws01X7o0dCU6dP9K9AnO9/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780143542; c=relaxed/simple;
	bh=Ba4+DJc34+I6NOKgDDK+9MINHGOX+dzE+TTEAOjMkUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX+aNFGGfz9Pfpj1r8z6Nzjmi9zoIt6aobGQymvoxpTVm/xAQ9r1GYC3ss7UPZguuPgISzBdtSyB/XEJBDqPQNbAiK23dfPGQJuyJUqsggfUZQxuEIxQ+V/Zrie5WcVHMbMQv6asQ7nmawgsUvBKf/IQudUQSKwmxwFRWJSrS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiwRNXUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiwRNXUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06241F00893;
	Sat, 30 May 2026 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780143541;
	bh=jcAb7kozyts+b1h0rXGYQK+xZkw2WmbmCBb1u9nQJlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OiwRNXUtgv8vu2GE3Vs7nfzsSEaqco8BB+scWl7dzI+x7NeQYl4F8HYrG9z0BTVta
	 KrBivUXm9uMwA844Ewbdtppn8XntdVqltW+tBqyfMIsPesuMC9NDw3zWjRDVistI6M
	 TPT4xlexzY78TBfV3blg/t1YoU/ZtFU5d/MZe9eHodzCCB36UIlndQh3z7xVPhkkYC
	 HkOZyUpIhmKXNHHX3akIHM8daUdhXGiOzjg/zRnbBOUoIbgTUUGfVs8DPUT6PYM7kJ
	 N5v+vTVlnazwUiNQdZ4cz9ffs8EQE12L8uyVXxH0TuWBAwOXtZAfTi42N4vUj768RX
	 YhhtKv/RwNA+g==
Date: Sat, 30 May 2026 14:18:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: exynos990: Fix PERIS gate clock parents
 and add TMU_SUB
Message-ID: <20260530-fuzzy-rapid-corgi-f9eb86@quoll>
References: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>

On Thu, May 28, 2026 at 08:10:39PM -0500, Denzeel Oliva wrote:
> Correct eight PERIS gate clock parents to match the hardware clock
> tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
> gate.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
>  include/dt-bindings/clock/samsung,exynos990.h |  1 +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

