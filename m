From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Tue, 29 Mar 2016 19:06:23 +0900
Message-ID: <56FA539F.1000208@samsung.com>
References: <cover.1459167385.git.bugs.a.b@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43820 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756714AbcC2KGa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Mar 2016 06:06:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4S003SOPERK580@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Mar 2016 11:06:27 +0100 (BST)
In-reply-to: <cover.1459167385.git.bugs.a.b@free.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Adel Belhouane <bugs.a.b@free.fr>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On 28.03.2016 23:08, Adel Belhouane wrote:
> On ODROID XU3, after having all the Exynos5422 cores detected as
> started in HYP mode with a patch[1], KVM still won't work because it
> needs the Generic Timer Architecture. It's defined in other exynos5
> models (5250, 5440) DTs,  but not the 542x/5800, so I just added it.
> 
> Actually this timer was defined in ODROID Hardkernel's repository [2],
> so I took its clock-frequency value too (which isn't provided by
> firmware/U-Boot).
> 
> KVM now works on ODROID XU3 with kernel v4.5 plus these changes.
> 
> regards,
> Adel Belhouane.
> 
> [1] from Brian Kim:
> https://gist.github.com/bkrepo/6f4eea33be133ad306e3
> 
> [2]
> https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/boot/dts/exynos5422-odroidxu3.dts

Please look at this thread:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/359806.html

Unfortunately I do not have any more details about this.

Best regards,
Krzysztof
