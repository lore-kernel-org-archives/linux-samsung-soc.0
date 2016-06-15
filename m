From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/5] clk: max77686: Combine Maxim max77686 and max77802
 driver
Date: Wed, 15 Jun 2016 23:35:18 +0800
Message-ID: <201606152336.8yLdCgO4%fengguang.wu@intel.com>
References: <1466000018-16784-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:57981 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932432AbcFOPgC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 11:36:02 -0400
Content-Disposition: inline
In-Reply-To: <1466000018-16784-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: kbuild-all@01.org, k.kozlowski@samsung.com, javier@osg.samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@dowhile0.org>

Hi,

[auto build test WARNING on next-20160615]
[also build test WARNING on v4.7-rc3]
[cannot apply to clk/clk-next robh/for-next v4.7-rc3 v4.7-rc2 v4.7-rc1]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Laxman-Dewangan/clk-Combine-MAX77686-and-MAX77802-driver-and-extend-for-MAX77620/20160615-223243


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/clk-max77686.c:177:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
