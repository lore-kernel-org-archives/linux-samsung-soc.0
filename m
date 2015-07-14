From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv6] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 14 Jul 2015 14:04:19 +0900
Message-ID: <06b101d0bdf2$8aad8fb0$a008af10$@kernel.org>
References: <1436833441-8405-1-git-send-email-parkch98@gmail.com>
 <55A45C63.2030907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52673 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbbGNFEW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 01:04:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NRG02A1COR87K00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jul 2015 14:04:20 +0900 (KST)
In-reply-to: <55A45C63.2030907@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Chanho Park' <parkch98@gmail.com>, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Krzysztof Kozlowski wrote:
> 
> On 14.07.2015 09:24, Chanho Park wrote:
> > The odroid-xu3 board which is based on exynos5422 not exynos5800 is
> > booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
> > is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
> > cortex-a15 cores. To correct this mis-odering, I added exynos5422-cpus.dtsi
> > and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
> > cpu4-7 are cortex-a15.
> >
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Chanho Park <parkch98@gmail.com>
> > ---
> > Change from v4:
> >  - Resend patch with correct signed-off
> >
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
> Thanks, applied to my tree. I'll send it to Kukjin for v4.3 unless he
> picks it also.
> 
Well, let me see. I'm thinking we need to sort out the cpu ordering and dtsi
inclusions for exynos5420, 5422 and 5800 related to DT files.

See, 

1) exynos5420 DT (cpu0~3: a15, cpu 4~7: a7)
2) exynos5800 DT is including exynos5420 DT
3) exynos5422 and exynos5800 based boards are including exynos5800 DT.

Then making exynos5422-cpus DT for exynos5422 based boards?
(cpu0~3: a7, cpu4~7: a15)

I think, it could cause confusion when new board based on them are added
because it's not clear and the boot cpu could be selected by bootloader part.

So how about creating exynos5422-cpus and exynos5420-cpus then including the
cpus DT file in each board accordingly?

Or more clear way to avoid confusion?

- Kukjin
