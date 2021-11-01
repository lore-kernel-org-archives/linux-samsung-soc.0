Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E048C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 07:43:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03F3660F46
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 07:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhKAHpi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 03:45:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43154
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230400AbhKAHph (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 03:45:37 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6497B3F177
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635752583;
        bh=P5EmjtVy3Q/Sl5vMD4AJleTfAces0kc83H/qtiLZpsA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MHmXSzixwMX8dP7YEOfv5sR2S6oyrOlPS+iCKi0g9QGtSXa4+r5HcplnReoBeG8IX
         8ugAKcFdudHbmIl9mlW+krXiun5lXRd7Gkv9rCEycl4yIGHIS9vjab3ZGj01CEWi7O
         ICtfi0rITmxxVPko6qkZ+uJzFSy03TxBqu5gbvYIN1UWw0f9JNjICQ0bArwRHQx9tG
         6iZ1GTw7UmIORM0o0SjwKGwfJQW/YcQ49m/gEPl9oN+jmPEOWRbKnzXD2uCXhW91b1
         anvJv7Poji9CLEm2uUMoCW/DC4N1xFTmwEuIpzFE/6Ed1S3+p0bWOHfvTb+f9+isPY
         zNWONUE4wd+zA==
Received: by mail-lf1-f71.google.com with SMTP id f13-20020a056512228d00b003ffd53671d8so5181309lfu.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Nov 2021 00:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P5EmjtVy3Q/Sl5vMD4AJleTfAces0kc83H/qtiLZpsA=;
        b=zjNNmQG2Ttjd5cnt02i0F7CPwZ7eU50bKO/paQFt+282v0LD/brE43sbkh0+VxfpIT
         wxprJ91Df8m6xaNsj2hD0KxgvNj5eqbzbEapi78XewA+T1AV1aQ7AxY7gk1I2a2oXSsW
         WAOLLNE8JHohimSMtM/3mocOisdhMP1r/HAGrmqtzEnS+6+h24VUCJTwVpXWc23Wfoy5
         RtNELIIODxM83+NN1YT7nfCPU3Y9hFSsGKPomfLbzk06W9QSU+E52MR8q8w3BfDv+ffx
         xD5Hmm/d5kzLyZwY63zqsza+Nh1ulFQDZguZUidhl3KQaZlBLgzAX7pX6MJuXKxHH9eT
         s6AA==
X-Gm-Message-State: AOAM530vSW5TWdnfsABN62d4cv5kLkrHMNCfAQJ6Op4tAbH3lcVM3MEo
        x1Gb8ojdCTfZgxRF6wBDT9CL7+cv/AND3mRTf3dIJLQCQ+QrJCtYg7xiTRMIuIdfojcdCOE2XxY
        r6T18BvRUAO7nCUnVjoUzlHvOv46mzXTnCqvRX0+Mr/yGnwiD
X-Received: by 2002:a05:6512:238b:: with SMTP id c11mr9464901lfv.55.1635752582849;
        Mon, 01 Nov 2021 00:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTBjlYgNdZWvFuAyG8+5ovVAueMERrhBzZVtiW+PwhADTBkkpZV9sYnRKo8Z5LK8UPUARFcg==
X-Received: by 2002:a05:6512:238b:: with SMTP id c11mr9464886lfv.55.1635752582666;
        Mon, 01 Nov 2021 00:43:02 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bn28sm1612869ljb.117.2021.11.01.00.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 00:43:01 -0700 (PDT)
Message-ID: <583fac88-0b6d-43a9-dbec-e1e89d3c6ad8@canonical.com>
Date:   Mon, 1 Nov 2021 08:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/2] soc: samsung: exynos-chipid: print entire PRO_ID reg
 when probing
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>
Cc:     chanho61.park@samsung.com, semen.protsenko@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031165645.1182368-1-henrik@grimler.se>
 <878a4657-c68a-743e-7c89-bf69b416b824@canonical.com>
 <YX8KnNl0atfDwccR@grimlerstat.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YX8KnNl0atfDwccR@grimlerstat.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 22:29, Henrik Grimler wrote:
> Hi,
> 
> On Sun, Oct 31, 2021 at 09:35:20PM +0100, Krzysztof Kozlowski wrote:
>> On 31/10/2021 17:56, Henrik Grimler wrote:
>>> Older Exynos socs has one reg PRO_ID containing both product id and
>>> revision information. Newer Exynos socs has one Product_ID reg with
>>> product id, and one CHIPID_REV reg with revision information.
>>>
>>> In commit c072c4ef7ef0 ("soc: samsung: exynos-chipid: Pass revision
>>> reg offsets") the driver was changed so that the revision part of
>>> PRO_ID is masked to 0 when printed during probing. This can give a
>>> false impression that the revision is 0, so lets change so entire
>>> PRO_ID reg is printed again.
>>>
>>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>>> ---
>>> Has been tested on exynos4412-i9300, which is compatible with
>>> exynos4210-chipid, and on an exynos8895 device compatible with
>>> exynos850-chipid.
>>> ---
>>
>> Hi,
>>
>> Thanks for the patch.
>>
>> I miss here however the most important information - why do you need it?
>> The answer to "why" should be in commit msg.
> 
> In dmesg we currently print something like:
> 
>     Exynos: CPU[EXYNOS4412] PRO_ID[0xe4412000] REV[0x11] Detected
> 
> where PRO_ID is given in datasheet as:
> 
>     [31:12] Product ID
>       [9:8] Package information
>       [7:4] Main Revision Number
>       [3:0] Sub Revision Number
> 
> By printing PRO_ID[0xe4412000] it gives the impression that Package
> information, Main Revision Number and Sub Revision Number are all 0.
> 
>> The change was kind of intentional and accepted, because revision ID is
>> printed next to the product ID. Printing revision ID with product ID
>> could be confusing...
> 
> Sure, I see the reason for only printing the product id. Would you
> accept a patch write Product_ID instead of PRO_ID in the printed
> message? So that we print:
> 
>     Exynos: CPU[EXYNOS4412] Product_ID[0xe4412000] REV[0x11] Detected
> 
> There's then less room for confusion regarding the revision, since
> Product_ID should contain only the Product ID, unlike PRO_ID which
> should contain both Product ID and revision info.

Yes, let it be then:
Exynos: CPU[EXYNOS4412] ProductID[0xe4412000] Rev[0x11] detected


Best regards,
Krzysztof
