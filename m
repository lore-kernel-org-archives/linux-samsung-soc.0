Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9CB158535;
	Sun, 25 May 2025 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748161833; cv=none; b=EqepDxVxG5aKsfvc9VMtXF5z45Qez7VedSEB083Wsx1Oi7moEeSCWdd0IvwaRHiU0N/9Z5Sd5zFFcQbzp6ysgAuguVAZZdtw/W41V4cXRtFe/thnHkp9ylWeEkqPL+DcKT20PRFCkP+picqRC1z6DCK3CbDhc22CBuf7vz9IeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748161833; c=relaxed/simple;
	bh=X+gCXOXsYKVvislAM03W3reWMCip6O0Qe6ZtQ4W/bEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE1TjHW88I4f3BTPoLpwRz5eLdGyo/x+rYwWeG8nZ8gJ24FtHH8qJxmYav7g8aTLJ6LBSmiU3yL+H5KGyKMS5jAI8aD4g6/kC5CNW+dx65kAQElOCnG5dWcve0bsXFmcmt62Gubx+PISGfH0lCnD5NAiMz/OPyGxRXKaBsRSN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzDtJR6u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzDtJR6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748161831; x=1779697831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X+gCXOXsYKVvislAM03W3reWMCip6O0Qe6ZtQ4W/bEY=;
  b=HzDtJR6uTttCDplaErNBdi1osVN8PrsngmSS9xV1/PXmZHii5xxXP0KO
   htuGZer8dmfvZ880n7KPQyL/i4kzsWYld2vRp9s6MIbVZ9pFChvToNqEQ
   k862zaNjh/cdbFq5fotxp6qtrLVVClykKI4EIp7Zo37xBkY36+BakAFbw
   2aVNxRV9881a/3weqc3oozJy9/xKYGvgE5QmTLv9xWGUn8BAx7en3mHfc
   Tv7f6BsObKjSbh9mRa54uCoftVtsIJZhjwYDJ2m7+46UOxIrgfEaoeWUk
   lL16U05f37sOCOZRRoyKGcKkXwLG3owqbj6Ocu62ifpA2w0vf6sVadoum
   w==;
X-CSE-ConnectionGUID: O+BBJgsjSku/4b588RnvBw==
X-CSE-MsgGUID: 5zmitrl6T12COMprVwpnjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50049067"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="50049067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 01:30:30 -0700
X-CSE-ConnectionGUID: CHrzet/zQQehuzWBXCFlUw==
X-CSE-MsgGUID: hssUZyPESOKzuGHr03rH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="141765201"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 May 2025 01:30:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ6kS-000RhQ-1E;
	Sun, 25 May 2025 08:30:24 +0000
Date: Sun, 25 May 2025 16:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	William Mcvicker <willmcvicker@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <202505251653.TsYCp5Mq-lkp@intel.com>
References: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 176e917e010cb7dcc605f11d2bc33f304292482b]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/arm64-dts-exynos-gs101-Add-local-timer-stop-to-cpuidle-nodes/20250524-153138
base:   176e917e010cb7dcc605f11d2bc33f304292482b
patch link:    https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-2-aea77a7842a6%40linaro.org
patch subject: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
config: arm64-randconfig-r132-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251653.TsYCp5Mq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251653.TsYCp5Mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251653.TsYCp5Mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/samsung/exynos-pmu.c:593:32: warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable]
     593 | static const struct dev_pm_ops cpupm_pm_ops = {
         |                                ^~~~~~~~~~~~
   1 warning generated.


vim +/cpupm_pm_ops +593 drivers/soc/samsung/exynos-pmu.c

   592	
 > 593	static const struct dev_pm_ops cpupm_pm_ops = {
   594		.suspend_noirq = exynos_cpupm_suspend_noirq,
   595		.resume_noirq = exynos_cpupm_resume_noirq,
   596	};
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
