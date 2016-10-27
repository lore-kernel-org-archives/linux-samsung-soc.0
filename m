From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: get access to DMA engine early to defer
 probe properly
Date: Thu, 27 Oct 2016 18:45:31 +0200
Message-ID: <d73fe5ed-a691-ead8-52c7-3fac510ef272@samsung.com>
References: <CGME20161027103418eucas1p1628aa0c578b8470d537abaa92c6bf10c@eucas1p1.samsung.com>
 <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29415 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753982AbcJ0Qpi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 12:45:38 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFP00KS0T7YOX10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Oct 2016 17:45:34 +0100 (BST)
In-reply-to: <1477564442-19772-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On 10/27/2016 12:34 PM, Marek Szyprowski wrote:
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

It's worth to note that the endless re-probing loop happens randomly,
not on every boot.  And the issue got uncovered by a commit which seems
to be slightly changing scheduling of work on the main probe deferral
workqueue and deferral of the amba devices [1], i.e. after this commit
all probe deferral jobs are scheduled to a single system_wq workqueue.
It seems concurrency change after the patch was significant enough
to make deferred probing of one device to starve deferred probing
of other device in that case.

[1] commit 2c507e464f791327c94d17a0137f00b4717744fc
    "device core: Remove deprecated create_singlethread_workqueue"
