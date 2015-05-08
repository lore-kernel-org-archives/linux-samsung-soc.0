From: Kukjin Kim <kgene@kernel.org>
Subject: Re: ARM: EXYNOS: Fixes for 4.1
Date: Sat, 09 May 2015 03:26:51 +0900
Message-ID: <554CFFEB.1010703@kernel.org>
References: <1430873718-22726-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48954 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751988AbbEHS1A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 14:27:00 -0400
In-Reply-To: <1430873718-22726-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

On 05/06/15 09:55, Krzysztof Kozlowski wrote:
> Dear Kukjin,
> 
> This groups important fix for current RC cycle. The patch was present
> on mailing list for quite long. It was tested. We had some
> disagreements about the solution but during discussion better ways for
> solving the issue were not presented.
> 
> Best regards,
> Krzysztof
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b446d22:
> 
>   Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/krzk/linux.git tags/samsung-fixes-4.1
> 
> for you to fetch changes up to 23e15018316e949c534cc32e46502f3080dfc970:
> 
>   ARM: EXYNOS: Fix failed second suspend on Exynos4 (2015-05-05 19:17:58 +0900)
> 
> ----------------------------------------------------------------
> Fixes failed second suspend to RAM on Exynos4412 based Trats2 board. This has
> shown up after enabling L2 cache but actually the "use delayed reset assertion"
> feature is to be blamed.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: EXYNOS: Fix failed second suspend on Exynos4
> 
>  arch/arm/mach-exynos/common.h  |  2 ++
>  arch/arm/mach-exynos/exynos.c  | 27 +++++++++++++++++++++++++++
>  arch/arm/mach-exynos/platsmp.c | 39 ++-------------------------------------
>  arch/arm/mach-exynos/suspend.c |  3 +++
>  4 files changed, 34 insertions(+), 37 deletions(-)
> --

Hi Krzysztof,

Yeah, the patch is old thing but if I remember correctly, I couldn't
apply it because of soc_is_xxx() macro. Yes, I agree with the way,
firstly fix something and if required, then update it later....But!

Please address comments about that, if not, it will not be accepted by
arm-soc tree.

Thanks,
Kukjin
