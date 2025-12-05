Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A2273D73;
	Fri,  5 Dec 2025 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764977317; cv=none; b=PePU29+DS1PTUFT6JeoY2wGL4cl4Iv2NKojvSHpoXGIbmtXad4xLtKEyLx63RCJnB8InX8WJVkdnqDsFECR2HvijRNCaZiedANRQeD66LInpYSEHnaPpolsUQKAW/h8ISLNpR9L2b1PQr0YmDIan9KAKpcFlm7f7DPNZQIiYARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764977317; c=relaxed/simple;
	bh=06GVYZhezTLwymxE0BBOOw8R+VWOzdpCWMmOUljCHSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndBH8HfitLQE9frkodyrr5zHajOrc3zsPbTifXZQASy0FH+CLMpnBWg6XCnRl4txAaXymTxI5bb1rXgZ0dxpObv6YYMB1T3LWDaXGAIIQZJ1Hp5r641R9uuhcyur7Bxc61/wN6phreHf5NJNHkqrARmj9O4SYHjKX7q0/aJfBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiCww/5j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiCww/5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764977315; x=1796513315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06GVYZhezTLwymxE0BBOOw8R+VWOzdpCWMmOUljCHSE=;
  b=ZiCww/5jj42Is8I0d0ZeKByrFkPFueZT2JAtRYLCKQFptEvFZxeOJlUA
   7eSRZC+Xuu4OLsvuhR5kMertnXQOm7Hy7RmXQIGcK2pK2azvSqrdK0QDo
   AOm5ZSdRdMxlPxv9/cyrG2v7S6Km4FCgnIW9urQ9HdKiwXFOLbYlJDZ3/
   2EvjXJyEOANcIUt4/nPeRGsKG95qh75L36qjt97u9n8awRz6/wa05J7TO
   rSuMur9xUQKFIKPFpwGcLsML1YGOvpo9r7XnNUZXgKJNS8h18DyfsG/k3
   Pz5td6UkNJo3tiYZ5sxTsaKOb4iskVbIRCeK4s7CzC1AIGIz2yWWSZHsO
   g==;
X-CSE-ConnectionGUID: 2A4vtRjPRryXShjATR3HmQ==
X-CSE-MsgGUID: lgyBKWZKRfucDr6OMvx+cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70633849"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="70633849"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 15:28:34 -0800
X-CSE-ConnectionGUID: VRBZGpVlTEKrNLGb2AjDVQ==
X-CSE-MsgGUID: jdVY+2RWT8y8YlhD9KahRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195857387"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 15:28:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRfDt-00000000Feb-3xD7;
	Fri, 05 Dec 2025 23:28:25 +0000
Date: Sat, 6 Dec 2025 07:27:43 +0800
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
Message-ID: <202512060730.wBnpCnQv-lkp@intel.com>
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
config: arm64-randconfig-004-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060730.wBnpCnQv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060730.wBnpCnQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060730.wBnpCnQv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: exynos4_mct_probe+0x70 (section: .text.exynos4_mct_probe) -> mct_init_dt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
