Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826834B404;
	Thu, 14 May 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777835; cv=none; b=mWrPBc59DyUE9idnqESi8PJKV8t6SK5QvC1FY0UAIV3NI2HYtx8MXszKZjCu7H43lUl6B1rSCkV/OIAHQOEZ18hB/xj3vDR6VATN35xozbH9FtJSmo72YpiMvyrleujDZEny2Wfcc4pMczl5oXPhYatjPln0k3beinME+tD2vwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777835; c=relaxed/simple;
	bh=oChIyfQLFymEOPNHqy7AoXKzE6HdH2VvyMttA3ZZRJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gfIQ4eSmwqZ7MlggSvJVNSq9AbLW8xpTliNbFWdfXbWayzO5Zqeq2q9DYHx7L9RXA5CDXIYrbzTomQM7aru6xV0Kq2RdT8ZHpj9gmPv3VSjdi7h6aLHv1CKLu2XLxMEUdv8gHrsl2EfgGOLGVVAUB75Rscvp5ZP1xl55SBG0gJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDqaFhHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDqaFhHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F196EC2BCB3;
	Thu, 14 May 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777834;
	bh=oChIyfQLFymEOPNHqy7AoXKzE6HdH2VvyMttA3ZZRJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kDqaFhHGZX/arY67mGQUBp3FLp0GAUEu+kz4WLdBo+b4K/+l/H7fJdcnFM1H5ihmn
	 EZFBD2RgMzzFyx4yJmGO6fZWT62BqyRKex9JCRqIEIXPHjChQ5uvhugzE12MeTk/Hm
	 1w5USBUSXYhvrN6tCgRsypJgXADvNn7pFzwP9qUG220R+eYGSM59vRMeVKgCfH6VbA
	 KNnWiW0sZu3fbDSYdaSXoEzdVWvenWLxyrEZ4QrSRc1+tuXdW5rWu77YAlLYPGTVkY
	 ed1J5KmneI7roICI6/8fL//F1MFkjmsnhZKDrR12ysiHzk7s3N53Ewe1mN9F3uE43m
	 FPTXoE1oCp9Sw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as
 critical
Message-Id: <177877783172.167994.5951307735596318933.b4-ty@b4>
Date: Thu, 14 May 2026 18:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 30 Apr 2026 12:53:27 +0100, Alexey Klimov wrote:
> The Exynos850 APM co-processor relies on the I3C bus to communicate with
> the PMIC. Currently, there is no dedicated PMIC consumer driver managing
> these clocks, so the clock subsystem automatically gates them during the
> initialisation. Once gated, any subsequent ACPM communication with APM
> results in timeouts.
> 
> As a temporary workaround (and let's hope it doesn't become permanent),
> mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
> prevent the clock subsystem from disabling them. This makes the ACPM
> communication functional. This workaround should be reverted once a
> proper ACPM PMIC driver is implemented to manage these clocks.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos850: mark APM I3C clocks as critical
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

