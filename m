Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567057603F;
	Sun, 23 Feb 2025 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740330074; cv=none; b=cLeGNINrSa4NRur42zRyao2Xp0DpdmVgKJ/cLU92ChkFv2+gzPPpLCCqGoMIUl504Oqz3RcinKtALp3Zv5XJGFiO04fO+j6XH9BJO1hCgJUdRyA2wx3f3MLXK5lY5hKNI3tjRrZK8EUxWjqC9DmJpkPmkRJxDhpScP18DHqvvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740330074; c=relaxed/simple;
	bh=hce+YrPGmrSFkOORUi3xYv5tzmbWodZaL3ZsXnTZWtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl+VsR56bfREU/xD7zUujn92F9gUn8CjqOr9kPGs5b7SSWvcIvpVNskfVl8TGkWKXfzlKgT/pflmJsK2pYZf2DRvmuel4IQ9HzstnBIfI3dtRtyhnrYMPAGyOf9yjokZcBmx2VTCnqCXQyf6dWxtNMFo7/ZpNO7aY+VNfe7pqnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiXDHEr3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiXDHEr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740330073; x=1771866073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hce+YrPGmrSFkOORUi3xYv5tzmbWodZaL3ZsXnTZWtQ=;
  b=XiXDHEr3d3JvkDEa9sPwmjhHqJYLWWSHCOLIRMuAJY03WNHoHS8/Khw9
   KQRew84sb/xj4cehG4ED+XOYX0yRbODsdHx4KPCqyR6Iy6qKcPh4l0W12
   1RWkdwRL5o/18qMIt2G+PQtuVMlqdz1bDgF1QpC8lfOofSyji7pVGlH4M
   7dXvuU9dHGii+ZwzKt/HXoEGmWcvRkZyPVSHKDDYiZ4JFSJ8LAggJ14I7
   ZtswQFz6SxQKfLx8MLkTfXxRxJCu4eREo0hKQ5P1ECr8K53JGvyFsHp+Z
   OMCZ7WJ5AQu4ZnhdgPMuQDP7NXOSA2ENtAgoA8DK81D4oIZVLiVT1z0WL
   w==;
X-CSE-ConnectionGUID: jSos5SuhTkeub1TTp5tneg==
X-CSE-MsgGUID: bqmabwlzToO+ZMyWgWOzwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="63557680"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63557680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 09:01:11 -0800
X-CSE-ConnectionGUID: pt1LIXu7QMCp6BV5jQiC4w==
X-CSE-MsgGUID: dtvLSN++Sc+fPbZlSCdwpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116360702"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2025 09:01:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmFLk-0007T1-38;
	Sun, 23 Feb 2025 17:01:04 +0000
Date: Mon, 24 Feb 2025 01:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Message-ID: <202502240019.JZE1rcyX-lkp@intel.com>
References: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250223-203243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223123044.725493-5-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
reproduce: (https://download.01.org/0day-ci/archive/20250224/202502240019.JZE1rcyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240019.JZE1rcyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
