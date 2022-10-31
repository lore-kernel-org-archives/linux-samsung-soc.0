Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6421FA3740
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Oct 2022 12:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiJaMYt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiJaMYs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Oct 2022 08:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00F8101C0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667219003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
        b=OXxETfR4g8DTtsYOgeAYKp+EQgjNGaqLLCMi4dhrYZ+lPfcfdS5h5O8mwAFhR877yun0Zf
        nn2XbQOGwj8SjrqEVIoXsAliYDbiWm27JjHNCKViA/plFCtoSisI7Dw8DPfoOt6SWLCrcj
        xhNghWqsLn4MotOmVecD81rNWnwv9F8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-cwpSoQdROpGgXSTb3k0zyQ-1; Mon, 31 Oct 2022 08:23:19 -0400
X-MC-Unique: cwpSoQdROpGgXSTb3k0zyQ-1
Received: by mail-wm1-f71.google.com with SMTP id h204-20020a1c21d5000000b003cf4e055442so5238561wmh.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
        b=Fwply7TJQz77uzFvIpusfHEXhz7enIrOLbvZVwmoF+b4XyjpadIwDQTJLVI+hKyhgb
         phvi12vT9NWh++0bHBDY7GARwQY19JusjSBlxw/2SfRjGKO2A//tFmObT0hUZtRWLIeV
         YPWyoKiA6RvLxTgLFMfV+02nzMnTnZHZBObJwGlEFgwjt/X6I9VpsBKxPlgPaDym+jiE
         Gx+OKBwrFzqILOSh3gbHcMluFQA2FEhktgmwM8/1Evl7W60hnh/Ei5diaZtyAHyLEszy
         y66syjFqMDmXwhYAQYB2wqahiJabA//Q4ZeMkMDzVke+oCE+EYUOh4Uto8fcv8jz/cft
         6Xbg==
X-Gm-Message-State: ACrzQf1CsaZHb7PlLDA1GlXtWU6SFs6HHeGMXDT4kuFHZtFxOM2AX96+
        vuJBpEfgluAW6DVlBU13MZJmdR1664+8efmrDWudxk5ceQq4iK/dA0AZX3uMKiLf+P2rgJ05LWt
        sZhtLgc2lFexY8WIHVa7v6C+RtHCLMag=
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582877wrc.205.1667218998716;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7e34dAcxvP3Vi0CwbwP1YeMi235O6q6VyKCYvEf93eDT38FEWiyAv5s+MTc8QNv7Bgz3ny/w==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582855wrc.205.1667218998538;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id ci8-20020a5d5d88000000b0023662245d3csm7011927wrb.95.2022.10.31.05.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Message-ID: <63a804b4-ab2c-f5b7-73b5-edefdeff038e@redhat.com>
Date:   Mon, 31 Oct 2022 13:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 11/21] drm/fb-helper: Cleanup include statements in
 header file
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
 <20221024111953.24307-12-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Only include what we have to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

