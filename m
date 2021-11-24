Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993A9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Nov 2021 19:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbhKXT2s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Nov 2021 14:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbhKXT2p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 14:28:45 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B83C06173E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Nov 2021 11:25:35 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so10143509lfb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Nov 2021 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KeS8gzA/xfPhh34ugNpumxJ4yVD03DKGSAXtYcv0CNY=;
        b=SAc/SLcjr/Co2yuN16R4GlaVzZSj3SGoLB+z8GEtc5h3aU8zidJIe+uJIfa5Bt3D1m
         nuadLC4dAavDlWMr1PeQuweQd+2WdTckNNsIconSEReAJErSpN6N4gfv9qVsidgXYX4W
         DgLzz9OtmsjjUCln49Mp1puk5J/PS0oP5pNQGW6/PODbWKgIQA2683kIWTMVDF2u1GaU
         zUk/hBrZv/Y5JYpAKGEZV59d7yKkGNXiC8ECZpl5WSyDCfVqbJatNNvZekBqH872CrLv
         DnkBT6Ag/Y+r1nbhQmm3dynY5ZAPZOqTB78XiVuqR4zUUwyampX0urGluugIt56Dj2tu
         WlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KeS8gzA/xfPhh34ugNpumxJ4yVD03DKGSAXtYcv0CNY=;
        b=Grb28hnUytzaf7YIYjrfvh5nvglfm9+G2L0qE+iEXIwK8/A4hkmk0mCne3+6JO/fBQ
         MMtqixKQ7cOAVSyR5xrrks8MGVeiOuTSaHVKlJGZnpRs5HuRO4I1Z0lfrUBPa7GZTjkE
         CRa3JKLlm4NsQ5pFYiGZpwnEoVT4JOsaq0iaLIySBuc2XdLVrWsbeP1zQhH6Rya6LC1S
         P4jPirWIVcC1cmAgLVc3jA+I7CBppn8CILoFPyEqKx1ArJ7ZhXI0UXwX2QxezgX3IMti
         obRoCrjh2Mq99TwP7vNVAW+bw2wCWORHP9E8J/EMTOB75+ohbRfUFh1beKXEyu6c//C8
         +qag==
X-Gm-Message-State: AOAM530ld8AZd10aJJlVNyW+RzCC+DmTZoMo5o5s3vJyXXgi9nB2as4o
        Y3x6ABg7PtOkIi9pr8rOJKSDj2kc9/zgxZRt6voGaw==
X-Google-Smtp-Source: ABdhPJzSEYCURJSiTw//vdik61HAkzTY0+VAOHaDC/VmX4bo1DEpc6xicGzGrpeh42Ukrn7jGcsGzS4EiBrSWD3re9Y=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr18103844lfn.358.1637781932136;
 Wed, 24 Nov 2021 11:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20211124184603.3897245-1-john@metanate.com>
In-Reply-To: <20211124184603.3897245-1-john@metanate.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Nov 2021 20:24:56 +0100
Message-ID: <CAPDyKFr=ok3uKXS8bWtZPvyLOeA2cF_4Z2c7ROcoMfBF2G1uhA@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: dw_mmc: start deprecating mshcN aliases
To:     John Keeping <john@metanate.com>
Cc:     linux-mmc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 24 Nov 2021 at 19:46, John Keeping <john@metanate.com> wrote:
>
> This series is prompted by discussion on a previous patch set [1] but is
> a totally different approach and only a partial solution.
>
> With these patches, the dependency on the mshcN alias is totally removed
> from dw_mmc-hi3798cv200 and dw_mmc-rockchip and dw_mmc-exynos moves
> towards being able to consider the mshcN aliases deprecated.
>
> I haven't changed dw_mci_hi6220_caps here, although it looks like it's
> possible to apply MMC_CAP_CMD23 to all controllers there with no change
> in behaviour as the final entry is SDIO for which CMD23 is not
> applicable IIUC.  But I'm not familiar with that hardware and don't feel
> confident making that change.
>
> [1] https://lore.kernel.org/all/20211116190244.1417591-1-john@metanate.com/
>
> John Keeping (4):
>   mmc: dw_mmc: add common capabilities to replace caps
>   mmc: dw_mmc: hi3798cv200: use common_caps
>   mmc: dw_mmc: rockchip: use common_caps
>   mmc: dw_mmc: exynos: use common_caps
>
>  drivers/mmc/host/dw_mmc-exynos.c      |  9 +++++----
>  drivers/mmc/host/dw_mmc-hi3798cv200.c |  9 +--------
>  drivers/mmc/host/dw_mmc-rockchip.c    | 11 +----------
>  drivers/mmc/host/dw_mmc.c             |  3 +++
>  drivers/mmc/host/dw_mmc.h             |  3 +++
>  5 files changed, 13 insertions(+), 22 deletions(-)
>
> --
> 2.34.0
>

This looks good to me, I intend to apply this later this week, unless
objections of course.

In the meantime, I will continue to look at what we can do to resolve
the exynos/k3 issues around this.

Kind regards
Uffe
