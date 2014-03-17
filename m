From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 0/5] ARM: dts: exynos: Add missing dt data to bring
 kernel of Exynos4x12
Date: Mon, 17 Mar 2014 10:44:36 +0900
Message-ID: <006201cf4182$77b665f0$672331d0$@samsung.com>
References: <1394605156-7768-1-git-send-email-cw00.choi@samsung.com>
 <53204328.7070607@samsung.com> <53211071.4040408@samsung.com>
 <532651E5.6040903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57345 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932070AbaCQBoo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 21:44:44 -0400
In-reply-to: <532651E5.6040903@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org

Chanwoo Choi wrote:
> 
> Dear Kukjin,
> 
> Ping.
> 
> Please review this patchset.
> 
Looks good to me, will apply tonight.

Thanks,
Kukjin

> Best Regards,
> Chanwoo Choi
> 
> On 03/13/2014 10:57 AM, Chanwoo Choi wrote:
> > Dear Kukjin,
> >
> > On 03/12/2014 08:21 PM, Tomasz Figa wrote:
> >> Hi Chanwoo,
> >>
> >> On 12.03.2014 07:19, Chanwoo Choi wrote:
> >>> This patch add missing dt data of Exynos4x12 to bring up kernel
> feature and
> >>> code clean. This patchset is based on 'v3.15-next/dt-clk-exynos'
> branch.
> >>> - git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-
> samsung.git
> >>>
> >>> exynos4x12/exynos4412/exynos4212.dtsi
> >>> - Add ADC (Analog and Digital Converter) to get raw data
> >>> - Add PMU (Performance Monitoring Unit) for perf event
> >>> - Add gps_alive power domain to remove power leakage when gps-alive
> isn't used
> >>> - Remove duplicate dt data of interrput combiner controller
> >>>
> >>> exynos4412-trats.dts
> >>> - Add ADC dt data with ntc thermistor child to read temperature
> >>>
> >>> Changes from v1:
> >>> - Use clock macro name for Exynos4 instead of constant for ADC
> >>> - Remove unnecessary description about patch content
> >>> - Move gps-alive power domain's dt data from exynos4x12.dts to
> exynos4.dts
> >>> - Move thermistor dt node outside of ADC dt node and modify node name
> of thermistor
> >>>
> >>> Chanwoo Choi (5):
> >>>    ARM: dts: exynos4x12: Add ADC's dt data to read raw data
> >>>    ARM: dts: exynos4x12: Add PMU dt data to support PMU(Perforamnce
> Monitoring Unit)
> >>>    ARM: dts: exynos4x12: Add GPS_ALIVE power domain
> >>>    ARM: dts: exynos: Move common dt data for interrupt combiner
> controller
> >>>    ARM: dts: exynos4412-trats2: Add ADC/themistor dt data to get
> temperature of SoC/battery
> >>>
> >>>   arch/arm/boot/dts/exynos4.dtsi          |  5 +++++
> >>>   arch/arm/boot/dts/exynos4212.dtsi       | 13 ++++---------
> >>>   arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
> >>>   arch/arm/boot/dts/exynos4412.dtsi       | 14 ++++----------
> >>>   arch/arm/boot/dts/exynos4x12.dtsi       | 26
> ++++++++++++++++++++++++++
> >>>   5 files changed, 60 insertions(+), 19 deletions(-)
> >>>
> >>
> >> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >>
> >
> > Please review or comment this patchset.
> >
> > Best Regards,
> > Chanwoo Choi
