Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B8158DC4;
	Sat, 15 Feb 2025 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739639775; cv=none; b=oKXDnXwdKullD05qEzoaxHlb/kaF5w3qvKO8NaUm0NN2qkMr4YaEJRd683nRB9c2N10Oy60fsbQUjkKnvGoQMYBnkTbmEVn8iSPN61sgqDHeU+F6c/ZjOrnFTwtWGm+fPZZk7L649l3WWvAm4a015TCm6TsuXaIo2VtDVaOQHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739639775; c=relaxed/simple;
	bh=Equsm08FQ5ieBMbjiGQm0NyEsM2olvsgtLG0zKJlMKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJjw14GM2p74EzhszkU7cuPLDbH/gF40xidz+dEY/VN1tXNpn33JNEMZ2Nl7F4j+n0jMcJINQGxVPns8E2HXye4loAW4I6CIxKXETIZVB2/o4Zc7/TZhh9v7Xn6zLrVajoj5jhAYOzp8BTCC1x5fqiO9kMjQmIj/Lxqsf6/ViXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4VpjfNk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4VpjfNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739639773; x=1771175773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Equsm08FQ5ieBMbjiGQm0NyEsM2olvsgtLG0zKJlMKo=;
  b=l4VpjfNkSNwuaTcR0Pxvss4+9dfbJx+EqVrSadMv3SX7//LiHfIi13sr
   a/zy2x+DHGUD+bpEE/RsNNFPrNOzfEjAFkuOICFe/h4Kqm9Ycbtvif651
   NqUgV+5U3hGxhcZg7w1v1lKqXd4K+EcdBq685nfpVX2Kv/iatY2Rl1T2R
   yvGkVqiPUHJad/ngRr/j7NNNRYajaHp5wXKdv39A6mHg/4zWw4ReYt42q
   tkfyhm60w7riUEX7oj79d8VcS+l8bpT6N5mYcwrgPD/ffOGiepe018lUq
   trb9F7KXZw1PqPU4w6ETFzJlaAS21S5ABn6VNfjPetZK+MUPOP1vWU3wO
   Q==;
X-CSE-ConnectionGUID: pPoMEHllQE27/H1nZL+vKQ==
X-CSE-MsgGUID: 4yQv5bnlQoSii68tLT6a1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40403678"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40403678"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 09:16:12 -0800
X-CSE-ConnectionGUID: Yd7RnQbmTgWJdCCXOEjokw==
X-CSE-MsgGUID: Dzd1IWb1TXSPnX7Q8e5WhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144654676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 09:16:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjLlw-001B1v-0e;
	Sat, 15 Feb 2025 17:16:08 +0000
Date: Sun, 16 Feb 2025 01:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Message-ID: <202502160050.nTezfbL3-lkp@intel.com>
References: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/MAINTAINERS-add-entry-for-Samsung-Exynos2200-SoC/20250215-210923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250215130702.170851-1-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502160050.nTezfbL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160050.nTezfbL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
