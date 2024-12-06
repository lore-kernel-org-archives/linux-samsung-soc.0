Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427891DE891;
	Fri,  6 Dec 2024 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471949; cv=none; b=CM0s/ZJmuIPOqQLDt1pcQt9ljVPsFawlOvJHg1nIJ1tmMXTnIKiBX3Z/6PTWe1WlSy8/BrWbtKUBbrdnOmAxYxk5PzE0BzOg3QIL3qJrvL7SOGzScKqi4zG0AfbBLEuq4ejgYv+zhsgjYsggUZAI1v2uPR6h2FA9xJjJf9XR3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471949; c=relaxed/simple;
	bh=uh1GtNgeJXD3jjxW/WbErm5HG89T+2j4ihV8ipDenzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXdMHAWKZ50Z4DkFI/GLAyavQNnobl2S0Ww09EXHDDiC45HvLQNdezdCmlr9pRZI1uEogbYGToiHZd6qDqLGnSQeMamkhr+kArdmIGvj9h8xwNStHkAcNjrA+pERUoyK8n/VCLhM94xa8fqO3eT9JoScnuajIyj0l+FzeqSTYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kf10tiZj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kf10tiZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471947; x=1765007947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uh1GtNgeJXD3jjxW/WbErm5HG89T+2j4ihV8ipDenzw=;
  b=kf10tiZjl6IxDl/yTFUpvOa83oYPJWIpizA/buJvsVpm4omcT1m9rzm/
   WrRdWc7tDjvj0CMuavvFzVVn9O/qwPBnnd90iqmbLLg361Fv4ewJTZHFD
   yVvCQqbPgJuqYYnMpB9k6HfPdjOYvWVDrlAPmQWrw9dr8d1m4BKCLrKAI
   rI+XO/3IQYWwnWHPW+Q/M92LUfps8CtjVXxo0STt9JJQYz092l/Mp1WkW
   63SNKejb68ZZ7BKfFNRnaGeRNWp9BHAT3GliXBPLvN8cF8JhZv1h1kV5h
   FEfV6avNqL4xU8x3A+kqHs7gFEKaW5sgU/PaudEKAb6vdhRdM/QYJBjRl
   w==;
X-CSE-ConnectionGUID: JSPMxw3LQkS29yOlxdd94Q==
X-CSE-MsgGUID: HY9T8fFhS0aNVxVnzDTG4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192754"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:06 -0800
X-CSE-ConnectionGUID: JvQ4gwdtSrS4ez3aatitGA==
X-CSE-MsgGUID: tB2L8oKAREmMv3tfZ4NGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144258"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 23:59:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJTEq-0000pj-1e;
	Fri, 06 Dec 2024 07:59:00 +0000
Date: Fri, 6 Dec 2024 15:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock
 controller driver
Message-ID: <202412061549.wyFF9u8X-lkp@intel.com>
References: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next clk/clk-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belwon/clk-samsung-clk-pll-Add-support-for-pll_-0717x-0718x-0732x/20241206-043559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241205193423.783815-4-igor.belwon%40mentallysanemainliners.org
patch subject: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock controller driver
config: arm64-randconfig-004-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061549.wyFF9u8X-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061549.wyFF9u8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061549.wyFF9u8X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynos990.c:13:10: fatal error: 'dt-bindings/clock/exynos990.h' file not found
      13 | #include <dt-bindings/clock/exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/clk/samsung/clk-exynos990.c

    12	
  > 13	#include <dt-bindings/clock/exynos990.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
