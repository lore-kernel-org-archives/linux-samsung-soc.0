Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFA1991CF;
	Thu,  6 Jun 2024 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690240; cv=none; b=beqIGroO+idNxgUz8iZDodiaeT6e2Eq1doXPTUaLaCCMkZDoLtel1Gf4ik0I8bvT/ttVsgjdSQV1Qma/Ej9ruz85UPuD7oHCHQ6phQCIl4lRe39gooVofyONlhNkNjmSIOw7DVz4TZzumux19771Im2fqGF/OkixNrEk7WXWHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690240; c=relaxed/simple;
	bh=xWWZ+gaYkDL6L7se9sOsqYkVgD6gieTPbfInOylbZ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWaun8n1qQ9UafH8VXqb78nmslSsqAlJ4EMfAe/g1oSMeJ7A1byKgb/1TdkhwpiNMt5R25ad1jyXlbHqflF6Jih3/bwtkkfsNjL+P0boS4TnTYSSTrqwv/7ijF8ILMwJOL/JRWeDxwG2b5NdRLjQBdwlNXAExZRxq2k+urxx42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmbzLCX5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmbzLCX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690240; x=1749226240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWWZ+gaYkDL6L7se9sOsqYkVgD6gieTPbfInOylbZ7E=;
  b=PmbzLCX5odknoa1cktfGTlY+1e2poAxxoNTflkDvOp6sWOLLQiOPqqbk
   smJ3ptzEXz3oiSNSGbpWRlHQSxBblevOtXDivybZFJDIABuRtn7K8vAi4
   Mdn6ZcKQpiiRLcZDs/APQP9oW9BghnF90OWNEE4PxtL1QkA4lfDO8FNts
   naiKXJsougpF6aVfZcB3QzAkrszUmTQWgVQKe3jRC450wgvUu9oaAjAo+
   f+lgzrpm8KPlUp++2nWocXYRgwr6rP8okK/xP1Rzru8boKB7udACrzNkW
   e3qrZOHcYruOJOVJ+PHM7S+t3bDS1yvL3eJtvDrx0bVcF7Rm/2Yv4bIom
   Q==;
X-CSE-ConnectionGUID: RvPNPuMJQb+cfrCkPlLbbQ==
X-CSE-MsgGUID: T365XC7wQA6NkNfkefOPvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14525091"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14525091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:10:36 -0700
X-CSE-ConnectionGUID: d7XDmZzjTU2ZhgGmzyFAEg==
X-CSE-MsgGUID: z077FzzDS26beD27llOV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38695667"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 09:10:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7F778371; Thu, 06 Jun 2024 19:10:30 +0300 (EEST)
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
Subject: [PATCH v1 4/4] clk: visconti: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:09:34 +0300
Message-ID: <20240606161028.2986587-5-andriy.shevchenko@linux.intel.com>
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
 drivers/clk/visconti/pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index e9cd80e085dc..3f929cf8dd2f 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -262,9 +262,9 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	for (len = 0; rate_table[len].rate != 0; )
 		len++;
 	pll->rate_count = len;
-	pll->rate_table = kmemdup(rate_table,
-				  pll->rate_count * sizeof(struct visconti_pll_rate_table),
-				  GFP_KERNEL);
+	pll->rate_table = kmemdup_array(rate_table,
+					pll->rate_count, sizeof(*pll->rate_table),
+					GFP_KERNEL);
 	WARN(!pll->rate_table, "%s: could not allocate rate table for %s\n", __func__, name);
 
 	init.ops = &visconti_pll_ops;
-- 
2.43.0.rc1.1336.g36b5255a03ac

