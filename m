Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238631DF963;
	Sat, 11 Oct 2025 03:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154012; cv=none; b=mzCtvqOHLmQKULytC5hg9szHiWJrmEHtfExuyYDK4iGFOeFdYq1dw1sKIhxEMdFog+J8IeKjtO3BL6XwCSnnrwoV3X2F9cTOPI7OdXX4ONqO426vN+/ilfiBTEQnTMkGwzUxwDKsaxZbcA09X8iMqHUXz7nABB+Mh85faZNOVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154012; c=relaxed/simple;
	bh=p/Sw6hsNG/Asjp0JRAo06u1WUs6i3eDXjAUi4btbFE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmhR5gkkHnC9TDJkqxG4Z8Fatoh95IyBQtL59QcDPWG49+Nm/xVIDTyqKCa6c5QHmC02RXjnTqjZXKbEOY8cII3Lb89BrRdceKCQDZsy3P5aE8rRzeImdWylSZYrGuvzzS/cS82oNasmhpgxDladEixDS70LtmZsIRjOUcLVuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3lxvNWI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3lxvNWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154012; x=1791690012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/Sw6hsNG/Asjp0JRAo06u1WUs6i3eDXjAUi4btbFE4=;
  b=d3lxvNWI85fwFg1oPznrC2VJeL2c1YqhGLuGgKOcppIVC/tCZwxT0R2b
   p14OnxYM3SmFr8vkN9IuFaFNemw1Hkg8bycM2AOMeXF4VWAhR4lwqhYBW
   rQvhRyzdrXPXAiThwgmXmQ40Gf3NdoTHmqgfLB3Ih/p4mFesPOHueVksU
   1EOuW25HOXqSRENHPcmA2LFGyepqdrBOthq4IK6sv0jk4em6+iJQj+NmA
   E2nXKJ5QC/TTB7N1burHZHOJiJ+mn3/DpL8W+EdANzPWBf8hEorPON6Em
   cIWdqmSnr2p5cotoZ5NPT15tk97WE9VyZ2ObLfZHmPBr90CHpXBC5H3q4
   Q==;
X-CSE-ConnectionGUID: LXDx0pBURa2rrXlvENz4UQ==
X-CSE-MsgGUID: 6pILyeEkQ+idl1n3WfkaXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73476873"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73476873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:11 -0700
X-CSE-ConnectionGUID: SsZEgcbATqSz7rgWvti7/A==
X-CSE-MsgGUID: oc8A357CSaCUSoyqDnPI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180236749"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003UX-1s;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
Message-ID: <202510111335.oyOAs9MB-lkp@intel.com>
References: <20251006232125.1833979-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006232125.1833979-2-royluo@google.com>

Hi Roy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5f0a698b34ed76002dc5cff3804a61c80233a7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Luo/usb-dwc3-Add-Google-SoC-DWC3-glue-driver/20251010-092651
base:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
patch link:    https://lore.kernel.org/r/20251006232125.1833979-2-royluo%40google.com
patch subject: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
config: s390-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111335.oyOAs9MB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111335.oyOAs9MB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111335.oyOAs9MB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-google.c:467:12: warning: 'dwc3_google_resume' defined but not used [-Wunused-function]
     467 | static int dwc3_google_resume(struct dwc3_google *google, pm_message_t msg)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-google.c:441:12: warning: 'dwc3_google_suspend' defined but not used [-Wunused-function]
     441 | static int dwc3_google_suspend(struct dwc3_google *google, pm_message_t msg)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/dwc3_google_resume +467 drivers/usb/dwc3/dwc3-google.c

   440	
 > 441	static int dwc3_google_suspend(struct dwc3_google *google, pm_message_t msg)
   442	{
   443		if (pm_runtime_suspended(google->dev))
   444			return 0;
   445	
   446		if (google->dwc.current_dr_role == DWC3_GCTL_PRTCAP_HOST) {
   447			/*
   448			 * Follow dwc3_suspend_common() guidelines for deciding between
   449			 * a full teardown and hibernation.
   450			 */
   451			if (PMSG_IS_AUTO(msg) || device_may_wakeup(google->dev)) {
   452				dev_dbg(google->dev, "enter hibernation");
   453				pm_runtime_get_sync(google->usb_top_pd);
   454				device_wakeup_enable(google->usb_top_pd);
   455				dwc3_google_enable_pme_irq(google);
   456				google->is_hibernation = true;
   457				return 0;
   458			}
   459		}
   460	
   461		reset_control_bulk_assert(google->num_rsts, google->rsts);
   462		clk_bulk_disable_unprepare(google->num_clks, google->clks);
   463	
   464		return 0;
   465	}
   466	
 > 467	static int dwc3_google_resume(struct dwc3_google *google, pm_message_t msg)
   468	{
   469		int ret;
   470	
   471		if (google->is_hibernation) {
   472			dev_dbg(google->dev, "exit hibernation");
   473			dwc3_google_disable_pme_irq(google);
   474			device_wakeup_disable(google->usb_top_pd);
   475			pm_runtime_put_sync(google->usb_top_pd);
   476			google->is_hibernation = false;
   477			return 0;
   478		}
   479	
   480		ret = clk_bulk_prepare_enable(google->num_clks, google->clks);
   481		if (ret)
   482			return ret;
   483	
   484		ret = reset_control_bulk_deassert(google->num_rsts, google->rsts);
   485		if (ret) {
   486			clk_bulk_disable_unprepare(google->num_clks, google->clks);
   487			return ret;
   488		}
   489	
   490		return 0;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
