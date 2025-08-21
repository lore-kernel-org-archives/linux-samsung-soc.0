Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCD4393DC3;
	Thu, 21 Aug 2025 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811746; cv=none; b=sQJcU54giXNIv0cBaLD4ovgQeGRvj0g0V5AEyXAbG0cSlKZ6hYk04OdlB7rIsSQ4jd6quh5vkVG1yftAMmRaJPuzAxYnsuv3FLyC7E19RGC5skdsKyckQ5BNm7orEY2f6ojUCvkNXSFKX9HegPMEw1+onq5HmotJgAP9pGp6iMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811746; c=relaxed/simple;
	bh=GrR4bZtSzHvF2nyvCTmyXxhSUd2f7AHIaQh0d8oCmy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxsSTfoQGuEdncUIKb7AcJCBwMJ2WcJXO7LCvlF4eomDnnni7lZZwnQFPeAAw1aDcYLMJoKpCQhvAI/cnWiN7ZJwj/fosGHQ/mVJs16Z0We8RW6JiHS3LmsWrT1tMcRlsa0SQOywtkMnIUGkScgXggC6vtXT7cok+d9MIG6zwvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpDu6IiP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpDu6IiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755811745; x=1787347745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GrR4bZtSzHvF2nyvCTmyXxhSUd2f7AHIaQh0d8oCmy0=;
  b=GpDu6IiP5TcabN1rW1hg7kEqCsn4VaXK74cm6eL9TUIfdNBa9tpKwtui
   CrXPf/1AhPizjVm7D6R0Gtm16Uhw5Z/amMGNMsyyzFe0LZB5upaDWl8G4
   n4xvYt4S6htTOJb+m2Gq7tDtsChxfWVaNwGmJ39xiRGUNR05E+cvpOI0J
   EhA8BC29nUZsRrGSV332vsXT/tDYwnvQxI9QmNbE0u8E6AAGxOymZMo4n
   MYGsdHohj9BLS0enwel7dZE2E/Mm1eqKB9vg5TNngDmg7AmmgfdiMpPuo
   jJAqBPXulOWFyvItwWJR6NMitbrfS2DNYCHPacH4MoGOYUifwwYaYfGHE
   w==;
X-CSE-ConnectionGUID: IGD2FNyWSou7MnZKoUIBRA==
X-CSE-MsgGUID: 6I5DleFLTDCWDinLqhNSmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58211818"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58211818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 14:29:04 -0700
X-CSE-ConnectionGUID: gKLChN3FSmS9FPg4KxPt5g==
X-CSE-MsgGUID: QjoNdbbBQACgALAV+CuSFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172780491"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2025 14:28:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upCq8-000KgN-1H;
	Thu, 21 Aug 2025 21:28:56 +0000
Date: Fri, 22 Aug 2025 05:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, johan@kernel.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v6 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <202508220553.lm7ExAxG-lkp@intel.com>
References: <20250821073703.2498302-7-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821073703.2498302-7-pritam.sutar@samsung.com>

