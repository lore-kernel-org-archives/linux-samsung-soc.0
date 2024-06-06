Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878DA1991B6;
	Thu,  6 Jun 2024 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690239; cv=none; b=IF19vK12HVd7m6yJLsGD5XZ7JfYTPxxRVe/P+PPXMj93nIAQz7WJ2ZH+Yb6z1UdTBik1uIIt3rSneTENipBZ+Y54FUaixo6H8q/PZPGp7SXH+znIvqEHHzEkTy477HWizkbbEepw4wPD3ZeTMGh9BHyyhvhOzYZmqOFbYNaoCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690239; c=relaxed/simple;
	bh=981GD+z8786+C1hp7EEXk+A3A1FHkVkYoLEaJHuT4kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5kzeRBt/B/hzzBtQcdvdu9i2xA7jt8BRe3dpM/DPKGEaJPPKQuxP2cLVl6k9RzFzPXgNm2Oe+UBYvqOy7hgZ66wqcjfUuFf1kgHR+pjcJD1JcHDKPsk4d8g0XsHArDY1GqryAd3LXXyjS+HYhuodUHFACNbbGnYFhPDk/sSZIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIL9SuzP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIL9SuzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690238; x=1749226238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=981GD+z8786+C1hp7EEXk+A3A1FHkVkYoLEaJHuT4kc=;
  b=lIL9SuzP05E736w2t6sclJvu3JqLstKrWkKBJ/zTYz2Sr4IkcQv/5lJD
   FbHS8TuKdGkelpaIeuPt9+y7fzkv40lYjRMv/vzXotl1pdgOr0NzFIx58
   ksQzp4nq9h7NsMk2DrEITP4Knd/hNmuRZhZPD4Stu7FKCagqpv7jfeeun
   arpxMsNWizX0ycsv7QMm8ANfUFwhmnXd7lTj8JL1/GFtXHxGd2tlO5E0L
   n4e9KKB662q9eTojfVIj2tYSao/S2qF1tcg4vagZZj+B0O7168+WB5C38
   Vy9hyXy75VGDpXMb5w46MgfDOt0IJAER1gAU7e4FepHULRnEG+uG0NXIT
   A==;
X-CSE-ConnectionGUID: N/xwbN3pRw2XyKatPQvEGQ==
X-CSE-MsgGUID: bAVsWFH5SxqrIc3Sye+W3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14525065"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14525065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:10:36 -0700
X-CSE-ConnectionGUID: 0YfWCvGIRxmFQhBgzuOM0Q==
X-CSE-MsgGUID: fP3DNq1eQYaIJNdR5+FS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38695663"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 09:10:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 617131C9; Thu, 06 Jun 2024 19:10:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v1 1/4] clk: mmp: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:09:31 +0300
Message-ID: <20240606161028.2986587-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/mmp/clk-mix.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 454d131f475e..07ac9e6937e5 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -447,7 +447,6 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	struct mmp_clk_mix *mix;
 	struct clk *clk;
 	struct clk_init_data init;
-	size_t table_bytes;
 
 	mix = kzalloc(sizeof(*mix), GFP_KERNEL);
 	if (!mix)
@@ -461,8 +460,8 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 
 	memcpy(&mix->reg_info, &config->reg_info, sizeof(config->reg_info));
 	if (config->table) {
-		table_bytes = sizeof(*config->table) * config->table_size;
-		mix->table = kmemdup(config->table, table_bytes, GFP_KERNEL);
+		mix->table = kmemdup_array(config->table, config->table_size,
+					   sizeof(*mix->table), GFP_KERNEL);
 		if (!mix->table)
 			goto free_mix;
 
@@ -470,9 +469,8 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	}
 
 	if (config->mux_table) {
-		table_bytes = sizeof(u32) * num_parents;
-		mix->mux_table = kmemdup(config->mux_table, table_bytes,
-					 GFP_KERNEL);
+		mix->mux_table = kmemdup_array(config->mux_table, num_parents,
+					       sizeof(*mix->mux_table), GFP_KERNEL);
 		if (!mix->mux_table) {
 			kfree(mix->table);
 			goto free_mix;
-- 
2.43.0.rc1.1336.g36b5255a03ac

