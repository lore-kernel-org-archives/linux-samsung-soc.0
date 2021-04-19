Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD1FC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 11:04:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0471B61246
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 11:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDSLF0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 07:05:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56186 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhDSLFZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 07:05:25 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYRi3-0002gJ-IH
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 11:04:55 +0000
Received: by mail-ej1-f70.google.com with SMTP id ne22-20020a1709077b96b02903803a047edeso2188606ejc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rmmgqTm+14dah62/nL48FwNXg3AN08p9OkUED0cAEDo=;
        b=H/lDqC1o6wSSyomZwlALigFEPvLJaKvXdPjHnl7BpzV5915lJXn9WP3Y/5VEZrYcai
         dsbKaVKUbJiJRd4NsnLBDORJShHQ6X38m6r0x3PDQkumOpLOlyarb2D7K2D7kxqKXAx6
         auJgHHkEhIXUVeLrud0gSMjhqtTFsOQAfSR0BISBNG5kRqCwUs3NymsK3do7G6Tz8U+N
         LqT1/gVRj5n97nUHFwyi94DPQix59ZME3JBSKiStRiDni3SQ+AFvls24ZglcHS73U+nW
         eodQyuaNeEhX7SLavf9/kX5jyKzjQ487IbUacjgFpKlOa8PCWN3j8AVtgGM6vp1Z6AIo
         04Eg==
X-Gm-Message-State: AOAM532C99Z93ohYkS2MNGpOp9maeVPLkh0mRPtSfsVcIj6R+PhcMqEa
        LTLABNKHtnDEBwA/9EtV92w4qyRSAI54FO3hbuFjhHjlRfBbJy2EqYgccnwYuCodN1b+zAkmuAT
        Ri7tPIjF3QSOdeKF0Fg0LN3IZhfdxgoXaEznXLqEgFwOikXYz
X-Received: by 2002:a50:ee17:: with SMTP id g23mr25157237eds.45.1618830295335;
        Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLhshrkmIn+obTvsmXNoesducAwfvWh+CLyV7FaE2SkNPnhgqKAWXBmJSAf7QOw6eaSyUr+A==
X-Received: by 2002:a50:ee17:: with SMTP id g23mr25157215eds.45.1618830295145;
        Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id b22sm9881378edr.52.2021.04.19.04.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 04:04:54 -0700 (PDT)
Subject: Re: [PATCH 4/7] mfd: da9052: Simplify getting of_device_id match data
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <152ee5cc-878a-310d-b1c9-76a983ee25e8@canonical.com>
Date:   Mon, 19 Apr 2021 13:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/04/2021 10:17, Krzysztof Kozlowski wrote:
> Use of_device_get_match_data() to make the code slightly smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/mfd/da9062-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Copy-paste error in the subject - the prefix should be:
mfd: da9062:


Best regards,
Krzysztof
