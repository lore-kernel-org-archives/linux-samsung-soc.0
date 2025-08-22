Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38342EF660
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854810; cv=none; b=gAW8biFHBH4pnc5SWEkcMdYNpbEU9jhSOgyRDmRHmFZjd0GFSa5ELzrujYKvqloQ0oTHeic+dLVZE8/M9i7t7s3Ehk1SlYVF4xsgJZS75FalZh1WqSX5i1LmbDg6v/3w86OA4JuHsNjfDcmVuDg4huGYg1KSP8a3rc+bsuR4Bjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854810; c=relaxed/simple;
	bh=wOwI2oKPnDRuHjZ2SOx+OFwv2fBfKeaehXv6eU6r2tU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=aPQe2/SVjhRw6nh0jZXM5rm3hB9qbRWke0PKCFKJk/SEioW3CAREm+023ge05yCJXk+lewbxTFBGK2sDi1NfHpTVRjN/Pgf1QVZakP1uIy+uBFHaGjJIxj5XCC+FC3ViJaWr/ihVl8YECC6NVGHXGvA5/RYmzhE2B5kZoKy0O68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HCpzWZv5; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HCpzWZv5"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822092638epoutp02cbc1108965ee625079013e2c4d576504~eDKL9M4b-2888428884epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:26:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822092638epoutp02cbc1108965ee625079013e2c4d576504~eDKL9M4b-2888428884epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755854798;
	bh=nmtEoeQlWuqYko7mqBv9pQr3Zd1olsc1MAqj9gtJ+xo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HCpzWZv55h4/Y3Rnp1lf4B3OehmY2sv1WXATu/E8TIH9xI1JiUvdMJc96nTLLOTrU
	 NRHX6Gwhywx84a6gjxknJR5WU9QgJaMZz/nqalCscox3T28UUmNW0e/crGbjBh8VjW
	 yXPFJoLzQYdYkxChWMST6TkzFwJK96nYt7OdC1Q4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250822092637epcas5p29a7dd2208e947a9732298efc46494f7e~eDKK4z4X51122911229epcas5p27;
	Fri, 22 Aug 2025 09:26:37 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7ZZP0Mkqz6B9m5; Fri, 22 Aug
	2025 09:26:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250822092636epcas5p41d4c9c6511ed7d0194c95e651ba0d6b3~eDKJrf--63154431544epcas5p4e;
	Fri, 22 Aug 2025 09:26:36 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822092633epsmtip197617a5a4f4d248d605769bfa26a2454~eDKGnqxap0570405704epsmtip1Z;
	Fri, 22 Aug 2025 09:26:33 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <johan@kernel.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <202508220553.lm7ExAxG-lkp@intel.com>
