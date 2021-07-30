Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2150BC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 15:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04F4660EBB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 15:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239760AbhG3P0G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:26:06 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35738
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231439AbhG3P0F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 11:26:05 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2E81A3F107
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627658760;
        bh=TEvW673M4tlEqNAgqaz/ijFkYi/5QPh9cKHdp/b4gIY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=BMulju+qd6KNkK/xIBYsQ3RcCIw+PvngouNH3a538zmeXYpC/wNdT+iHdl8d8Q+OJ
         0gdFBuO97tWbjeFb8QRI6V3eMx68WkIJifJFNI5AljTUmSnln8HQBXeoS4g2PVv3Nz
         0FlyXccarUfYO9HGrXwnEv7C3Rn7siyGM8a0U+lSQgr/lQRLYJF+3Dw2yLtRpdp3Lb
         4OcmFV0kFDi7A2jzPZChQU2Pa0G5CxPxAqhhoN0NaZsaQZlAtWX4ecxbDgzw0wjdaU
         j8HCFmrvGTgdfkouKwGypfSzJxVZ61bfuvExYngXzTZSjbYL6VTCeDriPW+0mSSUY5
         TIacC70xyXKew==
Received: by mail-wr1-f72.google.com with SMTP id l12-20020a5d6d8c0000b029011a3b249b10so3304056wrs.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 08:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TEvW673M4tlEqNAgqaz/ijFkYi/5QPh9cKHdp/b4gIY=;
        b=DxL/8iNlrxYRwz+zcZ+MYdgZ9tMN0HDWbCjgS/K4uHDu2mTWit4B5Lg3o1VNiPjQjm
         YXEhyN1Mral2TO6idIQd6hG9+zs2XJSoqgNSjGO08L0E0ww86aMN+n3k9BNMPuau+vuI
         HDWIxj0S7iYyD/zsrVtDhpv13dCiPiwUjnrrActd1rhUfbhIHjqRenRLXPW1Rf4DcklW
         ZM2XnqruQfcyp77cZyKEhkKt5DqGJTCl2Bje71M2pbkD6IxnA7a2PPC/1/O+mHDFygUM
         4Yqv4ZTuPgqE/lVINWHVeqoeWaTTn2uBL2hnOkuy5xZaJ2l/VvLrQaYKx0uwE9MOuhIS
         6ZTg==
X-Gm-Message-State: AOAM530uLtHBRW+SfjOZfj2aZyYcL1fupPkd8s8qF+GQ6WF7fOnUZgDi
        fhtoX+hYTAkz7v/KM0w6DKND6f9/j4smn+Yo3EKiKu691RPMI3tOC3PSfIxt9r4abZjQh2fGNG9
        0cn0PmN0shXad+f/FJ5uC/gT1bda9xIvBZPWvBkNAa9QDmlpE
X-Received: by 2002:a17:906:2d51:: with SMTP id e17mr3031135eji.500.1627658749654;
        Fri, 30 Jul 2021 08:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGrmbK76jzm7R0wU9rDjzOLSuvi09IncVRLsAPOuK8inPZj/nU5vtfrdytg3IgHkG0o3Lyzw==
X-Received: by 2002:a17:906:2d51:: with SMTP id e17mr3031123eji.500.1627658749527;
        Fri, 30 Jul 2021 08:25:49 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id p16sm826354eds.73.2021.07.30.08.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 08:25:49 -0700 (PDT)
Subject: Re: [PATCH 08/12] MAINTAINERS: Cover Samsung clock YAML bindings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-9-semen.protsenko@linaro.org>
 <CAHp75VcugLnV6D8xhkMHuW-X6LCtHDDnghD2G+vqwYmRvFP9Nw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8202e9f9-06f4-f1ba-4f30-e1a0c8340450@canonical.com>
Date:   Fri, 30 Jul 2021 17:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcugLnV6D8xhkMHuW-X6LCtHDDnghD2G+vqwYmRvFP9Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/07/2021 17:06, Andy Shevchenko wrote:
> On Fri, Jul 30, 2021 at 5:50 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
>>
>> New device tree bindings are usually added in YAML format. Fix "SAMSUNG
>> SOC CLOCK DRIVERS" entry to cover both txt and yaml docs for Exynos
>> clock drivers.
> 
> Fixes tag?

No need because the pattern is correct at the moment. The patch does not
make sense on its own and should be squashed with the next one.


Best regards,
Krzysztof
