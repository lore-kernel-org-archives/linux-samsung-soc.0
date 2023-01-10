Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420A0C54EBC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Jan 2023 17:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbjAJRoT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Jan 2023 12:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbjAJRoS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 12:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B875E652
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673372610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
        b=YF4ROHM1cdc7n2r7cWvxihUIptOtLvG059RIJZTY/A5W8UJzQg+d8IOzoOl3DAdBqT/W5k
        /8i1djwpRIvGWe0aomn8uN8J+eTldwGcTGmgf7rTZH8JjPLa70sPdFIyojPcwS/Fz1VcGO
        F5klJBcRwhuBuGnNTUAIxr+uA0zM76o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-FbZ_j-nKNK22ddlfVbvYnw-1; Tue, 10 Jan 2023 12:43:28 -0500
X-MC-Unique: FbZ_j-nKNK22ddlfVbvYnw-1
Received: by mail-wm1-f70.google.com with SMTP id k20-20020a05600c1c9400b003d9717c8b11so6589762wms.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 09:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
        b=MYbDgs2o1AEqaRxoUlYx4tycOhGKQEXHYyl1Mc06ycdIK0O++E58xfZaCXp2a8K+xN
         P734dHnx+jKxm3MtYHtwyScezs1PirceAhxvPO2b+I4neZ47dmcSmFbo+siniZC5XMmf
         w4hrL0vrL9EaVfn/YCwOvmAjGuBELJfA90dTowhEHKwnHBdacZIElVQcLuhHjs44DkqO
         EbZmVONvH/vgmqsEM7bRuqVbVCOxWeGHPgRCw4qBuP3hm+jVNesym76Y/IcRsQ3bkldF
         yB4bWu9sRBzmd/sWCttXMaL0fKOcDsu6Z2alBrNDHq6ddo5Uyj5uSEiC0p9GO2hySUaJ
         pnhw==
X-Gm-Message-State: AFqh2krGDJ9AS/YeLi6UNRZiLbXqQXVskE/4L/H+LCKQi9sF+QvXhbRC
        Ua9fJ60derxf9btnJnAabNlXSFctMTy5u7CK+4EE+O7wqJgt6u8gqM3QxWdFa+ACB5VHNfK0DaR
        JoY0FKg6EX6a9ytp93rtYt/JzkhKDSLg=
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id a5-20020a05600c348500b003d1ee6cf897mr50288314wmq.3.1673372607713;
        Tue, 10 Jan 2023 09:43:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxU+5jK6DCKCFcOjrGESz1FsScmmigeVbnmUI9PNQjGsaat4nrYN0f6poWVOX7lRHhoUaFUg==
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id a5-20020a05600c348500b003d1ee6cf897mr50288302wmq.3.1673372607455;
        Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c10-20020a056000104a00b002238ea5750csm13837334wrx.72.2023.01.10.09.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Message-ID: <7a61ea5f-c6e0-1f6b-fc5c-40bdf2c6293e@redhat.com>
Date:   Tue, 10 Jan 2023 18:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        linux-arm-kernel@lists.infradead.org,
        Tomi Valkeinen <tomba@kernel.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
 <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/10/22 10:21, Uwe Kleine-König wrote:
> Hello Arnd,
> 
> On Fri, Dec 09, 2022 at 11:53:49PM +0100, Arnd Bergmann wrote:
>> On Fri, Dec 9, 2022, at 23:05, Uwe Kleine-König wrote:
>>> Some of these dependencies used to be sensible when only a small part of
>>> the platforms supported by ARCH=arm could be compiled together in a
>>> single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
>>> for kernel options incompatible with a multiplatform image. See commit
>>> 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
>>> details.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> Makes sense,
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks. (But honestly I'm not surprised you agree to this patch after
> our conversation on irc :-)
>

This makes sense to me as well, but it would be great if someone else
from DRM can review/ack before pushing it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
  
>>> diff --git a/drivers/gpu/drm/omapdrm/Kconfig 
>>> b/drivers/gpu/drm/omapdrm/Kconfig
>>> index 455e1a91f0e5..76ded1568bd0 100644
>>> --- a/drivers/gpu/drm/omapdrm/Kconfig
>>> +++ b/drivers/gpu/drm/omapdrm/Kconfig
>>> @@ -2,7 +2,7 @@
>>>  config DRM_OMAP
>>>  	tristate "OMAP DRM"
>>>  	depends on DRM && OF
>>> -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
>>> +	depends on ARCH_OMAP2PLUS
>>>  	select DRM_KMS_HELPER
>>>  	select VIDEOMODE_HELPERS
>>>  	select HDMI
>>
>> Since the original purpose of the ||ARCH_MULTIPLATFORM was to allow
>> building the driver on more targets, I wonder if we should instead
>> make that ||COMPILE_TEST, which would also allow building it on
>> x86 and others.
> 
> I wondered about that, too, but thought that would be a new patch.
>

Agreed that making it || COMPILE_TEST should be in a separate patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

