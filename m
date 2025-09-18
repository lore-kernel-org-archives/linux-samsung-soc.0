Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5D302CD7;
	Thu, 18 Sep 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196325; cv=none; b=IM/N2sv7zXA6GSLNxj10dR0ct7+NZLUyrZl1bme/jwWIGApCq2Acz/AT08/mf/yPXJlEzLWb52TPLU+tfaKzDoA5oB48PR8GsB7QAQw0YoWieUqKTQGSbZJezx477UFDxcaSrlYV6NkWVK59Lol3DU+jENm7FOVnkPdUhnIePOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196325; c=relaxed/simple;
	bh=gRM5ebAAEf4TRIWQFHbcl8pLy8N7ldQhFRmgB1sHmKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1rgGiTtdNgHOw9LZJZtF7eRllRNz4OPLxF6kA4RXsTs55hWk4+J3NkPievehrll0RxkjDjf1+bkOByBdk1xEs/VNB1mwXc7SeRJ1CvjQxM4MafuLBC6RuZ2ICtThzVM7Xgyro9nzCE+2b/PEi49bptWjClUXtKsIcO264SLx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMjQgkSb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMjQgkSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758196323; x=1789732323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gRM5ebAAEf4TRIWQFHbcl8pLy8N7ldQhFRmgB1sHmKg=;
  b=lMjQgkSb1i9TJMwdwcBEkuoREb13VReBGNKC2Nbx6AIQmX+RhFhMvwwq
   YoimvS5PWBAQsKGF3lTuE1CxpYqqT7R0zpt8tjR2j7zCLqrlPyOO7gAWy
   FMRx7gRLmA3TGglDg5CYwtN/xjpoglb13K1kovCnCSNb9ytyVOcy0/0Wf
   cT+N1sqfmmsjEZNp9P6jZacfr5u/0OfL7+7t/XMfYHQaRCRS/Vs+Rb9JL
   RIFHx3FO2QEzJrh5Bk9EhNapWZmYITCgBv9Lp4PUiX+ZfOPHaYvGQ2gfK
   sTj2E+PtZ3qJKaoUT4FRnBHsC7y17cTzik1Hf5uZ3c2UCFg/xnGAq16oP
   w==;
X-CSE-ConnectionGUID: B8ZVAdgnST60rHEwTjRNvg==
X-CSE-MsgGUID: hM5iuPmZQJOUOhrOa5DqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60454918"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="60454918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:52:03 -0700
X-CSE-ConnectionGUID: xpACrP6fTbC4WJ9LOd4WfQ==
X-CSE-MsgGUID: RkJTVKFVTm6UUBTnBekyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="206471603"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2025 04:51:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzDB4-0003D5-14;
	Thu, 18 Sep 2025 11:51:54 +0000
Date: Thu, 18 Sep 2025 19:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ravi Patel <ravi.patel@samsung.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, ravi.patel@samsung.com,
	ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com,
	krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com
Subject: Re: [PATCH 2/7] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
Message-ID: <202509181955.NgLJ2aBv-lkp@intel.com>
References: <20250917085005.89819-3-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-3-ravi.patel@samsung.com>

Hi Ravi,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on clk/clk-next next-20250917]
[cannot apply to robh/for-next linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravi-Patel/dt-bindings-clock-Add-ARTPEC-9-clock-controller/20250917-165346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250917085005.89819-3-ravi.patel%40samsung.com
patch subject: [PATCH 2/7] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20250918/202509181955.NgLJ2aBv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181955.NgLJ2aBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181955.NgLJ2aBv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/samsung/clk-pll.o: in function `samsung_a9fraco_recalc_rate':
>> drivers/clk/samsung/clk-pll.c:1508:(.text+0xcc): undefined reference to `__aeabi_uldivmod'


vim +1508 drivers/clk/samsung/clk-pll.c

  1490	
  1491	static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
  1492							 unsigned long parent_rate)
  1493	{
  1494		struct samsung_clk_pll *pll = to_clk_pll(hw);
  1495		u32 pll_con0, pll_con5;
  1496		u64 mdiv, pdiv, sdiv, kdiv;
  1497		u64 fvco = parent_rate;
  1498	
  1499		pll_con0 = readl_relaxed(pll->con_reg);
  1500		pll_con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
  1501		mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
  1502		pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
  1503		sdiv = (pll_con0 >> PLLA9FRACO_SDIV_SHIFT) & PLLA9FRACO_SDIV_MASK;
  1504		kdiv = (pll_con5 & PLLA9FRACO_KDIV_MASK);
  1505	
  1506		/* fvco = fref * (M + K/2^24) / p * (S+1) */
  1507		fvco *= mdiv;
> 1508		fvco = ((fvco << 24) + kdiv) / ((pdiv * (sdiv + 1)) << 24);
  1509	
  1510		return (unsigned long)fvco;
  1511	}
  1512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
