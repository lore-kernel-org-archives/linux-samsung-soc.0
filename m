From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/1] irqchip: exynos-combiner: Save IRQ enable set on
 suspend
Date: Fri, 12 Jun 2015 14:57:01 +0900
Message-ID: <557A74AD.6040305@samsung.com>
References: <1434087795-13990-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52793 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbbFLF5B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 01:57:01 -0400
In-reply-to: <1434087795-13990-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Peter Chubb <peter.chubb@nicta.com.au>, Shuah Khan <shuahkhan@gmail.com>, Chanho Park <parkch98@gmail.com>

On 12.06.2015 14:43, Javier Martinez Canillas wrote:
> The Exynos interrupt combiner IP loses its state when the SoC enters
> into a low power state during a Suspend-to-RAM. This means that if a
> IRQ is used as a source, the interrupts for the devices are disabled
> when the system is resumed from a sleep state so are not triggered.
> 
> Save the interrupt enable set register for each combiner group and
> restore it after resume to make sure that the interrupts are enabled.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
> 
> Hello,
> 
> I noticed this issue because after a S2R, IRQs for some devices didn't
> trigger anymore but others continued working and all of them had lines
> from a GPIO chip as their interrupt source.
> 
> The only difference was that the GPIO pins that were not working after
> a resume, were the ones that had the interrupt combiner as interrupt
> parent.
> 
> With this patch now all perhiperals are working correctly after a resume.
> Tested on an Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800 Peach Pi
> Chromebooks.
> 
> Best regards,
> Javier
> 
> Changes since v1:
>  - Clear masking bits before of the COMBINER_ENABLE_CLEAR register before
>    restore IRQ enable set the Suggested by Chanho Park.
>  - Fixes a typo in the commit message. Suggested by Peter Chubb.

Looks okay,
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
