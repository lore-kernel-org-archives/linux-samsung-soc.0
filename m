Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599788;
	b=eBc3sI5wnM8/bVir7n8ZE1NjT0Ue0gy+ttntVL7gIdqAhAc5IrqyiEEDeNwfIpaIvbEf
	 GsAf3H8HkHIfLxBN4MBtyeeq2Ebmbkmdw0WEKeKahL0xBNKlgxGaWclwWCA0nLwiWIgIa
	 cz+2jhi0JIlc50dUzheQhn1RKsKNssC++SOAp5wQ7irahkCnZeSiy/FgVyyQgCaUXmU0b
	 KphFM8tDLvbolEXQSv9FJd+0a5AbZZlbNtDmPtRTbU8ozEHJR96oCOIJM22WUuVRzzcGO
	 KMgelqyR/w8xMOEwu12HRIgrKcfM0rxssKPDTPWxZ6fuKVV0AVCQiHudjx8k9rNbiRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599788;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=wOHj1d0LLsR4NEXioV3U1dxoAjIfm4PZ/x3fQDWazaA=;
	b=ZAF5WtDuIcVXRnmZ304i5/lU2W7XglnBNHNHB3KSRMwUIw6Bt90bx4wlUaDuA6KEiYBq
	 PopVaLbVMUYOiGPG3aN6xF9eA5nVACoFTwzGgrROd/d5LsT/frhEu/TtPWvKFHgGDlnzq
	 ym0ZXwgkGcOIgMiVdWwdIq3IPHxKAGB0pA7/xFH6D2zc2mg40+9BrqNIcAIfYRUafAbrs
	 5LPZ6/uAQAMyJI+fsT2r4kESEQGrBIAotiDMg5vIxzS+V98Fa2qcpa3bQidWuewsCKQ4L
	 26S4zu3tUECuDFBI1XNrc8V92pxfoXPYwD2eZD29L2rZnquwcfgCidc+sBfJMd5QcpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d0/fkeri";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923260A6F7B;
	Fri, 13 Nov 2026 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0/fkeri
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA91F000C4;
	Fri, 13 Nov 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794599788;
	bh=wOHj1d0LLsR4NEXioV3U1dxoAjIfm4PZ/x3fQDWazaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d0/fkeriZVr4S0U16bHjr9wAHrjQGekFc1etjF922zDxmBP45mK5cT2rhJplps2+J
	 B1Wk3Uy0J+DoRvzwpKZ9D/enebWIyqxC8DqqHR/8rCB+LCLxjRnhXlldBdaoH+gGwA
	 ugjF1+lvbvUj8pa4UNuwthS59HFo+CVD55OjRKfWdXDEzSYg2y5amNhp9GpddPK4UA
	 1HdI963jNwx7BHhP4LqN7aebUd45OMGNPo99VFkSR4E9ghG+lMLdgqDEWNeZg4D8ob
	 g1nQtI/Pc6YMpEbVc69l/fURbgFg51KzcrR2NtOnDE8avclEZ8G5aXm+9fl62u9nVm
	 bKwb98g30Bd2A==
Date: Fri, 13 Nov 2026 14:56:25 -0500
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
Subject: Re: [GIT PULL] clk: samsung: fixes for v7.4
Message-ID: <avdraUOapLKvCUTS@x1g10>
References: <20261113071818.14923-2-krzk@kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113071818.14923-2-krzk@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Nov 13, 2026 at 08:18:18AM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.4
> 
> for you to fetch changes up to 5fbe2d229bd3738ed63c7c9177466ad6bc130f18:
> 
>   clk: samsung: exynos5-subcmu: Defer probe until power domains are available (2026-11-02 13:24:59 +0100)
> 
> ----------------------------------------------------------------
> Samsung clock drivers fixes for v7.4
> 
> 1. Properly handle deferred probe of the Exynos AudioSubsystem clock
>    controller.
> 2. Fix integration of clock controller and power domains on Exynos5250
>    and Exynos5420: be sure device runtime resumed before proceeding with
>    probe and defer probe till the power domain is available.
> 
> ----------------------------------------------------------------
> Marek Szyprowski (3):
>       clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
>       clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
>       clk: samsung: exynos5-subcmu: Defer probe until power domains are available
> 
>  drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++++++++---------
>  drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++++++++----
>  2 files changed, 47 insertions(+), 13 deletions(-)

Merged into clk-fixes

Brian
