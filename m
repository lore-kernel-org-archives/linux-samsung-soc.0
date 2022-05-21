Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C09CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 May 2022 14:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353520AbiEUOGz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 21 May 2022 10:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346239AbiEUOGy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 May 2022 10:06:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7980459956
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2022 07:06:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id l13so11946751lfp.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2022 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G/JiRdkydlLW6miQGBKIde5cpkPs5X1Fjry1L1VttZ8=;
        b=kyB5ACp5DuAfVmlH0VGXRH77XLo8B/mgLfzsfy8jooXJhmFYVW81Oja6/l3xtcOTa8
         MM0A/6I5qcbB+I3JU/nsraWIB5cYHPZa3iw13NBrxS67gV3dFCghgpj9i2xuahlWbrIC
         gBKWxBLL6aoVwoIFDpahsY+rTT5ek7sLMfMZ3wZ7zuz+EXgcXVV56rzw3sGAHiUjJCk6
         gEy+UDsYF77Gig16w/+57VmWd+zpmiPQCXU9OlH7mqPLRGBoswRYE92/sB3+4oExf2kF
         TfvkcF37exSKXoC0e6xeaBrloQmxW8z2u42+XhGtadIPZH1hnteqxxZWAOPgWiwrc5al
         VzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G/JiRdkydlLW6miQGBKIde5cpkPs5X1Fjry1L1VttZ8=;
        b=6daSJ0Jx0tNsXH8E/KRv5xgSsFk1+CqL2/GBiRnCLHVcf47PF1GXODVb/WjelTEpCa
         SMyO4N6EbuAfEU3kh8TGo3m8U8fl2xami8t8KTuUK3uCQzAiNJ0CMsYsuROvTWqqCyMx
         TNhXfHsPkXa+rK7H7ZmgXJ+UYdLTJjtArHYMPreu5eu9bMhUHwRyfrz0uld7x7GlTENW
         kgBzLzjrh5frL02194u1k2u5QKgiI8SqwRr7aEpIt8VcJYw2Y+GCUKhcrO+NdeesOJZx
         KkZwVkq2VnHAI6xFRX8L+e1I4ywANklmICPO/HBD6sO1MT2cK2zuh+6b1//NV68IwLXh
         nqqw==
X-Gm-Message-State: AOAM531uNwTVxmmY+4yU3oX7l2pL60VCb7PaO0x5TroII8O0N2TvQtEq
        d2KeSL0aYUPUp1aFflSRhtL8Ig==
X-Google-Smtp-Source: ABdhPJwXkIO/E6VJ/I8iMFuOXFk5pyRswYiniF2BoI2fFc5koe9Rg/H/T076e7mIyPPEs68Svxv3eg==
X-Received: by 2002:a05:6512:b83:b0:44a:9fb7:784b with SMTP id b3-20020a0565120b8300b0044a9fb7784bmr10379431lfv.547.1653142011456;
        Sat, 21 May 2022 07:06:51 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o28-20020ac2495c000000b0047255d211c4sm1065940lfi.243.2022.05.21.07.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 07:06:50 -0700 (PDT)
Message-ID: <4db8d4df-9cab-a53e-ddd4-84479af46ba8@linaro.org>
Date:   Sat, 21 May 2022 16:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dmaengine: s3c24xx: fix typo in comment
Content-Language: en-US
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220521111145.81697-46-Julia.Lawall@inria.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521111145.81697-46-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/05/2022 13:10, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
