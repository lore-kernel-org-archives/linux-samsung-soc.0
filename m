Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 27 Nov 2022 21:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiK0VZr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 27 Nov 2022 16:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiK0VZr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 16:25:47 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB457DF0A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:25:45 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f13so14637653lfa.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdNlfxFpNA9v+siDfBOeG/1CGaIc/PiTgC9L8Cnj6l4=;
        b=JC9GbIQZD/+dALaeWM7wgUgenBU4oHG7ObLpkFoqYuDDyAG8qmswzXvMSsI+yL/BkM
         LjH86DKS8yNrS6xt78FTTE/69oEKdpaaAw2pPc/byw7wT+kNejZ1tDRALFYrqA+KT+1O
         trw66R9zcakW86YlVbUmcJHDnRFgQJWLcSwejusloM+Yd05pyuxN9XcgZ6aHQTdkxEjz
         2qU5kKntP7pvkMuupXFm6JOWrC4jYy7KePJKrnAX9VTAA2NVV62AYuo79lzBIXIxRHAh
         yGLWh3k+gzVMGOZV9hI8xyvUPKqZ7700MP+gCZJphVphG7fb1pUSSPRJ7KJqc349ejb5
         ZxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdNlfxFpNA9v+siDfBOeG/1CGaIc/PiTgC9L8Cnj6l4=;
        b=F5PyJLE/qiooZqLfgewA5B3xMTUhxCIuVL2NQY33IESXgn9nutIeJwXk3ekUy5f11d
         mwvnGQr8z0aVy3fybz+xlRCpi8ubHiozLs/zD1utji2kSEKaCTQGolU1q6nhKKY5PqF4
         QoENkbGWkpmDtIOl3VUdGW2g0YxN1VVZQXXqGnbpRuQExqpOizjAkOAmJ2BP3aaXZrqx
         Ydhf4VcDtecrkd8B5jidFdhG+2QTHu58Kg/kFcVJ81a5dyEFw4eiS/b/XmgOrkJ/MPt1
         jeWgMCa2ixHkv3nzirJ0/W/NXIimywAUKF1aCoS1HD1U3ZrtNYRlRqedyAJvMIlOLPKP
         C3JQ==
X-Gm-Message-State: ANoB5pmq5mrI6q2JLSAmSzzKg9ZYFU6icFn5+mFHUywnXUa7OA5WFwft
        BBv+GokNHXaIUtyp1LBx6pnGkrQH7IBNx466
X-Google-Smtp-Source: AA0mqf6tl5cDOhSilQAphSRO6mOQxIuWDKYqMIz/VSua8WhMyPN14GwX1pMXB38rOIzFTuZ9SOi3Ug==
X-Received: by 2002:a19:e012:0:b0:4b4:7b39:6edf with SMTP id x18-20020a19e012000000b004b47b396edfmr11647286lfg.157.1669584344319;
        Sun, 27 Nov 2022 13:25:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o29-20020ac25b9d000000b004b491fe071fsm1409870lfn.36.2022.11.27.13.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:25:43 -0800 (PST)
Message-ID: <17bf93b5-dca7-8eac-3f0a-3dbd13479a55@linaro.org>
Date:   Sun, 27 Nov 2022 22:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 0/2] arm64: dts: [exynos|fsd]: Update cache properties
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Aswani Reddy <aswani.reddy@samsung.com>,
        Shashank Prashar <s.prashar@samsung.com>,
        Arjun K V <arjun.kv@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221123092449.88097-1-pierre.gondois@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123092449.88097-1-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/11/2022 10:24, Pierre Gondois wrote:
> v1:
>  - exynos: [1]
>  - fds: [2]
> v2:


Thanks, applied.
It is however very late in the cycle, so there is a chance this will
miss the merge window. If this happens, I will keep it for the next
cycle (no need for resending).

Best regards,
Krzysztof

