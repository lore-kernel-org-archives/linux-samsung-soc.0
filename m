From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 0/4] Exynos SROMc configuration and Ethernet support for
 SMDK5410
Date: Wed, 28 Oct 2015 10:52:58 +0900
Message-ID: <56302A7A.1070105@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61778 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755159AbbJ1BxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 21:53:10 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWW000NJQKKDW00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 01:53:08 +0000 (GMT)
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>

On 27.10.2015 17:43, Pavel Fedin wrote:
> This patch extends Exynos SROM controller driver with ability to configure
> controller outputs and enables SMSC9115 Ethernet chip on SMDK5410 board,
> which is connected via SROMc bank #3.
> 
> With this patchset, support for the whole existing SMDK range can be added.
> Actually, only bank number is different.
> 
> This patchset also depends on Exynos 5410 pinctrl support, introduced by
> patches 0003 and 0004 from this set:
> [PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html
> 
> Pinctrl support is necessary in order to correctly configure
> multifunctional pins of the Exynos chip.
> 
> v1 => v2:
> - Fixed some typos and bad labels in device tree
> - Improved documentation
> 
> Pavel Fedin (4):
>   ARM: dts: Add SROMc to Exynos 5410
>   drivers: exynos-srom: Add support for bank configuration
>   ARM: dts: Add Ethernet chip to SMDK5410
>   Documentation: dt-bindings: Describe SROMc configuration
> 

The bindings documentation goes first.

Best regards,
Krzysztof
