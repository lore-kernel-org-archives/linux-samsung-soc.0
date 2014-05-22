From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/4] Add more supported blocks to UniversalC210 and
 Trats
Date: Fri, 23 May 2014 03:32:19 +0900
Message-ID: <537E42B3.5080608@samsung.com>
References: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34489 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbaEVScY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:32:24 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so2843844pab.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 11:32:23 -0700 (PDT)
In-Reply-To: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 05/22/14 14:52, Marek Szyprowski wrote:
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
> Changelog:
> v2:
> - added port sub-nodes to ehci and ohci modules as requested by Tomasz Figa
>
> v1:
> - initial version
>
> Marek Szyprowski (3):
>    ARM: dts: exynos4210-universal_c210: enable USB functionality
>    ARM: dts: exynos4210-universal_c210: add multimedia nodes
>    ARM: dts: exynos4210-universal_c210: add external sd card node
>
> Tomasz Figa (1):
>    ARM: dts: exynos4210-trats: Enable USB gadget functionality
>
>   arch/arm/boot/dts/exynos4210-trats.dts          | 10 +++++
>   arch/arm/boot/dts/exynos4210-universal_c210.dts | 59 +++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
>
Applied, thanks.

- Kukjin
