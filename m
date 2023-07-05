Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC230C0015E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 08:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbjGEIZu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbjGEIZs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CB3C1
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688545500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eZJh75bw9w7BaC88TjfKOAwS7yZRgwUVKM0cKS0Ap4c=;
        b=UIddqukx5nXy4dT6Hjln0PjmZX2BRHDt68qeq81AGsB5/+jfHjDYy9UEwdfSF4GQ8wl4S8
        9gPMlJ9BuM2BZthj2KFRBgi9ZSP9s6JAduUdmjuICDOzlqBAz/8S8dwadVMrj2CRU/5tUl
        Hu9/Ped8FrtUATvOKeskbNDqnjuhBU4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-wkmysIe_OBmpYluFTjkcIA-1; Wed, 05 Jul 2023 04:24:59 -0400
X-MC-Unique: wkmysIe_OBmpYluFTjkcIA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb76659d54so6193430e87.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688545498; x=1691137498;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZJh75bw9w7BaC88TjfKOAwS7yZRgwUVKM0cKS0Ap4c=;
        b=b7FNGKSIOvaqfb30Xfv6OF0J422W6BHigUpBjENytWk6RHWTsl+K9Zm7/T7qA4Y8YD
         99/zsBHmzFnnbQjVCq/PnW82wZI8/GfhjGKPiCEZwoEoCWN5xhYpFp66hW3Fso4HacpW
         Ds3e2x7SKKQNrMPNORvL4bVUwmrAW+xLIl5gVBcFRt95iYNipIiO4ThoaIMOI2vg7hcM
         e4RdCSJvjpq2af+ZxLU7bnNzf7Fm+OUj9lwHuKFXzuVzx2jR1QAXLJpAvgFCDNpqfa6r
         RMMhGoP2N5AAijT+2V1i/q+pRYX2aceYUo4yxgRiOIh98ggetc0dUkRS1tjpnD7eO1EY
         uizQ==
X-Gm-Message-State: ABy/qLZdwWLuvXu5fkXT0dzISPb6jgQcCuz7b+CG94BMAf+TZHpd6BNF
        OGz/QlUIpwSk+zOnuHPWTfWbGJBE3rqs7EvFTcDE2ArRqVXGWYsInlEpBbt5f2/lgvSK8SwbU6p
        A0nPPThX9T3/RXH0VKbQi421VT4M6dOQ=
X-Received: by 2002:a05:6512:214a:b0:4f9:710f:f3a9 with SMTP id s10-20020a056512214a00b004f9710ff3a9mr8987199lfr.58.1688545498073;
        Wed, 05 Jul 2023 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmVl6rLLB6OUt7bROr01892dqkjNHI5vlj2R/On3xPNUheSZKZaL6NJ+PF67CBojymc/sLhQ==
X-Received: by 2002:a05:6512:214a:b0:4f9:710f:f3a9 with SMTP id s10-20020a056512214a00b004f9710ff3a9mr8987187lfr.58.1688545497921;
        Wed, 05 Jul 2023 01:24:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d69cb000000b00313f07ccca4sm26118306wrw.117.2023.07.05.01.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:24:57 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 03/10] drm/tegra: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-4-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-4-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:24:57 +0200
Message-ID: <87zg4arciu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev emulation. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

