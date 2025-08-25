Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC9F27461;
	Mon, 25 Aug 2025 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756099096; cv=none; b=ahdY8bsLWpgPB5HMZPwyYNQoJgtfU2LwaZzM1va8a9JbHiQGGTtB196EZJcsPAI26XzbQJSFBSnIC0B/s3V9TpKNegQEve560ftx+aBWsF+sVpvd0VQoAhqlP9IfrtKaBynMlturWqFuMviwNMyTsyjS5y5mRogVb1duCokGKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756099096; c=relaxed/simple;
	bh=zee6qQcdz2NESdycJGLf0jyNkyCbxXigV5rhsZo3qno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/cGQjw8smQ2WB5+hyShnMO9IQoSMa4ICNlz7jQeT59Tm1rV5zVyfyMZtAQBOC6yB8PR9ImBj/L2YIPNM/xn811Kb0Oo9m4KquZmBG3jZ4sWeESn51LRasn2ydSkh8YElhEln+6Zuq4/bSUxBMYmi0p/lSn4sKp7pvCbLbVfa6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYcQYXcx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYcQYXcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756099094; x=1787635094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zee6qQcdz2NESdycJGLf0jyNkyCbxXigV5rhsZo3qno=;
  b=SYcQYXcx/vGcPyavfMR+aURxRvq7+doYrBPEVwI3qnokYm14v6D0zXSY
   GBEXTanujqxw8xblaI+3DTT4Xv6tuW9NxS4c7bBM4t/rdcinYVC5hJOCW
   k77fyGilM46lY8570rBIkbssBhmVQGCND95w+Ucl7T7z1kbtqdhaqDtmm
   RvnfHE+nhO3hoLCc4k0UJwRtqI09lRc+RvJXEjBNTHa3d7xDmFbM3+jcv
   U63PVFkL3W9cjeyTri6jFoq6ZbR/IiRUlNALJYn/syfySy4X211HTK+gA
   YcGRms+x7891JqZcXsjaKqTLf5BklpNEM34dPRXTnz+FrJG4JqIoKQeOp
   w==;
X-CSE-ConnectionGUID: hJ93BqGpREWwNLzM2MYbHQ==
X-CSE-MsgGUID: fqiSM2hRSFOX4j/D8SFIcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="57325626"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57325626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:18:14 -0700
X-CSE-ConnectionGUID: 9zXKjhopRGCNk3ARPBkVFQ==
X-CSE-MsgGUID: 6Oe+u1HPQCyvRcYVRKsZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169587955"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2025 22:18:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqPaq-000NNv-0G;
	Mon, 25 Aug 2025 05:18:08 +0000
Date: Mon, 25 Aug 2025 13:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: Re: [PATCH v3 4/4] clk: samsung: exynos990: Fix PLL mux regs, add
 DPU/CMUREF
Message-ID: <202508251258.cfDwcqgu-lkp@intel.com>
References: <20250825-cmu-top-v3-4-8838641432dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-cmu-top-v3-4-8838641432dc@gmail.com>

Hi Denzeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f4c93f7eb861acab537dbe94441817a270537bf]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/clk-samsung-exynos990-Fix-CMU-TOP-mux-div-widths-and-add-fixed-factors/20250825-105730
base:   0f4c93f7eb861acab537dbe94441817a270537bf
patch link:    https://lore.kernel.org/r/20250825-cmu-top-v3-4-8838641432dc%40gmail.com
patch subject: [PATCH v3 4/4] clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF
config: riscv-randconfig-001-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251258.cfDwcqgu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251258.cfDwcqgu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251258.cfDwcqgu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynos990.c:980:6: error: use of undeclared identifier 'CLK_DOUT_CMU_CLK_CMUREF'
     980 |         DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
         |             ^
>> drivers/clk/samsung/clk-exynos990.c:1160:17: error: invalid application of 'sizeof' to an incomplete type 'const struct samsung_div_clock[]'
    1160 |         .nr_div_clks = ARRAY_SIZE(top_div_clks),
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   2 errors generated.


