Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC657EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 08:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjGEIj0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjGEIjZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8249C1A2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688546319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0ev84vUzUh8ZH6f1TjRoMQmaeXWVKy1q8JlkhwPTuuw=;
        b=d4P3/wJedq4/9u52+s60wkaaG4H5xhmk62Pk+v75tvkDJk0kDMJwPG8AdirL7mIL3Un4SY
        YednNuS+HC8ruF7vvusz08LSI6Rouu++lnih55cIo7J6GzRdhw0qRGhiMG+NrSFIHm88Yo
        g0NAWX4cTErOLkRGtClEtaOYKseapQQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-S9fCpztQMy-iHDCbMMikxw-1; Wed, 05 Jul 2023 04:38:38 -0400
X-MC-Unique: S9fCpztQMy-iHDCbMMikxw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4edc7406cbaso6435260e87.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546317; x=1691138317;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ev84vUzUh8ZH6f1TjRoMQmaeXWVKy1q8JlkhwPTuuw=;
        b=BxCpb8/tjxUCsYNp5xKRy6Mo90+aJwI4hqBP4S8+mV8WZ1m2VR99r9XgUqFBWDtCqu
         qaZgQcipA6XJ9ta8ISp6n2D9vthCuMCkV1RMqg2YSLb1Gv+xSqn9nODfHi+L8TkDHoiC
         4bZrrLLoau7QeWrv5E23h6+7up4xZGHyGS9ku/641IvH8LyOpnop1maZ1iwTmSn5clge
         +PhQhzj4ZZBJW0u5PODCq0yUx3GKaCMQei0joouEwzVjga6gcZuBAbYBpHVaBI651vG4
         ziigfQ7J30cgPGuy2yvyfTancw2d8X6GJiinDsnAXqaE10PMQbZ9cmiIp3brvyVsnHfo
         6dmQ==
X-Gm-Message-State: ABy/qLZ+QU9qtE4NIGZ4yCZlSv9zDXIKmK0lVVUIoT5MsCc2ZxtaFfdH
        y04K5OCqQrmYsaQEVwi9ocljOEE1C7sZE6LhCMjBcFz/ydTfBEwP2fVxAT5jewo9ALepw2EWHis
        AgX4kPfVFwEEi4+oKZIwFgMZOBahkbCc=
X-Received: by 2002:a05:6512:2211:b0:4fb:8948:2b2b with SMTP id h17-20020a056512221100b004fb89482b2bmr14099220lfu.48.1688546317012;
        Wed, 05 Jul 2023 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHw/8+9xxPRw7DNATPC6lakSSCvVuMDKfqLB9aRt/ZUrBO5oK9Z8Als1e5OzgdL2qBEpY21lQ==
X-Received: by 2002:a05:6512:2211:b0:4fb:8948:2b2b with SMTP id h17-20020a056512221100b004fb89482b2bmr14099194lfu.48.1688546316638;
        Wed, 05 Jul 2023 01:38:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000180300b003141e9e2f81sm14564718wrh.4.2023.07.05.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:38:36 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 05/10] drm/exynos: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-6-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-6-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:38:35 +0200
Message-ID: <87ttuirbw4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev emulation. They drivers previously

s/They/The

> used the I/O-memory helpers, while allocating DMA-able system memory.
> This could (in theory) result in bus errors from accessing the memory
> range.
>
> This bug has been present since the exynos driver was first added.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1c248b7d2960 ("DRM: add DRM Driver for Samsung SoC EXYNOS4210.")

Wonder the value of this "Fixes:" tag since this patch depends on the DMA
helpers introduced in 1/10?  I would just drop it, since it might confuse
the different kernel stable scripts that attempt to backport by looking at
this tag.

As you said, it has been present from the beginning of this driver.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

