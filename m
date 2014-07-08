From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] drivers: phy: exynos-usb2: add support for Exynos 3250
Date: Tue, 08 Jul 2014 16:32:45 +0200
Message-ID: <53BC010D.1080303@samsung.com>
References: <1404725966-12331-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17851 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbaGHOdT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:33:19 -0400
In-reply-to: <1404725966-12331-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 07.07.2014 11:39, Marek Szyprowski wrote:
> This patch adds support for Exynos3250 SoC to Exynos2USB PHY driver.
> Although Exynos3250 has only one device phy interface, the register
> layout and all operations that are required to get it enabled are almost
> same as on Exynos4x12. The only different is one more register
> (REFCLKSEL) which need to be set and lack of MODE SWITCH register.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> 
> Changelog:
> v2:
> - added new binding documentation
> - removed superfluous defines
> - removed mode switch for 3250, because it is not really needed
> 
> ---
>  Documentation/devicetree/bindings/phy/samsung-phy.txt |  2 ++
>  drivers/phy/Kconfig                                   | 12 ++++++------
>  drivers/phy/phy-exynos4x12-usb2.c                     | 17 +++++++++++++++--
>  drivers/phy/phy-samsung-usb2.c                        |  6 ++++++
>  drivers/phy/phy-samsung-usb2.h                        |  2 ++
>  5 files changed, 31 insertions(+), 8 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
