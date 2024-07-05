Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0313A25D;
	Fri,  5 Jul 2024 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720209126; cv=none; b=Os/aKz0+S72rfpkiIwYiHDJ5W3l7cM2wuZ8BdV0+caoCCvEQ4y/y3JH3/xQigxjtw1r0B/MofkgEz8qNa31+1SP4j1sxJ3+LNpdCmZ5pifyUtPLZRZ66GxrljHS2TtW5EI82rIsKbyr6fgjtHOOsdbPKv7n4LzcG2856WHWOO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720209126; c=relaxed/simple;
	bh=+VnYErGIIkw3TidWUIIlES6ORgduwaMebaN/MgmmDbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJxwdsewDGadTHCU8LLuDi+/5UrAq9vFkEcsXoIFDd08VuK1F8dSzDlaUFAmvpY0w3mv9xG5pRU2NYPz71/Hq3fI1iTBR0Dt6exSqVB8Hp64a4GZMmZ0ZuA3cPoMTUk04ea/dTAAbizXIyN022PW0aObCpj405THu37oIF59yuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAyWTzpJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAyWTzpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720209125; x=1751745125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VnYErGIIkw3TidWUIIlES6ORgduwaMebaN/MgmmDbE=;
  b=DAyWTzpJAXW/2B8+HwJ2Q5J/3PELB/SfkmcwFLlXJ+yH1fJmDX8Z6mkD
   Pre1AnNJyYELZfrHO9h8j/oNmw+//n6e8tHHvqAQnX9JtC30dWVbdbKZp
   a4PMcg6MZfJkdBDPqrhFlpqfLfo/DtuguJGKMZ5kPabsPIgOKK0sRqK9d
   XP5OwGfaAWojVdN0Mz/HqBvLNga0K+DcjrX9bRAmPHeAD7/kFsJZZZq8X
   h4Z5U+OEODmLw+hlBqzakag+Mb/VAUhQGrYTm8KEMfhY0FL5kukxHWOe2
   EXMX3gGn2WgGOo1pBfQTkl9gwbcbUodBi8VbCmJagPtlYI4B9m70LffkG
   A==;
X-CSE-ConnectionGUID: /9VFPOJ3Qc68uWOwf0V6RA==
X-CSE-MsgGUID: DVIF4NUaTLG78IC1pNAwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17150262"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17150262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 12:52:04 -0700
X-CSE-ConnectionGUID: eMQnS9GbRfutWVu7eMXv6w==
X-CSE-MsgGUID: QDixITXqRT+7KRwbYxMS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="46725005"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jul 2024 12:52:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPoyN-000SnU-26;
	Fri, 05 Jul 2024 19:51:59 +0000
Date: Sat, 6 Jul 2024 03:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sunyeal Hong <sunyeal.hong@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: Re: [PATCH 5/5] clk: samsung: add top clock support for Exynos Auto
 v920 SoC
Message-ID: <202407060332.KhLXveCd-lkp@intel.com>
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
config: arm-randconfig-001-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060332.KhLXveCd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060332.KhLXveCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060332.KhLXveCd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynosautov920.c:1131:40: warning: 'peric0_gate_clks' defined but not used [-Wunused-const-variable=]
    1131 | static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
         |                                        ^~~~~~~~~~~~~~~~


vim +/peric0_gate_clks +1131 drivers/clk/samsung/clk-exynosautov920.c

  1130	
> 1131	static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
  1132	};
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
