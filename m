Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BDCFA3744
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Oct 2022 12:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiJaMYG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiJaMXt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Oct 2022 08:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF2DF58F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xVJodACOlUyVw6jJB0o/QffeIPQi24/sF6MmyMfBvgg=;
        b=AD3YqiH6p2ttr44BpYQxrxqMRTPybN7R/b6HdOO7WVOug/Q1OjwZu85lR+0dhw9vB0ZNLp
        v7HafG6DmjwvnlLt3brJJxuyUzEl6cdvpUV5fqKr5ZAt+IBZq1/R/Xx18Uo02XSc4VOIrG
        Mu6cRHxrbzkM8L0aY3CeC+LMDI6BwZY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-O6W4HJgeNqKDkQ6KYYUcvw-1; Mon, 31 Oct 2022 08:22:28 -0400
X-MC-Unique: O6W4HJgeNqKDkQ6KYYUcvw-1
Received: by mail-wm1-f72.google.com with SMTP id 1-20020a05600c028100b003cf7833293cso234988wmk.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVJodACOlUyVw6jJB0o/QffeIPQi24/sF6MmyMfBvgg=;
        b=jN6E8yXc5xoWGQlTRj6GpLwwqsGiWaiIxqE1Zh5nrzEFQIzFY4CGWRPUfe6VyVqP9J
         DydloqDrPcRZHzr11miN0O3druS5YveJGdYdsREt1rKHgni+Ae9mwCHzq8eTolPJwJbc
         6lfx/429wyLkFEeMnX1Q09hhCu//IbqE2UDjsJX+bcbcaH2Gtv6xvb/rnYgReF1+YykD
         lHJR/Fld2H2AsTv9P9L6VS8altaYprCTS8JsZZL8OWSkargAEMn8lrbHIiLlPtVoii9V
         991Wb0vm6aEPbLC/F1PiEvw54R3Q/yw2/ppgQ9RkSatX9gA+ZbVABOQe3F/qr0fUQqJw
         G37w==
X-Gm-Message-State: ACrzQf1a+cfXQsdYZPwmnN2v6ZSszGTEzvBHJY/nuzF00G6X4QmfAD+p
        qm+UjnptC4AbbGDndhEyMLLENULImiIcP9WzoptFMDDQpnGEIB6BDOvS6TX3WkBzCvOsEuVRwCe
        g5e6LmtGbex1LUJbZTL8prCdBXJWsdjI=
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id q14-20020a05600c46ce00b003c6f27433b2mr7860181wmo.27.1667218947037;
        Mon, 31 Oct 2022 05:22:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zVdpLNc1mYDp74XAWVtjpPddzcwMDONTh4D+G0X15w3fKqsphKr/pP9hn5PrcknLAkhJ5Mg==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id q14-20020a05600c46ce00b003c6f27433b2mr7860165wmo.27.1667218946788;
        Mon, 31 Oct 2022 05:22:26 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c4e9000b003cf568a736csm5157904wmq.20.2022.10.31.05.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:22:26 -0700 (PDT)
Message-ID: <ea046b06-fb0e-b7c2-8f70-b299401d9adf@redhat.com>
Date:   Mon, 31 Oct 2022 13:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 10/21] drm/tve200: Include <linux/of.h>
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
 <20221024111953.24307-11-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Include <linux/of.h> for of_match_ptr().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

