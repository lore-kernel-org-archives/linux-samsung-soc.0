From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: exynos5422-odroidxu3: reduce total RAM by 22 MiB
Date: Fri, 23 Jan 2015 16:50:30 +0900
Message-ID: <0dbe01d036e1$42daee50$c890caf0$@kernel.org>
References: <1421842972-25807-1-git-send-email-m.szyprowski@samsung.com>
 <0b5601d036d6$d9628c80$8c27a580$@kernel.org> <54C1F7C3.7050103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52119 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554AbbAWHud (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 02:50:33 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIM00L0TDS7NM50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jan 2015 16:50:31 +0900 (KST)
In-reply-to: <54C1F7C3.7050103@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, 'Kevin Hilman' <khilman@linaro.org>, 'Sjoerd Simons' <sjoerd.simons@collabora.co.uk>

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi,

> On 2015-01-23 07:35, Kukjin Kim wrote:
> > Marek Szyprowski wrote:
> >> Last 22 MiB is RAM is reserved by secure monitor code and cannot be
> >> accessed from Linux kernel, so adjust total RAM size to 0x7EA00000
> >> (2 GiB - 22 MiB). This fixes random 'imprecise kernel abort' kernel
> >> failures.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   arch/arm/boot/dts/exynos5422-odroidxu3.dts | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-
> odroidxu3.dts
> >> index f6fc9442f631..50843208860d 100644
> >> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> @@ -18,7 +18,7 @@
> >>   	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
> >>
> >>   	memory {
> >> -		reg = <0x40000000 0x80000000>;
> >> +		reg = <0x40000000 0x7EA00000>;
> >>   	};
> >>
> >>   	chosen {
> >> --
> > Hi,
> >
> > Maybe is it related to the SoC not only for odriodxu3 board. If so, following
> > would be better?
> >
> > ---8<------------8<---
> > diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
> > index c0bb356..54840e3 100644
> > --- a/arch/arm/boot/dts/exynos5800.dtsi
> > +++ b/arch/arm/boot/dts/exynos5800.dtsi
> > @@ -13,6 +13,8 @@
> >    * published by the Free Software Foundation.
> >    */
> >
> > +/memreserve/ 0x80000000 0x1600000;
> > +
> >   #include "exynos5420.dtsi"
> >
> >   / {
> 
> I don't think so. It is related only to the setup done by the respective
> board's bootloader,
> not the SoC itself. It is already known that exynos 5800-based
> Chromebooks uses different
> bootloader setup (BL1+BL2+Trustzone) than Odroid XU3. Also please note
> that u-boot for Odroid
> XU3 limits the total memory passed to Linux kernel to 0x7EA00000, so we
> should not confuse
> the kernel about such 'reserved' regions. The same approach is used for
> Odroid X2/U3.
> 
If the boot-loader  passes limited memory, it makes sense. Thanks for the
explanation.

Will apply.

- Kukjin
