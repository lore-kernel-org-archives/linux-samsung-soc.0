From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 08/15] mfd: exynos: use devm_of_platform_populate()
Date: Tue, 30 May 2017 10:31:24 +0100
Message-ID: <20170530093124.7rpqudcqw4tfclsp@dell>
References: <1496072763-31209-1-git-send-email-benjamin.gaignard@linaro.org>
 <1496072763-31209-9-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36210 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751672AbdE3Jb2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2017 05:31:28 -0400
Received: by mail-wm0-f42.google.com with SMTP id 7so84038647wmo.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2017 02:31:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1496072763-31209-9-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 29 May 2017, Benjamin Gaignard wrote:

> Use devm_of_platform_populate() to be sure that of_platform_depopulate
> is called when removing the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> 
> CC: Lee Jones <lee.jones@linaro.org>
> CC: Kukjin Kim <kgene@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> CC: Javier Martinez Canillas <javier@osg.samsung.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/mfd/exynos-lpass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
> index 0bf3aeb..ca829f8 100644
> --- a/drivers/mfd/exynos-lpass.c
> +++ b/drivers/mfd/exynos-lpass.c
> @@ -138,7 +138,7 @@ static int exynos_lpass_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	exynos_lpass_enable(lpass);
>  
> -	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	return devm_of_platform_populate(dev);
>  }
>  
>  static int exynos_lpass_remove(struct platform_device *pdev)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
