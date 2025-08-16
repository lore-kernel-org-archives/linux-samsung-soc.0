Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E34501A;
	Sat, 16 Aug 2025 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755304587; cv=none; b=Vsdk5t3lcD/hrKzn26JEp6XrWSytH7LC99rDyqwbTiNYG0h0WuB0fRftD+DU9CoQ5Yrs4k4lIEmi4Oa31sZNN2v8gmH3IPBllKOVDF0/lo7tFhWS6D8v2DnnPGgqKLSYFSBEW+1FHvxCk59NaWFqCakUh/XM9qRPhcdUzfTO+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755304587; c=relaxed/simple;
	bh=benNazeuPaouG/+e8wLXd4fxOv6Us5y+9Sh2v9/dsfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+kyY821p98y/Rr/Fq/6IL3NZ8CAahEkcnQtg3KFe6K56wywT2ZO7yE8e8RgEeunwLKNTR8Qete/TeIl+X+eh4DsJpfL4PxGUIOPEfAyZwYolsF7n1iHcS0y2YNyPVOXKDrPU3E7PK0oGZNE0t5JaR+ibIgDmMhPq9d/jKFhZaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJOdlNAh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJOdlNAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755304585; x=1786840585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=benNazeuPaouG/+e8wLXd4fxOv6Us5y+9Sh2v9/dsfc=;
  b=mJOdlNAhAO+1VHVjjrYso7JmNsr0Sy+pQ5kYpBEqkgozEhGIYaoiy2Ln
   RI7ynZ9Ffvv2LoR5vQoSHiIZexSlSAixki6lmuzJSMLJOOm2e/c8uEF0h
   BxPZscGOx97/ukND+ymEAwtnRcA+YFS7x/3Sd56Vk4MV1K+SYaWIMdxmP
   vsEbtMcIqYTeSMJLbf3ge+8CKkYyfVY9pCG4UeIrYvQnEzqB1ozKAu3/Y
   lpVIHFwbbCavonCLDKZDeK08cgAvGDJqUXm2Sq6RanJYlxF59oDM4yyl9
   X2ClZH+dpin719Q+FSpvS3Qw3rbz1hweO4UBUI0RtNSFokRUkG9Rj1Il+
   w==;
X-CSE-ConnectionGUID: wRmwqNWlQYOsPU2dNupwXg==
X-CSE-MsgGUID: iYiDwLKeRLKoEiIGMdez4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61465016"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61465016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 17:36:25 -0700
X-CSE-ConnectionGUID: XsfJWJHDRiucVH5KSe51BA==
X-CSE-MsgGUID: NSRhkyfJQCqWWqVNaOYoEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166309080"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2025 17:36:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un4u8-000CSI-05;
	Sat, 16 Aug 2025 00:36:16 +0000
Date: Sat, 16 Aug 2025 08:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <202508160857.yC3oMucJ-lkp@intel.com>
References: <20250814104753.195255-9-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-9-damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on rockchip/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-9-damon.ding%40rock-chips.com
patch subject: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
config: x86_64-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160857.yC3oMucJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `analogix_dp_finish_probe':
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1700: undefined reference to `devm_of_dp_aux_populate_bus'


vim +1700 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1695	
  1696	int analogix_dp_finish_probe(struct analogix_dp_device *dp)
  1697	{
  1698		int ret;
  1699	
> 1700		ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
  1701		if (ret) {
  1702			/*
  1703			 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
  1704			 * not be called because there are no EP devices. Then the callback function
  1705			 * analogix_dp_aux_done_probing() will be called directly in order to support
  1706			 * the other valid DT configurations.
  1707			 *
  1708			 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
  1709			 */
  1710			if (ret != -ENODEV) {
  1711				dev_err(dp->dev, "failed to populate aux bus\n");
  1712				return ret;
  1713			}
  1714	
  1715			return analogix_dp_aux_done_probing(&dp->aux);
  1716		}
  1717	
  1718		return 0;
  1719	}
  1720	EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
  1721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
