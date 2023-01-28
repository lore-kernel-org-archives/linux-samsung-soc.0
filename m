Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A0AC38142
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 28 Jan 2023 10:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjA1Kjg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 28 Jan 2023 05:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbjA1Kje (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 28 Jan 2023 05:39:34 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DC1761F1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Jan 2023 02:39:33 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y1so7093316wru.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Jan 2023 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBB/UrWepXBkkfPd45IwxI+2oUrHzDJVZIL0q4lKLdQ=;
        b=JTKqHAytmPbQXk3+t7QAF91Sbvylmycvn9b9Xqpbu+tkUZ8DKWjQI5yFlHhhce9C7n
         n0naK1rAnkUKdu9wo0RlUMs9F9TtL+OiKvAhYqDBCni92qZbHNrj2VDPCdRnyjyVdjLO
         dmb4I7d3F/rX9gL9KqCHgzNtb/QLBdfMHAY+6p9gnGIm2+H08Z7wtdNZ4EVOMwA6kaFQ
         0Io+IU8a4OTRVkgELi6/udFAj1gocAqP5GLK6MGloIn6mfa08eFB1lMcTTE/wMW9sr7f
         QdJzc2fYd27TfNohiTNKlb2rs4iLDKxGBcur1sNJQcd//7z8zJx1M3MUSnPo/2rI2Oyu
         dh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBB/UrWepXBkkfPd45IwxI+2oUrHzDJVZIL0q4lKLdQ=;
        b=FGfzFdjSQ8hwuSRdKtfWU86M0nD3Awd0vBC8XRnIrxWcKBlvcbR5e92zkFlANVxzAO
         O4fItIyL2qfVK0XEyikdgeCdxUrbEWBpdMUQAk0jY/BubP9jJq7DKJzRlzgWKVsazzum
         URXrTGbe4rZ1M5IIBqqPQO6W7PlSKj7KD/0rze7CdR0sSBdFXAzSmshNkjNehqK49skY
         DzNiua4bB3YYqbAuFteNxmwR3GdtNSE4WIQd4aoqAJa8UcwoHPn/dsV7eg9aqWcZTEtA
         cK04AAZigRIDq2u7MPUQX1y0PD2iPBuS58v9NQjNBlOquFpJVKTd2d5fJR5PUR9XFgtD
         qv1g==
X-Gm-Message-State: AO0yUKXUhz71BEmeM+Xft3zrHQ7zHhFJluMOlymV4dHRnjdgmR/0nJOV
        ScBZORz9jHIFLxsbj9DB+gGR8g==
X-Google-Smtp-Source: AK7set+Zk9DiBCZq8AhGj9ng0r6KKDJ850gbX0mVQjmwnTlgxBxrDed1NWcHnxk7tB3Ixi0Dug+JVw==
X-Received: by 2002:a5d:62d1:0:b0:2bf:d680:e37a with SMTP id o17-20020a5d62d1000000b002bfd680e37amr3988339wrv.67.1674902371978;
        Sat, 28 Jan 2023 02:39:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y8-20020adfdf08000000b002bfb31bda06sm6644422wrl.76.2023.01.28.02.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:39:31 -0800 (PST)
Message-ID: <eeed3984-3ad2-01c3-365e-443ab664bda2@linaro.org>
Date:   Sat, 28 Jan 2023 11:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] regulator: s5m8767: Bounds check id indexing into arrays
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20230128005358.never.313-kees@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128005358.never.313-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/01/2023 01:53, Kees Cook wrote:
> The compiler has no way to know if "id" is within the array bounds of

It has. For the CONFIG_OF (the only way parent device - sec-core.c - can
match now), the id is assigned in s5m8767_pmic_dt_parse_pdata() and kept
within limits <0,ARRAY_SIZE(regulators)-1>.

The device cannot match via old non-OF way, so there is no real bug to
fix. You are silencing compiler warning, which is fine, but it's not a
real case. The code is not easy to follow, so I am fine with such checks
(WARN_ON_ONCE). The BUILD_BUG_ON is indeed meaningful.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

