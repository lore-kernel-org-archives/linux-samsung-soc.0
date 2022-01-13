Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7B6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbiAMM6P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 07:58:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54886
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234854AbiAMM6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 07:58:14 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B329440012
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642078693;
        bh=hJY+iTJXxh7N+a9cAeVo6uxkvEx09OIa8izcVhHm85o=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=IpiOiteyx37tD2UyrUeK5mNYpNoOsKisp5MwmGQKRd5q6ykDlmeiueHw/f25wzcwS
         dRPq/SZ/syX4AAoDuTH/KZTtZuDjZY8vqqnsXWBZQcDyZyO+Su6ElqbZduexksAmwE
         wf6QdyWj8bKiLVtgTU7rhMADdx1wimlHMO8CJfSizAhs+YVUnck6LAshzCkOM/yM+V
         YiAp795fOuRixIXN+PXSmPtWcZMX3eVJdLUTVpZ8IH7Dt5hAfSqKJ6aqOJiUK/jTrM
         IeyLJS+/yyGgeH17+MZgAo8A9MIS4e88AT+FYiyzJa+nQ9EGs9l4TBLPRR7VuuxBre
         FElAl+lC6W5bA==
Received: by mail-ed1-f72.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso5255583edd.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 04:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hJY+iTJXxh7N+a9cAeVo6uxkvEx09OIa8izcVhHm85o=;
        b=KIVsOdtjaz6IjGyE1UHUo4R5CtTu1bIJu1WUfEFt7n4+37WijWRyEarlkjyBisCz/2
         6yvg5OAI53Hpzj1D+Xg/0oMXHJJ8187dpoSdyGRhoi5D2RXtxqBqhgNaoICXah9O9X1c
         ljAqLT1IR3+MnUUiSdTkxOb1TLtA+bsb+TLd+AdUlPTrcRsJf3jLyhv/Akq5ZG2i8y2O
         Gz3MFpfbACvKV4xZB+WIyC3hbG+r/cYTKd6luhaMhq5Qq3CiC2OA5VS0b7KLCIHgjs/4
         1qA3KAMZR3MuowI9RCyuJloAFnKBI9OW5tQLMGl1t24ynhxbXBSfQESvUVvF0mvEwnIF
         AOKw==
X-Gm-Message-State: AOAM531yQUOQFHHZpjyWi6fGuNuf1KXzEtVyW6Nu8h3VjOZklfBK7lhg
        ChKUy11i7avAEgx+Y45lHCub0tbbLpX76rOn91ZZBJZnD6s+M1P05+CdT4+WW0xwLvyMVithMHk
        iFNVFmRu9C7OHzIPMQNduG90GpxLu1F/4wh5vGYTLJhEXivBU
X-Received: by 2002:a17:906:2890:: with SMTP id o16mr3429784ejd.99.1642078693395;
        Thu, 13 Jan 2022 04:58:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJz/KUtwGDsFrbTAXt/C7unJ3bAy1RqQ2PDpyX9XObENafua0PnOgc/W74tPU9CS4vGKDuoQ==
X-Received: by 2002:a17:906:2890:: with SMTP id o16mr3429764ejd.99.1642078693221;
        Thu, 13 Jan 2022 04:58:13 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id kx19sm865643ejc.112.2022.01.13.04.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:58:12 -0800 (PST)
Message-ID: <176af0b0-a324-da39-2848-1c2e01cfadf5@canonical.com>
Date:   Thu, 13 Jan 2022 13:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 12/23] dt-bindings: add vendor prefix for Tesla
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122404epcas5p4aa1c3ac09510eb55cce5fdd0791993a6@epcas5p4.samsung.com>
 <20220113121143.22280-13-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-13-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add vendor prefix for the Tesla (https://www.tesla.com)
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(

This should be the first patch in the series.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
