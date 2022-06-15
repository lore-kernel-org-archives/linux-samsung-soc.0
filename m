Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EB3CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Jun 2022 17:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347617AbiFOReC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Jun 2022 13:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357937AbiFORdm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 13:33:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E3352510
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s6so19953856lfo.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rEBSyXeCbmBUBcCDVrlaJF/sb3hQ6cDD+mTYpXhaT5Y=;
        b=NHk1jGKwkU2BrG33SfVEnhC0RF9ehEMIxRspkW9YY0bIyXGTIr7Wd9t+5XEZncbb2w
         Po2euByjQ9qiAh3cOvXZ68Z2NYJEsgK/cqwcuqgjLpcaF/M4EI7uKed+Qz2XwjSRWnK5
         A7FAIGoMw8pseVV+w6+VmsmAGl/+hCeCipcX0MSWeWCHimBHaA70MKvO04pr5zfmw5HG
         +3wlOonEgbO/H9EimUhVVT1Ihcd822/7PbCDjOxC7tsls2izvotRwFP2A51p90v/77Rz
         xV99fIS+FSqF5r0jujwn2gdxaaprTDad65FSN63dEagRi1nTFBBt/2vscajcg9aZv8u4
         CHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rEBSyXeCbmBUBcCDVrlaJF/sb3hQ6cDD+mTYpXhaT5Y=;
        b=pHTzB/HBJNylXkLFJGgQW1VeBPv68N5dYQRe4aT5eF2lCLj7ioI7BLbI4kLLWXnWHj
         uB3SkBEes+7MUh+E17E1Nfv2A9+zRbkUBdnQeTfJJqqO+TRBOpLNd9nVD/KJKv7IbWMM
         jKUJLcE7bAccuGzjPab2n8B/NPC3hfNeSovFhS0eAqHnctkc9Gh6GfCM9EPWquyjSeTc
         oQQ447FJeyttYinXhpwLa+rbPVs0WmXJpbSbDC0DM0tGAs04bwLJdg2SEQFXCyBzhjay
         iomP5O9XkcWfyLQZNFlj0xd5Iw8fUSDVBe/8KHcbOXR76JmqXC4oLFcS/eP6oZBiUL+G
         TjdA==
X-Gm-Message-State: AJIora8LBE8orbyRJnw2KS1lKEtAAvjGh/Vbfogl9Way4NK/D4RBM5la
        N3jgnFsnL9pOwBBpt9CjooUU8WHHISlJpVLJOzXCGQ==
X-Google-Smtp-Source: AGRyM1sWRqYe+A4qepiU6K08Gk2UDWKSsUHbIH4KwHmf8+CbMzbiIK6O9l48yMlOhTn4bi5DWqmSSxXBKjEklcsVy0U=
X-Received: by 2002:a05:6512:403:b0:479:1627:a9b7 with SMTP id
 u3-20020a056512040300b004791627a9b7mr343348lfk.233.1655314413654; Wed, 15 Jun
 2022 10:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220610211257.102071-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220610211257.102071-1-u.kleine-koenig@pengutronix.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Jun 2022 10:32:57 -0700
Message-ID: <CAPDyKFr35sr7RFpv4S0eosY4BT1r0te083rdan_tRq0T+7agJA@mail.gmail.com>
Subject: Re: [PATCH 1/5] mmc: dw_mmc: exynos: Obviously always return success
 in remove callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 10 Jun 2022 at 14:13, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> dw_mci_pltfm_remove() returns 0 unconditionally and returning an error
> in a platform remove callback isn't very sensible. (The only effect of
> the latter is that the device core emits a generic warning and then
> removes the device anyhow.)
>
> So return 0 unconditionally to make it obvious there is no error
> forwarded to the upper layers.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

This one and the other 4 patches in the series, applied for next. Thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-exynos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-e=
xynos.c
> index ca5be4445ae0..9f20ac524c8b 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -670,7 +670,9 @@ static int dw_mci_exynos_remove(struct platform_devic=
e *pdev)
>         pm_runtime_set_suspended(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
>
> -       return dw_mci_pltfm_remove(pdev);
> +       dw_mci_pltfm_remove(pdev);
> +
> +       return 0;
>  }
>
>  static const struct dev_pm_ops dw_mci_exynos_pmops =3D {
>
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --
> 2.36.1
>
