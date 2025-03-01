Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA7E1AB52D;
	Sat,  1 Mar 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740820107; cv=none; b=UbXWS9t0laG9s5JAm9JDTaUzVdMvSNSFx0CvP0lTXo7ZLElWlNLnfahRZPQrTknnxCk3mJ6dscl+4nk+MUHuYbHAkZQcHwfiLY4iZVnZPx9HZzwciGuZeH6nPzfcLXWkPGEHzrvrECGS2E12Dhf2PuoEtRPM1hx6ngpsoIlQ5do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740820107; c=relaxed/simple;
	bh=bQUvH/LR1KxS95c+RJnGjDSETbksb7G0/CS5aZy0gsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wsx1lNBYinqUi17L9eS6aZiC6q6APBFha/U99VJD+QbpuDeGq8/v9FXMnIDHl1FU+8By/pzdoUKXVdZdUIyXa3djFDZXmg7Fis9xo/9woNaV9W5f6fi/MKV4rqW9244Ft00bNgmV1AFhGBdi5ZVq5G0oceFqoyAZr6ePda7j0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS66Wmqz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS66Wmqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740820106; x=1772356106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bQUvH/LR1KxS95c+RJnGjDSETbksb7G0/CS5aZy0gsA=;
  b=eS66WmqzNQGui6u5SSmjvn/tGera2jVFrNENpiAUILwc+JVTBr+C7woa
   ViojhBWaUltF3RAoSHW/SNxVN+694OvExiC8ayJ5eJ0+7DyD7uzHA/lyl
   NFO+NHQnDh9QwwVT77818rsKQRqGD2K2CU1ZDic65gvLvJVhsEsuB4k7y
   +En5No2sKJKV/gU6hfzpBs7vHi1I2/JLe4VlXvgJx739571qR5zPJsGSm
   S9gzqks8yYCWgOf7kd8qaP8GjtkWx/7PWrsU2L5J+mjW5tV8k9y0LkN9O
   0nes7JiWy0T6CCVhovyfmbGti/cmUQ7BmHyDV0+LiCggK/pKBwQUmWdPw
   A==;
X-CSE-ConnectionGUID: nJcmozVSSx2Hu2GwQjNrfg==
X-CSE-MsgGUID: zkTdSru0RF6DgqGS9D5NRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41596833"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="41596833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 01:08:25 -0800
X-CSE-ConnectionGUID: hUwnSczhT5aCxc0MFFZ1sQ==
X-CSE-MsgGUID: 4nOe0TxbSYe4812Pe2RycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="117564427"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2025 01:08:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toIpX-000G4Q-2G;
	Sat, 01 Mar 2025 09:08:19 +0000
Date: Sat, 1 Mar 2025 17:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-ID: <202503011651.Vto3vDw7-lkp@intel.com>
References: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250223-203243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223123044.725493-4-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250301/202503011651.Vto3vDw7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011651.Vto3vDw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011651.Vto3vDw7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
>> arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: 'dt-bindings/clock/samsung,exynos2200-cmu.h' file not found
       8 | #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +8 arch/arm64/boot/dts/exynos/exynos2200.dtsi

b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  @8  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23   9  #include <dt-bindings/interrupt-controller/arm-gic.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
