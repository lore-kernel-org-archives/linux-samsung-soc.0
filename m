Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA28332EBB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Nov 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256895; cv=none; b=k6UtNmdc6Mcb2UsX5QnnAMXoXOY1mLzvCZhnlf3JmZuXDesOE2eDgWCUelicWc32LJunOjScyTQiRmL7r3vcGl0UbIiEQAgctUZrV2sWy5j1PbO9ElqodvWMwUDJYtbPRnSkPXJ+XnCuToQzaEpUZqxLrntec5txe2oZ1Vxvjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256895; c=relaxed/simple;
	bh=l30uKtUnlnaCK6ledu8lroZbWmXZNu2PzTlxqqyu5qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nm1zdGss3126LwHbFng0mpTRzAUnbeRe7CbxIlV5CjvSWsBKfiHwVWWyP3GVxGGENYI9YFoF+HFxop8LMwlS2Kf2NkeDLv2z6x64yQFtI97dqom4LAw2Ru1MsJBCLcn5Wxgc3IsKJQHDE3OQX9onbSJboK4nI6gkyCu7q4xv3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA98yyaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA98yyaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60276C4CEF8;
	Thu, 27 Nov 2025 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764256894;
	bh=l30uKtUnlnaCK6ledu8lroZbWmXZNu2PzTlxqqyu5qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gA98yyaJSZITpigNC4DCkeQvm2AsiopCkC1F1qaCwxmPLm6D6Gh6hoBUnisubL1R+
	 ft2e2R28hq18Nvk/qifpENd1SXTe59DKaIvEmsevGoSnegRt+SqixEDWmW1WYVTies
	 5ejBXHuGTlNLvVhK98fcngzLZh6rTmCSssnJii5eES9rTAvklkcM/QwOznuqXTsIRw
	 yinfANoVICeBU6rfzR/9JC8wPQV2bzWeZsQ32Wu2pGyeALED7dtt6xHbbuXlTr1u4Q
	 bEz8xwb2w4j2FgsfuiNtQ4EZwCxSfxSZL9EIovoOMdEzVcPLhuCgyEYnN75Wc+wjfz
	 4sZLjTiSKHJnA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix structure initialization
Date: Thu, 27 Nov 2025 16:21:26 +0100
Message-ID: <176425586192.204407.1695142870137100986.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126110038.3326768-1-m.szyprowski@samsung.com>
References: <CGME20251126110058eucas1p2054c35c38f2f849e5058b899eb66c377@eucas1p2.samsung.com> <20251126110038.3326768-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; i=krzk@kernel.org; h=from:subject:message-id; bh=qbucT3ubxCwA1fjqkmwDVPd9OxWxjvyWkTEHahQ6ir0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKGx29RC29QPwKsDrRYWVJFlud7/ff8F4J5blU uIT7I7i8ACJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaShsdgAKCRDBN2bmhouD 1+L6D/0SG99nNLFM+42dwcjHfpytOMLTQVnH74EMGPFWvH2o6jBZjIQiCj6olKFd/KywRgBqkKb P3karkWVs9xSlK2eNCkZcOW8dZy1MXj5OW/+L8PEpeQC+X+JlbLBrHFCQZoXS1n5nAdB4DSovFZ rj+O8LczYTVgHfIkCjY1+4eSj4/nIclvmk9d+JX/DSiu5Jvb9lD2+voW+P71OymdXd/BlFpNFQJ EX84zli1adrWQARagvQ6BQXnouSlFkGci8taN/p2pkocEDTMehlwHkMO0Cwj65YQyIIUcXq+pzb IaGhMcLr6qFYAuBURkkjCZ0kPXScrW8EQ15VezCaqmUtjMqBZFHwU/J2bKpyxmSafhI4pEJ90T7 xxUl0DZuDiNvwywKeEL8Jui+lYUWYU89CUTUeprr6bDCgTCGCIntnLBsJJrrz4S/WwUF511CoEc 0i4sGCJDZWLb2tge6h3NDXPjwxbTWXN2uMoKm2SualD0Q23k0Em/cmbL1d9H43RtE4QnaDjL2gZ MP5yZLumbfeY6oG8TCXV9AmEjltNNgLjMYfi7bcY+RDZl5jP+/ufEc1hmoKfqd/wrh0Tvw840Ft LC6IQGPShx44J8jcf5EBfy2CvV2frh8PeEfg/KiVMh6tFsUPonCG9xxhF55HeVXiRxsNZ5LPigh wijPkD6kvnsT5JQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 26 Nov 2025 12:00:38 +0100, Marek Szyprowski wrote:
> Commit 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for
> gs101") added system wide suspend/resume callbacks to Exynos PMU driver,
> but some items used by these callbacks are initialized only on
> GS101-compatible boards. Move that initialization to exynos_pmu_probe()
> to avoid potential lockdep warnings.
> 
> 
> [...]

Applied for late. I might send it during merge window or might miss it and roll
for the next one. In any case I will keep it in my tree.

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Fix structure initialization
      https://git.kernel.org/krzk/linux/c/2224ea67c75d0a0b9eaf803d0dfdab8d0c601c35

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
