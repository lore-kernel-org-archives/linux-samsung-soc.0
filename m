Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC2CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Jan 2022 17:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235846AbiAPRKO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Jan 2022 12:10:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43042
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235775AbiAPRKN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jan 2022 12:10:13 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A0EB23F1EA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642353012;
        bh=EhxJCJbUdgTgKtzOcyBHRUPuVpieLDdqxSMQQuY+TMQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YbJL1MwIXhbAMcHxfbsiQMfuB6I4wov1U/tsdt1wnnCdHFTEHA9aUJc7ut/noXbju
         EpNNJTRvdoDGBAq6ui0IVsmp5MoH47+WTgITMQs4lWTKpMc7kGlkM57s6imYFqJT3C
         tgYsu0piRutUQNve6CoVPqY9UE7EWWYs2W8tNM7EJZPTTiGDrvDssBMU5YHsLId1of
         z6KjtIAQxQ74jhBR7oWcXeyQJuW4zDTfjYqOtQNWHCxDYvZ1E5HXgn9f3kxeNOeZEY
         YIJD1hFKOdG5GSJcMFKYaL0YejNGQyLgIRtiKvtiuqg5anRiJKEDgf4nIonFTEunSe
         E1Lpu/R0QJqVA==
Received: by mail-ed1-f69.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso12255112edw.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 09:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EhxJCJbUdgTgKtzOcyBHRUPuVpieLDdqxSMQQuY+TMQ=;
        b=XU9oLBSMrgsjk0iMkqFjyjWKvEQO2cGRBOweMP5HCXfTke1mfl6NO3FI5zo5Dz15hV
         /Ociq/ZjKqQN/VMtDB7xB8o7ChuXVdBmKkqlwZpd/ouqqqE9z69oZqWK2J/Zry0j+nNV
         WHgKW18NAhWQgV6BZbR/DsRi6OLWyNUBqurQAjpkKPI0qK3/SgVjkKQUNnwYXUwHgQBe
         7NeV/gLldmVC9auaWAL9IWLbvPe5gYMy5qbxuqEgER5f9tVzx/SQCgQst5xHItyK8+vC
         8u3eu0ESmIKiSdJgyYaago3hcLRckXgs6Wa6lYhGKuMu5bCT+b5jjVvas6j9YgG/ehq2
         eQTg==
X-Gm-Message-State: AOAM532kgmUm24JxgEWC8gIC206TWFqv/4bNiFd45w6761f5PYcifnIk
        R+ZPtU6QmhxXLth5t5yakfLdHZ7L+8j1qvXJF9O4vEikK3XFmnM7ZpohLF1livx7hgBQr32Gzm5
        uvAep6eWwTSRZ0zcMrEtDIP4le1NyrQli1dYz0Opi82kieVwC
X-Received: by 2002:a05:6402:4382:: with SMTP id o2mr17362761edc.38.1642353012268;
        Sun, 16 Jan 2022 09:10:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza5CxAsjW3okTGXopRWNrhyQPGIvdCMmcUOjfP9egRyMTlefnsZXuW0WKLs2dmgxPbUpWabA==
X-Received: by 2002:a05:6402:4382:: with SMTP id o2mr17362749edc.38.1642353012118;
        Sun, 16 Jan 2022 09:10:12 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l2sm3117556ejk.187.2022.01.16.09.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 09:10:11 -0800 (PST)
Message-ID: <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
Date:   Sun, 16 Jan 2022 18:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to
 dtschema
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
 <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/01/2022 01:55, Linus Walleij wrote:
> On Tue, Jan 11, 2022 at 9:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> 
>> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) pin
>> controller bindings to DT schema format.  Parts of description and DTS
>> example was copied from existing sources, so keep the license as
>> GPL-2.0-only.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I expect that you will merge this into ARM SoC with the rest
> of the DTS fixes?

Yes, that would be the most clean approach, although there is no strict
dependency requirement between bindings and DTS. If they go via two
separate trees (ARM SoC and pinctrl), there will be a branch when
dtschema complains about DTS, which is not nice, but also not fatal.

Anyway DTS and dtschema will have to wait for one release, because they
depend on samsung pinctrl driver change (patch #2).


Best regards,
Krzysztof
