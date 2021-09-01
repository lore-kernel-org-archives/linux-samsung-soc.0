Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493BFC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 09:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B65C610D0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 09:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243725AbhIAJnZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:43:25 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49630
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232282AbhIAJnY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:43:24 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4D5743F325
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Sep 2021 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630489345;
        bh=Y3RQ54Zm5OFe9AQSuUGmYtHrFrafqN10VZzfx08OW4s=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ptEwrW+rV4ihnJssfFSdhJjffO4KlZ3CErO5I2fNT3tkhVC/nek8aIRQEP4JMgZOv
         LoreR12QX0VFgQhAw5Ex7ei7zG8yeEPQmYOt7OfColIUPDGIvkpqjyd+2JtcTJFQB4
         UiAMRZ91Jv6ClulUOX3R4vZmXXwlBlS80lnM9yz6/H43onTRYY5GiT5rqyOnLUjeQ0
         hT20eYMNBeRE8MqXRrmv8z7+OHzqWFvaipIlirOgSo3VPvv4YlhcLHYcYqO1EtLWQw
         rFYGztgDiKx4gE1cxvXokwANYTKuaor2ZEkp1g0yXyk5JTLUQL0gpIXRnNreE6MSbF
         h/x52xI7FI/uQ==
Received: by mail-wr1-f72.google.com with SMTP id h1-20020adffd41000000b0015931e17ccfso333992wrs.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2021 02:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y3RQ54Zm5OFe9AQSuUGmYtHrFrafqN10VZzfx08OW4s=;
        b=rgkY2gekX3swU7fNoNaVlk2Rp0StvdfxEpDPQuNTbCoRZ1yLLe3g3K/jNPx1NI8Y3A
         hjaTO0WQk8Pz+YrDvDEL1YkbZQ/1LnvyaXtWx+HQutAqSCoJ14YZYw2nLck1G3rsvCzO
         Gg5lR3iW7tPS1gXYc4utvxtHxUQCt3wHCs6HuzDFATLJSt1MCfFK+Sp7iIUmEXy0QfUe
         doAbuHSp+8dD3N6cH5mxGIBt1nZz7uBYc+kLagwg71ReezNT8OrMhquhdYC9+rtXYy71
         oFAm4Wu4ld9rpp76ABXCA3MAeubNzO11aEjH/QvGCo7h42XQeYKjP0j32Ag/jB/YLDcw
         9Dgg==
X-Gm-Message-State: AOAM5307o/oxmWx8FLjjwDKAA/AMyD+PNkbDTBTQcIjEq2eHt4BDF//V
        Jbh0KJaP8ZOnEBzlb75aA//88D8BVTM2dxSghkuiz32SqUUnvdOs22GYm45QsxZWaKkCjZVmRSF
        iG02bdLA9vtW9AsNw0RPAt51XguyOJ/1JMT3Lw3i7okaaxjFu
X-Received: by 2002:adf:d239:: with SMTP id k25mr9005604wrh.314.1630489344174;
        Wed, 01 Sep 2021 02:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR0Z0kzD+pLwVC4xGiQJns7caEYN8rRGrEFZPzMKL7gxFfjGtfCH/P6c84n/PyVciuzn525A==
X-Received: by 2002:adf:d239:: with SMTP id k25mr9005583wrh.314.1630489344007;
        Wed, 01 Sep 2021 02:42:24 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.172])
        by smtp.gmail.com with ESMTPSA id y1sm5096157wmq.43.2021.09.01.02.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 02:42:23 -0700 (PDT)
Subject: Re: [PATCH] pwm: samsung: Simplify using devm_pwmchip_add()
To:     zhaoxiao <zhaoxiao@uniontech.com>, thierry.reding@gmail.com,
        lee.jones@linaro.org
Cc:     u.kleine-koenig@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901054230.29678-1-zhaoxiao@uniontech.com>
 <79e46f2f-c3ed-d187-2553-e64e0aac4c13@canonical.com>
 <612f43cc.1c69fb81.205fc.d94bSMTPIN_ADDED_BROKEN@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e4d04494-8c49-b1c5-c0f4-165fc59f516a@canonical.com>
Date:   Wed, 1 Sep 2021 11:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <612f43cc.1c69fb81.205fc.d94bSMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/09/2021 11:11, zhaoxiao wrote:
> Thanks for your advices, This patch is modified with reference to the 
> patch that has been submitted，example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=66a03c4fd9e95e192c574811a1f4ea8f62992358
> 

The patch there looks correct, but you cannot apply one code pattern to
entirely different code and hope it works.

You reference a patch in a driver not using drvdata and having only
pwmchip_remove() in its remove() callback.

Now you apply it to other drivers and:
1. Remove drvdata even though it is used,
2. Delete additional code from remove() callback.

Especially the point (2) is a proof that you don't understand the
fundamental Linux driver model, so please do not convert code into
devm-like() before learning it.


Best regards,
Krzysztof
