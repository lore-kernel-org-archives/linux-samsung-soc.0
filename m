Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11AFC2BA4C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Jan 2022 09:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbiAZJcQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Jan 2022 04:32:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47566
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239195AbiAZJcP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 04:32:15 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 838003F1C9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643189533;
        bh=WceKU4GUOCSUXAyG5xoO2f2JwW1Wck3xgW1eUWgUNkY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=CyqsGe+edJ6joSpjo3TOlvrZRv///kII0v+38SMlYB9Be2UvyD6asRcozd49vS3mY
         wTjmnurH5m8m8CoqQlDAgwCoYNUwlzk+XKiG+7NBSNTlm+qIEukfr1+ovHliiPEgeZ
         ryrs1xd6PbcnbVjfn7CMO7wF1ZWqwGOwxjdu1ImC7e6VBxTf7dumCf/mdOY7htrbuG
         QZRvJ0HbtyvkCaXffNtZ+4F+tVqS2vLHroASrMk9MSKH2bHJ/7mPB1RR0zGVBxS7qb
         /ZvpbYENsTgBh8DZ5qb/KqaJyT8lwYNCj2lMudD+G7hl9dtDi9XVIHTcmn7ytnHNTx
         eVebGYshOEdRQ==
Received: by mail-wm1-f70.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso2299175wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 01:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WceKU4GUOCSUXAyG5xoO2f2JwW1Wck3xgW1eUWgUNkY=;
        b=lbGRf8gIf01hOeNDLTwbMW9Ns0peq1GqElpvPZsG7cUNL9KA91GUD8lxY3wcZ2ml2V
         C9RA9OLgdvzPjnaEDxTsAx6lSlwBwLTCFWOvOVv2c5iAwe1MBDyDuztRJZdccgKlt0AB
         tGoQidvDD84yAWyXPC9pdhfIC8M2Pqf67Y7Q4pzocP97Y52HqrJdzEGqqsbBByUadxL1
         NIvSRnjhgxp1CdV/p8YFzUJoCm2Nb3ZsXgxlmWmafoa6G+vgHBU9Wu63UiMXxrvzUEd4
         TBrSSB3jKwH0Blv+TDztrlgccvH2XL9AmZTlHc01KE6V8nVcpAacxWnH/C0DK6vdIY3O
         Vw9g==
X-Gm-Message-State: AOAM5327idtup72jARoRuzD2MVekugX8YKFvpQDyO//0RHoWbh2wOAjg
        dcmCVSgwe4sA9Hrepyw8//F7sLsKuV/R4511V9iFmb3cN9PnRcwqA7liT8bTyDXPKCxdE3OYg0e
        JGDkyoWZJxxc5KsKyAqrk5bGyrKineGmvcn69uHH1OH9/FlPB
X-Received: by 2002:a05:600c:6028:: with SMTP id az40mr6581975wmb.33.1643189532244;
        Wed, 26 Jan 2022 01:32:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDMFOPvmZNRYM0TyiLEwnvFjDMYmMANHOlkBtlXLzmxVacPKfbDDZu4cfqCpl6GROy6Yd5rA==
X-Received: by 2002:a05:600c:6028:: with SMTP id az40mr6581951wmb.33.1643189532005;
        Wed, 26 Jan 2022 01:32:12 -0800 (PST)
Received: from [192.168.0.60] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i6sm2803605wma.22.2022.01.26.01.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 01:32:11 -0800 (PST)
Message-ID: <31da451b-a36c-74fb-5667-d4193284c6cd@canonical.com>
Date:   Wed, 26 Jan 2022 10:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD)
 SoC
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, sboyd@kernel.org
References: <CGME20220124142850epcas5p2f82243b87386b3d49a9302c87e015d6b@epcas5p2.samsung.com>
 <20220124141644.71052-1-alim.akhtar@samsung.com>
 <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
 <063601d81281$5492d620$fdb88260$@samsung.com>
 <bccd3ad0-7862-ef3b-246c-71463baaca52@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <bccd3ad0-7862-ef3b-246c-71463baaca52@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2022 10:21, Sylwester Nawrocki wrote:
> Hi,
> 
> On 26.01.2022 07:52, Alim Akhtar wrote:
>>>
>>> Thanks, applied DTS/soc and pinctrl patches.
>>>
>> Thanks Krzysztof
>>
>>> I expect Sylwester will pick up the clock ones. Otherwise please let me know
>>> to pick it up as well.
>>>
>> Hi Sylwester, hope you will be taking clock changes, or let Krzysztof know otherwise.
>> Thanks
> 
> Krzysztof, can you also take the clk patches through your tree?
> If you prefer to avoid it I will create a topic branch with the
> clk headers and DT bindings documentation.

No problem, I'll consume everything I encounter :)


Best regards,
Krzysztof
