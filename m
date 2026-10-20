Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474680;
	b=1ytQcrpdLLx2B53A6mttY7OAEQ6N1lQKRirPv+KJONTup9ch2oAMDP4xg3uuqbXBLHBv
	 X0ftXV+JaGJvS3nKaSJV2Y7fGovxAKYpfrkRdxUTHI5lTd7c37J6VkBpFOmnIDdkRj2IG
	 f+dfVfzHGSKtJp+8OSZ12nevpamum4irLuIBqEaZfvWFwSWEqf5aP6PqdkdkAnbVRO6Xr
	 ZOcrq7bHtmK3n0c26dwzVvb7jXJ30+Pz8fpDguZg6ONBwJ4jEETceVOd3Ch/oZt1ttDqo
	 uGBPe9YFKuSEzmHOW5J/ppTgaa+H/ci/FUSPV36SWe5B9ebLjYFfjYzinJ5jcfj5AEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=AbQx3F5DeqIg01v5J1HMAoVNtPC3XJeQSCQTqpj8efU=;
	b=LmX8lsFz6Bh9uQ3+a63tMsWXaTWImzaSv4m8fZURRN1AyNt+M1sNuwYqSGJXCkJzERI5
	 rFu09egX/3BcLkvAOMuB6dZ7OHwCsqMQ7zvVZVSQcjz5cwuADuPrk6HcnZ3qhn4j6fyIj
	 7mgLa6f34gwdvOVRME013cRjfFWS3WbtsDGs3MPc00cJq0jRNuA2iFvzsvK9vVCJN2ovA
	 Nob8FdIvm2mxNhTI/iyW2OC/Q4YDbLYoWP4YQmA3onQklfhCOTHQ6emwPFo3tzTk7l86S
	 +IWnzH30ORwaofznnb0uD6RVmek4wupd9ocipLnrKZ1upiZjG0K0WHeUWQtg8oJUufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUgD4eHz;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9454C606A319;
	Tue, 20 Oct 2026 05:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9454C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUgD4eHz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792474678; x=1824010678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CgbzEe28G1zTrLdrNfJYfgWctwC1jg4tju9+nzpN6Co=;
  b=RUgD4eHzpPUBnKZVvbHMKd1EjVoOsXRWo6EQDyyqUB0lu9O/9vJu4qCU
   mMteyl3wn7+JrFaj5kwOUJZ2mE1sR3dXQ56UubBuxDKTvZGd7Amn61jna
   6CY4EUNUBvZHMJK+itmyRzXLD8ElYjfS58eUa/UzcAYcxDUu48Chn35wZ
   vHppLPPXUG1U9YlokzMZlDofYpmzn66Ma+5B/2+1bTpTFfbJlilbQW6f0
   JwfZoBcnwM0GaGTVGZXvHjb+5m3hl6caf4Sw/9F/RwrwR8qHbh3fFAEdb
   szrftpmu8eOhW2J0bZtMpi0RtslsaOjgDX9KyZ7WDdq/raCxZr1dXehXI
   A==;
X-CSE-ConnectionGUID: tksN/plqRmmK9zUIYunwww==
X-CSE-MsgGUID: eNyqFsdwTXymOylt9rTpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1059050"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1059050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 22:37:57 -0700
X-CSE-ConnectionGUID: LV6bCR60Sxa6Yc/YIXoDCg==
X-CSE-MsgGUID: WFK0iYt7RvyviF8oI28nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2691338"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2026 22:37:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ2Xh-00000000Mxi-3lzb;
	Tue, 20 Oct 2026 05:37:45 +0000
Date: Tue, 20 Oct 2026 13:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 11/14] drm/bridge: analogix_dp: Use
 bridge->next_bridge instead of plat_data field
Message-ID: <202610201323.RdqouIbq-lkp@intel.com>
References: <20261019085836.3065008-12-damon.ding@rock-chips.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019085836.3065008-12-damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to daeinki-drm-exynos/exynos-drm-next linus/master v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Return-bitmask-from-analogix_dp_get_irq_type/20261019-165823
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261019085836.3065008-12-damon.ding%40rock-chips.com
patch subject: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data field
config: parisc-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201323.RdqouIbq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/bridge/analogix/analogix_dp.ko: symbol 'devm_drm_of_display_mode_bridge' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
