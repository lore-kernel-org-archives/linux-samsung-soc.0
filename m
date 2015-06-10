From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2] ARM: exynos_defconfig: Enable CONFIG_SND_SOC_ODROIDX2
 for Odroid-XU3
Date: Wed, 10 Jun 2015 14:27:24 +0900
Message-ID: <5577CABC.9000609@samsung.com>
References: <1433822879-3908-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15334 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222AbbFJF11 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 01:27:27 -0400
In-reply-to: <1433822879-3908-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 09.06.2015 13:07, Anand Moon wrote:
> Enable CONFIG_SND_SOC_ODROIDX2 and CONFIG_SND_SIMPLE_CARD to enable
> sound on Odroid-XU3 board using the max98090 audio codec.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
> Changes v2: Fixed the commit log.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Thanks, applied.

I'll send later to Kukjin for 4.3.
Unless he picks it also, in that case:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
