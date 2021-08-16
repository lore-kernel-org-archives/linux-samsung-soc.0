Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0ADC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Aug 2021 08:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 449B261A04
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Aug 2021 08:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbhHPIc5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Aug 2021 04:32:57 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:37584
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234811AbhHPIcx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 04:32:53 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 13F533F07E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Aug 2021 08:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629102742;
        bh=UCYlNRmzeCEuDZZ2cqWcomGqHyEFVVrQDIMY2+9YLGA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vj9cytwldvWQ99+UaWSDnYqdf9q1zk6IaRArkhdbhlUi1fmkpFjAXI6Oj0w60otUu
         daczrTrO9opyQoyqcPmKfcahk6xsR8bWNTjMj8yl9iaDHGIfBkIobuF3s5K00uaBiz
         iRIFXVpypZVQr0BSmMy0C7QCxDRjP9ts1LdBoKvmj0zdgW18zgpT+ZKgR/fQ3kKI+u
         Hy8fKKsvm5sIV+FioXdiYVBppHeOmwl5evstOOakryWQD4Womw9dyivV0dG//xrGBo
         DVx/zwdkD9tPvvkIePKIS1bdd046urOZYvxhdCYOrO0kVA683ZlTUZoT5KaEkH5VMc
         Eq+61GrWlua2A==
Received: by mail-ed1-f69.google.com with SMTP id ec47-20020a0564020d6fb02903be5e0a8cd2so8503212edb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Aug 2021 01:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UCYlNRmzeCEuDZZ2cqWcomGqHyEFVVrQDIMY2+9YLGA=;
        b=SYO1xZCfQ7a8thppzQ/lYMA5HgL0dxCEIa0W0saJSxp0GCUr7Rw/W/nj6vZNsh9dES
         vMe/NXVMlx8FeVzgUb2XBTcZi5c4IOi2AQ6mV9lRKdyb4hGo6dHbsWwFF2sTE0b0msz7
         OAAGQeo8VpexZElRZ+WOkSqjiaz8IFFg+uRZx7gXe25k7/m/jlFlzw3cUG5yI0xfI5js
         GBe+9x+fBKUsWNvRWK924cBzUHNaHkfnfPaTE4Usy7EPG4WR2gL4kzgFJvyt+i18Q4nz
         Ho10yqZ3DYad+C/zXkic5ntfzrDfkQJjzYEPiKPlSsiZPjFOe/JQgmpeYQ8vwEfzhKkQ
         hm8w==
X-Gm-Message-State: AOAM532UzYcaz/SCpy+xMENjJVUOQe3bQpJtOTF4osD96NppS3qDPfFJ
        04dtnY5lbo96dQ7I7D5EBnoGB2fVURtkCa2d1fJqw/7huI+m7U3J4nKPQEBw2v9ausK/Mkl+f+U
        FROeWtP9giFmz/hxoBpidxX7pxXatVgFk0HT6XszunRBBJ9ec
X-Received: by 2002:a50:eb95:: with SMTP id y21mr18627040edr.5.1629102741782;
        Mon, 16 Aug 2021 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWp7YYIs1HvFB9r8ma/frRskh/jd0dudB3BzbInzpUKcEh8rihjaxeMk6VTvCkVyqBdNIC2w==
X-Received: by 2002:a50:eb95:: with SMTP id y21mr18627027edr.5.1629102741690;
        Mon, 16 Aug 2021 01:32:21 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id d16sm4505366edu.8.2021.08.16.01.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 01:32:21 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: memory: convert Samsung Exynos DMC to
 dtschema
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
References: <20210813125414.104467-1-krzysztof.kozlowski@canonical.com>
 <73eebe7b-46da-137b-1938-09a5b453320a@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0ec05a0b-9499-3bf4-a231-ea53b1cf99ed@canonical.com>
Date:   Mon, 16 Aug 2021 10:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <73eebe7b-46da-137b-1938-09a5b453320a@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/08/2021 09:53, Lukasz Luba wrote:
> Hi Krzysztof,
> 
> On 8/13/21 1:54 PM, Krzysztof Kozlowski wrote:
>> Convert Samsung Exynos5422 SoC frequency and voltage scaling for
>> Dynamic Memory Controller to DT schema format using json-schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>   .../memory-controllers/exynos5422-dmc.txt     |  84 -----------
>>   .../samsung,exynos5422-dmc.yaml               | 137 ++++++++++++++++++
>>   MAINTAINERS                                   |   2 +-
> 
> I'm not an expert in this DT scripts and why it complains. Maybe it
> complains because the "samsung,exynos-ppmu" is defined in the .txt
> file... (?)
> Although, in general looks OK.
> 
> Acked-by: Lukasz Luba <lukasz.luba@arm.com>

I think the warning (triggered by DT_CHECKER_FLAGS=-m) can be ignored
because it complains about compatible in example which is not present in
the bindings. Usually it means someone wrote example not matching the
bindings (e.g. a typo in compatible) but here it is on purpose.


Best regards,
Krzysztof
