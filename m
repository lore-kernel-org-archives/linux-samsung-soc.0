Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A691E61FF1;
	Sun, 16 Jun 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718524774; cv=none; b=mRYNu2/pN42cLx/D+gkgw88JcgK+aaeaI6/jFuzpOC+3rc3aP+hBt/NpWJU8yTsyRyeUXj7e5R4B2CEIk7/kp/VFLL3Fw2e2uLfGGosFYtZtjCnPdYOp59UnS/oHSCnnLyVbSNthV9psCX5G9OuJk5iW55UV9PKsmA3xIQSRhs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718524774; c=relaxed/simple;
	bh=kdCwhDXT+UFIY/O1VgGsN1+FtroxhsWGrqdbAQg5REs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZiOCib34p6IE7LMxl/IJlBw70nzMWBByEpijdxgSRY6sqSHlZr4gXQi4a/HI9zI7grvncSKh8HBXmEnvTnPWrYlo8CMSIIEv5F1WD+37nMNpkIGQBIF4yAEIv0NHe9ow08upXwhRQggdorT01tXrVM9nsQPSg048jtoH/mQZ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from 79-98-74-242.sys-data.com ([79.98.74.242] helo=phil.guest.centrum-krystal.cz)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sIknO-0000UZ-8H; Sun, 16 Jun 2024 09:59:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-rockchip@lists.infradead.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: (subset) [PATCH v1 0/4] clk: Switch to use kmemdup_array()
Date: Sun, 16 Jun 2024 09:59:24 +0200
Message-Id: <171852472233.3824365.10919952003321666649.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 6 Jun 2024 19:09:30 +0300, Andy Shevchenko wrote:
> Replace open coded kmemdup_array(), which does an additional
> overflow check.
> 
> Andy Shevchenko (4):
>   clk: mmp: Switch to use kmemdup_array()
>   clk: rockchip: Switch to use kmemdup_array()
>   clk: samsung: Switch to use kmemdup_array()
>   clk: visconti: Switch to use kmemdup_array()
> 
> [...]

Applied, thanks!

[2/4] clk: rockchip: Switch to use kmemdup_array()
      commit: c9ba07b0c02acd89f2e521754357de30e704c254

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
