Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0492E7F2E;
	Thu, 14 Aug 2025 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159345; cv=none; b=RJSQ9Q5KH4xj6+ukE5C3ij4AHRK5+7kfPMx/SsS2b0XpVTAc1j4WFaMR/XvG7ZIP9STWOtXLv8CzH8KTVdb0l04yD18T3NVq0oXvCnl1YBzwGIewDptba361xS1z2Mab2eY3gJMqJDosJHaSCH9f48fnYTjWDFK+D80uzE9APOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159345; c=relaxed/simple;
	bh=6E0Tfz3mQAO8WgpBT7lxhRZaLaj11rwitgOe3a6lVFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eebs9yPZliKtV9tPxlyWWkupAabfPjSPY9933wd74Lyv0mdIVT08QX8nNOCTHSInTFHaxJX52WnpivVtm3nc7e/2R70E1JJ70O/a2FDkHdZQIm3yDMEcpMyvRV1Qmiyf3G25wXW+QychFA1i3uqiJ1yWc9aBPYFmMM3BbB4oiL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuLWiJm6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuLWiJm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755159343; x=1786695343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6E0Tfz3mQAO8WgpBT7lxhRZaLaj11rwitgOe3a6lVFg=;
  b=DuLWiJm6uV9jlhLe7bW59m+XKxl9xFf95zhKS8mxSLQaXvYTThsxxAdG
   jIyIVSJq2bGdAanBQDD0eJWHCAst1SsUl5LMVDnFXs60eOJBWVwgWstDS
   p5DDthoeNJ7pt850foCF/reoFBGuf2Zk88EQpRRGYVRyVjsUoMQK24tlV
   YQ4NGjXFssXiYQOwMYAZ6gpjqiD0F7MI8oY876bYsw38uY1mBBdnI/cTw
   Lg64MB581LfwdtHxyV/xWTg8xwC2pRBbq6AoJLifmLyt4ogUdJRGYdNhI
   Lhbe1TKDNPFHnj0rHTMCHfsehykJikPsNiVWwQjdeaO5ShyHngoxktdUO
   A==;
X-CSE-ConnectionGUID: OY/TJQv6TQOGDpl6vg7TGg==
X-CSE-MsgGUID: L89AeeGuQL2QR1FRGrvDRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="80045683"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="80045683"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:15:43 -0700
X-CSE-ConnectionGUID: 6QvLLeTHS52x5elOnY5SwA==
X-CSE-MsgGUID: FPLkVErvS/+BynwVet6Qsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166964216"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 01:15:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umT7P-000Ajw-2T;
	Thu, 14 Aug 2025 08:15:30 +0000
Date: Thu, 14 Aug 2025 16:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	William Mcvicker <willmcvicker@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v3 2/2] phy: samsung: gs101-ufs: Add .notify_phystate() &
 hibern8 enter/exit values
Message-ID: <202508141555.NJvU2oYQ-lkp@intel.com>
References: <20250813-phy-notify-pmstate-v3-2-3bda59055dd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-phy-notify-pmstate-v3-2-3bda59055dd3@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43c3c17f0c805882d1b48818b1085747a68c80ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/phy-add-new-phy_notify_state-api/20250813-231312
base:   43c3c17f0c805882d1b48818b1085747a68c80ec
patch link:    https://lore.kernel.org/r/20250813-phy-notify-pmstate-v3-2-3bda59055dd3%40linaro.org
patch subject: [PATCH v3 2/2] phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values
config: arm-randconfig-001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141555.NJvU2oYQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141555.NJvU2oYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141555.NJvU2oYQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/samsung/phy-samsung-ufs.c:232:11: warning: variable 'cfg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     232 |         else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/samsung/phy-samsung-ufs.c:235:19: note: uninitialized use occurs here
     235 |         for_each_phy_cfg(cfg) {
         |                          ^~~
   drivers/phy/samsung/phy-samsung-ufs.c:232:7: note: remove the 'if' if its condition is always true
     232 |         else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     233 |                 cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
   drivers/phy/samsung/phy-samsung-ufs.c:224:39: note: initialize the variable 'cfg' to silence this warning
     224 |         const struct samsung_ufs_phy_cfg *cfg;
         |                                              ^
         |                                               = NULL
   1 warning generated.


vim +232 drivers/phy/samsung/phy-samsung-ufs.c

   219	
   220	static int samsung_ufs_phy_notify_state(struct phy *phy,
   221						union phy_notify state)
   222	{
   223		struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
   224		const struct samsung_ufs_phy_cfg *cfg;
   225		int i, err;
   226	
   227		if (!ufs_phy->cfgs_hibern8)
   228			return 0;
   229	
   230		if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
   231			cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
 > 232		else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
   233			cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
   234	
   235		for_each_phy_cfg(cfg) {
   236			for_each_phy_lane(ufs_phy, i) {
   237				samsung_ufs_phy_config(ufs_phy, cfg, i);
   238			}
   239		}
   240	
   241		if (state.ufs_state == PHY_UFS_HIBERN8_EXIT) {
   242			for_each_phy_lane(ufs_phy, i) {
   243				if (ufs_phy->drvdata->wait_for_cdr) {
   244					err = ufs_phy->drvdata->wait_for_cdr(phy, i);
   245					if (err)
   246						goto err_out;
   247				}
   248			}
   249		}
   250	
   251		return 0;
   252	err_out:
   253		return err;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
