Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F89289E13;
	Sat,  3 Oct 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791035224; cv=none; b=TjYKn+y/RZGqkkyX2v6SJkzINkjWQvmTF9d0Lgsj4qdMF0a8FNY/KUy6I1AfdJ3x2gQOmKGkESkRf6v7ZIgTgUGpmchTas3F4iZFWe9EXzAGjUO8Y6Za6cBKiZBAHyrLLX8SzzoYtVltu0m39MgI+Z0UncDKeS9+pxCPsJ4/d00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791035224; c=relaxed/simple;
	bh=Xut+Lntpa/jRVZ1qBtTwTMTo0Ern+uyzdy6oYZB6rqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bkbe1p28AlLoC2HAyDe+4gGU4nQpMqB3o4bHMPyXe4+mnqLSh6lLQzK68bwFIk3tVocYHg96K1zheJzh8IJ/WwbwZyMnxsAZjY8A+fRA3UVIpQCgaK6elLFMVUs/eCRiLgeZ2dtd2/taf5lPoqRoSFdr0rj6d2QOinezcfQ+onc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHYklXRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHYklXRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8254C1F0089C;
	Sat,  3 Oct 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791035222;
	bh=ofZE+kb1r8+hvMIvcuxyOTAGuinMX21M/94Z27ADFBE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mHYklXRYPMv6RxvQhyiuDtRBe46DExSwR9/8GHCdBCQcQ8eNPtg7Wpj4u3rGC97t1
	 W4AV9lk7Ld3mf8wgDmNthZDkenjgAjFNPGl9Oe4osu+feJ8zj4za+hsot6D1G4TTDW
	 Q9TJMRKKzFz9BK5UJVBnI0pLMUSOEBlWEFnMr0EROwg/QQV1Ew6hMSZalGlGrZMv+M
	 w9lCP0HIF7claHjnt4V/DNf3aBlOW/d8bVkrgXt+grSKu+oQWs4LsQTHHNgttxt3Y2
	 m4XA2MykwUtdHWuNP4h0fLGh4KFuQ7NjgFYWhfLGk7BfgNGAGnPLwkRxhN1KbqDrfT
	 3Sdl/+BqtrYMw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaidev Shastri <jaidevshastri@vt.edu>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-mb-exynos-pmu-v1-1-4babb522ce0d@vt.edu>
References: <20260921-mb-exynos-pmu-v1-1-4babb522ce0d@vt.edu>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: order pmu_base_addr before
 the pmu_context gate
Message-Id: <179103522127.13392.6192386924567242318.b4-ty@b4>
Date: Sat, 03 Oct 2026 15:47:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 21 Sep 2026 21:07:23 -0400, Jaidev Shastri wrote:
> exynos_sys_powerdown_conf() returns early while pmu_context is NULL and
> otherwise programs the PMU through pmu_raw_writel(), which uses the
> separate global pmu_base_addr. exynos_pmu_probe() maps pmu_base_addr and
> stores pmu_context afterwards, both with plain stores, and the reader
> loads both plainly.
> 
> Neither the two stores nor the two loads are ordered. The callers are
> the Exynos cpuidle AFTR path and the suspend path on 32-bit Exynos,
> which run on other CPUs, so a caller that sees pmu_context before
> pmu_base_addr writes the power-down configuration through a NULL base.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: order pmu_base_addr before the pmu_context gate
      https://git.kernel.org/krzk/linux/c/682df6e2330123019fcdb9f6122f34a395082356

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

