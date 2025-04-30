Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44151EC01B;
	Wed, 30 Apr 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997988; cv=none; b=ZLKJQXEFkF/Y3hANVDXYaIqDKFmkM9dPuGJHn7aLqv+Ga/Z4KLU0nCjC+3TWN2ut4eOtYy9AEqI62fnXlAb/oRAjzgqZbnxT5HsDvYiJns62xoLrC+aqbp0aBtsmVBUusiZDvSc98CAO+TQTwtpXYepFyupGtcYy8ySao0E2T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997988; c=relaxed/simple;
	bh=t6ueMHETV9KCgJvq2360uo0bIUeF3j0Jz52z4tX26yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVtOn2ZqafvkxInykTIlx03jORgptDUFys5j6e9JJ4YcuuK32nrzbBKXQZSsllxafCZEHEc/xrwEP7l9uXeaKF0pSZLYAdjwNK+sXA6j2wqqnjm0DJeAw2m2TI7vI48Ckyka7vyUHyQE2jAnmzkD7hPhePD70edbPCo3SnlTb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvfeD8QQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvfeD8QQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1017C4CEE9;
	Wed, 30 Apr 2025 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997987;
	bh=t6ueMHETV9KCgJvq2360uo0bIUeF3j0Jz52z4tX26yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvfeD8QQKzC0uPB03Va/ckWcaetKMqORWYU7mNHmOrEUeDNqw7jklqILFZ1yIClEn
	 XJvO5yloSVlgk2e2ngqu0UwXSJ7osrrwPdsqPh7K2nFhr+dkViD+i3557R4wqM+guG
	 HOeoorPCdi9p7Rpy4rLf6rYMwzwGQq9E1gl6paGPowIPqnM3CBO75H939mkoztme5q
	 nLXboaD+iH5B7Vj46Dyh8BMFCQ8VA5eRryLiWvtoIfGrlXVGxEsSZTp6U7sSwOoSzr
	 HZtf5Y12zNpbJ1YH0H5rxFcfJAZPFo0sEXWY3MWJQ+h1/oNkJTj08OFE6Weo0U7Bt4
	 AzFyrj2aFg/qA==
Date: Wed, 30 Apr 2025 09:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shin Son <shin.son@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: samsung: exynosautov920: Fix incorrect
 CLKS_NR_CPUCL0 definition
Message-ID: <20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
 <20250428113517.426987-4-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428113517.426987-4-shin.son@samsung.com>

On Mon, Apr 28, 2025 at 08:35:16PM GMT, Shin Son wrote:
> The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
> It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
> a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.
> 
> This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95	

> properly matching the last clock ID for CPUCL0 as intended.
> 
> This error was due to confusion with the hardware diagram, and this patch
> ensures that the number of clocks for CPUCL0 is correctly defined.

Fixes: 59636ec89c2c ("clk: samsung: exynosautov920: add cpucl0 clock support")


And proper order - fixes are *ALWAYS* before new features.

Best regards,
Krzysztof

