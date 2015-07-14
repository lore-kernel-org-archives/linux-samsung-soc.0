From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv6] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 14 Jul 2015 09:48:35 +0900
Message-ID: <55A45C63.2030907@samsung.com>
References: <1436833441-8405-1-git-send-email-parkch98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57405 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbbGNAsi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 20:48:38 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRG00G4GCX0A180@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jul 2015 01:48:36 +0100 (BST)
In-reply-to: <1436833441-8405-1-git-send-email-parkch98@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 14.07.2015 09:24, Chanho Park wrote:
> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
> cortex-a15 cores. To correct this mis-odering, I added exynos5422-cpus.dtsi
> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
> cpu4-7 are cortex-a15.
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanho Park <parkch98@gmail.com>
> ---
> Change from v4:
>  - Resend patch with correct signed-off
> 
> Changes from v4:
>  - Remove temporal patch in e-mail body
> 
> Changes from v3:
>  - include this exynos5422-cpus.dtsi in the exynos5422-odroidxu3-common.dtsi
> 
> Changes from v2:
>  - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
>  - drop compatibles from exynos5422-cpus.dtsi
> 
> Changes from v1:
>  - rename exynos5422.dtsi to exynos5422-cpus.dtsi
>  - include the dtsi file top of the exynos5422-odroidxu3.dts
> 
> Secondary cpu booting problem[1] is not resolved yet. Need more investigations
> to work booting 8 cores correctly.
> 
> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg45525.html
> 
>  arch/arm/boot/dts/exynos5422-cpus.dtsi             | 81 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi

Thanks, applied to my tree. I'll send it to Kukjin for v4.3 unless he
picks it also.

Best regards,
Krzysztof
