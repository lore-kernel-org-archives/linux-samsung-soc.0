From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 0/8] Add support for Exynos SROM Controller driver
Date: Wed, 21 Oct 2015 09:34:34 +0900
Message-ID: <5626DD9A.9030603@samsung.com>
References: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62446 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751578AbbJUAej (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 20:34:39 -0400
In-reply-to: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, andi.shyti@samsung.com

On 20.10.2015 18:15, Pankaj Dubey wrote:
> This patch set adds support for Exynos SROM controller DT based driver.
> Currently SROM register sets are used only during S2R, so driver
> basically added for taking care of S2R. It will help us in removing
> static mapping from exynos.c and other extra code handline during S2R.
> 
> This patch set also updated exynos4 and exynos5 dtsi files for with device
> node for srom, and added binding documentation for the same.
> 
> First two patches are some minor cleanup in mach-exynos.
> 
> Patchset v1 was posted here[1]
> [1]: https://lkml.org/lkml/2015/4/29/98
> Patchset v2 was posted here[2]
> [2]: https://lkml.org/lkml/2015/8/24/125
> Patchset v3 was posted here[3]
> [3]: https://lkml.org/lkml/2015/10/13/392
> Patchset v3 was posted here[4]
> [4]: https://lkml.org/lkml/2015/10/19/278
> 
> This patchset, I have tested on Peach-Pi (Exynos5880) based chromebook for boot
> and S2R functionality.
> 

Entire patchset tested on Trats2 (Exynos4412) board. Unless Kukjin picks
it also, I plan to take it for v4.5.

Best regards,
Krzysztof