Subject: RE: [PATCH v6 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Fri, 22 Aug 2025 14:56:32 +0530
Message-ID: <006f01dc1346$db4edf50$91ec9df0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHdPSQ+XjFsLeZLd+6ieGPrJFm5GwFxhWqcAlQOQPW0Tc8gUA==
Content-Language: en-in
X-CMS-MailID: 20250822092636epcas5p41d4c9c6511ed7d0194c95e651ba0d6b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821212909epcas5p3cfcff210863febc2410cf661172be683
References: <20250821073703.2498302-7-pritam.sutar@samsung.com>
	<CGME20250821212909epcas5p3cfcff210863febc2410cf661172be683@epcas5p3.samsung.com>
	<202508220553.lm7ExAxG-lkp@intel.com>

Hi, 

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 22 August 2025 02:58 AM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>; vkoul@kernel.org;
> kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> johan@kernel.org; m.szyprowski@samsung.com; s.nawrocki@samsung.com
> Cc: oe-kbuild-all@lists.linux.dev; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v6 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> Hi Pritam,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on robh/for-next] [also build test WARNING on
> krzk/for-next linus/master v6.17-rc2 next-20250821] [If your patch is
applied
> to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://protect2.fireeye.com/v1/url?k=07116f39-666ac5ae-0710e476-
> 74fe4860001d-17dff89291ad3b5b&q=1&e=45b4f292-bcb1-4614-86a0-
> c790a47fb814&u=https%3A%2F%2Fgithub.com%2Fintel-lab-
> lkp%2Flinux%2Fcommits%2FPritam-Manohar-Sutar%2Fdt-bindings-phy-
> samsung-usb3-drd-phy-add-ExynosAutov920-HS-phy-
> compatible%2F20250821-153122
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
for-
> next
> patch link:    https://lore.kernel.org/r/20250821073703.2498302-7-
> pritam.sutar%40samsung.com
> patch subject: [PATCH v6 6/6] phy: exynos5-usbdrd: support SS combo phy
> for ExynosAutov920
> config: arc-randconfig-001-20250822 (https://download.01.org/0day-
> ci/archive/20250822/202508220553.lm7ExAxG-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-
> ci/archive/20250822/202508220553.lm7ExAxG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new
version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202508220553.lm7ExAxG-lkp@intel.
> | com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/phy/samsung/phy-exynos5-usbdrd.c: In function
> 'exynosautov920_usb31drd_cr_write':
> >> drivers/phy/samsung/phy-exynos5-usbdrd.c:2167:17: warning: unused
> >> variable 'dev' [-Wunused-variable]
>      struct device *dev = phy_drd->dev;
>                     ^~~
>    drivers/phy/samsung/phy-exynos5-usbdrd.c: In function
> 'exynosautov920_usb31drd_port_phy_ready':
> >> drivers/phy/samsung/phy-exynos5-usbdrd.c:2137:6: warning: 'reg' is
> >> used uninitialized in this function [-Wuninitialized]
>      reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
>      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
>        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    during RTL pass: mach
>    drivers/phy/samsung/phy-exynos5-usbdrd.c: In function
> 'exynos5_usbdrd_phy_probe':
>    drivers/phy/samsung/phy-exynos5-usbdrd.c:3056:1: internal compiler
> error: in arc_ifcvt, at config/arc/arc.c:9110
>     }
>     ^
>    Please submit a full bug report,
>    with preprocessed source if appropriate.
>    See <https://gcc.gnu.org/bugs/> for instructions.
> 
> 
> vim +/dev +2167 drivers/phy/samsung/phy-exynos5-usbdrd.c
> 
>   2125
>   2126	static void
>   2127	exynosautov920_usb31drd_port_phy_ready(struct
> exynos5_usbdrd_phy *phy_drd)
>   2128	{
>   2129		struct device *dev = phy_drd->dev;
>   2130		void __iomem *reg_phy = phy_drd->reg_phy;
>   2131		static const unsigned int timeout_us = 20000;
>   2132		static const unsigned int sleep_us = 40;
>   2133		u32 reg;
>   2134		int err;
>   2135
>   2136		/* Clear cr_para_con */
> > 2137		reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
>   2138
> 	PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
>   2139		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
>   2140		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2141		writel(0x0, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
>   2142		writel(0x0, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
>   2143
>   2144		exynosautov920_usb31drd_cr_clk(phy_drd, true);
>   2145		exynosautov920_usb31drd_cr_clk(phy_drd, false);
>   2146
>   2147		/*
>   2148		 * The maximum time from phy reset de-assertion to
de-
> assertion of
>   2149		 * tx/rx_ack can be as high as 5ms in fast
simulation mode.
>   2150		 * Time to phy ready is < 20ms
>   2151		 */
>   2152		err = readl_poll_timeout(reg_phy +
>   2153
> 	EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
>   2154				reg, !(reg &
> PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
>   2155				sleep_us, timeout_us);
>   2156		if (err)
>   2157			dev_err(dev, "timed out waiting for
rx/tx_ack:
> %#.8x\n", reg);
>   2158
>   2159		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
>   2160		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2161	}
>   2162
>   2163	static void
>   2164	exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy
> *phy_drd,
>   2165					 u16 addr, u16 data)
>   2166	{
> > 2167		struct device *dev = phy_drd->dev;
>   2168		void __iomem *reg_phy = phy_drd->reg_phy;
>   2169		u32 cnt = 0;
>   2170		u32 reg;
>   2171
>   2172		/* Pre Clocking */
>   2173		reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2174		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
>   2175		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2176
>   2177		/*
>   2178		 * tx clks must be available prior to assertion of
tx req.
>   2179		 * tx pstate p2 to p0 transition directly is not
permitted.
>   2180		 * tx clk ready must be asserted synchronously on tx
clk prior
>   2181		 * to internal transmit clk alignment sequence in
the phy
>   2182		 * when entering from p2 to p1 to p0.
>   2183		 */
>   2184		do {
>   2185			exynosautov920_usb31drd_cr_clk(phy_drd,
true);
>   2186			exynosautov920_usb31drd_cr_clk(phy_drd,
false);
>   2187			cnt++;
>   2188		} while (cnt < 15);
>   2189
>   2190		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
>   2191		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2192
>   2193		/*
>   2194		 * tx data path is active when tx lane is in p0
state
>   2195		 * and tx data en asserted. enable cr_para_wr_en.
>   2196		 */
>   2197		reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
>   2198		reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
>   2199		reg |=
> FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
>   2200			PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
>   2201		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
>   2202
>   2203		/* write addr */
>   2204		reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2205		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
>   2206		reg |=
> FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
>   2207			PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
>   2208			PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
>   2209		writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2210
>   2211		/* check cr_para_ack*/
>   2212		cnt = 0;
>   2213		do {
>   2214			/*
>   2215			 * data symbols are captured by phy on
rising edge of
> the
>   2216			 * tx_clk when tx data enabled.
>   2217			 * completion of the write cycle is
acknowledged by
> assertion
>   2218			 * of the cr_para_ack.
>   2219			 */
>   2220			exynosautov920_usb31drd_cr_clk(phy_drd,
true);
>   2221			reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
>   2222			if ((reg &
> PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
>   2223				break;
>   2224
>   2225			exynosautov920_usb31drd_cr_clk(phy_drd,
false);
>   2226
>   2227			/*
>   2228			 * wait for minimum of 10 cr_para_clk cycles
after phy
> reset
>   2229			 * is negated, before accessing control regs
to allow
> for
>   2230			 * internal resets.
>   2231			 */
>   2232			cnt++;
>   2233		} while (cnt < 10);
>   2234
>   2235		if (cnt < 10)
>   2236			exynosautov920_usb31drd_cr_clk(phy_drd,
false);
>   2237	}
>   2238
> 
> --
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=96757503-f70edf94-9674fe4c-
> 74fe4860001d-38e3f56dae8e119d&q=1&e=45b4f292-bcb1-4614-86a0-
> c790a47fb814&u=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki

Will post v7 with the fixes for these warnings.

Thank you.

Regards,
Pritam


