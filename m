From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: exynos5422-odroidxu3: reduce total RAM by 22 MiB
Date: Fri, 23 Jan 2015 15:35:59 +0900
Message-ID: <0b5601d036d6$d9628c80$8c27a580$@kernel.org>
References: <1421842972-25807-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14896 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752027AbbAWGgD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 01:36:03 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIM001JFABZXFA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jan 2015 15:35:59 +0900 (KST)
In-reply-to: <1421842972-25807-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, 'Kevin Hilman' <khilman@linaro.org>, 'Sjoerd Simons' <sjoerd.simons@collabora.co.uk>

Marek Szyprowski wrote:
> 
> Last 22 MiB is RAM is reserved by secure monitor code and cannot be
> accessed from Linux kernel, so adjust total RAM size to 0x7EA00000
> (2 GiB - 22 MiB). This fixes random 'imprecise kernel abort' kernel
> failures.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index f6fc9442f631..50843208860d 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -18,7 +18,7 @@
>  	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
> 
>  	memory {
> -		reg = <0x40000000 0x80000000>;
> +		reg = <0x40000000 0x7EA00000>;
>  	};
> 
>  	chosen {
> --

Hi,

Maybe is it related to the SoC not only for odriodxu3 board. If so, following
would be better?

---8<------------8<---
diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index c0bb356..54840e3 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -13,6 +13,8 @@
  * published by the Free Software Foundation.
  */

+/memreserve/ 0x80000000 0x1600000;
+
 #include "exynos5420.dtsi"

 / {
---8<------------8<---

- Kukjin
