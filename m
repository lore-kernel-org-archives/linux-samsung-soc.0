Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE1BC678D5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Jan 2023 14:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbjALOEM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Jan 2023 09:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbjALODr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 09:03:47 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28578517CD
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jan 2023 06:03:46 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id tz12so45007247ejc.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jan 2023 06:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=My5pjeUClAjTF9dSWjS7HwACXv9ARtmx5WO8ZfndvtA=;
        b=uBy7G5Rox1wP6B4fH9uy5CmEflO6HygSAGGHurab3cnZrdiaHCdUjBrlvDAKPJHkr7
         MiWmt7ezLDtrvtJdFH4F4yYUGBWfAI+X17IxfsvlM1ViBZRxmt1jB3ycNx6Y3lidI49E
         O1oKilXC5ef76Lhx+/q8U7U6rmVjDfW7yNA3WkYrqwMlE4whGt8kUEK6Cb29R7AluF5y
         +I8UefUeOI4BZyWNxMdvTL/ep55guLz+d2Z32mIpPq1dgH2veD2CBR0hwkSqqDJJS4Id
         ZCCFsGLPydd8vF26ZbQk+hX4sU/c8AQRFDwRfUfof6LT0OR2LilEoaCRpS9WF6xh11Ya
         sLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My5pjeUClAjTF9dSWjS7HwACXv9ARtmx5WO8ZfndvtA=;
        b=VOcdW791E4+7mbH+0THynXFS0hu/SGwPIPj+5Xvjjcqq6UMFWsimM2mjIFhSjQ39Kt
         bpVceaGUZit464SCBDeRERQS82WhfhQtiQQ/HmRxFmC6bke+W/ns5iboLwiDTl9LHKHl
         tBxTUZiIpb9yDD0AGxyjBeapVk7xTJkaqla5+kM4hG6y1MTVzW1z8hAZaS4HT2mfb/e8
         H3dbxGVlzHTn1HhBOL5jN2GrOes/z0xmbMOdXBhzrbKhi38dtWy38ttloniVSnGefhMd
         0dSRs3a9EcEb8C2K3E6GkCunBkuI7Hj/DB5hm3rYfJwAGsYSpkT6Jt1JjMOMC6kQLaww
         NDvw==
X-Gm-Message-State: AFqh2kqgoT/wvHP+ts/Y4Nrnwz5HbTlJ1olHlMxtB2kbzcqSlu7xPkkT
        J+AKWcErIjfjsA5rboUNfzYT7A==
X-Google-Smtp-Source: AMrXdXvGbdkQmK11XIYeXqsM2R9ZZHZRbxHVGXyT82WofEzYZUCqFMHjTZxbDkoGkeNeMW1pn3jBEQ==
X-Received: by 2002:a17:906:308b:b0:7ae:cda1:76d0 with SMTP id 11-20020a170906308b00b007aecda176d0mr59917554ejv.15.1673532224583;
        Thu, 12 Jan 2023 06:03:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906494c00b00860c51f7de5sm1709975ejt.131.2023.01.12.06.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:03:44 -0800 (PST)
Message-ID: <9ce176c4-60df-6768-1c4c-b387a9c3a2e3@linaro.org>
Date:   Thu, 12 Jan 2023 15:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/1] pinctrl: samsung: Do not mention legacy API in the
 code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/01/2023 14:48, Andy Shevchenko wrote:
> Replace mentioning of legacy API by the latest one.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Linus, please pick it up directly.

Best regards,
Krzysztof

