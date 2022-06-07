Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BE7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 06:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbiFGGdz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbiFGGdy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:33:54 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8783929835
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:33:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gl15so19251515ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MrBdSE+grn8LT47tXLayVexkMgaXUe8RtWJBxBXFaqk=;
        b=bnFho8U7nOdhZMVpWkDFScj100VJe75OnkuyHoq42OR4uIYhU90/7FN5WdL1S5BX5F
         7l+inS94sggjLvtlgi40e2NrqQTewUKWTUIrW5vxFbzfOUkllvrxaLlEFPZXsXO9KA+C
         YP1cjAT++nZIF4ixUlk9Q+wPLXj1425e2L2Gc6avVyzDZ/EAPN9gjoj/3zMMEZQZ3CFv
         /oqQYM8gNcwCd7rxbkjeMqk/nUtQnRLnQWbjBk2SjpDs/fe+8ndEbpDb+Fwp9h/h/P1s
         JzyM9Ddj2CNbjD4r8E687StGwMCNPu5p8WQ+LP9lZKSIT9nk7C3NPnGJF4wUpk7BkB7M
         +rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MrBdSE+grn8LT47tXLayVexkMgaXUe8RtWJBxBXFaqk=;
        b=G4USdkoP62T5n1t/HFQap0xGzkL5/NgH4yzR21gqCbXprFLtvCwxPkkVPQLEVzg0n+
         gwf1oLQQVcG5+Em1PNxq//blfoJJTEcmIIovp+X8lv0jVyY4KdwzchvBrKr1XrKQghV7
         3GhG6308gHfAJyZojo0DbZPmzn06sWA8GJUi699b2dZSNW5/5uYyKp5Ia/3hBlxZMPHp
         j8k5cJAEfsdtdoRImFSkG+DwsSHUKlz+m50gYKby61M4A2iJ5QbOk74At330QYA8wXXy
         w+57nCInrZ1q3ViC6W43cgedcyzwEQD6eF7qtVZwriIVrh5MT7lYIh5XX68ZH9A43EJc
         sXNw==
X-Gm-Message-State: AOAM530NhEsp7dgro1hOKqiON/2HwxOmd7dXR3Ths1aH2WG4cjxZbn6a
        VYDDjBvg8qDxPG6JdFiHglUkWg==
X-Google-Smtp-Source: ABdhPJyplNyPIe/T6bYyLSDq3aa3CWsQKbpcGxl+tx+4NoectMYlag5lodWutJKGoaF/yraYpIb5uA==
X-Received: by 2002:a17:907:3e99:b0:6fe:f823:ab96 with SMTP id hs25-20020a1709073e9900b006fef823ab96mr25335841ejc.428.1654583631036;
        Mon, 06 Jun 2022 23:33:51 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e2-20020a1709062d4200b006fec2097d53sm7160736eji.118.2022.06.06.23.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 23:33:50 -0700 (PDT)
Message-ID: <2fad1706-563d-72c3-eab2-5f464bf92681@linaro.org>
Date:   Tue, 7 Jun 2022 08:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of ufs
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Kishon Vijay Abraham I' <kishon@ti.com>,
        'Vinod Koul' <vkoul@kernel.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p407039a6087b6c460d6687b1cc1f3872a@epcas2p4.samsung.com>
 <20220602053250.62593-5-chanho61.park@samsung.com>
 <c86cb9c3-5fac-a990-f4cf-5aa8e4fe8a75@linaro.org>
 <000001d87a2e$6ed35ea0$4c7a1be0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d87a2e$6ed35ea0$4c7a1be0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/06/2022 07:21, Chanho Park wrote:
>> Subject: Re: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of
>> ufs nodes
>>
>> On 02/06/2022 07:32, Chanho Park wrote:
>>> Drop "ufs0-" label name usage of ufs phy and hci nodes.
>>> Regarding the comments of reg properties, we don't need to illustrate
>>> here because we can find the description from the dt-binding doc.
>>>
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>
>> This does not apply. Can you rebase and send the DTS patches as separate
>> patchset?
> 
> I forgot to point the baseline of this patchset. I stacked this patch on top of below patch.
> If you do not apply below patch or put this separate branch, I'll rebase this patchset without below patch.
> 
> https://lore.kernel.org/linux-samsung-soc/20220526204323.832243-1-krzysztof.kozlowski@linaro.org/

Oh, thanks! Unfortunately it helped for the patch #4 (first of DTS) but
not for the next one. Maybe some other patch caused the hunks to differ.
Please rebase remaining two DTS patches.


Best regards,
Krzysztof
