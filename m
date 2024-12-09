Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADD158534;
	Mon,  9 Dec 2024 04:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718316; cv=none; b=dRXpoOSdzhb4KWs5Yomb60DMas2WU7RdPrE6UAganj1j01JVeS8qDZAvRndLptXkasaFLwpgbwpPA0hJaoiETwtS0ZzgISUOthac6Xn3FJXqSVPL2wDCPOD66+dbrmOWE1YgGn2M3edm8Gp7CbiuyQ190pCEw9RgH0unwimJtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718316; c=relaxed/simple;
	bh=C5FkjyJ7HvPJ4EqFDqUUuKw1p6YZrLqlh9u/z0GNe1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxjFuKX1b1fTymFnc7Iv/WkMyY0N1ZE66gyg7RoVLQHlEU4G8v9E7JV63xKZJQ8WffHd1VmWd3Fs8N2BSIAf7UW80TSbR5gO0G/OY07Wp25qg8/lBo1gD8J+0lrGUXw6XFsz7z7Q/udkEeJM/df3whTMEGPsbw4kUkzT9Vn6d9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jdz6r8ws; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdz6r8ws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718313; x=1765254313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C5FkjyJ7HvPJ4EqFDqUUuKw1p6YZrLqlh9u/z0GNe1w=;
  b=Jdz6r8ws7y0KonroOkeNd0GR9V8mvkfCpgwLrhQWnwioxdt8UaipeGP/
   ETtTjAkCtFYVL5xoVsL7HGobeObpmZoULlI4z2fSWeTnT7UoO5X7skQyO
   gd8O7ghi6akd8coSA3nnkHj17ZdZqzXghMKFIDiAP7VV8+1LXtV34AYFQ
   mceFv58wuSUW41x7MiS9xAbu6PEToUszFc8kh29nOw2eMKQCM7+VUeor/
   Px8cGVJST+VfZQD2cP6RDWAkddcVZJJnyaTcuRuJnIHgZ0iVBwxbZvWRw
   +a7fT3DLb5kHCXqbh0ZzCS4dIiZzNG1/Gd8OAA2p8g6hZgJPBYiG8Ufg1
   g==;
X-CSE-ConnectionGUID: QMxuWvyGR8ytVLedgne+eg==
X-CSE-MsgGUID: 3qEvZvYUTKW6LIXeYINDqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37930662"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37930662"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:25:13 -0800
X-CSE-ConnectionGUID: jE5zo29IQtml4GznslC54w==
X-CSE-MsgGUID: DyfkoiC7QNaJ65/snZBYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751011"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:25:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVKV-0003qb-1R;
	Mon, 09 Dec 2024 04:25:07 +0000
Date: Mon, 9 Dec 2024 12:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 (x1slte)
Message-ID: <202412072223.jniPKsyn-lkp@intel.com>
References: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>

Hi Umer,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241206]
[cannot apply to krzk-dt/for-next pinctrl-samsung/for-next krzk-mem-ctrl/for-next linus/master v6.13-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-arm-samsung-samsung-boards-Add-bindings-for-SM-G981B-and-SM-G980F-board/20241207-024917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241206184609.2437-5-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
config: arm64-randconfig-003-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072223.jniPKsyn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072223.jniPKsyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072223.jniPKsyn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dts:9:10: fatal error: 'exynos990-hubble-common.dtsi' file not found
       9 | #include "exynos990-hubble-common.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

   > 9	#include "exynos990-hubble-common.dtsi"
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
