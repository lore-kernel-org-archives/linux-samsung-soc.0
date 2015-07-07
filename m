From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv5] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 07 Jul 2015 23:30:48 +0900
Message-ID: <08c001d0b8c1$844d4600$8ce7d200$@kernel.org>
References: <1436191955-3650-1-git-send-email-chanho61.park@samsung.com>
 <559B2F0C.5010603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45582 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754787AbbGGOau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jul 2015 10:30:50 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NR403431GBCZ880@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jul 2015 23:30:48 +0900 (KST)
In-reply-to: <559B2F0C.5010603@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Chanho Park' <parkch98@gmail.com>, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Chanho Park' <chanho61.park@samsung.com>

Krzysztof Kozlowski wrote:
> 
> On 06.07.2015 23:12, Chanho Park wrote:
> > The odroid-xu3 board which is based on exynos5422 not exynos5800 is
> > booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
> > is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
> > cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
> > and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
> > cpu4-7 are cortex-a15.
> >
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> > Changes from v4:
> >  - Remove temporal patch in e-mail body
> >
> > Changes from v3:
> >  - include this exynos5422-cpus.dtsi in the exynos5422-odroidxu3-common.dtsi
> >
> > Changes from v2:
> >  - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
> >  - drop compatibles from exynos5422-cpus.dtsi
> >
> > Changes from v1:
> >  - rename exynos5422.dtsi to exynos5422-cpus.dtsi
> >  - include the dtsi file top of the exynos5422-odroidxu3.dts
> >
> > Secondary cpu booting problem[1] is not resolved yet. Need more investigations
> > to work booting 8 cores correctly.
> >
> > [1]: http://www.spinics.net/lists/linux-samsung-soc/msg45525.html
> >
> >  arch/arm/boot/dts/exynos5422-cpus.dtsi             | 81 ++++++++++++++++++++++
> >  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  1 +
> >  2 files changed, 82 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi
> 
> Thanks, applied to my tree. I'll sent it to Kukjin later for 4.3 unless
> he picks it up from LKML.
> 
Hi Krzysztof,

If you're OK, I'd like to pick this up into Samsung tree with your ack based on
4.2-rc1.

Thanks,
Kukjin
