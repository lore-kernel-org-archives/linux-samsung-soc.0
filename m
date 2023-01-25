Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73D6C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbjAYJGz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjAYJGy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891CF359F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674637562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
        b=bb0cqsZz0zKgtjULylOvCA5zhjbhsiy7kCWvEcUDU7FIWespAcyAhvJgC8zanwc9H8Bokr
        f4b0p1VBuRFRAPXXm46sJuZTijcuJFCPcU3MzxWDQ4PsXEhYUuhwhPTkh29+LbjunbxIhA
        Sd56FNpXh7VUBBvmu21Gj7MRC8VoZ+A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-0Rx4jdfwPq2J2a2qRzJj6g-1; Wed, 25 Jan 2023 04:06:00 -0500
X-MC-Unique: 0Rx4jdfwPq2J2a2qRzJj6g-1
Received: by mail-wr1-f69.google.com with SMTP id r1-20020adfa141000000b002be28fd4a7bso3030543wrr.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
        b=7VofzYODdtTacEASUS8h7+RJW2JxSbcidd1yZJ9cgSw5vhm0e75rSEAJsny5EHMO0C
         ZBOi2d6tmOP0+9S5XuPKAMdJcvzyAQy3rWNc9iYoJw9e0ZDcD1gEECHwQfZgi9stDbm5
         c/A2NM9VKkz9DXJWCe1DiQQy7NX0+4HLCkkX8htYG557GJjg54qes1gsP5uNSCogLiL8
         Hsy+JghGRiPhjvYNlcFenrjBKVxD1WoLKcBneMQEuEBX3jffNqZeKOUAYAVsVt2bGswL
         AYGS4i1ocVHqgMC2Ws0kih8PY+WbPIUbPCD3JvOCTI6sMpoFhraDHTXFb25COG6VsuIO
         iNyw==
X-Gm-Message-State: AFqh2koV1QUcGiI/ZN5qSCqFy8qr1VpIpRplZ70A4W03BpBq5l/W3C7Z
        0xYfRanzjajXVWplvf3VTWMeq8uARKcWmCgvrXwkO5omwzeBRTJ8F3gcRdUHPCbF92swSmkYWfw
        5TtM+N4bsL/c59gAYPKN2bhm6Pus+muQ=
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id n20-20020adfc614000000b00248ab8a5144mr21094645wrg.63.1674637559804;
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMP+tIsLwCvIpxNk0o5l1ZP8xAGyOaXYfWMtnUqU1wHmPoAjbKjb1Za9A6b4DyRU3i/fPKxQ==
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id n20-20020adfc614000000b00248ab8a5144mr21094625wrg.63.1674637559560;
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d470f000000b002bc8130cca7sm3865503wrq.23.2023.01.25.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Message-ID: <a8beffd8-5977-aa51-97aa-feef314541e0@redhat.com>
Date:   Wed, 25 Jan 2023 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/10] drm/client: Add hotplug_failed flag
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
 <20230124134010.30263-3-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper, which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

