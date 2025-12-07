Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5329BDAB;
	Sun,  7 Dec 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765096960; cv=none; b=HR471L5/kmieA3Q5yC0Mx8D2lkPR6lH3VkMQqFz1YVk7E3nuwM7ODHslwUWWtYROjIi95s2pQr1SGrln1dhCNyDDS6XmuLUqqhcJpyzWs5/SikgsqiVKGvowW6KXdAxTLUyAgGqXQpZvA4Wo+YaWlcI5jzHBnHbepDzTOKQ9H78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765096960; c=relaxed/simple;
	bh=81fHP63wwjUBO7vufHEqW2i1/EwDrAJK5Nz166GaB5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtI1QuiIlRd86nUEWPeE2Ji07XfYvdqMzSe0jghTwvCogoGg6YYpvZ2kQfnn+dQqe4tY7Rr9g+9NPaltn3pDCtAt4Mna1yHOW/B8e8Ey71TMNuDjWdx8Crp1bGL9yhXUqVaZplAbC6+2zpPagqfQBCKHzFB+M4aX40mpX4U46eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwISr634; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwISr634"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765096958; x=1796632958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=81fHP63wwjUBO7vufHEqW2i1/EwDrAJK5Nz166GaB5w=;
  b=TwISr634oJMpLZzEHMU2CwUGJEhxPxY+oW/lDF1jrxeh1rgI6UShtbCc
   kTcClPFOleIWfYntKnmY8QsxwJ/KIcLzMASHEeElPfU5jS1OAsF1daKkp
   RacMQiLWJZ0yPelwHUT1d5WGPVIldK9HkEcUc40SIMn8sOo1ZmEZ7YyLj
   K9TyMhUXfFw+EaVT4G30fgY4foeO1UmWPQD7/AmSlSS8JtecpEs6PU6Rj
   i7Xa59xipTu+IHODm75HKTZZcsv1R7aeS25SzeS1pr7dr06JIjjLcH/r2
   MrrZ9xtCH81+FHIjjtFr/8IUt92mCXsGUth14JPzYlL2zlltmUfNNo4a9
   A==;
X-CSE-ConnectionGUID: bOToLW3ITKqSq0a0RwTEVQ==
X-CSE-MsgGUID: tYI4ZxZiSDKOrDKTdgkopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78426772"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="78426772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 00:42:37 -0800
X-CSE-ConnectionGUID: WhjFVEa8S4Gn1dyYhP97Ng==
X-CSE-MsgGUID: 85q/K6LiQPKuPr83qGUJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195738405"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Dec 2025 00:42:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSALd-00000000J8r-1pzF;
	Sun, 07 Dec 2025 08:42:29 +0000
Date: Sun, 7 Dec 2025 16:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] clocksource/drivers/exynos_mct: Add module
 support for ARM64
Message-ID: <202512071659.We0N43XW-lkp@intel.com>
References: <20251205011027.720512-6-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205011027.720512-6-willmcvicker@google.com>

Hi Will,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bca42080637ce3a21092fc0f7d5411e853b0c3b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-McVicker/clocksource-drivers-exynos_mct-Don-t-register-as-a-sched_clock-on-arm64/20251205-091403
base:   bca42080637ce3a21092fc0f7d5411e853b0c3b3
patch link:    https://lore.kernel.org/r/20251205011027.720512-6-willmcvicker%40google.com
patch subject: [PATCH v7 5/6] clocksource/drivers/exynos_mct: Add module support for ARM64
config: arm64-randconfig-001-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071659.We0N43XW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071659.We0N43XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071659.We0N43XW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: exynos4_mct_probe+0x84 (section: .text) -> mct_init_dt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
