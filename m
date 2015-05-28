From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Thu, 28 May 2015 10:58:42 +0900
Message-ID: <55667652.5050102@samsung.com>
References: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18695 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752354AbbE1B6w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 21:58:52 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP1007VCETNA5C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 10:58:35 +0900 (KST)
In-reply-to: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene@kernel.org, k.kozlowski@samsung.com
Cc: cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com

Hi Chanho,

On 05/28/2015 12:15 AM, Chanho Park wrote:
> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
> cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
> cpu4-7 are cortex-a15.

The exynos5422 SoC can boot using cortex-a15 cpu depending on gpio
GPG2CON[1], i think this is just Odroid-XU3 board problem. Is it
possible to overwrite cpus information directly from
exynos5422-odroidxu3.dts?
