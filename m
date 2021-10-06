Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39003C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 208C56115A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhJFM5n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:57:43 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49990
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231512AbhJFM5m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:57:42 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 386103FFE9
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524950;
        bh=iFs/8t2p0utw/cP9IG0B+N9Nu0IFpPSN+vPgOU+4tTQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=gnaHsB4TjacDgUMxYcWsGBKDgj6ETkMxZPjgl8em3SbbvAKcsYnNLWKbyovtYPOCA
         HrkpAj33cYp7KZ4EmBM4qPGgueBa2h7LVLSQvLB9se3sEWyP0F5mn9n94FEH45UvFT
         i/YtOVeDV+w7AgjtdPDVNyuQGfR7OePaq4AwAJJSAfmKyI1PK1SVSEv9ce7hXbs4P+
         DXjIKiAJWRfTb0BrhGUMUZ2M0HNX1n1TCrJryeJijIN1DzxVPpFxRu9XvzJDNQAc2n
         nGth4sPccWhquXUe+tOhtzi5K7AyibOwW0TXMl77kuigfMd76CMtQZRqjGdVPyU3Xd
         ncKk7m7Gey7Qg==
Received: by mail-lf1-f72.google.com with SMTP id r14-20020ac25c0e000000b003fc149ed50eso1909090lfp.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 05:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iFs/8t2p0utw/cP9IG0B+N9Nu0IFpPSN+vPgOU+4tTQ=;
        b=sIwo+RFYgcEcG2dTFiyG4Py29w30ADpzngjBDL2oJ7jc3kiXDcSlKSR9otANJd/h1f
         UZjWftxNIwkEc5nlk8nkLLfPqJj4LVYSS/A+mGI3sJMbPHwkKzoQwExSkhmIJ0cDhlzp
         6rkXGovADkIMlV3dVnnorTEthxUwJmsBVSohI6H2ZENm6KQaZ6Q1oIbzq/KjoZP7TcOo
         b9KB6HRRyNTXurnLiooH+5/f+ZM5Op4xYGpWoN+HUnIbZ9IBx7g1xEiNUcl/+5nbJt7F
         5ejO5MO6q/JeSH+pS6JV1B3qZ2WBp/l/pWITudfhbjS5rrQvXRyqKU0hMe2BaMHMi3/j
         1Yng==
X-Gm-Message-State: AOAM533gVVJchV+T3ewX8nkovXd/SWB4Fb8V+DKR1TbRnrp60o9FZk13
        Zl9zyRgwH+jVb7hfkfLI6cfDQ4RRAePrtpwkJfaJB+DwmOvFkiPgYceO5CYuKf6bnnYUkFNh3Gw
        8snyGO//RwrxbGy63tyehVeOWy2msR0nPcmQq+WiQIPy7Sk0j
X-Received: by 2002:a19:7606:: with SMTP id c6mr8052827lff.658.1633524949328;
        Wed, 06 Oct 2021 05:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx63BAEC5N5BPTXxbHx164yFb6F9c4H1IYobwbh/wc690q8zkKLdnBdIXP3X6tArYGLz+pQ4Q==
X-Received: by 2002:a19:7606:: with SMTP id c6mr8052807lff.658.1633524949164;
        Wed, 06 Oct 2021 05:55:49 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i15sm1147603lfc.11.2021.10.06.05.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:55:48 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
To:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <YVxBuEvHVdyDvaGD@sirena.org.uk> <YVxP0+kVxI0xQmQQ@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <41226a6d-999d-b1bb-d6a2-294a9e34d271@canonical.com>
Date:   Wed, 6 Oct 2021 14:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVxP0+kVxI0xQmQQ@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/10/2021 15:14, Lee Jones wrote:
> On Tue, 05 Oct 2021, Mark Brown wrote:
> 
>> On Fri, Oct 01, 2021 at 11:40:56AM +0200, Krzysztof Kozlowski wrote:
>>
>>> Merging/dependencies
>>> ====================
>>> 1. Regulator related binding changes depend on first two commits (the
>>>    fixes), because of context.
>>> 2. The mfd bindings depend on clock and regulator bindings.
>>>
>>> The fixes and bindings changes (patches 1-10) should go via the same
>>> tree.  For example regulator or mfd tree.  I propose the regulator tree,
>>> since it will have also one driver change (the fix, first commit).
>>
>> Lee, Stephen, Michael does Krzysztof's plan make sense to you?
> 
> I tend to take cross subsystem patches.  MFD is usually in the centre
> of these scenarios and I have tooling to easily set-up immutable
> branches/pull-requests.
> 
> Always happy to discuss if others have different/better ideas though.
> 

Another alternative is that regulator patches (1-2, 4-6) go via Mark who
later gives you a stable branch/tag to pull. Then the clock and MFD
bindings would go on top via MFD tree.

There is a comment from Rob which I will fix in v3.

Best regards,
Krzysztof
