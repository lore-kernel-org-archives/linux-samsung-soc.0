From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] fbdev: s6e8ax0: avoid unused function warnings
Date: Tue, 26 Jan 2016 09:46:26 +0900
Message-ID: <56A6C1E2.7060804@samsung.com>
References: <1453734300-1958304-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36709 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755882AbcAZAqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2016 19:46:30 -0500
In-reply-to: <1453734300-1958304-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kukjin Kim <kgene@kernel.org>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 26.01.2016 00:04, Arnd Bergmann wrote:
> The s6e8ax0 suspend/resume functions are hidden inside of an #ifdef
> when CONFIG_PM is set to avoid unused function warnings, but they
> call some other functions that nothing else calls, and we get warnings
> about those:
> 
> drivers/video/fbdev/exynos/s6e8ax0.c:449:13: error: 's6e8ax0_sleep_in' defined but not used [-Werror=unused-function]
> drivers/video/fbdev/exynos/s6e8ax0.c:485:13: error: 's6e8ax0_display_off' defined but not used [-Werror=unused-function]
> 
> This marks the PM functions as __maybe_unused so the compiler can
> silently drop them when they are not referenced.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/video/fbdev/exynos/s6e8ax0.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
