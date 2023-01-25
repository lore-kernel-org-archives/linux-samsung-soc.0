Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFBDC27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbjAYJTr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjAYJTq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7291D46D75
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674638332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a55Ot/a9auPBUYlSWbJ1dfW1qxB2YBfP2IFn3I6erq0=;
        b=M2rVy30VcEjzaXvqkcCnO6uV4pG/Xh+FP81Z/3ofmnBS8qgAhx0LWYvuycmbOFM578c8jv
        TqW34LmydRABVnB6D1TJ82fFMC/budb6eV/Mik0wppXgcOORZPeeMzdqAY0ew1mo1//M6A
        VeCxjno6JETB6AV4S7WchQ4TyJJHV6o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-0hOYxIs8PYKdfmLreKULKA-1; Wed, 25 Jan 2023 04:18:49 -0500
X-MC-Unique: 0hOYxIs8PYKdfmLreKULKA-1
Received: by mail-wr1-f69.google.com with SMTP id o11-20020adf8b8b000000b002be143c4827so3025842wra.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a55Ot/a9auPBUYlSWbJ1dfW1qxB2YBfP2IFn3I6erq0=;
        b=hxcxis0LMhtjmXA3TFp/IeL1IJ/WPnZtRhDjpycHCMpRSzcbyrRlcBfSUHcAXeaJgC
         KwPrGhfDAhQ9ocHPNlw8pg5dP0kytQM5RqnMmyR3Dzhy0dszdHwaxZIPLR9P/94UMzMW
         cH6/hBLwQoOynFsQgujFeXrdmy1+W5HqXkFHsy7lArGlPIpGWOEGbmJCuN9GsuLYrKn8
         RV0ani1511t+G1ctefkMsFHFWsDGi1iLE9i+eXlPf3W07OngCT2ENgDFsilxyZIeINHk
         e1o6QBEvPaiRT7abgjnJW5H1hAplXnmAluDl0wleGev1H0lxVlimt/IUJJVguijQZFGB
         IiwQ==
X-Gm-Message-State: AFqh2kr828qBghmTB8lY3S2YWoH0Y+UKFKVwqspqkTUsxvaCiAgeyaMj
        XEz28Hy6dQtoJMc5Jcx4Zto696F10or9qDYKAuPgkouDbSFC/TL7QSSIxk0FkMKiJi4h04AemFu
        KclsHiQawsJa6Y8M/yqUm8C3qh9eCLBs=
X-Received: by 2002:adf:feca:0:b0:2bf:9582:1378 with SMTP id q10-20020adffeca000000b002bf95821378mr16119699wrs.37.1674638328233;
        Wed, 25 Jan 2023 01:18:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMVsply5zUceDY+rfGRdP7xOLgJXzgPpsW/TV5uP5Pe3bOpgzxt5mZhJQXuF/HpRE9cQuOiw==
X-Received: by 2002:adf:feca:0:b0:2bf:9582:1378 with SMTP id q10-20020adffeca000000b002bf95821378mr16119688wrs.37.1674638328019;
        Wed, 25 Jan 2023 01:18:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002bfb5618ee7sm2235669wrb.91.2023.01.25.01.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:18:47 -0800 (PST)
Message-ID: <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>
Date:   Wed, 25 Jan 2023 10:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/10] drm/fb-helper: Introduce
 drm_fb_helper_unprepare()
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-4-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Move the fb-helper clean-up code into drm_fb_helper_unprepare(). No
> functional changes.
> 
> v2:
> 	* declare as static inline (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
>  include/drm/drm_fb_helper.h     |  5 +++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index c5c13e192b64..4379bcd7718b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -435,6 +435,18 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_prepare);
>  
> +/**
> + * drm_fb_helper_unprepare - clean up a drm_fb_helper structure
> + * @fb_helper: driver-allocated fbdev helper structure to set up
> + *
> + * Cleans up the framebuffer helper. Inverse of drm_fb_helper_prepare().
> + */
> +void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
> +{
> +	mutex_destroy(&fb_helper->lock);
> +}

I like that we have an _unprepare that is the inverse of the _prepare, but
since is only destroying the mutex, maybe is an unneeded indirection level?

Or do you plan to add more cleanup to that _unprepare function? Otherwise I
would just make it an inline function.

> +EXPORT_SYMBOL(drm_fb_helper_unprepare);
> +

Does it have to be an exported symbol? AFAICT the only user for now is the
drm_fb_helper_fini() function, so the function could be a static inline.

[...]

> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index f443e1f11654..39710c570a04 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -230,6 +230,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>  void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  			   const struct drm_fb_helper_funcs *funcs);
> +void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper);
>  int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
>  void drm_fb_helper_fini(struct drm_fb_helper *helper);
>  int drm_fb_helper_blank(int blank, struct fb_info *info);
> @@ -296,6 +297,10 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
>  {
>  }
>  
> +static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
> +{
> +}
> +

And you should be able to remove this stub if you limit the scope of the helper.

No strong opinion though. So if you prefer to keep it as is, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

