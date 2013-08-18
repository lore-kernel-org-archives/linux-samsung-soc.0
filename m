From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 0/4] DT/ARCH updates for MFC
Date: Mon, 19 Aug 2013 04:47:48 +0900
Message-ID: <521124E4.6090100@samsung.com>
References: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:63578 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495Ab3HRTrv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 15:47:51 -0400
In-Reply-To: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org

On 08/14/13 20:41, Arun Kumar K wrote:
> The patch series updates the DT nodes of MFC in Exynos4,
> Exynos 5250 and creates node in 5420.
> The memory reservation patch for MFC v7 firmware is omitted
> in this series as its no longer needed after the new CMA DT
> framework by Marek Szyprowski.
>
> Changes from v2:
> - Removed register and interrupt properties from common
> exynos5.dtsi file as per Kukjin Kim's suggestion.
> - Dropped v7 memory reservation patch
>
> Changes from v1:
> - Made status disabled in dtsi and enable in dts
> as suggested by Sachin Kamat.
> - Moved common properties to exynos5.dtsi as
> suggested by Chander.
> - Updated binding documentation for special clk removal
> - Updated exynos4 dtsi
>
> Arun Kumar K (4):
>    ARM: dts: Update clocks entry in MFC binding documentation
>    ARM: dts: Remove unsused MFC clock from exynos4
>    ARM: dts: Update 5250 MFC node
>    ARM: dts: Add MFC node for exynos 5420
>
>   .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++-----
>   arch/arm/boot/dts/exynos4.dtsi                     |    4 ++--
>   arch/arm/boot/dts/exynos5250.dtsi                  |    2 ++
>   arch/arm/boot/dts/exynos5420.dtsi                  |    8 ++++++++
>   4 files changed, 17 insertions(+), 7 deletions(-)
>

Applied this whole series, thanks.

Kukjin
