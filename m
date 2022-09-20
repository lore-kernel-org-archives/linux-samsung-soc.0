Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F51C6FA91
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Sep 2022 14:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbiITOWb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Sep 2022 10:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiITOWK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2022 10:22:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D29B46
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Sep 2022 07:20:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a8so3990880lff.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Sep 2022 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Eh2LQRT0Rx3iFyYK4xw6+ip+TFjiIifMEJCdTff73EU=;
        b=hgGlbX3Q+iNiEU6QrKzAMyM4NUdWObFNdyrjzItgO0hfONFpG3kGZLMHNAyIcQQdYM
         hkOb216nm8kXF3tEy4f4dYu5fz12yjJlUDGyHdbw0yV5I3oC/Oa/q6UtIMPm2ifgS3/j
         /dHDZDraX1V2o2SgLVOSOL61wEQf64y5E6mxqZEwbL3p9rMPm6uMcNyvnjdq7oYkzpRf
         MH4b3+qGlRWg5GSpo6aWlHnL1/Tx36wvxQAix8hZPpv2Fag1kFLqeMPsV3Fkdn7Xla96
         zF2I232b1xuhGrwprr3RBeKaaW65TgmovkcPdpAiHPLiyZoYvjghndI1DQvQOzpH8sw7
         Zy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Eh2LQRT0Rx3iFyYK4xw6+ip+TFjiIifMEJCdTff73EU=;
        b=xQ3GONCkIR8j0ky/EsibLpMnauEJB1perC99b3P0o9F0/aeS4klT9KnFJpb9tuE4o8
         UR5lcwB12SPIY5WOwhE6C7nu/YXesIOyJkLVSK09N1SVFlNA35YW1tomG2ubnbB9TXzy
         4GenCeQb8WezF6JkWOoua+1T8FbTf1HBWT2pgWx+J3bTJqDH8oPZWtCoxCcqm3kvTdfx
         Fp/cJqVBVNdjjRZiqZAhos5hAi7hyVzwNOi6jwxVLN2bsTQ0jv+Su1yN65nkry2mCDwA
         DvLBYjq8LTQhpTa0KKCQ1ddDeEMWJhPDp7tdAtQZBbDBkC96FtELn4devSW860EPcfhP
         3xEQ==
X-Gm-Message-State: ACrzQf18KGif3wqdlLpbb2Mj3mcst49RXcr14JCBDCeqhyozEYbxNtob
        IpEki+ye2lKeB9MNYLWkwDtFcw==
X-Google-Smtp-Source: AMsMyM5SNdAUxS11DFE5CHGNWUZu5b++WSSL/CI+Y2/Mq8HCuhwVuoEC3h+55HGtPLg5YKusYImE4w==
X-Received: by 2002:a05:6512:1047:b0:49d:a875:8d90 with SMTP id c7-20020a056512104700b0049da8758d90mr8706407lfb.630.1663683623367;
        Tue, 20 Sep 2022 07:20:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y17-20020a2e95d1000000b00261b9ccb18esm31448ljh.10.2022.09.20.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 07:20:22 -0700 (PDT)
Message-ID: <15f8096b-da2f-5132-c8e4-16a2ca12f0b4@linaro.org>
Date:   Tue, 20 Sep 2022 16:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH -next v2] spi: s3c24xx: Switch to use
 devm_spi_alloc_master()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     andi@etezian.org, alim.akhtar@samsung.com, broonie@kernel.org
References: <20220920142216.3002291-1-yangyingliang@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920142216.3002291-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/09/2022 16:22, Yang Yingliang wrote:
> Switch to use devm_spi_alloc_master() to simpify error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
