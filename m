Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104BBC43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348220AbiARSlc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:41:32 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36968
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348200AbiARSlb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:41:31 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 57C603FFD0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531290;
        bh=d4x+4xkW9gXvjz8GkGAmId26UTghAa2V8sVHpI1V4fA=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=Ra7QNSjMIXNCkgKOKRF9jtLidMIAKnsvSsAO6lk7P01IJlR8X6EUeqHtM5aWuJPiY
         lESaQiKgyLzBfPJ7cRkZeFWdp3dgo4tx51holdH/IsXkupl5CNY6dpAcMZPmTh7Dhe
         P/YNFtPO2rKQkH8Qng7gyjPG7SAcpeWtRjOtZC3yt57pXfbynuBA94L2rfaK+ASNos
         rDOgdB0W2UCKB/zvrzeqS26X8oS2Ss2L40YiG+V53pnHlRGP+PeWtGzn/CUI30jRF5
         4PobN8aBKgugaXRrUb7jMlecKmppk/iRG/wCBwU9vO+6Uy1cIM/F7O9IHavOINLAP5
         5b4hv2Bmoosmg==
Received: by mail-ed1-f69.google.com with SMTP id el8-20020a056402360800b00403bbdcef64so1932491edb.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=d4x+4xkW9gXvjz8GkGAmId26UTghAa2V8sVHpI1V4fA=;
        b=dprHB8XSyAEVsWTLhgfmPDGx+Vnl8BhpobuYteWqx2L+uN8ITuqGynq3wIhgGgB/3F
         8HsobCh1xRI0zT2HthjVKU0OPH3jtNJNySwcxQUYUzs0NlIr4qJ3f+caQxsoBBDVmrjq
         NaT0rgJ/fbA75cQhTrLejjt0LHYe1Cy4vS/Sh+hBFCKjvttn6+nKflwe7ZBl8JjRfbiN
         WqrLcjRV2Qb2pBV8KkgqNEUFxJQoFiU1ZBkdbSRng9Uk0N7WpWWWHZZSUz54ImjlEWoL
         tCPmk4bhlTVpYhpum3BqfzG3M3rHyF+DW8OLtSyOdITbZxv4evzOz7F1IkphhDELPBXe
         Yekg==
X-Gm-Message-State: AOAM533fJQJYiF0uHoxZKcpGpML0yUjZLagEIW7As0hQQ4wLuJqBor+t
        kpG7oAruNRBcYrACCqQMKBwEbGtzKuyXQh8fDSK/mJG+jIq1gi9TniVlBBuZhcQUofghgSHmSB9
        1KWPGJJGllG9drKp2jJ1FwNy4EVzrllwewQilq8M+1MRwSkeh
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr21220021ejc.320.1642531290051;
        Tue, 18 Jan 2022 10:41:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkNLpeCkuJ++ObHkzVuFE7m7/DGI74fZq5o+MQ9EhkoIL7QVnicxdhEZRzU5ffTMqzfAwbtQ==
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr21220001ejc.320.1642531289843;
        Tue, 18 Jan 2022 10:41:29 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c30sm5719152ejj.190.2022.01.18.10.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:41:29 -0800 (PST)
Message-ID: <25795f7e-8e04-aaae-db47-05e5016a1890@canonical.com>
Date:   Tue, 18 Jan 2022 19:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150104epcas5p4ac6fdc739d21c7d7eb2e53e469466487@epcas5p4.samsung.com>
 <20220118144851.69537-14-alim.akhtar@samsung.com>
 <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
In-Reply-To: <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 19:40, Krzysztof Kozlowski wrote:
> On 18/01/2022 15:48, Alim Akhtar wrote:
>> Add device tree bindings for the Tesla FSD ARM SoC.
>>
>> Cc: linux-fsd@tesla.com
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>  .../devicetree/bindings/arm/tesla.yaml        | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
>>
> 
> Looks good to me. I'll take it via Samsung-SoC after the merge window
> unless there are some comments/discussion.

Wait, no, I won't take it, it's not Samsung Exynos. :) I guess this
could go via arm-soc directly...

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
