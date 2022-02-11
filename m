Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF16C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Feb 2022 16:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351737AbiBKQqS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Feb 2022 11:46:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350454AbiBKQqR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 11:46:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAF1D6C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:46:11 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E44973F1E3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644597967;
        bh=YxosBduSO3gZaGp03eNLZDMC/NBLs1F+fJdwXRbsSfg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=DRnJyiPosef19DAEPhYIcooEp1H+Gs3TJQGChcVs90uucdOEAXNUMqoKGw5M/Hwf2
         ep3SiD/6uVfKf8scBvNGddxkDJLZOoT+rQNNGnUbLgPqFqOnpOhCu9XUdZ6B/oRZRl
         +OJDf59kugUGk6mmpn0JqMvG503sFE0OEQ43HyGtUdeV9uRZRYuw8KJQFiwbIn5VC9
         U4ah2/ppLaGyOE1QUyA/5gpvzeI7iTDGIuiv9YLw8KtFA+n1PRbtq3N86pqNRvAhOd
         AKTwuZPFOg+3JJcaJc5J1aTazFqEiESgs4zmYyNdMwBSpr2SJEX6NxSV0aR/9ONEIF
         ANOMyOqRXSfkA==
Received: by mail-ed1-f72.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so5671814edb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YxosBduSO3gZaGp03eNLZDMC/NBLs1F+fJdwXRbsSfg=;
        b=FDBOFrofu2SLPBXeKFPJZ25iTupeE7QiGDmHimXNOVVud/UrusJR5ZUj7Wa1b67r15
         oDONuILe6+nTU5dKG0XRkVRa9PqjsMtgMVPVsVMXqLZZhtxKGHgys6RfwHl81Un63CG/
         9QZb3vUQKAE8Gs4lUBIbiQdzhwPrvD1Ry6NczyVDCO5pgoqYx3EwBf9lf05WFBjOKcQt
         lTofiwZtzP0H7P027G0vx6Sh3es8R9WtXvVfxhvO8mpaiagIq60zt7xzgUOmzLKzxIic
         AehwcUy3zGO1WlwtoZn1quqQh1ZeOBpEPKG0h8WXz9VrcCDXvZqFqXKBDFDEKiMa7RWE
         /UIw==
X-Gm-Message-State: AOAM5321hPliLfbKxDqHF0XXR3e5rUmwkIqfx07zCgs5EtWTWnv23J9q
        KNueW8BgeVbOvEKdiK134ky8XRUARa8EGzBQFFkbvEHXdDVIA2Y7Dj6BwD4/fUqcX+YXZ2w/irV
        ddAWhx3UwHQ2eynht37TLvw7hUIMD/H2Vvc7jfWqaV+R+q020
X-Received: by 2002:a17:907:760a:: with SMTP id jx10mr2146459ejc.713.1644597967654;
        Fri, 11 Feb 2022 08:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCQMLo7bekR9JiDalKJVPp4p1o4WRdnFgKFrXj+PrAXbvI8p0HPOVADjajCFiI4ufX9F+Glw==
X-Received: by 2002:a17:907:760a:: with SMTP id jx10mr2146438ejc.713.1644597967403;
        Fri, 11 Feb 2022 08:46:07 -0800 (PST)
Received: from [192.168.0.101] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v19sm261061edc.29.2022.02.11.08.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 08:46:06 -0800 (PST)
Message-ID: <3986001a-96e3-f4cf-f825-3bc3eebac107@canonical.com>
Date:   Fri, 11 Feb 2022 17:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: soc: samsung: usi: refer to dtschema for
 children
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220208194119.46022-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4m9u4yFz84dQaMxNqCPauW6JTsOWRo5iJrkexHXOOsahw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4m9u4yFz84dQaMxNqCPauW6JTsOWRo5iJrkexHXOOsahw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/02/2022 17:04, Sam Protsenko wrote:
> On Tue, 8 Feb 2022 at 21:41, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Explicitly reference the dtschema for USI children implementing specific
>> serial protocol (I2C, SPI, UART).  The SPI schema is not yet accepted,
>> so it will be provided later.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/soc/samsung/exynos-usi.yaml      | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> index 58f2e9d8bb0e..f3aae7e0e2e6 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> @@ -18,11 +18,7 @@ description: |
>>    selects which particular function will be used.
>>
>>    Refer to next bindings documentation for information on protocol subnodes that
>> -  can exist under USI node:
> 
> This whole paragraph doesn't make much sense now, because the doc
> links it refers to are removed in this patch. Maybe it's better to
> just remove the whole paragraph?

Yes, I will drop it.


Best regards,
Krzysztof
