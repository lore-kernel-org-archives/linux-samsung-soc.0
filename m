Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EC0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 14:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbhLHO6F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Dec 2021 09:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhLHO6E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 09:58:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EECEC061746
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 06:54:32 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id c32so6138624lfv.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Dec 2021 06:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+3GG8yVaw/Cu9lTA3ESz9IPLwx5hb6gqwcTKh9yEKdg=;
        b=TDm+2l2xQjZJXAxHF1lIIxq7JT5vtwrGoUj0p2di74w5etDUHGR+7Eei8GyOEwgCiY
         +JgKdh6kbNJUdZDykDefycaRA4jnFuIlOMZFw3sZV9zpc3Ox1hNieOEsWFMJcfqK4BG0
         a9Z3Mr/kGhvXEugaD3MXqXjomrMITXbod3Yd+qyGqzRIXADCWE7zJgRVe8EOy/lX9Ar0
         gqp7TTQYGlm2LjyCmgOUzHAkqrcq9vlLUlzgfYbwFKA5e9QpBROxcSulY2JT0cvRpl43
         rKC7ZrXhUs+IyPbDhJAoLaes33mTxdtRXbljv3dTwpfZL2lL5S8DFR+9GPnKXH3vi+So
         rqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+3GG8yVaw/Cu9lTA3ESz9IPLwx5hb6gqwcTKh9yEKdg=;
        b=gvujudw9ymyGtyAXLhZYgU3Fv8l8tzcGMmPW58db1ZzmVaVi7JdW4ZPH8zjx9NgkVi
         eynaz1dIKeTvtjRuWz/46NWutrPZb0x81+pntmCj7xI8etzsaMIvfhu8Pa6TFgHO51wd
         GrgCnpnewJBXztobtOYZjBscpMYoQAK0QvV4TIEJrWbHl2OetehnTE9M8wdYE7iSC4qA
         M5YFf89+ieweT68yX7TC1ZIt8ayhOWw+K9/0KppRAO6QFRaCT1dgMreEKMblR0XxiOp8
         eyUQ6uw7eQdX1qKzyc7JbdJN7SyxLmJwmjIbdWt0eLVE4CeeQJMLH6dSlWxHl8CkHPrR
         vXXg==
X-Gm-Message-State: AOAM532c8ByjbNNjKI//zPoImGLrRkgr34r6uoIjmlRQPb9LOvXp/cUU
        Rj44VUFZ9DEJr5Q9UdNs3YUa+Hy8QUqYVeA15B+Ipw==
X-Google-Smtp-Source: ABdhPJz60+87r/gCmKRcwLcSv+19OvrFvH2SxIm+ME7dXLi7kpfr2caY9CmueMindoWcUiYaCTOk5ISfR/KRB8+C3YI=
X-Received: by 2002:a05:6512:3e04:: with SMTP id i4mr49006555lfv.167.1638975270897;
 Wed, 08 Dec 2021 06:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20211206142929.26729-1-marten.lindahl@axis.com> <20211206142929.26729-5-marten.lindahl@axis.com>
In-Reply-To: <20211206142929.26729-5-marten.lindahl@axis.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 8 Dec 2021 15:53:54 +0100
Message-ID: <CAPDyKFojCipHMwmCZB3h7CdYP+eSSikA=d=G701Y5+9xeQKxgg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: dw_mmc: Do not wait for DTO in case of error
To:     =?UTF-8?Q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Dec 2021 at 15:29, M=C3=A5rten Lindahl <marten.lindahl@axis.com> =
wrote:
>
> When running the ARTPEC-8 DWMMC IP version, and a data error interrupt
> comes during a data read transfer, there is no guarantee for the data
> transfer over interrupt (DTO) to come within the specified data timeout.
> This case is handled by the dto_timer handler which will complete the
> request with the comment:
>
>  /*
>   * If DTO interrupt does NOT come in sending data state,
>   * we should notify the driver to terminate current transfer
>   * and report a data timeout to the core.
>   */
>
> But since the ARTPEC-8 DWMMC IP version, supports an extended TMOUT
> register which allows longer timeouts than the non ARTPEC-8 version
> does, waiting for the dto_timer to complete the request in error cases
> may cause the request to take significantly longer time than necessary.
> This is specifically true for the failing steps during tuning of a
> device.
>
> Fix this by completing the request when the error interrupt comes.
>
> Signed-off-by: M=C3=A5rten Lindahl <marten.lindahl@axis.com>

Okay, this change looks a bit inconvenient to move into variant
specific callbacks. So, maybe the "quirks" flag makes sense, after
all. However, I would still look at using callbacks and library
functions, for the part implemented in patch3.

When it comes to the order of the patches in the series, I suggest
flipping things around and making patch2 the final piece. Otherwise
the support for the artpec variant will be broken between patch2 and
patch4, right?

Kind regards
Uffe

> ---
>  drivers/mmc/host/dw_mmc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 45ea9fd97a6a..d6b76f47b1a2 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2777,11 +2777,19 @@ static irqreturn_t dw_mci_interrupt(int irq, void=
 *dev_id)
>                 if (pending & DW_MCI_DATA_ERROR_FLAGS) {
>                         spin_lock(&host->irq_lock);
>
> +                       if (host->quirks & DW_MMC_QUIRK_EXTENDED_TMOUT)
> +                               del_timer(&host->dto_timer);
> +
>                         /* if there is an error report DATA_ERROR */
>                         mci_writel(host, RINTSTS, DW_MCI_DATA_ERROR_FLAGS=
);
>                         host->data_status =3D pending;
>                         smp_wmb(); /* drain writebuffer */
>                         set_bit(EVENT_DATA_ERROR, &host->pending_events);
> +
> +                       if (host->quirks & DW_MMC_QUIRK_EXTENDED_TMOUT)
> +                               /* In case of error, we cannot expect a D=
TO */
> +                               set_bit(EVENT_DATA_COMPLETE, &host->pendi=
ng_events);
> +
>                         tasklet_schedule(&host->tasklet);
>
>                         spin_unlock(&host->irq_lock);
> --
> 2.20.1
>