vim +/CLK_DOUT_CMU_CLK_CMUREF +980 drivers/clk/samsung/clk-exynos990.c

   863	
   864	static const struct samsung_div_clock top_div_clks[] __initconst = {
   865		DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
   866		    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
   867		DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
   868		    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
   869		DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
   870		    CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
   871		DIV(CLK_DOUT_CMU_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus",
   872		    CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
   873		DIV(CLK_DOUT_CMU_BUS1_SSS, "dout_cmu_bus1_sss", "gout_cmu_bus1_sss",
   874		    CLK_CON_DIV_CLKCMU_BUS1_SSS, 0, 4),
   875		DIV(CLK_DOUT_CMU_CIS_CLK0, "dout_cmu_cis_clk0", "gout_cmu_cis_clk0",
   876		    CLK_CON_DIV_CLKCMU_CIS_CLK0, 0, 5),
   877		DIV(CLK_DOUT_CMU_CIS_CLK1, "dout_cmu_cis_clk1", "gout_cmu_cis_clk1",
   878		    CLK_CON_DIV_CLKCMU_CIS_CLK1, 0, 5),
   879		DIV(CLK_DOUT_CMU_CIS_CLK2, "dout_cmu_cis_clk2", "gout_cmu_cis_clk2",
   880		    CLK_CON_DIV_CLKCMU_CIS_CLK2, 0, 5),
   881		DIV(CLK_DOUT_CMU_CIS_CLK3, "dout_cmu_cis_clk3", "gout_cmu_cis_clk3",
   882		    CLK_CON_DIV_CLKCMU_CIS_CLK3, 0, 5),
   883		DIV(CLK_DOUT_CMU_CIS_CLK4, "dout_cmu_cis_clk4", "gout_cmu_cis_clk4",
   884		    CLK_CON_DIV_CLKCMU_CIS_CLK4, 0, 5),
   885		DIV(CLK_DOUT_CMU_CIS_CLK5, "dout_cmu_cis_clk5", "gout_cmu_cis_clk5",
   886		    CLK_CON_DIV_CLKCMU_CIS_CLK5, 0, 5),
   887		DIV(CLK_DOUT_CMU_CMU_BOOST, "dout_cmu_cmu_boost", "mout_cmu_cmu_boost",
   888		    CLK_CON_DIV_CLKCMU_CMU_BOOST, 0, 2),
   889		DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
   890		    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
   891		DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_dbg_bus",
   892		    "gout_cmu_cpucl0_dbg_bus", CLK_CON_DIV_CLKCMU_CPUCL0_DBG_BUS,
   893		    0, 4),
   894		DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
   895		    "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
   896		DIV(CLK_DOUT_CMU_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
   897		    "gout_cmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
   898		DIV(CLK_DOUT_CMU_CPUCL2_BUSP, "dout_cmu_cpucl2_busp",
   899		    "gout_cmu_cpucl2_busp", CLK_CON_DIV_CLKCMU_CPUCL2_BUSP, 0, 4),
   900		DIV(CLK_DOUT_CMU_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch",
   901		    "gout_cmu_cpucl2_switch", CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
   902		DIV(CLK_DOUT_CMU_CSIS_BUS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
   903		    CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
   904		DIV(CLK_DOUT_CMU_CSIS_OIS_MCU, "dout_cmu_csis_ois_mcu",
   905		    "gout_cmu_csis_ois_mcu", CLK_CON_DIV_CLKCMU_CSIS_OIS_MCU, 0, 4),
   906		DIV(CLK_DOUT_CMU_DNC_BUS, "dout_cmu_dnc_bus", "gout_cmu_dnc_bus",
   907		    CLK_CON_DIV_CLKCMU_DNC_BUS, 0, 4),
   908		DIV(CLK_DOUT_CMU_DNC_BUSM, "dout_cmu_dnc_busm", "gout_cmu_dnc_busm",
   909		    CLK_CON_DIV_CLKCMU_DNC_BUSM, 0, 4),
   910		DIV(CLK_DOUT_CMU_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
   911		    CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
   912		DIV(CLK_DOUT_CMU_DSP_BUS, "dout_cmu_dsp_bus", "gout_cmu_dsp_bus",
   913		    CLK_CON_DIV_CLKCMU_DSP_BUS, 0, 4),
   914		DIV(CLK_DOUT_CMU_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
   915		    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
   916		DIV(CLK_DOUT_CMU_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
   917		    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
   918		DIV(CLK_DOUT_CMU_G3D_SWITCH, "dout_cmu_g3d_switch",
   919		    "gout_cmu_g3d_switch", CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
   920		DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
   921		    CLK_CON_DIV_CLKCMU_HPM, 0, 2),
   922		DIV(CLK_DOUT_CMU_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus",
   923		    CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
   924		DIV(CLK_DOUT_CMU_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_dpgtc",
   925		    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 3),
   926		DIV(CLK_DOUT_CMU_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
   927		    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 4),
   928		DIV(CLK_DOUT_CMU_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
   929		    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 3),
   930		DIV(CLK_DOUT_CMU_HSI1_MMC_CARD, "dout_cmu_hsi1_mmc_card",
   931		    "gout_cmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
   932		    0, 9),
   933		DIV(CLK_DOUT_CMU_HSI1_UFS_CARD, "dout_cmu_hsi1_ufs_card",
   934		    "gout_cmu_hsi1_ufs_card", CLK_CON_DIV_CLKCMU_HSI1_UFS_CARD,
   935		    0, 3),
   936		DIV(CLK_DOUT_CMU_HSI1_UFS_EMBD, "dout_cmu_hsi1_ufs_embd",
   937		    "gout_cmu_hsi1_ufs_embd", CLK_CON_DIV_CLKCMU_HSI1_UFS_EMBD,
   938		    0, 3),
   939		DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
   940		    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
   941		DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
   942		    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
   943		DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
   944		    CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
   945		DIV(CLK_DOUT_CMU_MCSC_BUS, "dout_cmu_mcsc_bus", "gout_cmu_mcsc_bus",
   946		    CLK_CON_DIV_CLKCMU_MCSC_BUS, 0, 4),
   947		DIV(CLK_DOUT_CMU_MCSC_GDC, "dout_cmu_mcsc_gdc", "gout_cmu_mcsc_gdc",
   948		    CLK_CON_DIV_CLKCMU_MCSC_GDC, 0, 4),
   949		DIV(CLK_DOUT_CMU_CMU_BOOST_CPU, "dout_cmu_cmu_boost_cpu",
   950		    "mout_cmu_cmu_boost_cpu", CLK_CON_DIV_CLKCMU_CMU_BOOST_CPU,
   951		    0, 2),
   952		DIV(CLK_DOUT_CMU_MFC0_MFC0, "dout_cmu_mfc0_mfc0", "gout_cmu_mfc0_mfc0",
   953		    CLK_CON_DIV_CLKCMU_MFC0_MFC0, 0, 4),
   954		DIV(CLK_DOUT_CMU_MFC0_WFD, "dout_cmu_mfc0_wfd", "gout_cmu_mfc0_wfd",
   955		    CLK_CON_DIV_CLKCMU_MFC0_WFD, 0, 4),
   956		DIV(CLK_DOUT_CMU_MIF_BUSP, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
   957		    CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
   958		DIV(CLK_DOUT_CMU_NPU_BUS, "dout_cmu_npu_bus", "gout_cmu_npu_bus",
   959		    CLK_CON_DIV_CLKCMU_NPU_BUS, 0, 4),
   960		DIV(CLK_DOUT_CMU_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric0_bus",
   961		    CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
   962		DIV(CLK_DOUT_CMU_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_ip",
   963		    CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
   964		DIV(CLK_DOUT_CMU_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric1_bus",
   965		    CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
   966		DIV(CLK_DOUT_CMU_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_ip",
   967		    CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
   968		DIV(CLK_DOUT_CMU_PERIS_BUS, "dout_cmu_peris_bus", "gout_cmu_peris_bus",
   969		    CLK_CON_DIV_CLKCMU_PERIS_BUS, 0, 4),
   970		DIV(CLK_DOUT_CMU_SSP_BUS, "dout_cmu_ssp_bus", "gout_cmu_ssp_bus",
   971		    CLK_CON_DIV_CLKCMU_SSP_BUS, 0, 4),
   972		DIV(CLK_DOUT_CMU_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
   973		    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
   974		DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
   975		    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
   976		DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
   977		    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
   978		DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
   979		    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
 > 980		DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
   981		    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
   982		/* SHARED0 region*/
   983		DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
   984		    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
   985		DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
   986		    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
   987		DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
   988		    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
   989		/* SHARED1 region*/
   990		DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
   991		    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
   992		DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
   993		    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
   994		DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
   995		    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
   996		/* SHARED2 region */
   997		DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
   998		    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
   999		/* SHARED4 region*/
  1000		DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
  1001		    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
  1002		DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
  1003		    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
  1004		DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "dout_cmu_shared4_div2",
  1005		    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
  1006	};
  1007	
  1008	static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
  1009		FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
  1010			"gout_cmu_hsi1_pcie", 1, 8, 0),
  1011		FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
  1012		FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
  1013			"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
  1014		FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
  1015			"gout_cmu_hsi2_pcie", 1, 8, 0),
  1016	};
  1017	
  1018	static const struct samsung_gate_clock top_gate_clks[] __initconst = {
  1019		GATE(CLK_GOUT_CMU_APM_BUS, "gout_cmu_apm_bus", "mout_cmu_apm_bus",
  1020		     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, CLK_IGNORE_UNUSED, 0),
  1021		GATE(CLK_GOUT_CMU_AUD_CPU, "gout_cmu_aud_cpu", "mout_cmu_aud_cpu",
  1022		     CLK_CON_GAT_GATE_CLKCMU_AUD_CPU, 21, 0, 0),
  1023		GATE(CLK_GOUT_CMU_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
  1024		     CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, CLK_IGNORE_UNUSED, 0),
  1025		GATE(CLK_GOUT_CMU_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
  1026		     CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, CLK_IGNORE_UNUSED, 0),
  1027		GATE(CLK_GOUT_CMU_BUS1_SSS, "gout_cmu_bus1_sss", "mout_cmu_bus1_sss",
  1028		     CLK_CON_GAT_GATE_CLKCMU_BUS1_SSS, 21, CLK_IGNORE_UNUSED, 0),
  1029		GATE(CLK_GOUT_CMU_CIS_CLK0, "gout_cmu_cis_clk0", "mout_cmu_cis_clk0",
  1030		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0, 21, 0, 0),
  1031		GATE(CLK_GOUT_CMU_CIS_CLK1, "gout_cmu_cis_clk1", "mout_cmu_cis_clk1",
  1032		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1, 21, 0, 0),
  1033		GATE(CLK_GOUT_CMU_CIS_CLK2, "gout_cmu_cis_clk2", "mout_cmu_cis_clk2",
  1034		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2, 21, 0, 0),
  1035		GATE(CLK_GOUT_CMU_CIS_CLK3, "gout_cmu_cis_clk3", "mout_cmu_cis_clk3",
  1036		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3, 21, 0, 0),
  1037		GATE(CLK_GOUT_CMU_CIS_CLK4, "gout_cmu_cis_clk4", "mout_cmu_cis_clk4",
  1038		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4, 21, 0, 0),
  1039		GATE(CLK_GOUT_CMU_CIS_CLK5, "gout_cmu_cis_clk5", "mout_cmu_cis_clk5",
  1040		     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5, 21, 0, 0),
  1041		GATE(CLK_GOUT_CMU_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
  1042		     CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, CLK_IGNORE_UNUSED, 0),
  1043		GATE(CLK_GOUT_CMU_CPUCL0_DBG_BUS, "gout_cmu_cpucl0_dbg_bus",
  1044		     "mout_cmu_cpucl0_dbg_bus", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS,
  1045		     21, 0, 0),
  1046		GATE(CLK_GOUT_CMU_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
  1047		     "mout_cmu_cpucl0_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
  1048		     21, CLK_IGNORE_UNUSED, 0),
  1049		GATE(CLK_GOUT_CMU_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
  1050		     "mout_cmu_cpucl1_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
  1051		     21, CLK_IGNORE_UNUSED, 0),
  1052		GATE(CLK_GOUT_CMU_CPUCL2_BUSP, "gout_cmu_cpucl2_busp",
  1053		     "mout_cmu_cpucl2_busp", CLK_CON_GAT_GATE_CLKCMU_CPUCL2_BUSP,
  1054		     21, CLK_IGNORE_UNUSED, 0),
  1055		GATE(CLK_GOUT_CMU_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
  1056		     "mout_cmu_cpucl2_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
  1057		     21, CLK_IGNORE_UNUSED, 0),
  1058		GATE(CLK_GOUT_CMU_CSIS_BUS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
  1059		     CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
  1060		GATE(CLK_GOUT_CMU_CSIS_OIS_MCU, "gout_cmu_csis_ois_mcu",
  1061		     "mout_cmu_csis_ois_mcu", CLK_CON_GAT_GATE_CLKCMU_CSIS_OIS_MCU,
  1062		     21, 0, 0),
  1063		GATE(CLK_GOUT_CMU_DNC_BUS, "gout_cmu_dnc_bus", "mout_cmu_dnc_bus",
  1064		     CLK_CON_GAT_GATE_CLKCMU_DNC_BUS, 21, 0, 0),
  1065		GATE(CLK_GOUT_CMU_DNC_BUSM, "gout_cmu_dnc_busm", "mout_cmu_dnc_busm",
  1066		     CLK_CON_GAT_GATE_CLKCMU_DNC_BUSM, 21, 0, 0),
  1067		GATE(CLK_GOUT_CMU_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
  1068		     CLK_CON_GAT_GATE_CLKCMU_DNS_BUS, 21, 0, 0),
  1069		GATE(CLK_GOUT_CMU_DPU, "gout_cmu_dpu", "mout_cmu_dpu",
  1070		     CLK_CON_GAT_GATE_CLKCMU_DPU, 21, 0, 0),
  1071		GATE(CLK_GOUT_CMU_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_alt",
  1072		     CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, CLK_IGNORE_UNUSED, 0),
  1073		GATE(CLK_GOUT_CMU_DSP_BUS, "gout_cmu_dsp_bus", "mout_cmu_dsp_bus",
  1074		     CLK_CON_GAT_GATE_CLKCMU_DSP_BUS, 21, 0, 0),
  1075		GATE(CLK_GOUT_CMU_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
  1076		     CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
  1077		GATE(CLK_GOUT_CMU_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
  1078		     CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
  1079		GATE(CLK_GOUT_CMU_G3D_SWITCH, "gout_cmu_g3d_switch",
  1080		     "fout_shared2_pll", CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
  1081		     21, 0, 0),
  1082		GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
  1083		     CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
  1084		GATE(CLK_GOUT_CMU_HSI0_BUS, "gout_cmu_hsi0_bus",
  1085		     "mout_cmu_hsi0_bus", CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
  1086		GATE(CLK_GOUT_CMU_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc",
  1087		     "mout_cmu_hsi0_dpgtc", CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC,
  1088		     21, 0, 0),
  1089		GATE(CLK_GOUT_CMU_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
  1090		     "mout_cmu_hsi0_usb31drd", CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
  1091		     21, 0, 0),
  1092		GATE(CLK_GOUT_CMU_HSI0_USBDP_DEBUG, "gout_cmu_hsi0_usbdp_debug",
  1093		     "mout_cmu_hsi0_usbdp_debug", CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDP_DEBUG,
  1094		     21, 0, 0),
  1095		GATE(CLK_GOUT_CMU_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
  1096		     CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
  1097		GATE(CLK_GOUT_CMU_HSI1_MMC_CARD, "gout_cmu_hsi1_mmc_card",
  1098		     "mout_cmu_hsi1_mmc_card", CLK_CON_GAT_GATE_CLKCMU_HSI1_MMC_CARD,
  1099		     21, 0, 0),
  1100		GATE(CLK_GOUT_CMU_HSI1_PCIE, "gout_cmu_hsi1_pcie",
  1101		     "mout_cmu_hsi1_pcie", CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE,
  1102		     21, 0, 0),
  1103		GATE(CLK_GOUT_CMU_HSI1_UFS_CARD, "gout_cmu_hsi1_ufs_card",
  1104		     "mout_cmu_hsi1_ufs_card", CLK_CON_GAT_GATE_CLKCMU_HSI1_UFS_CARD,
  1105		     21, 0, 0),
  1106		GATE(CLK_GOUT_CMU_HSI1_UFS_EMBD, "gout_cmu_hsi1_ufs_embd",
  1107		     "mout_cmu_hsi1_ufs_embd", CLK_CON_GAT_GATE_CLKCMU_HSI1_UFS_EMBD,
  1108		     21, 0, 0),
  1109		GATE(CLK_GOUT_CMU_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
  1110		     CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
  1111		GATE(CLK_GOUT_CMU_HSI2_PCIE, "gout_cmu_hsi2_pcie",
  1112		     "mout_cmu_hsi2_pcie", CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE,
  1113		     21, 0, 0),
  1114		GATE(CLK_GOUT_CMU_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
  1115		     CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
  1116		GATE(CLK_GOUT_CMU_ITP_BUS, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
  1117		     CLK_CON_GAT_GATE_CLKCMU_ITP_BUS, 21, 0, 0),
  1118		GATE(CLK_GOUT_CMU_MCSC_BUS, "gout_cmu_mcsc_bus", "mout_cmu_mcsc_bus",
  1119		     CLK_CON_GAT_GATE_CLKCMU_MCSC_BUS, 21, 0, 0),
  1120		GATE(CLK_GOUT_CMU_MCSC_GDC, "gout_cmu_mcsc_gdc", "mout_cmu_mcsc_gdc",
  1121		     CLK_CON_GAT_GATE_CLKCMU_MCSC_GDC, 21, 0, 0),
  1122		GATE(CLK_GOUT_CMU_MFC0_MFC0, "gout_cmu_mfc0_mfc0",
  1123		     "mout_cmu_mfc0_mfc0", CLK_CON_GAT_GATE_CLKCMU_MFC0_MFC0,
  1124		     21, 0, 0),
  1125		GATE(CLK_GOUT_CMU_MFC0_WFD, "gout_cmu_mfc0_wfd", "mout_cmu_mfc0_wfd",
  1126		     CLK_CON_GAT_GATE_CLKCMU_MFC0_WFD, 21, 0, 0),
  1127		GATE(CLK_GOUT_CMU_MIF_BUSP, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
  1128		     CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, 0, 0),
  1129		GATE(CLK_GOUT_CMU_NPU_BUS, "gout_cmu_npu_bus", "mout_cmu_npu_bus",
  1130		     CLK_CON_GAT_GATE_CLKCMU_NPU_BUS, 21, 0, 0),
  1131		GATE(CLK_GOUT_CMU_PERIC0_BUS, "gout_cmu_peric0_bus",
  1132		     "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
  1133		     21, 0, 0),
  1134		GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip",
  1135		     "mout_cmu_peric0_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
  1136		     21, 0, 0),
  1137		GATE(CLK_GOUT_CMU_PERIC1_BUS, "gout_cmu_peric1_bus",
  1138		     "mout_cmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
  1139		     21, 0, 0),
  1140		GATE(CLK_GOUT_CMU_PERIC1_IP, "gout_cmu_peric1_ip",
  1141		     "mout_cmu_peric1_ip", CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
  1142		     21, 0, 0),
  1143		GATE(CLK_GOUT_CMU_PERIS_BUS, "gout_cmu_peris_bus",
  1144		     "mout_cmu_peris_bus", CLK_CON_GAT_GATE_CLKCMU_PERIS_BUS,
  1145		     21, CLK_IGNORE_UNUSED, 0),
  1146		GATE(CLK_GOUT_CMU_SSP_BUS, "gout_cmu_ssp_bus", "mout_cmu_ssp_bus",
  1147		     CLK_CON_GAT_GATE_CLKCMU_SSP_BUS, 21, 0, 0),
  1148		GATE(CLK_GOUT_CMU_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
  1149		     CLK_CON_GAT_GATE_CLKCMU_TNR_BUS, 21, 0, 0),
  1150		GATE(CLK_GOUT_CMU_VRA_BUS, "gout_cmu_vra_bus", "mout_cmu_vra_bus",
  1151		     CLK_CON_GAT_GATE_CLKCMU_VRA_BUS, 21, 0, 0),
  1152	};
  1153	
  1154	static const struct samsung_cmu_info top_cmu_info __initconst = {
  1155		.pll_clks = top_pll_clks,
  1156		.nr_pll_clks = ARRAY_SIZE(top_pll_clks),
  1157		.mux_clks = top_mux_clks,
  1158		.nr_mux_clks = ARRAY_SIZE(top_mux_clks),
  1159		.div_clks = top_div_clks,
> 1160		.nr_div_clks = ARRAY_SIZE(top_div_clks),
  1161		.fixed_factor_clks = cmu_top_ffactor,
  1162		.nr_fixed_factor_clks = ARRAY_SIZE(cmu_top_ffactor),
  1163		.gate_clks = top_gate_clks,
  1164		.nr_gate_clks = ARRAY_SIZE(top_gate_clks),
  1165		.nr_clk_ids = CLKS_NR_TOP,
  1166		.clk_regs = top_clk_regs,
  1167		.nr_clk_regs = ARRAY_SIZE(top_clk_regs),
  1168	};
  1169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
