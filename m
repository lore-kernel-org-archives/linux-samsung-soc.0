From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 1/5] Samsung non-critical-fixes for v4.3
Date: Mon, 10 Aug 2015 09:41:04 +0900
Message-ID: <03ce01d0d305$3ceaea70$b6c0bf50$@kernel.org>
References: <55C06995.2030600@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60101 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640AbbHJAlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Aug 2015 20:41:15 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSU0171NCKGXSA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Aug 2015 09:41:04 +0900 (KST)
In-reply-to: <55C06995.2030600@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

Kukjin Kim wrote:
> 
> Hi Arnd, Olof, Kevin,
> 
> Here is Samsung non-critical-fixes for v4.3.
> Please pull.
> 
> Thanks,
> Kukjin
> 
Hi arm-soc maintainers,

Is there any problem on this series?
If not, please pull ;-)

Thanks,
Kukjin

> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> 
>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-non-critical-1
> 
> for you to fetch changes up to 2cc6b813579415c4f627b08a043079bdc5b87a33:
> 
>   ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem (2015-07-21
> 13:19:06 +0900)
> 
> ----------------------------------------------------------------
> Samsung non-critical fixes for v4.3
> 
> - fix sparse warning for returning iomem
> - fix clock-frequency of display timing0 for exynos3250-rinato
> 
> ----------------------------------------------------------------
> Hyungwon Hwang (1):
>       ARM: dts: fix clock-frequency of display timing0 for exynos3250-rinato
> 
> Krzysztof Kozlowski (1):
>       ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem
> 
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
>  arch/arm/mach-exynos/platsmp.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
