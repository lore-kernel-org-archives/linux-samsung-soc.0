Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90265C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbjAYJvi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbjAYJvc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E744699
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K/d1Iir0okyO1PXRE824II8zkHLTH6xPW+FwgTmuVIo=;
        b=i43tSzhaGlT3iP7kNF+8LzN0an29YTFMeBi1U+PA1dMET2VHr0oh5yow8+VryWBuQlNUYU
        UJ/bk/mDQxuPSIz4nni1fb8stQBsjkOHiYQ22fQgfuQhrE0DCs1QyUeP6aqiltjHPb2kDH
        fUjnLuOLzQWr4MzUGt9NdZqw9yl/okQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-1APfTUdnMq-0h7KswsOtMw-1; Wed, 25 Jan 2023 04:50:56 -0500
X-MC-Unique: 1APfTUdnMq-0h7KswsOtMw-1
Received: by mail-wr1-f71.google.com with SMTP id v15-20020adfe4cf000000b002bf9413bc50so2254636wrm.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/d1Iir0okyO1PXRE824II8zkHLTH6xPW+FwgTmuVIo=;
        b=QAA9rD2puatmBd2TQO33b2QbUZMQGbmof3uqPVwCXKTnTMlkWz0IW2B2BCKU4r3GsK
         ErUNzTgYy7LwL0YOFUe9Qe6nkWuNLv0RX2hO7JQpgHAY7KpHmITkpCuZ8RxHVIsYaePZ
         oe1Th82kHFbIDh3tgxh7bA24i4d3wNdr4UuTpc/j+vEzYlGpqPMbp3CCI+szNlmS8HBj
         bVjSmkZz8383imHa4rTrUgaJAtKweGeX+C4dDRYIsHWVZwlqGk7Ro5eQn0hJ4EITOQKc
         pma5b/u9/xzah6qUrP30ct9S6Qer7mumMsiY5qn3snf5tMGCJ/GvUzkv9AF/es5wTg+b
         Ur3A==
X-Gm-Message-State: AFqh2krw0+XlV07K6LKwhjuxdhqkxjIINlllv3IDuUMOYll9ZZYVyZkq
        Ub8U8UA3FBfC9FaF6y7OX4Etmq6bkDH024597+YHXI5J6UiQks2PuZp78xNJ1s3iSxKO2C4dvdC
        KZq2BOpkIcDcfxt1tmTbSwuooSzQVMuQ=
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id d8-20020a05600c3ac800b003da270bba6bmr32346396wms.41.1674640255700;
        Wed, 25 Jan 2023 01:50:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwfL0Z6VaIwodqmubvV+5fPQ6Vvv5kGgzDLr7Nlz5OAeVqgi6a3bBFtOpmTalnPP5+47xPuw==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id d8-20020a05600c3ac800b003da270bba6bmr32346388wms.41.1674640255501;
        Wed, 25 Jan 2023 01:50:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e18-20020a5d65d2000000b00294176c2c01sm3929576wrw.86.2023.01.25.01.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:50:54 -0800 (PST)
Message-ID: <498c2aa7-185f-d1cd-6e41-004880913870@redhat.com>
Date:   Wed, 25 Jan 2023 10:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 08/10] drm/fbdev-generic: Minimize client unregistering
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
 <20230124134010.30263-9-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> For uninitialized framebuffers, only release the DRM client and
> free the fbdev memory. Do not attempt to clean up the framebuffer.
> 
> DRM fbdev clients have a two-step initialization: first create
> the DRM client; then create the framebuffer device on the first
> successful hotplug event. In cases where the client never creates
> the framebuffer, only the client state needs to be released. We
> can detect which case it is, full or client-only cleanup, be

s/be/by

> looking at the presence of fb_helper's info field.
> 
> v2:
> 	* remove test for (fbi != NULL) in drm_fbdev_cleanup() (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

