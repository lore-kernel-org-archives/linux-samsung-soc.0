Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD32FAC0E;
	Tue, 14 Oct 2025 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453606; cv=none; b=FV5+6LKKX5j3wfvtUpiTGHb5Z26s0S43SyPKssvoegNk5OfVszay+nM36KUoIZDKmQF/PN9uIm08mpAiFOQ+baP11CXSLVz0le87KJBaGmzL643woq/2/UcP4r4/nyJkNqaWTcGAbq2Cl1nZSOxFmGMgdTgmpQ+GZ4c8WtAz3Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453606; c=relaxed/simple;
	bh=z6qNyT2/oj6cU0ryqpoJ0qcaj3pCu/T9Mq36j0ZaZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp/V5AP7qWM9SNoOqJHIoUkiVVDHL5bOVMIVEaJwnyvHu8oBtEiY8ppQ5KxZwTlZFwlf+VzuUYG++sga5hU2QMOVX/XBl3VNvZLil1kbdFlqa1NqJMU/jFdZEcdC/mnGbJQ+vo1MVcmvZqjKLIcPG9u9Z7dRLh5/xjAuhtHrB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4sKEVR6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4sKEVR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760453605; x=1791989605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z6qNyT2/oj6cU0ryqpoJ0qcaj3pCu/T9Mq36j0ZaZyo=;
  b=l4sKEVR66ZK+Cy48wJ5OpovUsLSslsJkYLDuGZDEyEUut3YxLFcTYLhL
   TVOlB65xvps7t6sowFRHPy/DiK7s0lEFgPYgmw22LO9rvD8DfTmU6TBMx
   fB67F0mZeEYh8udo1koN4OxQzNhUn0K+c0K7L5vTl1adoAStw6Xq8BU7P
   6zgy++zrhPytlctb1eNCvSaH/1778TsUab2xsiQp6ZL2YbY83zZXw1TD8
   LXrwVYIeeXTon/S1LMUdW5L4AQ7PTJc2wPemCBNPUzjXxaqM1KEU/ffji
   OMxiiv7fJ/02deZskt+SDKW0ivjbymwsfngClO+guN7kJZdyHl5dNFLQJ
   A==;
X-CSE-ConnectionGUID: pC1ofzHLQx2J0vM7lnIo0g==
X-CSE-MsgGUID: 9b1W4DuhRZOl5ayR7PRpgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73215493"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73215493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 07:53:24 -0700
X-CSE-ConnectionGUID: poiBxSkoQCCEVEGLJGVzdw==
X-CSE-MsgGUID: 8lac8hSAQea4DlnmA1UaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="219043783"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2025 07:53:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8gNb-0002tJ-14;
	Tue, 14 Oct 2025 14:52:23 +0000
Date: Tue, 14 Oct 2025 22:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
Message-ID: <202510142228.IQJSNIFa-lkp@intel.com>
References: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a71531471926e3c391665ee9c42f4e0295a4585]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-soc-samsung-exynos-sysreg-add-gs101-hsi0-and-misc-compatibles/20251014-045559
base:   4a71531471926e3c391665ee9c42f4e0295a4585
patch link:    https://lore.kernel.org/r/20251013-automatic-clocks-v1-7-72851ee00300%40linaro.org
patch subject: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode for CMUs
config: loongarch-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510142228.IQJSNIFa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk.c:481:13: error: too many arguments to function call, expected 5, have 6
     478 |                 samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     479 |                                                 cmu->sysreg_clk_regs,
     480 |                                                 cmu->nr_sysreg_clk_regs,
     481 |                                                 NULL, 0);
         |                                                       ^
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.c:511:23: error: too many arguments to function call, expected 5, have 6
     509 |                 samsung_clk_extended_sleep_init(reg_base, NULL,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     510 |                         cmu->clk_regs, cmu->nr_clk_regs,
     511 |                         cmu->suspend_regs, cmu->nr_suspend_regs);
         |                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> Warning: drivers/clk/samsung/clk-exynos-arm64.c:249 function parameter 'init_clk_regs' not described in 'exynos_arm64_register_cmu_pm'


vim +481 drivers/clk/samsung/clk.c

   462	
   463	/* Enable Dynamic Root Clock Gating of bus components*/
   464	void samsung_en_dyn_root_clk_gating(struct device_node *np,
   465					    struct samsung_clk_provider *ctx,
   466					    const struct samsung_cmu_info *cmu)
   467	{
   468		if (ctx && !ctx->auto_clock_gate)
   469			return;
   470	
   471		ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
   472		if (!IS_ERR_OR_NULL(ctx->sysreg)) {
   473			regmap_write(ctx->sysreg, ctx->drcg_offset, 0xffffffff);
   474			/* not every sysreg controller has memclk reg*/
   475			if (ctx->memclk_offset)
   476				regmap_write_bits(ctx->sysreg, ctx->memclk_offset, 0x1, 0x0);
   477	
   478			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
   479							cmu->sysreg_clk_regs,
   480							cmu->nr_sysreg_clk_regs,
 > 481							NULL, 0);
   482		} else {
   483			pr_warn("%pOF: Unable to get CMU sysreg\n", np);
   484			ctx->sysreg = NULL;
   485		}
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
