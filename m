Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7536FA3742
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Oct 2022 12:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiJaMB1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiJaMB0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Oct 2022 08:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256F15F4C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667217626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
        b=A81TQWzRANSt9UBXkN6GWZECwAj2+GPLXn6gdwd5irFl8gEo3FGTWQ0tGgzwhMkxQ2lwHk
        9EJ9dIXq62KH3h5oOwgKZ83yltwQfjYnOnaHOR1ePZXUP1C+hxUKtaADOJgdSnV4tlZcO1
        vZWbNYGFj0c0lpX1hv6hD75EP2wEoSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-MXNOjkzcMYK56dPBDxnpeg-1; Mon, 31 Oct 2022 08:00:25 -0400
X-MC-Unique: MXNOjkzcMYK56dPBDxnpeg-1
Received: by mail-wm1-f72.google.com with SMTP id o18-20020a05600c4fd200b003c6ceb1339bso5571071wmq.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
        b=0aOTYhVQsK0HN6ALXv5SHWypyYmaSyzNxl7lfl4693TmRdiO3oQLdck/wQmbUjMz5X
         oP4qTNykjKDQs5trADFLYzBo2UMobOiEyqT1wm1hEaAbNyxfIDtUbM4RxkWsdsnc7n70
         mUCzXDL4gzCTBt3w/bK+50xJhlzko8Qkn/6Aea3HxlivWMrz1rVxG6EmprOilLrKgg6X
         I7+h0gOja5N51CzetEjiR9/cVdli3ebGl7aHVSwmDkWfe8bx6NJLyl2h3J0B1EbzEyjZ
         OFt7h7XtBHTo1XRIOZIViNKeTHess8n5CD6O72bGzb49/Q6/v56vouth2K93NNVoj+ek
         JBLA==
X-Gm-Message-State: ACrzQf1Q6boDntizC2417R6AGvIV5b4QExXeuXzrQoEzCvtUwrVi/QGY
        BtY+UCN1ivL1D54S/NlUM+lRusCJJ6k12SerqjtrzAbgRIr/vxONbhi10E6PjJW7eQEV8IN4LmQ
        cEeESNAYJckktLUlQAh28INgwlp6yYCk=
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606537wrv.259.1667217623892;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SGo+SId6me5X0r4rljOgpSC8TPNcKC+21wfNb2F4dclcZs6G1cIUREq2tk/ot5/dgyLJVEQ==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606520wrv.259.1667217623655;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003c6c1686b10sm5388458wmb.7.2022.10.31.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Message-ID: <2e2e3915-a7b2-d030-2ffd-117b12deedb2@redhat.com>
Date:   Mon, 31 Oct 2022 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 03/21] drm/vboxvideo: Don't set struct
 drm_driver.lastclose
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-4-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as vboxvideo uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

