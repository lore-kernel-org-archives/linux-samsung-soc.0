Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEEEC0015E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jul 2023 06:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbjGNG3V (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jul 2023 02:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235160AbjGNG3U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jul 2023 02:29:20 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C199710FA
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 23:29:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-313e742a787so931886f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689316157; x=1691908157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cyRXTnFMgML5LRDqLhIxccKlQ2SpeUYza0LDZOHMN8=;
        b=gP66vUPyD3nRolEL+Es+rUKuIrtm3hjs2vXOFh1FT7zUuc+1//T3IHZZzh/SABAfJv
         Oqwi29iWmXra8Z0qcNI41QuWDywQu+cCYNDKd5ZBsWGGqDEgVzuAFDbg4j1s1XCWajXR
         NcPW589n0UrRpCvNVanNSvurpwOLRpN6Z+Opbb9eJHnooifrS0ULltLOAzx2MOIHT/p6
         iOwDW80foTu74YCC3urGICk2eyqP036A50+oOcuQRLrpHOwbp/PjEtSI/oM8uQD3igdr
         MSMjeMjmBSTtNa/4zvHg4jIxnaJv5ODTXM7T0MdzN1dt8nsw2S+dQruQAXw7hL8H2rxi
         JNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689316157; x=1691908157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cyRXTnFMgML5LRDqLhIxccKlQ2SpeUYza0LDZOHMN8=;
        b=g7QLQDGqy2mJD0HZklfSHxaj8s0i2zmW6kYuPaFgyJJHnVsmC06+iKjjkhQt6PYPWx
         FY1umNAFCv0HGVhv9crdHBkasz9DujiEdN8bBcPxBEOi5RE2CkFRWNbvBy13psQlnq6d
         spY7aCA5lA9XfmlVGX2pZkUDDB8wzfXpGefY99n9DF/W4SD6PsCTR9XQOJ3lmpmp9zpl
         y5uPFdq7edV7XHcIXBApg5QHbI8QOGHHDnWeBE8KgSFo2ixbbf/AcD4QdvUske914oTH
         JXhPCNfZfeOsh4eJOmF6nKN++WRKQF7M93mDMXpxR+wLzh/l4gxddY2GJaE8947V/Nmi
         bRkQ==
X-Gm-Message-State: ABy/qLblb3jj8trS6U6ksfI6u3KqqqxZFHmpT1GynmrpG2p3kmyJwRLR
        zT89lGk8EpclUoy/Q59aqoNQcA==
X-Google-Smtp-Source: APBJJlFX97c6rmpOJv+zuK0yecZ5eLJsgb7VgCnWkfQT9x7ss+tkXR1k8x1JhoD1UmTNXxl92Sm/Tg==
X-Received: by 2002:adf:f04f:0:b0:314:3108:500a with SMTP id t15-20020adff04f000000b003143108500amr1554118wro.0.1689316157230;
        Thu, 13 Jul 2023 23:29:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t14-20020adfe44e000000b00314374145e0sm9857803wrm.67.2023.07.13.23.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:29:16 -0700 (PDT)
Message-ID: <53b67388-8b64-f668-0e56-299dd1044db1@linaro.org>
Date:   Fri, 14 Jul 2023 08:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: exynos: add pwm node for exynosautov9-sadk
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Jaewon Kim' <jaewon02.kim@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Conor Dooley' <conor+dt@kernel.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20230714052025epcas2p46d5485a277c9f21ace14300dd9d7b4d8@epcas2p4.samsung.com>
 <20230714051521.22720-1-jaewon02.kim@samsung.com>
 <3bc9c34a-ba55-61c5-87ea-80b369841873@linaro.org>
 <000401d9b618$59a29d80$0ce7d880$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000401d9b618$59a29d80$0ce7d880$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/07/2023 07:59, Chanho Park wrote:
>>> +			reg = <0x103f0000 0x100>;
>>> +			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
>>> +			#pwm-cells = <3>;
>>> +			clocks = <&xtcxo>;
>>
>> This does not look like correct clock. Are you sure XTCXO goes to PWM?
> 
> Yes. XTXCO is the source clock of the pwm. Unlike any other exynos SoCs, the clock is directly derived from the external OSC.
> Thus, it cannot be controllable such as gating.

Sure, thanks for clarifying.

Best regards,
Krzysztof

