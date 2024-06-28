Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93051BF33C;
	Fri, 28 Jun 2024 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584774; cv=none; b=GBJxhVP2I212JHuO8YRjUMsV0ROgjhwjJwOVHW1TEFe9iEGElRleCIi4dKAQObcfRm0LTqJq+FCJpJPrDKFAGwbk99wnpvBNi9yQBTtjBBGYvKzuINGQuOyqog35Gv+L1wnVTWTGi5Zb+JbMoQUJxNh3f5VAQA/zoEWfk7j2f1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584774; c=relaxed/simple;
	bh=NNwWFM7IW7qVOULGcHWmbcUyzsaVOUsCykgxUFwXvKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz+sTzh/DGXQgckM45BKOxuxK3aL6hGWe9sji2PEGCV5b9Pkph1iDa/mSS2c8UP7jInsLfmpz6BBHtOdAqoYhiWDiExo/yblaN9eHPTQWPdFu8rdvye8KBHX/U0ROSaqAhJfBKz5Y3/XxRaR6f/abGWtKE1N24dr9agcesdp1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qx+IbJ7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qx+IbJ7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2110C32786;
	Fri, 28 Jun 2024 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719584774;
	bh=NNwWFM7IW7qVOULGcHWmbcUyzsaVOUsCykgxUFwXvKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qx+IbJ7HCkyLE037fOXgJYJzpvPz9wPnov1AgJhjnwbgtunOC4VIqXTRCNwQCK3kL
	 aXY3NAmE/6pM9oxqablmPh4c/l9s95+wh3/86KLLfovE7op0iVUSJH6+NcDqjvKhEi
	 c1Rgxh0YzFvEHGd7LEUmbMD4R/tBKrtxGzURh2+aphYyLUslJYgaKVFMnB+/x/qzID
	 jKoXK+qy/pwqaSPPB4RKHJAIzLHCSfbGRIH2oMr8hf0eTkiIgD3WPRFnNWwqJ0yQfy
	 hTixpnmwVgPrKRRaVtWulPBrJ07nw2f7E0BCtj9bpktq+oRfK8/pchDMAg+vh8wqIx
	 GgK+E6YrztIJQ==
Date: Fri, 28 Jun 2024 15:26:09 +0100
From: Lee Jones <lee@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, willmcvicker@google.com,
	semen.protsenko@linaro.org, kernel-team@android.com
Subject: [GIT PULL] Immutable branch between MFD and SoC Samsung due for the
 v6.11 merge window
Message-ID: <20240628142609.GM2532839@google.com>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621115544.1655458-1-peter.griffin@linaro.org>

Enjoy!

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-soc-samsung-v6.11

for you to fetch changes up to 35d6b98c625867209bc47df99cf03edf4280799f:

  soc: samsung: exynos-pmu: update to use of_syscon_register_regmap() (2024-06-26 16:47:05 +0100)

----------------------------------------------------------------
Immutable branch between MFD and SoC Samsung due for the v6.11 merge window

----------------------------------------------------------------
Peter Griffin (2):
      mfd: syscon: Add of_syscon_register_regmap() API
      soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()

 drivers/mfd/syscon.c             | 48 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/samsung/exynos-pmu.c | 38 ++++++++++++-------------------
 include/linux/mfd/syscon.h       |  8 +++++++
 3 files changed, 70 insertions(+), 24 deletions(-)

-- 
Lee Jones [李琼斯]
