Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA428A2BE;
	Thu, 13 Feb 2025 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739473299; cv=none; b=haIz5iL7HD1OOptYt7vZVLQbBB1kag/lZ6XFi9LQ2LBUD6eIEeqzYp7wRR6LTX+9oiSNDAHKi/Vln+t7J/JewPfq2/ZvBMWtMuFD9NpZfLm2JFhHvbb7kP/uv6IUAl6fT52nop/ngJsl+GRDdwkXU/SBQKIL2lPHFu5hQojnfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739473299; c=relaxed/simple;
	bh=Q+9A+XPhqjom/iRBeDIijWx64bo72hPGQfck4ws9+vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq2zlx6c5Wd0YJu5Yd7NWfUSb4P+Co/wr5SynI6LfU5bgVV4E5s1EtcXVlfeLri1LAF4lr0SCf8RmIIs62OfhMaOs0XSH3Jw14x1teWw6aEOd9k3xzH1Z+k1qLXSBXutUilnzUEDQRJWFX7uTV0VAlkJMVQE1HP7cCc/gIRESlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRtoWhRN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRtoWhRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739473298; x=1771009298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+9A+XPhqjom/iRBeDIijWx64bo72hPGQfck4ws9+vI=;
  b=DRtoWhRNFHUxFczFYfCam/DS7CzeJKUJYXqqQAC9pqv7fNpRzwEULaXv
   orodGSNWzl7rdxYbfiMpFAebdB0tbbs36phri7snAXwOXNAhMuLzH3vf0
   EAOOCu7TF8rCMuAG/tFld5ijirBWdUzLlHlOdiJoHFG0HVfe2gxpQJPgE
   MRMwTA3BtETmQCBKahxlZM6jW0pGhJVC9XYPj24/bZuflyn3p8izP/OrB
   2nIHnUeII7UXvA+nNDPnLBKhG+fOSq3nOXv0OPYica2t/9hgbhhA1mGgD
   6LVyKBG08f9ISgqQRzyaZ+YMvJ9QbNiC9OtBcB0plnEcELmR/O8GGOG61
   w==;
X-CSE-ConnectionGUID: Keux1IiyRVCQbxbaQWx/3Q==
X-CSE-MsgGUID: WuH8RpykTxO3tD5h4W0Hhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39904417"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39904417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:01:38 -0800
X-CSE-ConnectionGUID: 5CWKBrssRMGyGx6vOVkWSA==
X-CSE-MsgGUID: 6oLgLwqdRvqCFTMmNE6hwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113208216"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 11:01:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tieSX-0018bj-14;
	Thu, 13 Feb 2025 19:01:13 +0000
Date: Fri, 14 Feb 2025 03:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and
 aliases
Message-ID: <202502140220.nEdgzjof-lkp@intel.com>
References: <20250213000226.277-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213000226.277-1-wachiturroxd150@gmail.com>

Hi Denzeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/arm64-dts-exynos-r8s-enable-UART-interfaces-and-aliases/20250213-080512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250213000226.277-1-wachiturroxd150%40gmail.com
patch subject: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and aliases
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250214/202502140220.nEdgzjof-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140220.nEdgzjof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140220.nEdgzjof-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:122.1-10 Label or path usi_uart not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:127.1-10 Label or path serial_0 not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:131.1-13 Label or path usi_bt_uart not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:136.1-10 Label or path serial_1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
