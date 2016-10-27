From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ASoC: samsung: get access to DMA engine early to defer
 probe properly
Date: Thu, 27 Oct 2016 12:32:06 -0300
Message-ID: <31e42653-e620-5939-7708-8fee568d2e18@osg.samsung.com>
References: <CGME20161027103418eucas1p1628aa0c578b8470d537abaa92c6bf10c@eucas1p1.samsung.com>
 <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:49181
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936537AbcJ0PcS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 11:32:18 -0400
In-Reply-To: <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hello Marek,

On 10/27/2016 07:34 AM, Marek Szyprowski wrote:
> ASoC Samsung sub-drivers tried to get access to their DMA engine
> controllers as a last step in driver probe. If a DMA engine was not
> available yet, samsung_asoc_dma_platform_register() function ended in
> -EPROBE_DEFER, but the driver already registered its component to ASoC
> core. This patch moves samsung_asoc_dma_platform_register() call before
> registering any components, to the common place, where driver was gathering
> all needed resources.
> 
> In case of Samsung Exynos i2s driver the issue was even worse. The driver
> managed already to register its secondary DAI platform device before
> even getting the DMA engine access. That together with -EPROBE_DEFER error
> code from samsung_i2s_probe() immediately triggered another round of
> deferred probe retry and in turn endless loop of driver probing.
> 
> This patch fixes broken boot on Odroid XU3 and other Exynos5422-based
> boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Thanks for fixing this, the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

I've tested this patch and fixes the probe deferral storm that I was
seeing on an Exynos5800 Peach Pi Chromebook:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

I think this patch should be v4.9-rc material, since the issue prevents
some machines to boot correctly on v4.9-rc:

http://arm-soc.lixom.net/bootlogs/mainline/v4.8-14644-ge9f8f48/pi-arm-exynos_defconfig.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
