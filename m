Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20944C6F;
	Mon,  9 Dec 2024 04:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717109; cv=none; b=DiKsfikis/G8ungaRa7rv7vorQYYSPihOPqI17wxWzDILzSS9i1UB9BuJ3mR/hTRFTtXuL2D6nGdIjtVnUSEDbrlPKHF93dSHxaY+Pg0FrW7ilVY6dZDrlst5QcurreE1MlzSQqamD5u2PD+M+QIs+XCaAqYIFU1ST33Vm1QI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717109; c=relaxed/simple;
	bh=E3ZvC3O2eZ9A0yzuZHGVlm2/05VOaS+KPtoBU2Cfenc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOj7iIlGVIwobHbf9qENvbLT1O2N36m674FVvJs8DPWvD3isuvbx1Ny7cW7um5z03j+9U6AFys7tC/QCrona3xsF1Ypg1+Pd907TvJbbKGwt6njqnaDMLC++Rss+KXoNidabVSH/cJ++Qx4wVP4RDe5p74BruoxuOvqXTIOIheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBINYazY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBINYazY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717108; x=1765253108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3ZvC3O2eZ9A0yzuZHGVlm2/05VOaS+KPtoBU2Cfenc=;
  b=nBINYazYlyzwggbRO2belcLuKfhevIyR8KrRmXBOpDIM/GNzaB80Ca9J
   dyAA6EKAEiamMZrjj7b5BL2BjMgXHmas8G/ssnagKb4sk2z3WEX4ApHDV
   jrcyKWPXP2lDjxqw8lu6dmhg/gl5e/Hznm/woDnmcTd8GjFEDhOcd1eXx
   YWwGJUFIzFVu9ZtCnmKbVofJqYqQmOmmOACvhniIEnc02nQiIt5yeKHik
   3XPier+fo6WZU311xeWvsD+Gp2dZzXgJD/vZ8Ki0N4dNyI9iTjEt7H78/
   DvHruTy2FR+ARrn31XM43jaMxOjSKK6xeQwvoq+QREGBXb4Ylf84KJUh7
   w==;
X-CSE-ConnectionGUID: nV1EboCZRfCWZVmNs+jK0w==
X-CSE-MsgGUID: 5H3h7B9qTSuFe5Rfcy2W8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923810"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:05:08 -0800
X-CSE-ConnectionGUID: w3nAQ+5PSquIWdMR3H5efw==
X-CSE-MsgGUID: u3V0gI3gTH+lD4g+PwNdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793224"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:05:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV14-0003mk-0d;
	Mon, 09 Dec 2024 04:05:02 +0000
Date: Mon, 9 Dec 2024 12:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 (x1slte)
Message-ID: <202412071131.v9GOab0D-lkp@intel.com>
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
config: arm64-randconfig-002-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071131.v9GOab0D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dts:9:10: fatal error: exynos990-hubble-common.dtsi: No such file or directory
       9 | #include "exynos990-hubble-common.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

   > 9	#include "exynos990-hubble-common.dtsi"
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
