Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FACFC2B9F8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 May 2021 11:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC3261413
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 May 2021 11:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEYLZc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 May 2021 07:25:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48539 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhEYLZc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 May 2021 07:25:32 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llVAH-0005jt-Iw
        for linux-samsung-soc@vger.kernel.org; Tue, 25 May 2021 11:24:01 +0000
Received: by mail-ua1-f69.google.com with SMTP id i33-20020ab042240000b029020adb6e9ffcso12940059uai.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 May 2021 04:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cKFEGWGjPKFTHbLCEq/FcmjCObs9nvntIcJ76aA6+yU=;
        b=tZn5uvK+q8PK/1V4uIp7rKdx3oOBXWhM/jbbiIxsJ/SuFowH+2mVMod+FMJ+L9TJg/
         BFnU5cXWeAzHnlfq1fjl/kvILG9xniHCQ+wyxWRkHAcrpccOHGkrvHGtSq+HePLNlRAr
         JI/mv0ueVF22jdONdhK7lLUvl9S7oPHHMaVLzh6f3acizKE4V8s40ThPcc+QT1JL8JDB
         q7pJPLULLFhagM1wP4ezR2RRebVzuEUXfMwcpWG5TrgW/RpP7cca+hfRFSWq7zlDGwDx
         NazoPZPPFV3WsPUf6z43RQA/Yk7RhOMGc19WGh+kMXiW5nxuHQukTAEPF4ziJtq/u5c+
         I88Q==
X-Gm-Message-State: AOAM530JNIN+VIi72s1XpwSOqnF5EMDne/Ihfv+7cRWxM6C/Of37HaS8
        NenhjIuqkheyOrpxyeYWT6R7tKXA7FxtxSujOiZOVYfwymVAc848e8iJUOh5G0OI/N9WbBPomh6
        m9Cd6/GrzFZ1fsn9cOEeYkCwFxw5vhZvBd6RH+wK6j1ZZ2QnX
X-Received: by 2002:a1f:2d10:: with SMTP id t16mr24846431vkt.20.1621941840755;
        Tue, 25 May 2021 04:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKohWztINz3BHc6DY3l8WbUf9DL9+UvvtFDqk6elvIA3QHFY7rcn0DZHytmH5OC97CQv5/Bg==
X-Received: by 2002:a1f:2d10:: with SMTP id t16mr24846423vkt.20.1621941840580;
        Tue, 25 May 2021 04:24:00 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id a201sm1452649vke.21.2021.05.25.04.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 04:24:00 -0700 (PDT)
Subject: Re: [PATCH v2] hwrng: exynos: Use pm_runtime_resume_and_get() to
 replace open coding
To:     Tian Tao <tiantao6@hisilicon.com>, l.stelmach@samsung.com
Cc:     linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1621857218-28590-1-git-send-email-tiantao6@hisilicon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3f0117f8-a96a-08c5-f67b-ca4d6c7a22b3@canonical.com>
Date:   Tue, 25 May 2021 07:23:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621857218-28590-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/05/2021 07:53, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. this change is just to simplify the code, no
> actual functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
> v2: drop unnecessary change about if condition.
> ---
>  drivers/char/hw_random/exynos-trng.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
