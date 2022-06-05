Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE0CCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345907AbiFEQP4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345605AbiFEQPy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:15:54 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D144D9D9
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:15:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id kq6so11722804ejb.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q4xvebV0XpbZSZUkLXPf7W0/7Coc/c8ZBxn+5C67nfo=;
        b=ToZ5kP9Kz/Gl10P/HKmRpWlKQkXqmNdeTM+LNVC9njW6AT0pH0xVZjrKOFMF9f3Mez
         AcF/EXzFS58WnSELEpFPVPByzmW2A97Z80IRjtKOGQtD287SCpazq6TM0+NDayFP0Hzh
         p6wU6Dieof4JIaLDgkaBi1bM+pQagMygZFU2FJBur0Gv4O1k/0oiTvvkzT2eDdgAbbr4
         E/ADr96nj771HkAQ8M3tsXz3SRGod5gtIPSo7d138A7JJoBnLThPqxp8HYVvzC6GtkU0
         rppQermXFhcX51h1rqSJPu6KLJ3YCLozwHZYQ0k2ek3SJRr+2VP8xGpeSbqluAiZ+Xug
         qvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q4xvebV0XpbZSZUkLXPf7W0/7Coc/c8ZBxn+5C67nfo=;
        b=kjF17GRhObdExfoWdjBZdseRNET1WY+RDWGXJnjVlF6ClENEVOHpaCJNHW7Mw4gLnI
         Qnu8w2QPx+GreFmEIKmfpM+B0QJ7dmvQG0xjL5Sz5SJH/0C6YaDVJPa0tzB93xWInrhm
         p/fK67MrfOqwpSQYpBX00CmA4oiZHuuGPZBxkc+rnCFsxJd1WhFd1u12/tT/FtObHEMt
         8LRPGBWV3t/8nM4Eghj10PMPBeEQSdepBnbkWw+ee5h+xPnH5iW22JaoDCqfG47Em78z
         r4ku5EzG3/N2Krx7BD4dgLaN+U3Vuz7hCyQhrE6uwNOYlfch1DcYDCPGiD+9YTju1diC
         lbgA==
X-Gm-Message-State: AOAM530t5jzqqvZWpmzctNbZryD3odCOdJpAl8bCmoJ46SQkRFn2GVc1
        snRQiFmAOL3w8fANvPMVC3iw1A==
X-Google-Smtp-Source: ABdhPJxSk6GbCqAjHVAFLDzd36/7DDWGhmcFeX1F2x1nAxkiNHAdgw8zDJgf/YKTF/YzV0jFi2Krxw==
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id w14-20020a170906b18e00b0071026db7a53mr9222702ejy.290.1654445751496;
        Sun, 05 Jun 2022 09:15:51 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5196258ejt.122.2022.06.05.09.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:15:50 -0700 (PDT)
Message-ID: <56ef9076-3dae-31c1-defd-c3c24d55b82e@linaro.org>
Date:   Sun, 5 Jun 2022 18:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/5] phy: samsung: ufs: support secondary ufs phy
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
 <CGME20220603020426epcas2p3f50ebe570e01c7f10972a857659a5625@epcas2p3.samsung.com>
 <20220603020410.2976-6-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603020410.2976-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/06/2022 04:04, Chanho Park wrote:
> To support secondary ufs phy device, we need to get an offset for phy
> isolation from the syscon DT node. If the first index argument of the
> node is existing, we can read the offset value and set it as isol->offset.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
