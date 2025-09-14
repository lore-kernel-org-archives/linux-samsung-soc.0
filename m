Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2D8287E;
	Sun, 14 Sep 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859396; cv=none; b=QXGCGwIUmiA7rfFSlYxX3XmuRCAq42vPkS1koA/CgDP2WcU164+o/v0L23FlbfbQSk3n7zXl/1wBdrWTMm1bmun4cejlo044RwZtzpdDHkbOscCT51aC69CJnO037FYupqYEihILDYypcXojgpkZj+Kq/7dV/Ea0VkqhSe86kWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859396; c=relaxed/simple;
	bh=LC3H0PVcyqKsgsnH8G6RjhY7nYzGXX6eP+wpc+zEEsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJVjXj5dAn/KElCMuCNeIRFS6iEW+A3EgtQx8iv1+JCVKhlG71Q8F+SAPrk4GTO9OAQ9/rCApRWxC6umKvvuB5wnwU0ElkLVPSyWdH5ziYQBMImzBh0ICoMsfMxGOBV47rtuhvGzDv1JTpgc945kDrU2YEnNxQriE0Xnuh7/Jrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTYB9lZj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTYB9lZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757859394; x=1789395394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LC3H0PVcyqKsgsnH8G6RjhY7nYzGXX6eP+wpc+zEEsM=;
  b=JTYB9lZjPD+zk2eMHjOaN5wVD+7PC7Rnr4CifeHV8Blj4ixpOhz1fnzn
   s5Og+SFO4aoFaWsXyU5XghEW17N1XPEotKSbpAiEzUE7eCtCP1DByVoXm
   33QJr00lDj4DY2YKY/BtN76ugsx9ZG/L7O/Jh0hJAGIzTasQPNxqE8avM
   N1scrIDBqSAeKJoo6V/pIjK+ENJ6VW38ZMyStcmzIkztWCcggRqb2b7l5
   DmyEg7cTxibD+DnCNxBdVtiRjlQhE3Dy73druFUnmvTRQ7XhL8oVAqouL
   pi9qGf/q0g4ncn1pA8fn+hp49vmL1t+66S7UEo9DaQUPfwhHkdXFEZQ6l
   w==;
X-CSE-ConnectionGUID: hKcCLeKvQ6+/p9MEzuBpRw==
X-CSE-MsgGUID: XOlwq7e4TIukCBqyfFjvoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71503324"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="71503324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 07:16:33 -0700
X-CSE-ConnectionGUID: fKFq+2jnSAaSeZDt1z3VvQ==
X-CSE-MsgGUID: Zi1Q9B4xRvyVk5+bxvVdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174224891"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2025 07:16:30 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxnWi-0002Sy-0K;
	Sun, 14 Sep 2025 14:16:24 +0000
Date: Sun, 14 Sep 2025 22:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
Message-ID: <202509142156.qb0htmwo-lkp@intel.com>
References: <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on linus/master v6.17-rc5]
[cannot apply to krzk/for-next clk/clk-next next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-clock-add-exynos8890-SoC/20250914-202302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20250914122116.2616801-6-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
config: csky-randconfig-001-20250914 (https://download.01.org/0day-ci/archive/20250914/202509142156.qb0htmwo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509142156.qb0htmwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509142156.qb0htmwo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/samsung/clk-exynos8890.c: In function 'exynos8890_init_clocks':
>> drivers/clk/samsung/clk-exynos8890.c:49:45: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      49 | #define QCH_DIS                 (QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
         |                                             ^~~~~~~~~~
   drivers/clk/samsung/clk-exynos8890.c:88:31: note: in expansion of macro 'QCH_DIS'
      88 |                         val = QCH_DIS;
         |                               ^~~~~~~


vim +/FIELD_PREP +49 drivers/clk/samsung/clk-exynos8890.c

    39	
    40	/*
    41	 * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
    42	 * to exynos7, with the exception of the new q-state and q-ch registers that
    43	 * can set the behavior of automatic gates.
    44	 */
    45	
    46	/* decoded magic number from downstream */
    47	#define QCH_EN_MASK		BIT(0)
    48	#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
  > 49	#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
