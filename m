Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C752FC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Apr 2021 16:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E34C6121E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Apr 2021 16:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbhDVQb7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:31:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43006 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbhDVQb7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 12:31:59 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lZcEd-0002xQ-3u
        for linux-samsung-soc@vger.kernel.org; Thu, 22 Apr 2021 16:31:23 +0000
Received: by mail-wr1-f69.google.com with SMTP id y13-20020adfdf0d0000b02901029a3bf796so14068722wrl.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Apr 2021 09:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ppnGNxh0eFn8x7BCY1HCM1XkgXlS39iBEur/NFl3YdQ=;
        b=QKrI6uuUv7/xBODxiWCsxGNTWvbUD0+9JI2Si8WClUmI6HgkvnNsRsQriquMby78M1
         1GpNUNbMdmI4mmnomtaLZ7dH20MFQtkSipuAb0cQPmOIWdiE/iWl7lyqBBQ3DsK9pcCu
         2iFF6DL9Qw4UYVLb4eIQdO7TOrhDDeP/YClNqdVdOhqNjAoCMKhBjmpuoPyzIJS7Wf9E
         8ZIToyvcJtu7j7R7DBSJipYumlXtAiKCeALIW1sZsJUfD4xPCMkSb8dutKRUtnETIDEg
         1V7SCedBPUj5L+QLKukuT4HVlSDo4CIhnfwfygyXQ6AHh7vnidTrUT2WF0kJSN6ppwhd
         +HGA==
X-Gm-Message-State: AOAM533jGMUbJ3hpkoWzzaK7fsv6q8bdwSaZ/kfxpbC61ttc+okiMJRU
        PQ0OZ2X1CkdLJ/W6DJ/QA0+5pByHy5P8AqMICHdZlvQ2GwwSnaJ20YlKUFV8zj6vY4MsnF53+Cw
        xOZjTc3cCFQHT4u2fK1o+nRsxAt0b7NL9zLL5UzK/aUr110oD
X-Received: by 2002:adf:f742:: with SMTP id z2mr5238203wrp.82.1619109082870;
        Thu, 22 Apr 2021 09:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxao2x5CTffFeKvHNJlZUIC/sEATzkPF7ctqWq6WVRjowmOIGA4pJ6bPUOEevnIjYM+2LP2fw==
X-Received: by 2002:adf:f742:: with SMTP id z2mr5238180wrp.82.1619109082726;
        Thu, 22 Apr 2021 09:31:22 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id g12sm4569107wru.47.2021.04.22.09.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 09:31:22 -0700 (PDT)
Subject: Re: [PATCH v2] hwrng: exynos - Fix runtime PM imbalance on error
To:     =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <bc20ae4c-3e62-7b07-506c-ce8d90f65754@canonical.com>
 <CGME20210422112224eucas1p283ca7aeaa25ab514b9743a11e63a76e0@eucas1p2.samsung.com>
 <dleftj35vi7ee0.fsf%l.stelmach@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a8bdb9e0-cbe3-85d5-c9ac-619445471b41@canonical.com>
Date:   Thu, 22 Apr 2021 18:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dleftj35vi7ee0.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/04/2021 13:22, Łukasz Stelmach wrote:
> It was <2021-04-22 czw 12:46>, when Krzysztof Kozlowski wrote:
>> On 22/04/2021 12:41, Łukasz Stelmach wrote:
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> the call returns an error code. Thus a pairing decrement is needed
>>> on the error handling path to keep the counter balanced.
>>
>> It's exactly the same as Dinghao's patch:
>> https://lore.kernel.org/linux-samsung-soc/20200522011659.26727-1-dinghao.liu@zju.edu.cn/
>> which you reviewed. It has even the same commit msg
>> (although it's difficult to be creative here).
>>
>> I think it's better to resend his patch instead.
> 
> It isn't the same because it uses pm_runtime_put_noidle() as discussed
> here[1], applied here[2] and advised here[2]. Dinghao didn't prepare
> v3[4] for exynos.

Thanks, makes sense but then I would prefer Marek's approach of
pm_runtime_resume_and_get().

Best regards,
Krzysztof
