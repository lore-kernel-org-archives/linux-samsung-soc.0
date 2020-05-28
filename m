Return-Path: <SRS0=J4qy=7K=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C656C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 May 2020 14:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 040DC2084C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 May 2020 14:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFlx+Y5+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391018AbgE1ORp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 May 2020 10:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391021AbgE1ORT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 May 2020 10:17:19 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A44C08C5C6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2020 07:17:19 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id j28so6783218vkn.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2020 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BuuJ1LHr7B0D8g7eMjAHiAe1fYFy/QuFchre+f7F2cI=;
        b=lFlx+Y5+BUfKHtlP+elnq8ReiE97j9UIu82aEsFl8cz/Tp7zjdAMrb1MNJOECARaP4
         vRqzP98sYOszXMdn5TOvKP+Zb/VRf5V1+LLlbF0YOocMCIBnB+qL46UiLuNaVagJiOLm
         teFAdK0pIy+W/AFSR5OZsEWyFZa2vGrMCFm79jMy0gLLLKLBy43IvYtLnsrj7Go6tz8c
         64xYqvZ+gZ1CMMsTy+AmuGVqlFmjTVCZk83fWrVPmwhknhiDYCJwdThEKVfktQ3NyvHh
         NPZz85Uw+q36hEh1arPlO4A9HfZsT039Bk1VQdWrdJM61Pa423UhQ0o5gaJfRm4QHHzr
         /Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BuuJ1LHr7B0D8g7eMjAHiAe1fYFy/QuFchre+f7F2cI=;
        b=bRsxd1CdUBfwd5oQt9oxsQL8ZJuMJvZcPGAZl+l/gd6yYCNNhPi+LFyqJpAnKaXwVQ
         LCd6RyoXzkNLkDpJBvuZKUUFNZ9mhzH3qtytsDrZaPNKB3K9vUCEiJ15Zvs+pVab6CsH
         d0w1wc8T6md1mkcaUq4BuvOtbC2yvzQAZhtyJP0+FW+syKleMo+vuVMBoBxmPzwZdkFy
         fX5/h8bmsbof87pZ+pg5m/EXWkwB4EpUS7HGgjDMNAEHWwzzIesffpob2smpVPJE3/Kc
         B1Ry62HL+rIn58rlFBLFfL+mUF15/J0DUA8Gbr8DC1LSrqliTx75H34LDdqzM95Z8FiQ
         FlwQ==
X-Gm-Message-State: AOAM530uVdbr8qqSszBAJAowDUAjzOpXx9P+TuukvIf9Dka9lrT+8XQQ
        oAE46bWClQTDIq7XX2Oz0HpDnZ5Bj486RfpOyqclsQ==
X-Google-Smtp-Source: ABdhPJyFq0sy87bcDDV4B0w526F0rr56imrsl10NiW+RLPfH0tc0nFJzTbjhvpQLXbvgFrMuGv3blVrJBDS6GlwUgDI=
X-Received: by 2002:ac5:cded:: with SMTP id v13mr2325192vkn.59.1590675438652;
 Thu, 28 May 2020 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7@eucas1p2.samsung.com>
 <20200528140326.5215-1-m.szyprowski@samsung.com>
In-Reply-To: <20200528140326.5215-1-m.szyprowski@samsung.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 May 2020 16:16:42 +0200
Message-ID: <CAPDyKFqaD74m17ROncd8YA6bFY+m3ePX=jenSfVGq1K9E9zONQ@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-mfc: Properly handle dma_parms for the
 allocated devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 28 May 2020 at 16:03, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms for
> platform devices") in v5.7-rc5 added allocation of dma_parms structure to
> all platform devices. Then vb2_dma_contig_set_max_seg_size() have been
> changed not to allocate dma_parms structure and rely on the one allocated
> by the device core. Lets allocate the needed structure also for the
> devices created for the 2 MFC device memory ports.
>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Fixes: 9495b7e92f71 ("driver core: platform: Initialize dma_parms for platform devices")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index 5c2a23b953a4..eba2b9f040df 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -1089,6 +1089,10 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
>         child->coherent_dma_mask = dev->coherent_dma_mask;
>         child->dma_mask = dev->dma_mask;
>         child->release = s5p_mfc_memdev_release;
> +       child->dma_parms = devm_kzalloc(dev, sizeof(*child->dma_parms),
> +                                       GFP_KERNEL);
> +       if (!child->dma_parms)
> +               goto err;
>
>         /*
>          * The memdevs are not proper OF platform devices, so in order for them
> @@ -1104,7 +1108,7 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
>                         return child;
>                 device_del(child);
>         }
> -
> +err:
>         put_device(child);
>         return NULL;
>  }
> --
> 2.17.1
>
