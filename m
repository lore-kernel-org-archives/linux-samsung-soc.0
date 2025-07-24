Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4211ACEDC;
	Thu, 24 Jul 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753375311; cv=none; b=Fcpbxtj9DfLErFKfAOzbjRuW2V/zQbOFuN+YaKQVvTpq2IlPhTvGWh9aCE5lt6rd+l/0ln63zjKepyV68kg004UDqsfPMWSeyik9KqmNOk+8a1MnWhnXNUf9PkZWCDOl/TNZPt/m7F0uvNFbk1+F0G1STkYDxM5iuuj1gGWqlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753375311; c=relaxed/simple;
	bh=GJ7oPGiI/+5Cg12azq2uSL0OHujgc0U//kiVeas2jMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7mKvzSVDT24WwzctqoXgts0Afk5Zk7aOMom9RDeQQkle3EMPtl52eMYu73cVQs29DV5LfmsQG5cMuJubDRJWFMnuUot7UqzwsK8kbSJqp1uLm9npr99hSy1SECAkpWFnOGcxfz6pzQ8JhQ48b/209Bl2Ng9amBg0wJ3FVZKhuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrRaoxe3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrRaoxe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753375310; x=1784911310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJ7oPGiI/+5Cg12azq2uSL0OHujgc0U//kiVeas2jMI=;
  b=nrRaoxe3hD2jaQdzIqhpTrXWz9pyX0jgZNK2dnz/xeTCBQHa80wE3KDg
   GKXDyRZdPsAFK3ADUWeSA1aLH4CJuNIXebl4NP7M2DNUNEhNfoei49evC
   zSmsg8V17oFmFJU3bELvBwM6ieAvQB9G1hH7iYeqVR+f6IY9ByOAKAVd3
   UZxxn2IheoNxAyok/QTMEdby4kl8EPtjpyt5xiL5W3LLz91arw2OZi4ul
   R4Tu2SL8xrk1GXoyt3j5XkhHHCduZzM4d4a3Y2i6jwX+OFOTxHee9d5zp
   dBMeUrqGw8nfERi+bp5H/nRxpLahhPoSglzN6DZLNnHa15e3M5UgXVeDH
   g==;
X-CSE-ConnectionGUID: RtJnbSuFQNORFNY8DQc+Cg==
X-CSE-MsgGUID: U6u/XPTTTry0w9j6m9JtiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58322801"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="58322801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 09:41:49 -0700
X-CSE-ConnectionGUID: kbR/YZUgRpGnkRP9NRGpww==
X-CSE-MsgGUID: 7yCD/4uhRS+IRX2C8Brupg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164860147"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jul 2025 09:41:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uez0o-000Kdd-0x;
	Thu, 24 Jul 2025 16:41:42 +0000
Date: Fri, 25 Jul 2025 00:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Henrik Grimler <henrik@grimler.se>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maciej Purski <m.purski@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
	linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
Subject: Re: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <202507250036.RXWSmKW2-lkp@intel.com>
References: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>

Hi Henrik,

kernel test robot noticed the following build errors:

[auto build test ERROR on ca2a6abdaee43808034cdb218428d2ed85fd3db8]

url:    https://github.com/intel-lab-lkp/linux/commits/Henrik-Grimler/drm-bridge-sii9234-fix-some-typos-in-comments-and-messages/20250721-174814
base:   ca2a6abdaee43808034cdb218428d2ed85fd3db8
patch link:    https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677%40grimler.se
patch subject: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection logic to detect MHL
config: arm64-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250036.RXWSmKW2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250036.RXWSmKW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250036.RXWSmKW2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: extcon_register_notifier
   >>> referenced by sii9234.c:928 (drivers/gpu/drm/bridge/sii9234.c:928)
   >>>               drivers/gpu/drm/bridge/sii9234.o:(sii9234_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: extcon_unregister_notifier
   >>> referenced by sii9234.c:1009 (drivers/gpu/drm/bridge/sii9234.c:1009)
   >>>               drivers/gpu/drm/bridge/sii9234.o:(sii9234_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
