Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351177AbiFEQIb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351168AbiFEQIZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:08:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B1FA19D
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:08:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fu3so23228045ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=V3KulwXriouN7eiOyT0B/Q5x0zkY8WXHHcxmUV9w2Zo=;
        b=UlXeoLoPUmU0nPRjMSnknHIfP9yibqMNppALxbJ7X934DvZCM4ztooLXc3Py/cJwDe
         CReMe7p/hnSh2vbmgVnR+ylX3nwNh2GpZVBlXVCTPiqhKMFEzcSocwR7OaiseQ9DKFfB
         wDbQlcemkkLVg4Gvc/TLn37KYYdzLKZsVdrhOAIRSB3ekYlf0/nvXW4pRWdbLSqnpWkt
         xAcApZRMpmCxrbw5Qm5rWK24hTC8CRzjiRXVXQgcFbsluIAE47UyooL+2gsNa6KQIoxm
         N77asbG4o9m6N9WCA4FQxj+oBMuzniOskF7ZVI/He98Z6rA64O0alhDeXqJqF2lxEKMt
         LjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V3KulwXriouN7eiOyT0B/Q5x0zkY8WXHHcxmUV9w2Zo=;
        b=XRkDP7R90QE7L5smJlfUAxtc+ytd64YmxBUQP9/peM9bXPAzVCadbdFLnRW6vQkCyC
         Nc+FNTb64G0Az6sowE6Z7JRiuO+L2+orSj36YddWDNVWybcLO7YpwqLUvDPQdCbkRrEv
         yu8Fk1Dlb6sbo/VvbWicRUwwqAzlIivz0fQeNgrb52Kecwp9OxXLJnpahoSGCyKwnywu
         NWhZONvouXkYseT2oXmOqJAruGB/uEbwKzUCuxI4OKFEK5O5S7SzBHzzx2gQ32yfkRyr
         UlaVwcWpvGoHz1AP5wlp+crCg4IvdLNFeOYPQCc4RtswUJNBYb4CQ/LzVZ/8y3yUWMkp
         bJgw==
X-Gm-Message-State: AOAM530xJa11P/dBNzszk6Xdj6kvZLvxg6v+leOOUz5Y8ENH0y3i4ELP
        76rjQYoiNF3jDLJm87AMe1TXYw==
X-Google-Smtp-Source: ABdhPJyGaFicfO+SdTtgmzg7DPV7oVp+iUJDVqJZsfzrZ44MneA2ADvTEsKPzPGjU0XMC7eISXgIEA==
X-Received: by 2002:a17:907:a407:b0:704:34ac:835c with SMTP id sg7-20020a170907a40700b0070434ac835cmr17843528ejc.663.1654445301784;
        Sun, 05 Jun 2022 09:08:21 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zo11-20020a170906ff4b00b00709343c0017sm4653430ejb.98.2022.06.05.09.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:08:21 -0700 (PDT)
Message-ID: <5a23d393-1dd9-fe9f-c2d0-7f86e2d1a74a@linaro.org>
Date:   Sun, 5 Jun 2022 18:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: samsung,ufs-phy: make pmu-syscon
 as phandle-array
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220603020410.2976-1-chanho61.park@samsung.com>
 <CGME20220603020426epcas2p43e4c27b5a371e2fcdfa462c564d9c5e3@epcas2p4.samsung.com>
 <20220603020410.2976-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603020410.2976-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/06/2022 04:04, Chanho Park wrote:
> To support secondary ufs phy devices, we need to get an offset value
> from pmu-syscon.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
