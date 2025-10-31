Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0D301494;
	Fri, 31 Oct 2025 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761930158; cv=none; b=HifQ7DDjD3Ukmcb3gYgLQEfHi3w8TmF1iWTZYa4UNSPQsWBRodJq+CiXa0snigEeZoxEBLeA6m4MRXDeB/2imwgy7yZj+f+nXyz0OSC3l0fTIens9R/2WKfGc10cxiOsa90PH/Vgf1LgBumbgXMIfP5KRJcsv/a006GUSCnvGGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761930158; c=relaxed/simple;
	bh=yDv6EgtiAeu4cOA0bFneDjrfyEEmzUj26cMNw39epTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Knq8Vbjf/Z3JMotImY45v6aKFBx9arRfmuN+tZHrXj227T0Cmo+jOoXjrDK/vAl6BREamnBWu1mW8aRZ5TBK7h9K4jVanDFxtoi8O1ZzTXAvcXg3oJ3YEPfsN+CYP3/qICEmx/C9LyF+/XtNQmOyqlGyiRpc2iylOsOkOr10CBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdDMZSni; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdDMZSni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761930157; x=1793466157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDv6EgtiAeu4cOA0bFneDjrfyEEmzUj26cMNw39epTU=;
  b=kdDMZSnirkeTKx9eF6/GSp8gQaTt50P4ivFZ+4stDPZhzyrJYL8ACEwl
   OQnI9PF5ym02x43l5r79ATF7THyoRPoKtJoKrtiGu0YNOD067w+JdBe5l
   qTNtdPZntLG5pes3cQeFovPsc/Ofd1HZe+eX6/eiTZ2JWMUK78wNF0VzM
   T66wgldN3bhzw1ZQdHy2UoLBl0EhlKCGKGW2okL/6rCOpbl4dviYoLmLB
   FvAcJUzbp+u7X3IkYTLk0KvKxqdqs2kOIMRdE05uddYuhvTe4u1uCEAS5
   SmcAiDZrtcceL5nHEFgXetpDf+gcoO0/5RSoG+WKdPTMUNHumUtJ6Hx0+
   w==;
X-CSE-ConnectionGUID: Z/W6X/zMSKe1aaMhQIcgBw==
X-CSE-MsgGUID: yZ4Po6iUT1GkWcSuf9oSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67956445"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="67956445"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:02:36 -0700
X-CSE-ConnectionGUID: D1sa5WS/TvqpPNu3Vd6RTA==
X-CSE-MsgGUID: tBaFbmKcS9O0+gxgVl/e3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="216937489"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 10:02:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEsWC-000NUM-38;
	Fri, 31 Oct 2025 17:02:28 +0000
Date: Sat, 1 Nov 2025 01:02:26 +0800
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
Subject: Re: [PATCH v2 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
Message-ID: <202511010049.sebVqntI-lkp@intel.com>
References: <20251029-automatic-clocks-v2-3-f8edd3a2d82b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-automatic-clocks-v2-3-f8edd3a2d82b@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 72fb0170ef1f45addf726319c52a0562b6913707]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-clock-google-gs101-clock-add-samsung-sysreg-property-as-required/20251030-053356
base:   72fb0170ef1f45addf726319c52a0562b6913707
patch link:    https://lore.kernel.org/r/20251029-automatic-clocks-v2-3-f8edd3a2d82b%40linaro.org
patch subject: [PATCH v2 3/4] clk: samsung: Implement automatic clock gating mode for CMUs
config: riscv-randconfig-002-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010049.sebVqntI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010049.sebVqntI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010049.sebVqntI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/samsung/clk.c:458 function parameter 'np' not described in 'samsung_cmu_register_clocks'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
