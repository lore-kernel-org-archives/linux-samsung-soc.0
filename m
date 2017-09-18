From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] arm: dts: r8a7790: add cpu capacity-dmips-mhz
 information
Date: Mon, 18 Sep 2017 09:39:46 +0200
Message-ID: <20170918073946.GA9156@verge.net.au>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-5-dietmar.eggemann@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50474 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdIRHkH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 03:40:07 -0400
Content-Disposition: inline
In-Reply-To: <20170830144120.9312-5-dietmar.eggemann@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@arm.com>

On Wed, Aug 30, 2017 at 03:41:20PM +0100, Dietmar Eggemann wrote:
> The following 'capacity-dmips-mhz' dt property values are used:
> 
> Cortex-A15: 1024, Cortex-A7: 539
> 
> They have been derived form the cpu_efficiency values:
> 
> Cortex-A15: 3891, Cortex-A7: 2048
> 
> by scaling them so that the Cortex-A15s (big cores) use 1024.
> 
> The cpu_efficiency values were originally derived from the "Big.LITTLE
> Processing with ARM Cortex™-A15 & Cortex-A7" white paper
> (http://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf). Table 1 lists 1.9x
> (3891/2048) as the Cortex-A15 vs Cortex-A7 performance ratio for the
> Dhrystone benchmark.
> 
> The following platform is affected once cpu-invariant accounting
> support is re-connected to the task scheduler:

Thanks, applied for v4.15.

My understanding from the following comment in the cover letter is that not
currently the case and this there is no behavioural change in applying this
patch.

For the record I observed the following with and without this patch
applied. I believe this is the expected result.

v4.14-rc1
# cat /sys/devices/system/cpu/cpu*/cpu_capacity
1535
1535
1535
1535
1024
1024
1024
1024

v4.14-rc1 + patch
# cat /sys/devices/system/cpu/cpu*/cpu_capacity
1024
1024
1024
1024
539
539
539
539
