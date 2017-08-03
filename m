From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Fri, 4 Aug 2017 03:36:12 +0800
Message-ID: <201708040313.sZE4uytJ%fengguang.wu@intel.com>
References: <1501746323-5254-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:45197 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751251AbdHCTgi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 15:36:38 -0400
Content-Disposition: inline
In-Reply-To: <1501746323-5254-2-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: kbuild-all@01.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, krzk@kernel.org, Maciej Purski <m.purski@samsung.com>, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com

Hi Maciej,

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v4.13-rc3 next-20170803]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Maciej-Purski/add-Silicon-Image-SiI9234-driver/20170803-200255
base:   git://people.freedesktop.org/~airlied/linux.git drm-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/bridge/sii9234.c:1010:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
