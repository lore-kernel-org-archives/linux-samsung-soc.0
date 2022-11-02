Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96653C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Nov 2022 10:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiKBKCc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Nov 2022 06:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBKCb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 06:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C976111172
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Nov 2022 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667383295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=UWCyn+sWLCdqIGt0zi4G1sa0HBoqVb9TDsArvY7SUDnWWjH/QULh0SjUEXIgHk0WsjjgDT
        mOk6d+0ONGFqFrDCDWTzw9zftVUNV5UtsX3iz9n4E67bfN+bAImwOUweK2PoNHmpMzDmi6
        n4z37jCIosfJEtmgFf27wb0Fq+KG0BA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-gNXDeJKtMRC1BVoky9z3_g-1; Wed, 02 Nov 2022 06:01:33 -0400
X-MC-Unique: gNXDeJKtMRC1BVoky9z3_g-1
Received: by mail-wr1-f69.google.com with SMTP id h18-20020adfa4d2000000b00236584fc8c7so4583233wrb.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2022 03:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=MSzPrCXMAw2WaSGDPEeRE/gZ73RvHKqsohi4imckGslP+0Q8meU4pZxJiatZo+qlM6
         817C8j85J+zQPMlF6PZ+BqMZvX4qgi1Qzy49zmotUexZeJ6Kwz+jUZ3dkqUsFmKWmtct
         Kv1kNpjgJ/nlhDbj2GDFZS56ed66WEv6R1Znzw0V8ez07wIZ4ygpFoLPgYCAEApErFeG
         41eDW7P/VM3/OtAbNV0i+svdiHg89Un1G5Cnv8aE17L8vpaO8pJQ8j45BCSdf+hnRygB
         0L7pSsa644HaJKZM1y3S8Oo3Kh8XzWIuE9pu+A2UgZF8Ui9te8+7lzC7DdkMTiEQcman
         FHeQ==
X-Gm-Message-State: ACrzQf1uz5fAuUF+uUwAIg6349W0g99KDydy7x6ptOFTwIB9NiYzMYPx
        rY7GP3rKCWLtdDFIGzNcjQL8V3o1R6cZom8JttL3ZUgmvRDTHsTXI90hvq1/lEqf9/e5ISA1Ucw
        GDC0SGzhdzPQVntSmHQeDmlIAWifdvBU=
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14406258wrv.68.1667383292648;
        Wed, 02 Nov 2022 03:01:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ieiweFPtXW5w3c0VZoUXMoQohTPuy1WtQBfT29g+UzlDhvHMzFOjUUUPFpm0LZwMa5DV8ag==
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405736wrv.68.1667383284200;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14230263wrv.108.2022.11.02.03.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:01:23 -0700 (PDT)
Message-ID: <1d2b9809-857f-48cc-1177-72e6fc67b8e5@redhat.com>
Date:   Wed, 2 Nov 2022 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 20/21] drm/fb-helper: Move generic fbdev emulation into
 separate source file
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
 <20221024111953.24307-21-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-21-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Move the generic fbdev implementation into its own source and header
> file. Adapt drivers. No functonal changes, but some of the internal
> helpers have been renamed to fit into the drm_fbdev_ naming scheme.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