Hi Pritam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.17-rc2 next-20250821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pritam-Manohar-Sutar/dt-bindings-phy-samsung-usb3-drd-phy-add-ExynosAutov920-HS-phy-compatible/20250821-153122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250821073703.2498302-7-pritam.sutar%40samsung.com
patch subject: [PATCH v6 6/6] phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920
config: arc-randconfig-001-20250822 (https://download.01.org/0day-ci/archive/20250822/202508220553.lm7ExAxG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220553.lm7ExAxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220553.lm7ExAxG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/samsung/phy-exynos5-usbdrd.c: In function 'exynosautov920_usb31drd_cr_write':
>> drivers/phy/samsung/phy-exynos5-usbdrd.c:2167:17: warning: unused variable 'dev' [-Wunused-variable]
     struct device *dev = phy_drd->dev;
                    ^~~
   drivers/phy/samsung/phy-exynos5-usbdrd.c: In function 'exynosautov920_usb31drd_port_phy_ready':
>> drivers/phy/samsung/phy-exynos5-usbdrd.c:2137:6: warning: 'reg' is used uninitialized in this function [-Wuninitialized]
     reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
     ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   during RTL pass: mach
   drivers/phy/samsung/phy-exynos5-usbdrd.c: In function 'exynos5_usbdrd_phy_probe':
   drivers/phy/samsung/phy-exynos5-usbdrd.c:3056:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.


vim +/dev +2167 drivers/phy/samsung/phy-exynos5-usbdrd.c

  2125	
  2126	static void
  2127	exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
  2128	{
  2129		struct device *dev = phy_drd->dev;
  2130		void __iomem *reg_phy = phy_drd->reg_phy;
  2131		static const unsigned int timeout_us = 20000;
  2132		static const unsigned int sleep_us = 40;
  2133		u32 reg;
  2134		int err;
  2135	
  2136		/* Clear cr_para_con */
> 2137		reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
  2138				PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
  2139		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
  2140		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2141		writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
  2142		writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
  2143	
  2144		exynosautov920_usb31drd_cr_clk(phy_drd, true);
  2145		exynosautov920_usb31drd_cr_clk(phy_drd, false);
  2146	
  2147		/*
  2148		 * The maximum time from phy reset de-assertion to de-assertion of
  2149		 * tx/rx_ack can be as high as 5ms in fast simulation mode.
  2150		 * Time to phy ready is < 20ms
  2151		 */
  2152		err = readl_poll_timeout(reg_phy +
  2153					EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
  2154				reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
  2155				sleep_us, timeout_us);
  2156		if (err)
  2157			dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
  2158	
  2159		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
  2160		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2161	}
  2162	
  2163	static void
  2164	exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
  2165					 u16 addr, u16 data)
  2166	{
> 2167		struct device *dev = phy_drd->dev;
  2168		void __iomem *reg_phy = phy_drd->reg_phy;
  2169		u32 cnt = 0;
  2170		u32 reg;
  2171	
  2172		/* Pre Clocking */
  2173		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2174		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
  2175		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2176	
  2177		/*
  2178		 * tx clks must be available prior to assertion of tx req.
  2179		 * tx pstate p2 to p0 transition directly is not permitted.
  2180		 * tx clk ready must be asserted synchronously on tx clk prior
  2181		 * to internal transmit clk alignment sequence in the phy
  2182		 * when entering from p2 to p1 to p0.
  2183		 */
  2184		do {
  2185			exynosautov920_usb31drd_cr_clk(phy_drd, true);
  2186			exynosautov920_usb31drd_cr_clk(phy_drd, false);
  2187			cnt++;
  2188		} while (cnt < 15);
  2189	
  2190		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
  2191		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2192	
  2193		/*
  2194		 * tx data path is active when tx lane is in p0 state
  2195		 * and tx data en asserted. enable cr_para_wr_en.
  2196		 */
  2197		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
  2198		reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
  2199		reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
  2200			PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
  2201		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
  2202	
  2203		/* write addr */
  2204		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2205		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
  2206		reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
  2207			PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
  2208			PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
  2209		writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2210	
  2211		/* check cr_para_ack*/
  2212		cnt = 0;
  2213		do {
  2214			/*
  2215			 * data symbols are captured by phy on rising edge of the
  2216			 * tx_clk when tx data enabled.
  2217			 * completion of the write cycle is acknowledged by assertion
  2218			 * of the cr_para_ack.
  2219			 */
  2220			exynosautov920_usb31drd_cr_clk(phy_drd, true);
  2221			reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
  2222			if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
  2223				break;
  2224	
  2225			exynosautov920_usb31drd_cr_clk(phy_drd, false);
  2226	
  2227			/*
  2228			 * wait for minimum of 10 cr_para_clk cycles after phy reset
  2229			 * is negated, before accessing control regs to allow for
  2230			 * internal resets.
  2231			 */
  2232			cnt++;
  2233		} while (cnt < 10);
  2234	
  2235		if (cnt < 10)
  2236			exynosautov920_usb31drd_cr_clk(phy_drd, false);
  2237	}
  2238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
