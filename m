From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 5/6] ARM: exynos: select POWER_RESET_SYSCON and
 POWER_RESET_SYSCON_POWEROFF
Date: Wed, 21 Oct 2015 09:14:02 +0900
Message-ID: <5626D8CA.7000505@samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <1445333085-22837-6-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12757 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695AbbJUAOG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 20:14:06 -0400
In-reply-to: <1445333085-22837-6-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 20.10.2015 18:24, Alim Akhtar wrote:
> Since we switch to use generic syscon regmap based reset/poweroff
> driver for exynos SoC, lets select it from ARCH_EXYNOS instead of
> enabling it from various defconfigs. This also select POWER_RESET
> as SYSCON-{reset, poweroff} drivers depends on it.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> 
> Have run make for allyes, allmod, multi_v7 and exynos defconfigs
> no error/warrning reported.
> 
>  arch/arm/mach-exynos/Kconfig |    3 +++
>  1 file changed, 3 insertions(+)

Thanks for update:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
