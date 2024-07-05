Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBA13A416;
	Fri,  5 Jul 2024 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720216035; cv=none; b=i5h4CGUjhVoXmSMr8u1OjY6ak50qL++W4NqYH06R9bkN1zTEXU6P6Q5R58XUkP7v9bSNn8p5Z4qR/9rfihccYlxiQlhmtuJW54lg/x2Y2n8C4GV6dN0kw9ZGt2ThfuHilv9h6IyMSvvVIXepKlC01Gfr6Fh0GY4W6Ipvd4MjIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720216035; c=relaxed/simple;
	bh=DO9YI6U87/AdMasnKM6dLVn1EA/TZFiL2Gbj0GMnUZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naRjHi2m2UN/FwpUvCRPpkgnfqthl9PkjWQvpRFOz5uv5e8d7RpDQgXTW4QwCksEQejeKasLv/yGCZ5Me7YaxSWCo/g7QtnqI7Z3DlPRS6KTP3ibkBAW26rabo19Xe407lg31ug9V6jj2GDdjVHLX2q8GbiDRy0q2InzJkQ5D+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muGtsAxj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muGtsAxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720216032; x=1751752032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DO9YI6U87/AdMasnKM6dLVn1EA/TZFiL2Gbj0GMnUZ4=;
  b=muGtsAxjD/Igzsv+LCo4NmSKZsOQBFuEN/zhBlUgW7htJV0jzxntUk1n
   ErLXjna8TRyItrOO7220YNMTLsgwhb8BQmc58FE8ylXfqy3sR61BNf5z5
   wHiRl2V2l4D2WaDfj8nOPLxYJWI3EESI6VzyASIglba4dtwbPuFQQ4QgP
   ltgfYCklIA74gyTIWJKtYL7gimXIgCZQUzlM3PEyAGJywHrn+BmUwO4aD
   1sdh8Exh5WUwEzQyvL6F+VO+yjPJu0q3uO90HjW3Q/TdrDdAxLZUS3YRa
   mhqmW+6s/kkw6RQ1QxIu8UoYRqkBnCMv8Vn+WZ+luTurqcZO2HxVg+l3M
   A==;
X-CSE-ConnectionGUID: R1hVL9B+Th2ROvAZOc2gjQ==
X-CSE-MsgGUID: xPvJ/cayRli9vmG2aQVOPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="40018474"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="40018474"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 14:47:12 -0700
X-CSE-ConnectionGUID: aIZrDO3KQ0C9qQiMHrZZJA==
X-CSE-MsgGUID: OxqEUSBdR2KL+507Z7R3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="47040794"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jul 2024 14:47:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPqlm-000Svc-39;
	Fri, 05 Jul 2024 21:47:06 +0000
Date: Sat, 6 Jul 2024 05:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sunyeal Hong <sunyeal.hong@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: Re: [PATCH 5/5] clk: samsung: add top clock support for Exynos Auto
 v920 SoC
Message-ID: <202407060546.Zqh1m0PR-lkp@intel.com>
References: <20240705021110.2495344-6-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705021110.2495344-6-sunyeal.hong@samsung.com>

Hi Sunyeal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on pinctrl-samsung/for-next krzk-dt/for-next linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunyeal-Hong/dt-bindings-clock-add-Exynos-Auto-v920-SoC-CMU-bindings/20240705-195227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20240705021110.2495344-6-sunyeal.hong%40samsung.com
patch subject: [PATCH 5/5] clk: samsung: add top clock support for Exynos Auto v920 SoC
config: arm64-randconfig-003-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060546.Zqh1m0PR-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060546.Zqh1m0PR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060546.Zqh1m0PR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynosautov920.c:1131:40: warning: unused variable 'peric0_gate_clks' [-Wunused-const-variable]
   static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
                                          ^
   1 warning generated.


vim +/peric0_gate_clks +1131 drivers/clk/samsung/clk-exynosautov920.c

  1130	
> 1131	static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
  1132	};
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
