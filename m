Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F4AC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 07:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A9F420720
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 07:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcKWsYuJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGGHQD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 03:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGHQC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 03:16:02 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A73CC08C5DF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 00:16:02 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id u6so10141392uau.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wULRYb8hTQ3DSK0waXDTahHo3SLIrsIw0jdCnMxAKcA=;
        b=wcKWsYuJHcCaZBBYXq+uak+cU00WVu2UgYkovzrsp2rvH7fV8jVNnFn0xBKxwAF2Ae
         uWdnbQRiEK6JyTL9+FutmmrqTR3CC+lasw9LeA6aw0fQQSzkQYqjEbzn6cJbo7ptrWdQ
         xGTIzf4ImUSRJoQMT+3OMQTx5AVpNVC3uq6QieRnLDtFAvv6iql5C1xW3TRRE9H5zW/1
         TLCi3BH+Aafjz00IRsYJlvW5DyHGtm5u8uX9WfwWO32F8TishTYObMok5gWvtCg2XBjD
         eVLL9QOY7EwPrs099vYX04X/yY7hsRooQcG8m+svdn/kyzzQ4IFCc/ThOlUtXtLlZUOu
         8IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wULRYb8hTQ3DSK0waXDTahHo3SLIrsIw0jdCnMxAKcA=;
        b=NJerXIQZc/dyTgbTMghaNXT3mQkuxD9NL8d67R5F1tjFffC4giLHoTYjOFAbgzpjVj
         /9BKCdOH2jeQk2Qn+1ylB2JCT4tiIg70wdUgKb1fwGHQRRcJgjUdUoIekj6dyob93ux0
         GzFouY6WoVYjvAHILukLgk9N6w2gjzMN3PGfUpUyWG6L8LnI84Lx4j/sw8m3RNWTY33A
         VI/w1/iySTqnepcWaudhD/GhxM1xAWcnrMAwD1GaNBahRlKKQobsw54AYf1xhdJooRAE
         M0kSI0hnALeeUE2+WPzHvdFooPwMtACF2Q4HnJGaiL0iD01/H32GTmnYg/JANB54KpyH
         Ev7Q==
X-Gm-Message-State: AOAM532iWsvGctmejeyHNUuGZiBMLBXFuG6Dv89u3PyWgC2xijNvOmP0
        eNtsx1IXsK8/gH0XUN0u4PHmpcRb3SPN1sq1UZJzrQ==
X-Google-Smtp-Source: ABdhPJwMwTl3YpAgByVRV5/0CyJMIT9UexQ3ZB6gZc+BkUJfj4jbLurrY4uFc+j16UQ+IYEihjoOLDUK2mNhKiKB2zQ=
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr36772869uan.19.1594106161737;
 Tue, 07 Jul 2020 00:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200706163031.503431-1-colin.king@canonical.com>
In-Reply-To: <20200706163031.503431-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jul 2020 09:15:25 +0200
Message-ID: <CAPDyKFqtcw+zccgR4LOPqYAs3dQ02Hu7SmpNq7aNgOs23dzJ5g@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc-exynos: remove redundant initialization of
 variable 'found'
To:     Colin King <colin.king@canonical.com>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Jul 2020 at 18:30, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable 'found' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
> index 5e3d95b63676..99b900008a03 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -472,7 +472,7 @@ static int dw_mci_exynos_execute_tuning(struct dw_mci_slot *slot, u32 opcode)
>         struct dw_mci_exynos_priv_data *priv = host->priv;
>         struct mmc_host *mmc = slot->mmc;
>         u8 start_smpl, smpl, candiates = 0;
> -       s8 found = -1;
> +       s8 found;
>         int ret = 0;
>
>         start_smpl = dw_mci_exynos_get_clksmpl(host);
> --
> 2.27.0
>
