From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 0/4] ARM: multi_v7_defconfig: Stuff for Exynos
Date: Fri, 15 May 2015 16:12:20 +0200
Message-ID: <5555FEC4.6050204@collabora.co.uk>
References: <1431694142-32141-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48395 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423113AbbEOOMZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 10:12:25 -0400
In-Reply-To: <1431694142-32141-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/15/2015 02:48 PM, Krzysztof Kozlowski wrote:
> Dear Kukjin,
> 
> The patchset enables various config options on multi_v7 config
> for Exynos boards. The first two patches are actually resend.
> 
> Arnd suggested [0] that this can go through your tree.
> 
> Patchset is rebased on next-20150515 and Javier's patchset [1]
> (to avoid conflicts around regulators and clocks).
> 
> Please let me know if this should be rebased on other commit.
> 
> [0] http://www.spinics.net/lists/kernel/msg1991518.html
> [1] http://www.spinics.net/lists/kernel/msg1990767.html
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (4):
>   ARM: multi_v7_defconfig: Enable CPU idle for Exynos
>   ARM: multi_v7_defconfig: Enable PMIC and MUIC drivers for Exynos
>     boards
>   ARM: multi_v7_defconfig: Enable TMU for Exynos
>   ARM: multi_v7_defconfig: Enable OHCI on Exynos
> 
>  arch/arm/configs/multi_v7_defconfig | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

On a first look, I agree with all the Kconfig symbols but I noticed that
you are adding them to be built-in while the current policy for multi_v7
is to build as much as possible as a module.

Could you please add as =m for all the tristate symbols that can be build
as a module?

Best regards,
Javier
