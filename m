From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/4] Add more supported blocks to UniversalC210 and Trats
Date: Wed, 21 May 2014 00:49:25 +0200
Message-ID: <537BDBF5.3040304@gmail.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:45587 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbaETWtd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 18:49:33 -0400
Received: by mail-ee0-f41.google.com with SMTP id t10so1003582eei.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 May 2014 15:49:32 -0700 (PDT)
In-Reply-To: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

On 20.05.2014 14:46, Marek Szyprowski wrote:
> Hello,
> 
> This is a small update for Exynos4210 based UniversalC210 and Trats
> boards. Full USB support requires merging '[PATCHv5 0/4] Enable usbphy
> and hsotg for exynos4' series recently posted by Chanho Park.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Marek Szyprowski (3):
>   ARM: dts: exynos4210-universal_c210: enable USB functionality
>   ARM: dts: exynos4210-universal_c210: add multimedia nodes
>   ARM: dts: exynos4210-universal_c210: add external sd card node
> 
> Tomasz Figa (1):
>   ARM: dts: exynos4210-trats: Enable USB gadget functionality
> 
>  arch/arm/boot/dts/exynos4210-trats.dts          | 10 +++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 53 +++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 

For the whole series, after addressing comments for patch 2/4:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
