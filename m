Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF61175A61;
	Sat, 28 Feb 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772309755; cv=none; b=QA1CKrttktVgpR2Bn0aFWKPcG6vg+PTlsR9a9ymoxfRSarDCvR7ObMJtHnyAVw7Jkui9GrRAXfZHth63J2hNIG3nqLIW6O6GWClmm9T0uxvR/Cd/3DruvZP1TE++w268LQEhhePhpEeQHeFD8TRpb4bKnFsoaC7NxSiJjWcskvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772309755; c=relaxed/simple;
	bh=Pf2ZqDiNTaVpou8OCsl9k0nAKVHkTrsQ8rYWDuqHje8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxLDLOmgiZDf7yvNLtwE2zxjwhPTjTpt52LznqaCyAJeLMuHKgjnN3uccbgb9Uidt0t/MWosuNXG8MLFtMUDjEIuILIHT19MPhBGL2+3x3XV4S42tLsTsBKBwMcx4IpTq7PpLvFDkGiNDVA/MpduOOFK/yoe3rUh1rX1WYwO+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6XiScxm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6XiScxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772309754; x=1803845754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pf2ZqDiNTaVpou8OCsl9k0nAKVHkTrsQ8rYWDuqHje8=;
  b=W6XiScxmEOz2bHSeC6zCjlHfu3o9oRI6AafLrmzeu2xxYVLN0t/trisy
   GOZmoPo7M14BzRZwPkOZkJgwIfOgs1oOhy4/TxR5o3Pc1By1svIdCx1OD
   J5n0vHmyH6vlcCaGtIij/aalIZn6E4EK4ALt54ZMFtp5omNCy3+K+aKGQ
   2Mnx9nWRqaHnVip7+7FFxyQxFRBPnbN9LEY/7CaKc5QF1qc83KWHw1+dx
   xcKr4WAQX4AycP9B7yKzy0tkfQKBpEZZ12Sp57K7Cb4Dj4zLFm4xNjzQj
   yrKz2KP+EIUCjf/5ni4VE5Ub1PDqxl4TUmlyysIhrpVVYSbJAu+2ME4ju
   A==;
X-CSE-ConnectionGUID: ijS5lK04QcGQKP+ykBsPeg==
X-CSE-MsgGUID: BZAdaNeKT3qRNPlHP0nxoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="84001425"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="84001425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 12:15:53 -0800
X-CSE-ConnectionGUID: +7+h/CCuRO2AFQu/kS6OeQ==
X-CSE-MsgGUID: ekF6cjXETo6a1NGSKrOlSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="214980288"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2026 12:15:50 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwQj5-0000000009v-0A1G;
	Sat, 28 Feb 2026 20:15:47 +0000
Date: Sun, 1 Mar 2026 04:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, amitsd@google.com,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
Message-ID: <202603010422.kDnbXirr-lkp@intel.com>
References: <20260227083954.3529857-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227083954.3529857-1-badhri@google.com>

Hi Badhri,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d692f20de6311fa507c952adc3487c641edee00]

url:    https://github.com/intel-lab-lkp/linux/commits/Badhri-Jagan-Sridharan/arm64-dts-exynos-gs101-Enable-AVS-APDO/20260227-164153
base:   5d692f20de6311fa507c952adc3487c641edee00
patch link:    https://lore.kernel.org/r/20260227083954.3529857-1-badhri%40google.com
patch subject: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260301/202603010422.kDnbXirr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010422.kDnbXirr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010422.kDnbXirr-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:177.10-30 Unexpected 'PDO_SPR_AVS_SNK_APDO'
   Error: arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:177.35-36 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
