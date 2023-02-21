Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCDFC61DA3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Feb 2023 10:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbjBUK1y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Feb 2023 05:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbjBUK1x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 05:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B162386F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 02:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676975224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
        b=Z3Q2Zi10hlCQa8ofLpOaS/vu8JtkMnrh3kDnXKizOX/mg6G5FLLWq73mBvf6MGA7FhSMVj
        oiNBjAa3sBBpgRw2KWrBBOB4K/9Ji2bW4D0n/nKN0CMRPnIRUjSC/Fsydcvh8PU2ulluVK
        U6tGIbwjzWCNXaVxo6NRKHjlRHdwydQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-nhjMPIrkPoWg-R7vRxpFQg-1; Tue, 21 Feb 2023 05:27:03 -0500
X-MC-Unique: nhjMPIrkPoWg-R7vRxpFQg-1
Received: by mail-wm1-f70.google.com with SMTP id k10-20020a05600c1c8a00b003dc55dcb298so1774692wms.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
        b=0xci5b58ub02+F0OlGFEZsMZ4P87dUCS7UMuw87SmOEUwC5QGjegEsYNV9zh8k0WaV
         3f/G80e4p3Zsjh9vadLDD6ejFDXr+C3ciqLiamz3Yd5y3aTPFdeJlxDZlHRc+DpaKs3C
         A6k+yx0M6wpgOMPngxV+PWtiBlD8Wo5T9GktoPKfLgtdFG3gaJk5xyyj5Mq7TOTnfZQx
         zQHKuPUVq3fB6kabGUNwV1FhvlZtldZ4prS61lMGBY4ydjgkJcdBShGozJHBHK2oWZmG
         Q46KjbVhxG4injWEmMui/6XCOjyMrZ80OysNeGWF8l6gvVH7KoQ/a4rh9g0M2nMqA7ul
         9OYg==
X-Gm-Message-State: AO0yUKWhcgcxPjlIZUvHxtpU0t3afgUpK9pdj9hnxN0kdwBKhlj699cw
        rDPs+yl7mJPYhSMn7M//fqoI9m45OZsbwTV6dZbAUvzm0sQWBNcrQV0E828p4c0tJsjDAmAiHgC
        Fh14uPhbnyn4Uo4utXBAdc4NzSGJZKWw=
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id x7-20020a05600c188700b003e20918ecd4mr2997465wmp.37.1676975222125;
        Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/cKnMX/kNp3d4wm95Jc/vSbL62QyA9ckz6jygZFZOsNWWFJ1UBaXn9HDaaIXMU9JLf5j495Q==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id x7-20020a05600c188700b003e20918ecd4mr2997460wmp.37.1676975221852;
        Tue, 21 Feb 2023 02:27:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c274100b003dfe549da4fsm4700968wmw.18.2023.02.21.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 02:27:01 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
In-Reply-To: <20230216140620.17699-1-tzimmermann@suse.de>
References: <20230216140620.17699-1-tzimmermann@suse.de>
Date:   Tue, 21 Feb 2023 11:27:00 +0100
Message-ID: <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move drm_fb_helper_unprepare() from drm_fb_helper_fini() into the
> calling fbdev implementation. Avoids a possible stale mutex with
> generic fbdev code.
>
> As indicated by its name, drm_fb_helper_prepare() prepares struct
> drm_fb_helper before setting up the fbdev support with a call to
> drm_fb_helper_init(). In legacy fbdev emulation, this happens next
> to each other. If successful, drm_fb_helper_fini() later tear down
> the fbdev device and also unprepare via drm_fb_helper_unprepare().
>
> Generic fbdev emulation prepares struct drm_fb_helper immediately
> after allocating the instance. It only calls drm_fb_helper_init()
> as part of processing a hotplug event. If the hotplug-handling fails,
> it runs drm_fb_helper_fini(). This unprepares the fb-helper instance
> and the next hotplug event runs on stale data.
>
> Solve this by moving drm_fb_helper_unprepare() from drm_fb_helper_fini()
> into the fbdev implementations. Call it right before freeing the
> fb-helper instance.
>
> Fixes: 4825797c36da ("drm/fb-helper: Introduce drm_fb_helper_unprepare()")

I think this should be Fixes: 032116bbe152 ("drm/fbdev-generic: Minimize
client unregistering") instead? Because commit 4825797c36da just added a
wrapper function for mutex_destroy(&fb_helper->lock), but it was commit
032116bbe152 that made drm_fbdev_cleanup() to call that helper function.

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change itself looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

