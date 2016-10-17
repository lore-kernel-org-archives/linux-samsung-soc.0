From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable exynos-gsc driver as
 module
Date: Mon, 17 Oct 2016 19:46:09 +0300
Message-ID: <20161017164609.GB15435@kozik-lap>
References: <1475677469-1524-1-git-send-email-javier@osg.samsung.com>
 <1475677469-1524-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36751 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030203AbcJQQrH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 12:47:07 -0400
Content-Disposition: inline
In-Reply-To: <1475677469-1524-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 05, 2016 at 11:24:29AM -0300, Javier Martinez Canillas wrote:
> Exynos5 SoCs have a General SCALER (GSCALER) IP block that can be used
> to do video streams scaling and color space conversions by hardware.
> Enable support for its driver as a module so the GSCALER can be tested.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)



Thanks, applied.

Best regards,
Krzysztof
