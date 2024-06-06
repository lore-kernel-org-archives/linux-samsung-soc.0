Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C51991A7;
	Thu,  6 Jun 2024 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690237; cv=none; b=bjh4bmJDAAWhzpkgDVSHfqGuTCzMZDmdfxVLAXfe4IQKBimjgdU3kwi2u3FC8dqxpXUtPBQ+/NZFPVMTRyEvYP4+c8ELcNTUJ8whSrD420MSN/eBhMovbGgN1ubPo2lvS3fc02e+p6XyEr4OkpOTpWd7nmtHooWjr1PMnnkunQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690237; c=relaxed/simple;
	bh=je0DYBuKhWYW4JpL97m6nmOv4z/QoM1eIcNvWJ+BGJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mt+1VyyB44OTkybg5PcwYU/CY3zbsbPZ0DTBoOhJ1p6QUqYHT+6wYI4iW+KRqZGHyNxJnRYCFWt+pCOAXu8TyZgtSUGkSD6NBUmLRJ3ZgbxcIggNpumPjtv/9OSZpoLn3MW2pdqgUadd7jog3eJhRtnPqk96K99xbIMFB4AMEB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFdMrZ1G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFdMrZ1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717690236; x=1749226236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=je0DYBuKhWYW4JpL97m6nmOv4z/QoM1eIcNvWJ+BGJY=;
  b=UFdMrZ1GfxjDqJUR3mR1sMujMHwYLbWlGKtL78M2ggr3dFjywpvvXbA2
   Tsib6sdhDPZxjvxsf5vMBD+pXBgzzGA9RWBzm7CnS3AVuCXV1KmD/ZXw6
   QkSjl13oJspvBHL3clLyHe1a116tBGOkdE0L+K9R53UpXWjPXDZe31vKn
   8mDi4LMpaDhi8mzgDVtedqCRKBGhRAL1s8KOzRrwQE0JMnj5zMuuwfBbe
   pNoRDmy5QTOOcqnDb5BjUeh+mdUDAqj1zSmR9DvMgyNUyQaA/9017EQi8
   oPrgT1/loct11vT0w50yvVV+pw94s0LyfKSRtwFUsK+zYYVuf6h7bs41Q
   w==;
X-CSE-ConnectionGUID: d0iNDyqkS4a9Ejc7IcInvw==
X-CSE-MsgGUID: ELl6U3UMTZm5GvgMDM7uPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14525073"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14525073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:10:36 -0700
X-CSE-ConnectionGUID: SEfdrqv7QsChJC8hWYOwtA==
X-CSE-MsgGUID: uMf6eAe2QZ6v/8IuWzVlkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38695666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 09:10:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 515D12A4; Thu, 06 Jun 2024 19:10:30 +0300 (EEST)
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
Subject: [PATCH v1 0/4] clk: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:09:30 +0300
Message-ID: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open coded kmemdup_array(), which does an additional
overflow check.

Andy Shevchenko (4):
  clk: mmp: Switch to use kmemdup_array()
  clk: rockchip: Switch to use kmemdup_array()
  clk: samsung: Switch to use kmemdup_array()
  clk: visconti: Switch to use kmemdup_array()

 drivers/clk/mmp/clk-mix.c      | 10 ++++------
 drivers/clk/rockchip/clk-cpu.c |  5 ++---
 drivers/clk/rockchip/clk-pll.c |  8 ++++----
 drivers/clk/samsung/clk-cpu.c  |  4 ++--
 drivers/clk/samsung/clk-pll.c  |  8 ++++----
 drivers/clk/visconti/pll.c     |  6 +++---
 6 files changed, 19 insertions(+), 22 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

