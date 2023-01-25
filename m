Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094B8C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbjAYJmB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbjAYJmA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022C22B29F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=Km6gExUB7q+SFkVkSURn+CyhaPLT6yTla50HLsl8iKD8VxS7MMwmWmSBiLC/G/JcsUSCk9
        KhK1bt2RopU1vxsA4uVAThRv2tIhysEDWxeCgBQl2ZSZcfMGlMv3Ya0Q4HwOdkuLd0+7Nf
        4wOFNqd+uqHuSWDWTj7GcD8F4aL7lg8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-NI77pBxgMkasSnMYnpRSMQ-1; Wed, 25 Jan 2023 04:41:07 -0500
X-MC-Unique: NI77pBxgMkasSnMYnpRSMQ-1
Received: by mail-wr1-f71.google.com with SMTP id v15-20020adfe4cf000000b002bf9413bc50so2247195wrm.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=wS/BV0faBRXInvCclrGI9BeGTdyAXf4M1miytj344nkf7avY+WLcmhy5G4jDImtuPw
         jfmsV5mu2QZlS1bBrnhdHxhwlqXBNPkOVKkBmMZYA5fksb5oNVOaK8q/cp3fzyM4pNmJ
         i0o/22pqhR0LkFDrBs840bbPvoHoNIsI2Ih/SUpA/7pnqWltp3K5qKVe1Rkl/LNT1cQj
         fH3bP1siiZgfQVqD+QGnb9TnsPT1ScrYqXX/+/e35/PrETmWFCjPUElFzHBtilfdcoID
         kGBIiS6YoaWZap3OhEjk2UE8Wegx76lITpCOml88FBSyJxs1Qj2wb7e+DqgqLcfpAzvd
         hO4Q==
X-Gm-Message-State: AFqh2kquqYK2FdVPTWEsFAwoSHWUgaoExKy4KjFJSvbfWecBlgOisO8t
        WQ1ilbPWcLCy2d7v/u9F8Ly2KWqVdKSgPgdpTuZStMTZ+owsln6e6OQ00LHslqs9RhB7+xzMnU6
        prjyUZItRpBfRbFaO+7MONTPvQtNkv74=
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416464wrb.3.1674639665556;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspvSYF5UcTCX9Syl/sB5Wttapk1TJmAOGMxlySA2rIPpJprAbwV2wYhJQSWjxg72A43lgFrQ==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416452wrb.3.1674639665344;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002be25db0b7bsm4010247wrx.10.2023.01.25.01.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:41:04 -0800 (PST)
Message-ID: <66114220-d226-e0e9-bf09-707388ce98f3@redhat.com>
Date:   Wed, 25 Jan 2023 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred
 BPP in prepare function
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-7-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper's preferred_bpp field early from within
> drm_fb_helper_prepare(); instead of the later client hot-plugging
> callback. This simplifies the generic fbdev setup function.
> 
> No real changes, but all drivers' fbdev code has to be adapted.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

