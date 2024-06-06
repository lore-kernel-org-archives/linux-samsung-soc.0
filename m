Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7B1991BB;
	Thu,  6 Jun 2024 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690239; cv=none; b=ZtM6rC3aaml6KEpD8nOK4xyfc4QdHgO8W1U5bfl+zFI4ZwhLfLOBhk65xICKtiqmUci+j+xemiI2644BKIUW23yK1w/O6Bq+sdYA3NMg2gMtwGxFABQ0dSUF+wY+sC8qdpgqNLaSFuf7cwmCNkub7d44vvQ/uLd5wwg8+W7RXnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690239; c=relaxed/simple;
	bh=gj6vGOfIMvi9wknlVIRBepDS/CXPzi91odpfx0mTouo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/gOiU0V0hHtgc4PudFRi5Ove3BYJ0x2DVt751NUBX4TMKq4yLV4x2PK01CvOZWXLok7xVWmfgfbnv2SMGz6NUgfHuxWP0yc4+qklDOhMy+PbbrOdcZmMTKUbj4VAKEmOAar3a6hSRwWHWi/QXbZQdj+ezDIg9zhosSB9JNQqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWp/1rHL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWp/1rHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690238; x=1749226238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gj6vGOfIMvi9wknlVIRBepDS/CXPzi91odpfx0mTouo=;
  b=BWp/1rHLf0gWpdstKDFmaGtCVrAMgoTeKyrjZneIqCSD6KWNlhG0i+0F
   WQIdV+1umJbUaEJyN6wS/1JZSVbo2esa7w1fmh+o97z8dcd0CIaqKAk6D
   Ge9/JK+OsoBEyS0n6Td3rJdEak8KZD6rocyVjVazE4rD/kKj6fBnB46oq
   e7olweniMyEBQHenUipqdc1X0Wg7Nme2foKLjixuOp2hZRqsOAj+2yuQ8
   KI+tyR3G3aRU/2ZmMkmUqhQBvE/GhqR9SkY4fCsWmMWudpR9lfGCDxF6X
   YhJVCIufhzYevair+DsAYarFFFV+LxXZqWO8tQ+0aLfflN7rY3pA1n0un
   A==;
X-CSE-ConnectionGUID: 3aCrt+LSTneoV6NFTdDGZg==
X-CSE-MsgGUID: dO6UusazQfqm79OAVsLJww==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14525082"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14525082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:10:36 -0700
X-CSE-ConnectionGUID: 6qzv+wlwTLqiO2jXs6ZH2w==
X-CSE-MsgGUID: WntpOTQdS1WOSgQljWuITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38695664"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 09:10:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 68B992CF; Thu, 06 Jun 2024 19:10:30 +0300 (EEST)
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
Subject: [PATCH v1 2/4] clk: rockchip: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:09:32 +0300
Message-ID: <20240606161028.2986587-3-andriy.shevchenko@linux.intel.com>
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
 drivers/clk/rockchip/clk-cpu.c | 5 ++---
 drivers/clk/rockchip/clk-pll.c | 8 ++++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 6ea7fba9f9e5..398a226ad34e 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -369,9 +369,8 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 
 	if (nrates > 0) {
 		cpuclk->rate_count = nrates;
-		cpuclk->rate_table = kmemdup(rates,
-					     sizeof(*rates) * nrates,
-					     GFP_KERNEL);
+		cpuclk->rate_table = kmemdup_array(rates, nrates, sizeof(*rates),
+						   GFP_KERNEL);
 		if (!cpuclk->rate_table) {
 			ret = -ENOMEM;
 			goto unregister_notifier;
diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 2d42eb628926..606ce5458f54 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -1136,10 +1136,10 @@ struct clk *rockchip_clk_register_pll(struct rockchip_clk_provider *ctx,
 			len++;
 
 		pll->rate_count = len;
-		pll->rate_table = kmemdup(rate_table,
-					pll->rate_count *
-					sizeof(struct rockchip_pll_rate_table),
-					GFP_KERNEL);
+		pll->rate_table = kmemdup_array(rate_table,
+						pll->rate_count,
+						sizeof(*pll->rate_table),
+						GFP_KERNEL);
 		WARN(!pll->rate_table,
 			"%s: could not allocate rate table for %s\n",
 			__func__, name);
-- 
2.43.0.rc1.1336.g36b5255a03ac

