Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F07C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 12:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbiKKMkn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 07:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbiKKMkm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 07:40:42 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCD67BE43
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:40:41 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id g24so4171996plq.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+pSb3nKIXHaiftR3v+Evz/+SDGPAA0OKtaaUaJuams=;
        b=Sjp+mfbMzTuBd24OSiZRNL5zBW3SR3VhtM052t7yx/J6peolwpXst7LHpoNhlP9dD8
         9mseGD3RSu7bRw7aHIcBd1wSnaU5o6nLd7pEv3S+kb9HP0IcUDkg2hUASCyg+4M+IOyE
         08L8NwAfmRui4CAQhMSxF+aTuV/l8wcqkMXVYZbjWVQYWPDnBNNNiJEr6Kxm8PeX1vgH
         FLI4W3mxjcPdLzWn3o6pv0if/c7n2L6SagBoUnKYUCGKsYHLGdAYMDvhe06ghDz5HLG8
         PfvCLm5t2xvoWdnWkk5Pt1zDQKOuBgzys4CtR9MMJ7PJFtqbRtt4/W5uBhyl6vpt7Kjf
         3lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+pSb3nKIXHaiftR3v+Evz/+SDGPAA0OKtaaUaJuams=;
        b=lrzMalFluLenWdY0b7jaa9xhUDlIs9OzpeSU2Zzj951m0Lgrz/iHhgmy7/X2j2MeOH
         5ZTAKApV192CVe4yy/+O4dyzog9b1pT7rG0WnIiAzmbtVGJTqXe/r6kabwZ+GI+F6Omy
         2MjietAXJSPK3a0J+5WJo1v5+AXxng+/xYCp97X3JGJ9fxUyQW6vAi23br21Uf0puVW4
         KR9xyIhlRvww9duWU5Iv0H4pvqef8eOD00tRwTNd6UxfUFwAmJs4hSYdsDQ5BuBbAFnd
         VwykMZWy7vT5q+AKyhC2MaY/xHIB6OoTjh7qALR/m5AUbBEA5Q+slONqSlBPUBPqe2SY
         o0Jw==
X-Gm-Message-State: ANoB5pmH10WPbx6c225x2TDT0sOPBl1gP+v0JqIv2y8kOLel0Jd2VA8f
        TUaC5tKZSJznRLrthEFGDNjmKShjxc0CbFYQG+hSUg==
X-Google-Smtp-Source: AA0mqf4ti3oIKNWdDvRGk3CYFGxw+N1DPpSsx+LEvKJ59w+/d/YXkMZ5jOTCwUxB+wZd+6Fsj3xULFkVVj/qRccDZtQ=
X-Received: by 2002:a17:90a:f18f:b0:218:8f4:bad5 with SMTP id
 bv15-20020a17090af18f00b0021808f4bad5mr1786731pjb.55.1668170440958; Fri, 11
 Nov 2022 04:40:40 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221110154141eucas1p1e69a91704c32c07307a9c73b95e0d9a3@eucas1p1.samsung.com>
 <20221110154131.2577-1-m.szyprowski@samsung.com>
In-Reply-To: <20221110154131.2577-1-m.szyprowski@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Nov 2022 13:40:29 +0100
Message-ID: <CAPLW+4mpZWJHg6qQi1SOAwB-KRrzQo1sOnY4ku5FV3zgVAqNYw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: exynos: Fix remove() function
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Nov 2022 at 16:41, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> The core DWC3 device node was not properly removed by the custom
> dwc3_exynos_remove_child() function. Replace it with generic
> of_platform_depopulate() which does that job right.
>
> Fixes: adcf20dcd262 ("usb: dwc3: exynos: Use of_platform API to create dwc3 core pdev")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/usb/dwc3/dwc3-exynos.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index 0ecf20eeceee..4be6a873bd07 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -37,15 +37,6 @@ struct dwc3_exynos {
>         struct regulator        *vdd10;
>  };
>
> -static int dwc3_exynos_remove_child(struct device *dev, void *unused)
> -{
> -       struct platform_device *pdev = to_platform_device(dev);
> -
> -       platform_device_unregister(pdev);
> -
> -       return 0;
> -}
> -
>  static int dwc3_exynos_probe(struct platform_device *pdev)
>  {
>         struct dwc3_exynos      *exynos;
> @@ -142,7 +133,7 @@ static int dwc3_exynos_remove(struct platform_device *pdev)
>         struct dwc3_exynos      *exynos = platform_get_drvdata(pdev);
>         int i;
>
> -       device_for_each_child(&pdev->dev, NULL, dwc3_exynos_remove_child);
> +       of_platform_depopulate(&pdev->dev);
>
>         for (i = exynos->num_clks - 1; i >= 0; i--)
>                 clk_disable_unprepare(exynos->clks[i]);
> --
> 2.17.1
>
