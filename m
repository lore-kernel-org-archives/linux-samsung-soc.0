From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/5] ARM: dts: exynos4x12: Add PMU dt data to support
 PMU(Perforamnce Monitoring Unit)
Date: Tue, 11 Mar 2014 13:21:17 +0100
Message-ID: <531EFFBD.8050301@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
 <1394524494-30641-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13273 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536AbaCKMVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Mar 2014 08:21:36 -0400
In-reply-to: <1394524494-30641-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk

Hi Chanwoo,

On 11.03.2014 08:54, Chanwoo Choi wrote:
> ARM CPU has its own performance profiling unit(PMU, Perforamnce Monitoring Unit).
> This patch add PMU dt data to support PMU which count cache hit and miss events.
>
> PMU interrput list of Exynos4212
> - <2 2> : INTG2[2] - PMUIRQ[0] for CPU0
> - <3 2> : INTG3[2] - PMUIRQ[1] for CPU1
>
> PMU interrput list of Exynos4412
> - <2 2> : INTG2[2], PMUIRQ[0] for CPU0
> - <3 2> : INTG3[2], PMUIRQ[1] for CPU1
> - <18 2> : INTG18[2], PMUIRQ[2] : CPU2
> - <19 2> : INTG19[2], PMUIRQ[3] : CPU3
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4x12.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
