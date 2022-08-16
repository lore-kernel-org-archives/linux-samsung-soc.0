Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0E7C32771
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Aug 2022 10:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbiHPKXh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Aug 2022 06:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbiHPKXT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 06:23:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFF658539
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:23:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u3so14053551lfk.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xqmZkTjqkBszJr4LKjJt2ehtVUvSW3sFkYgqkkGWDf4=;
        b=yj+1nFMppjyZXIpFnjKZvFDRpcKZwm+a4RWh+1tgO9xkQqZ5ouieOYtGDdckwPCLkD
         uFNRzJohXUEtJkdoEMQud0/N66NTYI0UV0uWL9W2sOWN2DPcWtt6PVdBw5MjNIDJIYgz
         7z1qS3BhvROOXNwNVdMCiNBn+hCwboOkqh+EliX/jOaVubo4IIFegvDhncPRP9id2YSy
         zJ2KMbORQuM3hcHWwWAxXLHMYeN11+ZOS0NSe132Auln0y3rEuRGL4zv++iOnJSGhjZc
         kbibfmoOvPb7P4Gyx7pJH4QHOwiW9cdScaGQsSqohEUl4AfB3xEzQnP61EQFQQFRh6Y2
         8OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xqmZkTjqkBszJr4LKjJt2ehtVUvSW3sFkYgqkkGWDf4=;
        b=TPhuRbvpCXFJDSdBfdCS9V+YrXnkwVOh15pTOM6Xp62tuqiF5sZ/EXgFnkzVUKYpfw
         8kBxE7YvwhFfXNbWWRzsrGHBL7s/lPZFA77DXMq5AWwgzmb4Jekh9PP2D8wxZdSmt/G7
         4pGBUqHxAp5tCIls7oGuEEkSklj+XFUtOqMFJCpdT4ruJ7C7kbkPHUJ4NQsE9viWGUfG
         LddspSF54eE606TScJuN00nNWLxI9uGvB3sQjJyV5l+pXCmUKdRISZ56uJBseb5KkEUD
         EVhZLJCy+ICbbooSLcHNkSVm1+zm+t+9Jdax+YDkqeMvCHR4jJaxYC6O0L8xzVwpxyzF
         Grfw==
X-Gm-Message-State: ACgBeo1sfBUGBxLmJLo3+g6ugYGdgsAHqYW43xFmPg+sDYDUinUrl5HJ
        5A0MYCfdEQU2XBRrDIgpyAVcwg==
X-Google-Smtp-Source: AA6agR5+nNwI8d3IuOAHqLUOx1QI0JR8HQgP2AKO07DOADBkCQC3TdTrDgt0+LLhBk+z2F6rApxi6Q==
X-Received: by 2002:a19:5e02:0:b0:48b:1870:dc4 with SMTP id s2-20020a195e02000000b0048b18700dc4mr7462376lfb.4.1660641809597;
        Tue, 16 Aug 2022 02:23:29 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id x25-20020a056512131900b0048a0e948c34sm1325631lfu.195.2022.08.16.02.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:23:29 -0700 (PDT)
Message-ID: <b6a515bf-b1a3-02e5-ecda-d11753288fe2@linaro.org>
Date:   Tue, 16 Aug 2022 12:23:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Saravana Kannan <saravanak@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220727013349.3056826-1-saravanak@google.com>
 <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
In-Reply-To: <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/07/2022 11:32, Krzysztof Kozlowski wrote:
> On 27/07/2022 03:33, Saravana Kannan wrote:
>> As soon as a gpio is registered, it should be usable by a consumer. So,
>> do all the initialization before registering the gpios. Without this
>> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
>> mapping fail.
>>
>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> 
> Looks good.
> 
> Linus,
> It's too late for me to pick it up, so make you could grab it directly?
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Otherwise it will wait for merge window to finish.

Applied.

Best regards,
Krzysztof
