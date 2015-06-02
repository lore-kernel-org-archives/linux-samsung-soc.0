From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv3] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 02 Jun 2015 21:02:23 +0900
Message-ID: <556D9B4F.3070508@samsung.com>
References: <1433161459-10901-1-git-send-email-chanho61.park@samsung.com> <84k2vmwzxc.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:36660 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753637AbbFBMCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:02:31 -0400
Received: by pdjm12 with SMTP id m12so48604073pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 05:02:30 -0700 (PDT)
In-Reply-To: <84k2vmwzxc.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>, Chanho Park <parkch98@gmail.com>
Cc: kgene@kernel.org, jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

W dniu 02.06.2015 o 12:29, Peter Chubb pisze:
>>>>>> "Chanho" == Chanho Park <parkch98@gmail.com> writes:
> 
> Chanho> The odroid-xu3 board which is based on exynos5422 not
> Chanho> exynos5800 is booted from cortex-a7 core unlike
> Chanho> exynos5800. The odroid-xu3's cpu order is quite strange. cpu0
> Chanho> and cpu5-7 are cortex-a7 cores and cpu1-4 are cortex-a15
> Chanho> cores. To correct this mis-odering, I added exynos5422.dtsi
> Chanho> and reversing cpu orders from exynos5420. Now, cpu0-3 are
> Chanho> cortex-a7 and cpu4-7 are cortex-a15.
> 
> Does this patch make any difference?  CPUs are numbered in the kernel
> in the order they're enumerated; with this patch or using the old dts
> I see the CPUs numbered the same after boot.  And only 5 of the 8 come
> up: processor 0 is an A7; processors 1 through 4 are A15.

In my case (Odroid XU3 Lite, next-20150529) the patch makes difference.
The A7 is 0-3 and A15 is 4-7 so the patch changes the order.

Best regards,
Krzysztof
