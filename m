From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] ARM: multi_v7_defconfig: Enable NTC Thermistors support
Date: Thu, 16 Jul 2015 09:48:15 +0900
Message-ID: <55A6FF4F.4080002@samsung.com>
References: <1436977965-7078-1-git-send-email-javier@osg.samsung.com>
 <1436977965-7078-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34288 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbGPAsQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jul 2015 20:48:16 -0400
In-reply-to: <1436977965-7078-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 16.07.2015 01:32, Javier Martinez Canillas wrote:
> The Exynos5420 Peach Pit and Exynos5800 Peach Pi Chromebooks have
> IIO based ADC thermistors. Enable module support for its driver
> and also for the needed Exynos ADC driver.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
