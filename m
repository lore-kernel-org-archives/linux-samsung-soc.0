Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D8C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbjAYJZ6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjAYJZ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE7247093
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674638710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
        b=KO/F8P4vq8StqgMN5WTrUy+yBRODcTmvXLkNdiWJbBvY+PrQxM152TJ52cTrRMGmJgp3hd
        Mq418D+5UWJW/g7TONCkcO1TCMq3/FrAUDBt9CPrkiXfrSZDdhtjHIFV6w17aWUi8qd2gu
        XGMkU581WKYiDI4LD9T4aRRWm3FgGkI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-YfjpCE28MgOZBB-VXTl4XQ-1; Wed, 25 Jan 2023 04:25:09 -0500
X-MC-Unique: YfjpCE28MgOZBB-VXTl4XQ-1
Received: by mail-wr1-f70.google.com with SMTP id o11-20020adf8b8b000000b002be143c4827so3031324wra.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
        b=hgdhgVKRq6ZtH97mhWqeqNPTktN3wq/Cgn27KRtVccxbei4geArJPxFlkZmcsYtiav
         vjIpuY619uVMy+HM4x+l9FuXaEj5FIfCBogdX8GvuS2czx08WRxOd6pf+eSwC4u/K4bv
         n1vuPH742rs0UxMsp6u+44PliZ3n0/dD+yG/oFyR4Dh90IuBHXkQgtrGYj66kgwbE/k8
         ET22mgXF7U5WldONU6iKZOLUKSqxci+xCQL/rjKkuSy0hbsen9iT5vc6ip1TOq7ePnl8
         Dar5QMrVqbNQkZs7vJn3bwkGKpxv67yPpRnr3KMDAPJlwkqJbUzE5Zc70h1q3DkTZjR9
         3wLQ==
X-Gm-Message-State: AFqh2koIOaM6xJIbnSAntFPc69grnRq8iFWrekcehp0oMZrw1K+NElM7
        PJ20+Lw4wMw7Evr6vQ/L9k8J6QMeiU/g7Re0G9mwu8G5CNMghjVEeJGuCU6lBu7xk72Pg+4tUXc
        Mh0yANvpxglPPsLe1i4jW3tmEm48IGYY=
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id l13-20020adfa38d000000b002bf9527ce62mr13001323wrb.60.1674638707870;
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA3fpsEqb88MB1qU578so/hL+p+6J8snUbZz7AHyqAc1so8GvG1XEiL3HmPZITj9u0u/0ozg==
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id l13-20020adfa38d000000b002bf9527ce62mr13001312wrb.60.1674638707672;
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q8-20020adff788000000b002bfbda53b98sm534384wrp.35.2023.01.25.01.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Message-ID: <c0377e71-12b8-a545-dc48-704c223f344c@redhat.com>
Date:   Wed, 25 Jan 2023 10:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
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
 <20230124134010.30263-5-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper structure immediately after its allocation
> in drm_fbdev_generic_setup(). That will make it easier to fill it with
> driver-specific values, such as the preferred BPP.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>  	if (!fb_helper)
>  		return;

Maybe add a new line here?

> +	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

