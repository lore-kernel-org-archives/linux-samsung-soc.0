Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39A221561;
	Wed, 28 May 2025 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474288; cv=none; b=C5jJ8mcPy9UBFNHViupgVEf1Tc9wV9gwLOBucK/nm3gOAWdf6s/BdhmtTHoq2/pg4KElKyanmYtmo5lk66+7fGDiSwcRK9pVwtxVahGHOdz6GhtOKm2pgSsVOjXc7Ng5BOx7TuT5IwWavCzSiETYL1hLTWkPBwNfj7S9JVDJu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474288; c=relaxed/simple;
	bh=OlkQ5LDNFcAG4+B3fU48CyA1LXgDRJ2eUlh71NIIl0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njslww3afXodhKL98Z4NmLimVbIm0USopLU3jbOtSzNNN+DQZWVrNKScwu/prld3gDcDAdbeSejmhB3u3E47+KK5Itstd9sEYjN1zR744P/ZZBE6rL2aQ03EawDduPTCULBfyYslRbL1CGbdrRrSZVi052oeSuVllgJtv3kh2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0M2qj4w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0M2qj4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748474287; x=1780010287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlkQ5LDNFcAG4+B3fU48CyA1LXgDRJ2eUlh71NIIl0g=;
  b=O0M2qj4wvoys0A4I/YcBtIYJdrj2eZonR1Zcq4S5Cw0NwNkk8WLhcZjA
   G20iNxU/tzR7I4h5MdFPhuk399k+hXKOLyiz/22ck0LzBH1K0wYOX/e9c
   aWuJ+4lkbGDXXz+SUvQ05mB0tWZ2ni+W+OnsMOkgUyb+hb42TH29llMbU
   Y/91kK0zHeioKqbdW01u1fEJR7BzX7j5Gg9e4TNrf+UjkDsqkntE5VEut
   aWxtPtGGi56xdngWErDOwB3nd0W66Y/n0UrJANQw2Q99sPneGnxKrDG8K
   zFE9CfI/UhZWku784YlxaMc8Knq3bNkOHcAzHATpsmbv4Z/PwvBbHf5go
   w==;
X-CSE-ConnectionGUID: QCceLrO7SuOUAo56GKGOzg==
X-CSE-MsgGUID: izNXCJMtTkG9clhoDtB70Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68070664"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="68070664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 16:18:05 -0700
X-CSE-ConnectionGUID: Ynjqfh96TUCxktsd33xPwA==
X-CSE-MsgGUID: M+fn4Cj8S6uE04O0uNAhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148524148"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 May 2025 16:18:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQ23-000W9G-1F;
	Wed, 28 May 2025 23:17:59 +0000
Date: Thu, 29 May 2025 07:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
Message-ID: <202505290752.ccgBnlpc-lkp@intel.com>
References: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>

Hi Umer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next clk/clk-next linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-clock-exynos990-Add-CMU_HSI1-bindings/20250528-185847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528105252.157533-3-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
config: arm-randconfig-002-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290752.ccgBnlpc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290752.ccgBnlpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290752.ccgBnlpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/samsung/clk-exynos990.c:15:
>> drivers/clk/samsung/clk-exynos990.c:1666:7: warning: 'mout_hsi1_mmc_card_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_mmc_card_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1658:7: warning: 'mout_hsi1_bus_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_bus_p) =  { "dout_cmu_shared0_div3",
          ^~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1657:7: warning: 'mout_hsi1_pcie_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_pcie_p) =  { "oscclk", "fout_shared2_pll" };
          ^~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1653:7: warning: 'mout_hsi1_ufs_card_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_ufs_card_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1649:7: warning: 'mout_hsi1_ufs_embd_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_ufs_embd_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^


vim +/mout_hsi1_mmc_card_p +1666 drivers/clk/samsung/clk-exynos990.c

  1647	
  1648	/* Parent clock list for CMU_HSI1 muxes */
> 1649	PNAME(mout_hsi1_ufs_embd_p) =		{ "oscclk",
  1650						  "dout_cmu_shared0_div4",
  1651						  "dout_cmu_shared2_div2",
  1652						  "oscclk" };
> 1653	PNAME(mout_hsi1_ufs_card_p) =		{ "oscclk",
  1654						  "dout_cmu_shared0_div4",
  1655						  "dout_cmu_shared2_div2",
  1656						  "oscclk" };
> 1657	PNAME(mout_hsi1_pcie_p) =		{ "oscclk", "fout_shared2_pll" };
> 1658	PNAME(mout_hsi1_bus_p) =		{ "dout_cmu_shared0_div3",
  1659						  "dout_cmu_shared0_div4",
  1660						  "dout_cmu_shared1_div4",
  1661						  "dout_cmu_shared4_div3",
  1662						  "dout_cmu_shared2_div2",
  1663						  "fout_mmc_pll",
  1664						  "oscclk",
  1665						  "oscclk" };
> 1666	PNAME(mout_hsi1_mmc_card_p) =		{ "oscclk",
  1667						  "fout_shared2_pll",
  1668						  "fout_mmc_pll",
  1669						  "dout_cmu_shared0_div4" };
  1670	PNAME(mout_hsi1_bus_user_p) =		{ "oscclk", "dout_cmu_hsi1_bus" };
  1671	PNAME(mout_hsi1_mmc_card_user_p) =	{ "oscclk", "dout_cmu_hsi1_mmc_card" };
  1672	PNAME(mout_hsi1_pcie_user_p) =		{ "oscclk", "dout_cmu_hsi1_pcie" };
  1673	PNAME(mout_hsi1_ufs_card_user_p) =	{ "oscclk", "dout_cmu_hsi1_ufs_card" };
  1674	PNAME(mout_hsi1_ufs_embd_user_p) =	{ "oscclk", "dout_cmu_hsi1_ufs_embd" };
  1675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
