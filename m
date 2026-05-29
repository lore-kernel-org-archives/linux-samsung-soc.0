Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDA23BD17;
	Fri, 29 May 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063675; cv=none; b=bhZm7obwughHAC/7VIi1qRR3KAn0/RMkAPyTZTA7D05+/t0rN1rEST8UJGY8AQBhrt7L1Tmcdz5TiHDAw83fKAPpUtsCMN45NMfXUqS3J1n43IIwDeqieAKHK0+RF04pWljU+cA9VyyCuB9ziv/YJ3I6YX9XkSholFfSjRqM2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063675; c=relaxed/simple;
	bh=ue08O2d6t6ARMqltt0UxNBeDwVbeiJ463bGnvVL931k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cVEDZZLCKy8Q+zX8/VaUAmAyougsi+vys5AqSZs1n0WRobQcV7vfmiSBDJK2Mbuel/3C/ccZ9id/YTotOTt7n9rv6kWcgzxd7A3Ho/OOkgivim3Cz6gySNrFF6Co8QUovGGpRvLndf4vnhGvT4gb5qfGdHEcBsI39Uf731eNjs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hdnelqg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hdnelqg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F68E1F00893;
	Fri, 29 May 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063674;
	bh=xFUpSfQ8K42FekVk7jn2Yystije++zURvDYqbJ39kSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Hdnelqg7x8Uz2I/M3nnicz1PmHSyGz4GHnKHUlE2ROqVqdjhp7ZEoH4BP4lIulr3K
	 1IWREuYKfsX1u5cb5AYNN1BVs5PkUq26ga/ZyWdgquBsw8eWCpv9d+TBsViAHeKHRg
	 jb7IhEQlzznMNYxToxdUyPis6Zem2Ej4PFTDtwS54o03LYT3UtI2dZovGeXi9h4BFH
	 sUnGt4tQWSVDLUT1l47pPANgDvrDHK/zyM7RhLKp8cA0iq+R6TobbUlAuR+60smVaF
	 90RKWKq9Q/c/3ZuG/GXr9xWIPgnBo2Dq3qfT5LEa00Rlntxcr5cSucvQKVov8QOhjr
	 USmLY3Dau+Hyg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Brian Masney <bmasney@redhat.com>, Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260529134454.2147446-1-arnd@kernel.org>
References: <20260529134454.2147446-1-arnd@kernel.org>
Subject: Re: [PATCH] firmware: samsung: acpm: remove compile-testing stubs
Message-Id: <178006367096.55906.16678510397337205828.b4-ty@b4>
Date: Fri, 29 May 2026 16:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 29 May 2026 15:43:31 +0200, Arnd Bergmann wrote:
> Sashiko reported an inconsistent use of NULL vs ERR_PTR()
> returns in the stub helpers in xynos-acpm-protocol.h.
> 
> Since this only happens on dead code for COMPILE_TEST=y, this is not
> really a bug though.  Having stub functions that return NULL is a common
> way to define optional interfaces, where callers still work when the
> feature is disabled, though this clearly does not work for acpm because
> some callers have a NULL pointer dereference when compile testing.
> 
> [...]

Applied, thanks!

[1/1] firmware: samsung: acpm: remove compile-testing stubs
      https://git.kernel.org/krzk/linux/c/7b661285aa7507eab79efff0a418445157db4141

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

