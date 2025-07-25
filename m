Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E732E36FA;
	Fri, 25 Jul 2025 02:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753410461; cv=none; b=KygYluwpjn+8D+ONOKOF1umW/zL1IHSqMusrdBn1ttWyKbSzw2dzDVzIAbim0Hhw6KW42cutPN3pthWVCA7OfZjTFDloVeTuk5qdrLdNLwtTooDo+0LMJjzoDfgJJcRQze9sobOwj8IOKly0WoB8RL/UqZ9WnJJ1O+KaJZelpNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753410461; c=relaxed/simple;
	bh=Khfr6GJFMEPyxoF5TtbNyRQfS0y6Twazz2yM+2molDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5WaFfpnUof97YZwI6urY+UcsWy4xNy+qy6/JbhCDh/WxQspwctNRHwblD0rvxwOFzey83r0G2Bg7pMCjZ41FC/7tfMCl5Pj7o7TsG3U2nxJ/ln3Bz2oHbGnRrO0Kxvje43bB61PFLmJ+3Y66BxI6487uLGSgHF+Ym91j1puxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh9r7jr/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh9r7jr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753410459; x=1784946459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Khfr6GJFMEPyxoF5TtbNyRQfS0y6Twazz2yM+2molDY=;
  b=Lh9r7jr/DubdmVjebTXg4vwbPAXesuoFlT9XsSkWk6ETSY/rBSfMpw3v
   Pt9OyY1vmpe4KWS8c2KezZDvlhyUAvsnMVfnEsuZyFTZDlQPKjUUcXz2K
   wq+bI9EzoU8OuLPpk5e1aP+PVQ40/1/GZqrueoI0xVEG8WzxBr6W3xns9
   exFfA3XzqwuCP94KCQoMc4XBzG52WOqFLBayHbTJrKtwYgC9P8KN1brAX
   6vrGXmCjwPVhYiEFKcwEmyDvdYlFjPBcoZIgDpaFDX/Pg6G9G+iqhggFY
   5Be0ZSYUl5DH+FG2lPP9/cj4NchcYD7orlzmDjaj4+m+BsjzgBsg6tZfu
   w==;
X-CSE-ConnectionGUID: LA8oJAhLSvCDYAo4BAdbuQ==
X-CSE-MsgGUID: LfI585xwQaqLFgRjFc7V+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="43352925"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="43352925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 19:27:39 -0700
X-CSE-ConnectionGUID: bLSRn50RQC6VQhsJrY0bkA==
X-CSE-MsgGUID: qPdZrQ5FRW2cHtvxPARCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="164883627"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2025 19:27:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf89i-000KzD-0K;
	Fri, 25 Jul 2025 02:27:30 +0000
Date: Fri, 25 Jul 2025 10:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <202507251021.A6WmQ4di-lkp@intel.com>
References: <20250724080304.3572457-9-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-9-damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20250724]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250724-160804
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250724080304.3572457-9-damon.ding%40rock-chips.com
patch subject: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply drm_bridge_connector helper
config: x86_64-buildonly-randconfig-003-20250725 (https://download.01.org/0day-ci/archive/20250725/202507251021.A6WmQ4di-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507251021.A6WmQ4di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507251021.A6WmQ4di-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1346:12: error: incompatible function pointer types initializing 'enum drm_connector_status (*)(struct drm_bridge *, struct drm_connector *)' with an expression of type 'enum drm_connector_status (struct drm_bridge *)' [-Wincompatible-function-pointer-types]
    1346 |         .detect = analogix_dp_bridge_detect,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1346 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1333	
  1334	static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
  1335		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
  1336		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
  1337		.atomic_reset = drm_atomic_helper_bridge_reset,
  1338		.atomic_pre_enable = analogix_dp_bridge_atomic_pre_enable,
  1339		.atomic_enable = analogix_dp_bridge_atomic_enable,
  1340		.atomic_disable = analogix_dp_bridge_atomic_disable,
  1341		.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
  1342		.atomic_check = analogix_dp_bridge_atomic_check,
  1343		.attach = analogix_dp_bridge_attach,
  1344		.get_modes = analogix_dp_bridge_get_modes,
  1345		.edid_read = analogix_dp_bridge_edid_read,
> 1346		.detect = analogix_dp_bridge_detect,
  1347	};
  1348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
