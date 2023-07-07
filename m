Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82102EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Jul 2023 10:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbjGGKOf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 7 Jul 2023 06:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjGGKOF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jul 2023 06:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C426D30D5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Jul 2023 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688724748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
        b=TzYnI9s5JcszrVKky2QMsAwqLDqmVIzYsOQP9Vgvzug/CT+YkMRdTbgqfrB+XK6FUs2xgT
        fW2V1YOD/FXcRs7wlMK+fziefLnxFdeKHL/wyfDNmgPtfBwSsMAbmDqiQzD/1J22O1WsXQ
        IIc1f1BwsxGn0rZPNFhW7NtTmhqdbhk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-Nrd2kVUAMNeVEF49bPqWrQ-1; Fri, 07 Jul 2023 06:12:27 -0400
X-MC-Unique: Nrd2kVUAMNeVEF49bPqWrQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fa976b8b6fso10276365e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jul 2023 03:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688724746; x=1691316746;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
        b=VWg3V6K3JE61am6DD92nqat4VFV/yRW2ROEAc8ZSKu/9GWeeJaPIv/ltXtajGFlOTM
         PKmPSOD03iFs6Pn78oOOYSIOnju1lb5y9U0O128jBzJUVTnDT36/q7otdMcCK49N21WB
         7fp4a/fFBq/J0Almn0+fq2ZxPSdqp0+9TCb5qgVoOsSIfxr/IqvWWK9jF8wKpmWu25pK
         YNqSwCjFalA3d1fXdi6E1RZ3Xj2HkCLkipNXLueGl56IB5sVPbnv1F6GwJTcb0NYgzlZ
         kZAygDkSGx1xiqboe5L2sfs/vXc0bhct1UEceQ+3Izht7XTSLpD21yljhwhZPrB400yH
         Y4Ew==
X-Gm-Message-State: ABy/qLb/WTywtH8JrBGEQChvaw3W5M8tdHV3jtvdHa06Auk2emXp9Ehz
        CXpastpnxM66VdqSlwbLsp57PE83/FGcB6uHen+1v/1YGdctht1Y74YvIdKW7UwnMhohFqYUXl9
        xn8eym3TVm9QUEhV3wLGJAWT6q8oTt7c=
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id g11-20020adfe40b000000b00313f02fbe7fmr3429139wrm.55.1688724746547;
        Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEl0rRQx8YRJhH9y3kGM2crHvIosSMl2yPsiQFeLRX1mWJpZ5P5lO4jWKSG6bWALHyxhssqPQ==
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id g11-20020adfe40b000000b00313f02fbe7fmr3429126wrm.55.1688724746175;
        Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m5-20020adfe945000000b00313f9085119sm4031028wrn.113.2023.07.07.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 03:12:25 -0700 (PDT)
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
Subject: Re: [PATCH v3 05/12] drm/tegra: Store pointer to vmap'ed
 framebuffer in screen_buffer
In-Reply-To: <20230707083422.18691-6-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-6-tzimmermann@suse.de>
Date:   Fri, 07 Jul 2023 12:12:19 +0200
Message-ID: <87pm54xc70.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Tegra uses DMA-able memory, which has to be acessed with CPU ops
> for system-memory. Store the framebuffer's vmap address in struct
> fb_info.screen_buffer. The currently used field 'screen_base' is
> for I/O memory.
>
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
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

