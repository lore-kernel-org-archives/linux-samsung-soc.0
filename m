From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add dts file for odroid XU3 board
Date: Wed, 3 Dec 2014 12:24:07 -0800
Message-ID: <CANMBJr4B-c-eMCvwexW5_WhfK=xsJ0-Cjo_OApTpUXP3zBG-kw@mail.gmail.com>
References: <1417438770-28696-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35323 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751275AbaLCUYJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 15:24:09 -0500
Received: by mail-wi0-f176.google.com with SMTP id ex7so32584563wid.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2014 12:24:07 -0800 (PST)
In-Reply-To: <1417438770-28696-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 1 December 2014 at 04:59, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> Add DTS for the Hardkernel Odroid XU3. The name of the DTS file is kept the
> same as the vendors naming, which means it's prefixed with exynos5422
> instead of exynos5800 as the SoC name even though it includes the
> exyno5800 dtsi.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Tested-by: Tyler Baker <tyler.baker@linaro.org>

Tested this atop of next-20141203 both on exynos_defconfig and
multi_v7_defconfig. All configurations boot fine on my odroid-xu3
board, no imprecise aborts observed either.

Thanks!

Tyler
