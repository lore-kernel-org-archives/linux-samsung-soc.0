Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13352C00A89
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 10:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 847382151B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 10:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvffOctS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgKEKIM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEKIL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 05:08:11 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C0AC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 02:08:11 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o13so938990ljj.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
        b=rvffOctSKYH+6isvUsZ6vjuDGiRiPXrriws2tYpmxIOJoDbVaUBBLJZNLsZfPTViCm
         OB7UJ7kJVc74V/wH1kAJWs50qUWe8BxYk+3Bh0Ntwrn4R80Kw+RHuzDoPIDkFuxVKOMP
         awvWPavfta6vj9AUR/6i26T0t+QGvBOviGEDNRn+gsaMK+rwApX3VuBwIy6OffxGwIGI
         Q9ElrJtiii5nM3Ug/hNAa7sMnYOfnIMkNbbQWWsd9e9E4LqYfoNACefZyIQWVQxYvven
         erCA3D+b6EoRTgIG3bxLlMg5PeozREFm5ydwy7sAu7xfjUKeSkZzmy6N/j40DftaLQPo
         OSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
        b=YHMN/Yt5HSJwtI597HF4pFTXvGjJxLh3jTsXfnqaJe7W4yZ2hS6qQwmSrrm48ub/A2
         bmGPZrMEgDP8Tqf586k4TfoCrLpeqWvCX/PcK+niHuSmshmNXlSs5c6UhB9VM92/Q7yC
         A1ViduipUwbYqP8bNeMsT2aGns2xnPhjRdZYjjyuKIm+LFqD1/OvdQhdwt6XLEoRdKSX
         A12usNaB5OZEow06q5XLZJeVv/HeC2KtKDG1bWplO+uRdIjWtXZNKedZTwvlV54njcDU
         MpaasRQ6nsilPZbJptz9vbgW/ADjGYjmlK/NBRLrxcnj8hoOnSE9/SB8pqQ+tnuSIECo
         6ltA==
X-Gm-Message-State: AOAM530eQ0yP3oeigSVmU96r0ZUc3nScKbXknzNWPuPZNuO/gJgBg/fx
        yrkhbfVvCKfMme4A7d3ZzrLJCztlgWoW1gBYJrCpOg==
X-Google-Smtp-Source: ABdhPJzTsAT/B7g6yG/tiOPWkhIyiq+coc///CuocOp+hPojlZHj2TddLjwWNxDtJai798d/HI10cYYk95MMhchsZzo=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr658065lja.283.1604570889728;
 Thu, 05 Nov 2020 02:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201020122046.31167-1-tzimmermann@suse.de> <20201020122046.31167-10-tzimmermann@suse.de>
In-Reply-To: <20201020122046.31167-10-tzimmermann@suse.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:07:59 +0100
Message-ID: <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] dma-buf-map: Add memcpy and pointer-increment interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, yuq825@gmail.com,
        Ben Skeggs <bskeggs@redhat.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        ray.huang@amd.com, Sumit Semwal <sumit.semwal@linaro.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        luben.tuikov@amd.com, apaneers@amd.com, melissa.srw@gmail.com,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        spice-devel@lists.freedesktop.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        xen-devel@lists.xenproject.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Overall I like this, just an inline question:

On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> To do framebuffer updates, one needs memcpy from system memory and a
> pointer-increment function. Add both interfaces with documentation.

(...)
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:       The dma-buf mapping structure
> + * @src:       The source buffer
> + * @len:       The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +       if (dst->is_iomem)
> +               memcpy_toio(dst->vaddr_iomem, src, len);
> +       else
> +               memcpy(dst->vaddr, src, len);
> +}

Are these going to be really big memcpy() operations?

Some platforms have DMA offload engines that can perform memcpy(),
drivers/dma, include/linux/dmaengine.h
especially if the CPU doesn't really need to touch the contents
and flush caches etc.
An example exist in some MTD drivers that move large quantities of
data off flash memory like this:
drivers/mtd/nand/raw/cadence-nand-controller.c

Notice that DMAengine and DMAbuf does not have much in common,
the names can be deceiving.

The value of this varies with the system architecture. It is not just
a question about performance but also about power and the CPU
being able to do other stuff in parallel for large transfers. So *when*
to use this facility to accelerate memcpy() is a delicate question.

What I'm after here is if these can be really big, do we want
(in the long run, not now) open up to the idea to slot in
hardware-accelerated memcpy() here?

Yours,
Linus Walleij
