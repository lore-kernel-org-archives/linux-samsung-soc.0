Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68E199399;
	Thu,  6 Jun 2024 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690244; cv=none; b=hrheJrH4tdbMN4/8aThOnwAimBTd9DuuZLYkOiaraSQpVadz3FQLWhChTDmafKhXcO3ZecLy8VX/raTQOnbsbnV1TgD+T98dTIq6lc5ZbGYVQZg5Z1QtGkumlYJOIbTPJPpKvNjaNhOVSqqhxA3o56R54fOP1p97eTeXj1S4oRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690244; c=relaxed/simple;
	bh=3+qSRLVpcdMyUzcNy5jn6Wrz5bikHflvBafSsMgGFj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkein40dAFnzn3YJd2TGm2bX77kqSyTNQioPle0HzHQCmga+CfAREYg1pF5UKfyu0K4mVooSk/LlPEeg+0WojA1gW1XF1dncSSWGBa1113oRpF3SGrgHftz4DJOFf0Z5+JzkN+GqtoOFhfuKoSq/g3ZLZXMi6ZLzDzGov5rwGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIEJx+PB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIEJx+PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690242; x=1749226242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3+qSRLVpcdMyUzcNy5jn6Wrz5bikHflvBafSsMgGFj4=;
  b=aIEJx+PBIvh4wCbIWf+5RU/uxUGYoQxDHB8tN/Snu2P04uA9R+wifoEg
   OKCNtP0OVvqV4a1PemcfHQwtR8ah+SL5KxmkkiZt4QzxtqwDLfTy8QBDk
   80RUkwB0OpFmvD48TbLp0c0qSvz+7R4wftjClWStMoDf551saFz2aCaYc
   qxFG5mXk1o8QKcAo4j3QKz4y4u620sa9ZVyglvgN1rydtBzYoQtVMxrVy
   tlG3Y0VUmbjBi19nH7nx9LGsvvM0nkCoaGpo0myfvPhckMZDWvjCBfbIT
   E+TPRP8HzfvqV6SgYE4JKXlBdfdRncnFykXBKEcmUe528+SG+CgNOYfSp
   g==;
X-CSE-ConnectionGUID: w/PmKJ2lRZKIWJDukrHV5Q==
X-CSE-MsgGUID: fYD5Ur7ySleyJ2pBZ6tojQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18164351"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18164351"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:10:35 -0700
X-CSE-ConnectionGUID: 6PYiMqvtSKGU11AqT+idoA==
X-CSE-MsgGUID: nCNrCDJvSL+zXHFUY5b1DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37949163"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2024 09:10:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 73307339; Thu, 06 Jun 2024 19:10:30 +0300 (EEST)
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
Subject: [PATCH v1 3/4] clk: samsung: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:09:33 +0300
Message-ID: <20240606161028.2986587-4-andriy.shevchenko@linux.intel.com>
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
 drivers/clk/samsung/clk-cpu.c | 4 ++--
 drivers/clk/samsung/clk-pll.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index fbf4c4208e06..dfa149e648aa 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -689,8 +689,8 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
 		num_cfgs++;
 
-	cpuclk->cfg = kmemdup(clk_data->cfg, sizeof(*clk_data->cfg) * num_cfgs,
-			      GFP_KERNEL);
+	cpuclk->cfg = kmemdup_array(clk_data->cfg, num_cfgs, sizeof(*cpuclk->cfg),
+				    GFP_KERNEL);
 	if (!cpuclk->cfg) {
 		ret = -ENOMEM;
 		goto unregister_clk_nb;
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4bbdf5e91650..4be879ab917e 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1286,10 +1286,10 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			len++;
 
 		pll->rate_count = len;
-		pll->rate_table = kmemdup(pll_clk->rate_table,
-					pll->rate_count *
-					sizeof(struct samsung_pll_rate_table),
-					GFP_KERNEL);
+		pll->rate_table = kmemdup_array(pll_clk->rate_table,
+						pll->rate_count,
+						sizeof(*pll->rate_table),
+						GFP_KERNEL);
 		WARN(!pll->rate_table,
 			"%s: could not allocate rate table for %s\n",
 			__func__, pll_clk->name);
-- 
2.43.0.rc1.1336.g36b5255a03ac

