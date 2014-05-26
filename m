From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3rd 0/3] Samsung updates for 3.16
Date: Mon, 26 May 2014 13:03:08 +0900
Message-ID: <035501cf7897$6705ec70$3511c550$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16717 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaEZEDK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 00:03:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N65001H9XX8VI80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 13:03:08 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof and Kevin,

Here is 3rd Samsung pull-request for 3.16

Actually this series is depending on multiplatform and as you know it it
alreay ready, honestly almost but it should be fine for 3.16 soon.

Note, please see the resolution for tags/exynos-cpuidle in the [GIT PULL 3rd
1/3] Samsung Exynos cpuidle updates for 3.16.

One more, maybe you need to pull following for samsung updates for 3.16,
once exynos-multiplatform is ready to pull ;-)

>From 1st pull-request:
- tags/samsung-clk ([GIT PULL 2/5] Samsung clock updates for 3.16)
- tags/exynos-mcpm ([GIT PULL 5/5] Samsung Exynos MCPM support for 3.16)

>From 2nd pull-request:
- (nothing)

>From this:
- tags/cpuidle-exynos
- tags/exynos-soc
- tags/samsung-clk-2


If any problems, please kindly let me know.

Thanks,
Kukjin
