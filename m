Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800BAC43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 06:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiGFGeq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 02:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiGFGeq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 02:34:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136D9296
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 23:34:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r9so17192897ljp.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i1BMPZ/ewrNPyYNCuyDmgoFFvJ41CYWagfxQdw0+v9Y=;
        b=Lo3trhbMqgjZoPdYYcnbvZhtIDuRabm8nZMnEBZyQLC3yvna+fxEmTnLai4ERTFrjg
         Iku7oKbwE8nsfygrKY5QkTPgJwjCFB+yo8fBRSE/GYqfQHK2X0GaZnUwN1bgPkivjtvY
         Nq7wx99tOa19wMED8G1K+jXoXERDjWhWZyQuyiIdeTkhHlQct6EYgTTR9Oz1brCFcage
         z8GLW5ePAoeK/iD0gCYSAfwHnq9kgSi6YhPWPvJH39exY03QmzaFpimDy7A/6wkojpHD
         a/UEo66WF8Snyuhk+m3P85WkTDNmIahYSH7DrEgoj+wDK0fGWt5HBwVyKIFGtZoSHnwf
         /z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i1BMPZ/ewrNPyYNCuyDmgoFFvJ41CYWagfxQdw0+v9Y=;
        b=NSJ9z2PxcmWPxxiVTfed07rPJvruoHy+QJa48pkqwaTZST8IlQE7XbKktzB6lnpO4N
         CGSLPxT0yiIumg/ztAd/Z5Guptv+LaD0XZC7qXvxtVXPkT1a7UmR/1vAB/mbxrULttrc
         bSmjFZx4NSpEfHSgxQBnKfjDdngm+YpovCoGRI0wv5D5MbuyBgTxoMEYjkkKf3QuSwTm
         L3htVZSqzhnCn8xBNiB5eGLgQv/wN6wXjwgiCoFGm7AiE0WrTJ5R9IaHEt9OxstIcWYi
         Fxh/iIWeYU/HacbfnLr7UdwCy19rbe6XTpXGptb4X70yZIN/mc+m+Qui8Z5WrUKCcFe5
         fNtg==
X-Gm-Message-State: AJIora8sSbR5CM9c7yb3nC666aPRFfbd4F8crRiWjltp60umGYOIJmFO
        WLsusKwzTt5Mqc1lJbipum0cmw==
X-Google-Smtp-Source: AGRyM1tngCb/QoxR46x5xt4ID2Ocox7HpE23Iw/rnbB/1UGPcOBz34iXoDNTfziafJKa4Utr8OAANQ==
X-Received: by 2002:a2e:9d84:0:b0:25b:c7f1:c978 with SMTP id c4-20020a2e9d84000000b0025bc7f1c978mr22662876ljj.126.1657089283491;
        Tue, 05 Jul 2022 23:34:43 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id c4-20020a196544000000b0047f6fe39bb9sm6113165lfj.27.2022.07.05.23.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 23:34:43 -0700 (PDT)
Message-ID: <8c221a4b-8a66-f142-d57c-2d6b9ed047b0@linaro.org>
Date:   Wed, 6 Jul 2022 08:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] crypto: s5p-sss: Drop if with an always false
 condition
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de
References: <20220705205144.131702-1-u.kleine-koenig@pengutronix.de>
 <20220705205144.131702-7-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705205144.131702-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2022 22:51, Uwe Kleine-König wrote:
> The remove callback is only called after probe completed successfully.
> In this case platform_set_drvdata() was called with a non-NULL argument
> and so pdata is never NULL.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
