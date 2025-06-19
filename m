Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49719247282;
	Thu, 19 Jun 2025 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364568; cv=none; b=azdwvoCVjE7X10k68Artf7ODpdqvFq5QxHx5Rf3OwP8plY5GY1QXn3XE+cUBhv1bQtefe44OvYD4Dsr/vLwuHNekXv7W1xVEDpjQEgE7qlNUidxsmBPN6Fo7We6k8kG6bswqw8Db4ghECbOLAz79DZgQilqW54M64dQigB1nnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364568; c=relaxed/simple;
	bh=1306ugvPqvYx0GNhUobnRO2BRmD0tvRO5GZ6dyr69A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D33PJxQ9Z+tuoO//AkG6dXN8bYaNIBu2TRPyMqWkIcXrFqE9DH+g1TRws/UV0UNFTCAWHIk7/umZrYp46QjH4LwSpZtprge8ziehwzyYlNcSIKvt/VFml8zApWtSwYwMA7vXtSW8JZD0UGgx6npAS0K6+t8E5x+LwphLZP+hZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+tgCKKi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+tgCKKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750364567; x=1781900567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1306ugvPqvYx0GNhUobnRO2BRmD0tvRO5GZ6dyr69A0=;
  b=h+tgCKKinRvHLtC60qB7dF2+bk2mybbl33reQHvAUpU3nrlK+zJ2j/p+
   Rv4x5zfdy0lAIZI/QHdagMNY79SSl63sWXA2/vUVg6WrQlUs1dEw+M1RC
   YsyXATkQltzEn0USuIVSnA6fvZzzQxY42TNBANOqWHj5GoD8NB9Qndm5d
   1gvaxMsd1ugxGmTeNK96KIZZbV/rsk1+iY2dZaxX9XTRZ9YmZ+zSNxjpq
   gL/Wei/JfW0s6rU2l0EM/DdgtQB+oIuz0fT9s3rM4aH0T8XUj5WCWDcJZ
   G8/TGD3NPbuSjmpJxhtO/V3wB7bs4AL74OI17ing8alPxHDsykeRHfr+T
   w==;
X-CSE-ConnectionGUID: DZC/fWJMTuaCCKfVknXyow==
X-CSE-MsgGUID: WeITPr8tSf+dnsiUpFuliw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51852704"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="51852704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 13:22:47 -0700
X-CSE-ConnectionGUID: HbfmO9QBTz2wrgvuPHbqPA==
X-CSE-MsgGUID: fjTzpWQ/Sxa+NwOTsif4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="155290205"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2025 13:22:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSLmQ-000L5G-2H;
	Thu, 19 Jun 2025 20:22:38 +0000
Date: Fri, 20 Jun 2025 04:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Will McVicker <willmcvicker@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <202506200445.1vdWU11a-lkp@intel.com>
References: <20250618210851.661527-6-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618210851.661527-6-willmcvicker@google.com>

Hi Will,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-McVicker/of-irq-Export-of_irq_count-for-modules/20250619-051424
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250618210851.661527-6-willmcvicker%40google.com
patch subject: [PATCH 5/6] clocksource/drivers/exynos_mct: Add module support
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250620/202506200445.1vdWU11a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200445.1vdWU11a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200445.1vdWU11a-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x178 (section: .text) -> sched_clock_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x220 (section: .text) -> sched_clock_register (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
