From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCHv2 0/5] ARM: dts: exynos: Add missing dt data to bring
 kernel of Exynos4x12
Date: Wed, 12 Mar 2014 12:21:12 +0100
Message-ID: <53204328.7070607@samsung.com>
References: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54279 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753655AbaCLLV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 07:21:29 -0400
In-reply-to: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk

Hi Chanwoo,

On 12.03.2014 07:19, Chanwoo Choi wrote:
> This patch add missing dt data of Exynos4x12 to bring up kernel feature and
> code clean. This patchset is based on 'v3.15-next/dt-clk-exynos' branch.
> - git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> exynos4x12/exynos4412/exynos4212.dtsi
> - Add ADC (Analog and Digital Converter) to get raw data
> - Add PMU (Performance Monitoring Unit) for perf event
> - Add gps_alive power domain to remove power leakage when gps-alive isn't used
> - Remove duplicate dt data of interrput combiner controller
>
> exynos4412-trats.dts
> - Add ADC dt data with ntc thermistor child to read temperature
>
> Changes from v1:
> - Use clock macro name for Exynos4 instead of constant for ADC
> - Remove unnecessary description about patch content
> - Move gps-alive power domain's dt data from exynos4x12.dts to exynos4.dts
> - Move thermistor dt node outside of ADC dt node and modify node name of thermistor
>
> Chanwoo Choi (5):
>    ARM: dts: exynos4x12: Add ADC's dt data to read raw data
>    ARM: dts: exynos4x12: Add PMU dt data to support PMU(Perforamnce Monitoring Unit)
>    ARM: dts: exynos4x12: Add GPS_ALIVE power domain
>    ARM: dts: exynos: Move common dt data for interrupt combiner controller
>    ARM: dts: exynos4412-trats2: Add ADC/themistor dt data to get temperature of SoC/battery
>
>   arch/arm/boot/dts/exynos4.dtsi          |  5 +++++
>   arch/arm/boot/dts/exynos4212.dtsi       | 13 ++++---------
>   arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
>   arch/arm/boot/dts/exynos4412.dtsi       | 14 ++++----------
>   arch/arm/boot/dts/exynos4x12.dtsi       | 26 ++++++++++++++++++++++++++
>   5 files changed, 60 insertions(+), 19 deletions(-)
>

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
