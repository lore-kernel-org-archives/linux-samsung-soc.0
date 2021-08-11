Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47354C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2566D60FD9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbhHKGpp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 02:45:45 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:32956
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234835AbhHKGpo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 02:45:44 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1B8933F102
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628664321;
        bh=gmY/J/A33Nx43ZzHIFzZWs91cvzZlKl1g6yirbYjAYw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rGTxJX2i6cMZYpbTGYYGKuK2R497CMsziU0rTK1qivTi/C/wi4Vxdi/oYdoG6TXZL
         iVQMZhv7rZDDuREzRXBS4HwilV0v+ro9Dqpg9MrhpKJQBL6Brfi56fyUFphAE/eMkq
         BGzrevVZuOqiLWk8BYk2nzVyWwck9Vp5eWT9ubEu1icXlipCC3Ha8LAoxo76nRjeR3
         s6Z7KesOdzf5M2vk1c7JMHO1Q/5SXYUrfFfhSL/atQtmCn0U5yxZ04VdTapiO7HGZp
         CH1G9mMDONVjYuA3zuwfg3T5yJDySPgukhv6hOiTZOZ33UtG4ktQsiEvvXSHziGp9i
         Nk+UcdPRgWWGQ==
Received: by mail-ed1-f72.google.com with SMTP id dh21-20020a0564021d35b02903be0aa37025so732158edb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 23:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gmY/J/A33Nx43ZzHIFzZWs91cvzZlKl1g6yirbYjAYw=;
        b=rUbQTeuSBb9tXDo/437NOBiBdYpFucOC4rqty9O/RWiC3eO/5b0EXWqXF1WBOiZGcS
         5Lv5l2ZJEPP42AmAApIuexPN0B9+nwg/4eJIy5XXuLzNKw2L2Yqbo4HA13LVyvvPMrLN
         LzC/OKAkfKfPf0tVeaf4KDITSP4u+YicC3an+F2qiTGaTqMBId6uwCPOpwXcOkb6BIT7
         qW+VqieQlbLDMHM6zOH8/WLVtbrStgQRGNHJpIz/+ZDKraST5GvwRS8vdH7TE+2PXOLD
         +uJnUwMmzV021PhX7HZid1z16s+9NafAAzlu/VvR4n/PE/bN9uAaxZ0tVFvVyQWl9wWb
         dcfw==
X-Gm-Message-State: AOAM531wUBhp8S/0T29r/u30Viq3rt/iW9k2CflNicVqxUpSyks0ciqz
        Ovz/x3OhSrx6QSwWoV6oMfwBrfDeZq3/01W6VQZ0OZE96LI0GXp8JmXmf6b62hQz8KfJewntwM/
        5cMipzyfMg3XNcwkYPph/97FYR2l9OSp1XOHXwzTzeNUKybfe
X-Received: by 2002:a17:906:b886:: with SMTP id hb6mr2214608ejb.13.1628664320878;
        Tue, 10 Aug 2021 23:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeQI3Jl5IBCJ1wbuMCYAH2RdwJTbWq0SzgphVQ3VMfqTXOBz/h15Zxr3R9LY/NpsIUu7B+YQ==
X-Received: by 2002:a17:906:b886:: with SMTP id hb6mr2214598ejb.13.1628664320762;
        Tue, 10 Aug 2021 23:45:20 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h19sm10827579edt.87.2021.08.10.23.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 23:45:20 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: samsung: add bindings for
 Exynos external clock
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-3-krzysztof.kozlowski@canonical.com>
 <CAPLW+4mKv0Azi4w2S=Ono1gpghmBtfy4QpaRBjtHkgrUGZVW_Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fb4cf910-8465-7efc-184f-eef691cf614d@canonical.com>
Date:   Wed, 11 Aug 2021 08:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mKv0Azi4w2S=Ono1gpghmBtfy4QpaRBjtHkgrUGZVW_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/08/2021 19:49, Sam Protsenko wrote:
> On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Document the bindings for Samsung Exynos external to SoC
>> (oscclk/XXTI/XusbXTI) clock provided on boards.  The bindings are
>> already implemented in most of the Exynos clock drivers and DTS files.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
> 
> Just want to mention that remaining users of such fixed clocks can be
> converted to regular fixed-rate-clock, and then this binding can be
> removed along with samsung_clk_of_register_fixed_ext() API? Just a
> thought.

Removal of samsung_clk_of_register_fixed_ext() would cause ABI break,
probably acceptable for these devices. Yet still, someone would have to
do it and test it.



Best regards,
Krzysztof
