Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4638C43460
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 May 2021 14:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B6A6124C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 May 2021 14:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243327AbhESOs6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 May 2021 10:48:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32959 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237545AbhESOs5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 May 2021 10:48:57 -0400
Received: from mail-qt1-f198.google.com ([209.85.160.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1ljNU1-0001PK-3x
        for linux-samsung-soc@vger.kernel.org; Wed, 19 May 2021 14:47:37 +0000
Received: by mail-qt1-f198.google.com with SMTP id s11-20020ac85ecb0000b02901ded4f15245so9939813qtx.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 May 2021 07:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jlsUdvAi6guPhxb/KDLB35/MQXQ9ef80K6DmXkPtEJY=;
        b=ZvIoUJv8Zp+PIAp9NUxJdBFP4henFup4iUzOQzjbxXKz+1j+6V2SaRA8gewlyO7W+F
         a+db1JbRzGAe9gJDjOVy6QKi5aEJ1V/EJ1FFO8BZW6papUtEPg6le9RLin8S5gCtxtyK
         Qf9zemFRUaNG+eJ4UtOwdD/JxOywlQIOqzJYhTb4PXcZR7bwt8qcBefMIxjKT7xPoXqm
         QIHfqnP0KnmaoGBFK5vpm1SjDt49xUXhyXBvIIOJ8Ja44tiqybchqw7ecVeDHhTeRskh
         xCdyFnd/DPmWcNAPR7peIXUtq0jB7ahr17dXqqDqvS3lyTZHX4cvRLYpu/8cXkeuNwSg
         AEEw==
X-Gm-Message-State: AOAM530JHE+qTZgCGfIVTilE5WdHKn8FRHSdn9AN/9I3TVwK5IwB/TCi
        OcklSPeqHWvYVnN+i2fJExl2R0CKoAXeGs+G0iN9Rr2UtCl4gmAQAZiKoMHGywKd76w8ejbwpD4
        8y/WKYRiwEoP3vUo4poKAXpZB8bqHXi9pWHtSACBK0scwG/DR
X-Received: by 2002:ae9:e70c:: with SMTP id m12mr4511957qka.414.1621435656336;
        Wed, 19 May 2021 07:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQnyqJ3uV7od4UNk33JSm3yvXvFib0hw6K0hCjkV16Dui0sb3gcPAR3H/GJ1RFmug5AkAs6A==
X-Received: by 2002:ae9:e70c:: with SMTP id m12mr4511940qka.414.1621435656170;
        Wed, 19 May 2021 07:47:36 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id x27sm9461224qkj.133.2021.05.19.07.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 07:47:35 -0700 (PDT)
Subject: Re: [PATCH] soc: samsung: pmu: fix BUT->BIT macro typo
To:     Alim Akhtar <alim.akhtar@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20210517141250.55655-1-krzysztof.kozlowski@canonical.com>
 <CAGOxZ524m0tYy2Y8xnkfoSg9PQj7uA6PohYC9u23Je3F+gHjDA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6c7fda4b-7f0c-242e-21c2-eb6c003d6d05@canonical.com>
Date:   Wed, 19 May 2021 10:47:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAGOxZ524m0tYy2Y8xnkfoSg9PQj7uA6PohYC9u23Je3F+gHjDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/05/2021 10:36, Alim Akhtar wrote:
> Hello Krzysztof
> 
> On Mon, May 17, 2021 at 7:59 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The macro EXYNOS5_USE_STANDBYWFI_ARM_CORE1 should use BIT, not BUT.  Fix
>> does not have real effect as the macro is not used in the code.
>>
> Can we consider removing this? As this is not used in code.

Sure, I guess, if someone needs this bit, can always check in the
documentation :)

Best regards,
Krzysztof
