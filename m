From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] Add support for monitoring gpio switches
Date: Sat, 5 Dec 2015 02:14:48 +0800
Message-ID: <201512050224.lVULPyNu%fengguang.wu@intel.com>
References: <1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:50185 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752046AbbLDSNZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 13:13:25 -0500
Content-Disposition: inline
In-Reply-To: <1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: kbuild-all@01.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Martyn Welch <martyn.welch@collabora.co.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Hi Martyn,

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on v4.4-rc3 next-20151203]

url:    https://github.com/0day-ci/linux/commits/Martyn-Welch/Device-tree-binding-documentation-for-gpio-switch/20151205-014105


coccinelle warnings: (new ones prefixed by >>)

>> drivers/misc/gpio-switch.c:98:34-40: ERROR: application of sizeof to pointer

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
