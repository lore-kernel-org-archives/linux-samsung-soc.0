Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969DEC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Jun 2022 13:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348873AbiFUNLW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Jun 2022 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiFUNLU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 09:11:20 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121111EEF3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2022 06:11:19 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o10so19313856edi.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2022 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iKG7ipis6svDRJZdPtz2/v7PW+5iNIJmzZjHALS7NSA=;
        b=okX+XmWFVy8JkpopHuzLRfgSke7JTv9kr3wB8aAZYW7uPFgGtBNefvBCzCyVSiD2HY
         TnUi0Ww2tDe/iD32IcnsZcbSSPly/JQvMmMcTC95dxbVfXqlV0Oj+1EtG5LQkRBhj6AT
         4Lr8qoiBBS9N3HvMdWPHUGFj8a5z2FnZCngklGjalL/tVkMuaHywyOyaJ2+S45XkCky2
         X/cFcjcDmKY6TZw5/yaaHZ8YQRFHBZ6DSEPFcQGQ5jyjgr/uIuyX82plxGm9LxkOVi6f
         78GBh57ZNFjKjSoKxxdssEvscwQqRR95ejACIeFNNFrY7WMO63gX3D8zse3OsiXEA0h7
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iKG7ipis6svDRJZdPtz2/v7PW+5iNIJmzZjHALS7NSA=;
        b=hOQYKOxSAG/+5vV5HOQZzrUogP6U4zQAYVXy0QClrw296Wzbjf05DHriOVnSpD7Rql
         jCdv3oD8CDnFn2pV9BteVB+X4/L4xA0uxGTVCOjkYwz/ZfrokvvKRhiph2POSqKcqhCm
         hmioUgcIJ/WmmkObmGyQ5tLAU5babYBqnN/x7loDOS1bvbayQY75fCnFeh84ooD96N4B
         /Xm9QN2kBzqlBJWHToAtXkpaX5YQXyyB04HyXZ/fnpx/dh2zZwazRBdnPut8LRkED5G6
         LSDH/vESKc5QKwUDZ+O7WyhoOtivIwI8MPofM4npejNmmmKjS6/8E26ljmB9axJvSAP9
         PmVA==
X-Gm-Message-State: AJIora+4gCiliLPlRomBLeoPKkbsTFAKj0IUu0CHlZdAiWpmGd3SgVUq
        2Up7ulhcgFu8db/cH1bw7h5stuAh1EIJGg==
X-Google-Smtp-Source: AGRyM1vKW37lesBOhQl1w2hkQXH+6mMPK7WPBmLgxo70ZkWNzmO3m43rOEkPpANuofDWkYzsHia7IQ==
X-Received: by 2002:a05:6402:2419:b0:435:1e2a:19ce with SMTP id t25-20020a056402241900b004351e2a19cemr35898425eda.370.1655817077646;
        Tue, 21 Jun 2022 06:11:17 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709060b1100b006ff52dfccf3sm7522455ejg.211.2022.06.21.06.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 06:11:17 -0700 (PDT)
Message-ID: <d0f3bab8-fadb-709c-7118-20e23fba1dc4@linaro.org>
Date:   Tue, 21 Jun 2022 15:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 3/4] clocksource/drivers/exynos_mct: Support
 local-timers property
Content-Language: en-US
To:     tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        krzysztof.kozlowski@linaro.org
References: <20220609112738.359385-1-vincent.whitchurch@axis.com>
 <20220609112738.359385-4-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609112738.359385-4-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2022 13:27, Vincent Whitchurch wrote:
> If the device tree indicates that the hardware requires that the
> processor only use certain local timers, respect that.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Daniel,
All patches got my review. Do you need here anything more? It seems it's
only me who reviews such code, so I don't expect more Rb-tags. :)

Best regards,
Krzysztof
