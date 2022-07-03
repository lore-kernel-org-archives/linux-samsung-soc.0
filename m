Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260ACC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jul 2022 18:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbiGCSLl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jul 2022 14:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiGCSLl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 14:11:41 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0095460FC
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Jul 2022 11:11:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r9so8505508ljp.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2022 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EA2HK1w3Mx9SWECBezKw/os0mvoFNvlKu8SCzQeFYZA=;
        b=AErGtm4DckMyY6HrGDk8x/qOpOCzcTPclkWo7BzqWtHYPQWvkAKeMSoWoZGzfokF6g
         EHfNtu6hGsDEiZcMIBDXH7iOU4tuMG3dVspL+YAtfaHBzs9TePyr7DoDipP+LyFzmd/0
         v2vF8tVpNzJAWX+UC2Du1olJzxPCnYAO5Na6o/aZtEiNE2i+6yzH7cu9IK/vbOQYHe4u
         OAsXylQFD1sfvGIi/+wP4/1tgieLac/0S/qmtUJJog2pmxS1R/X6SSLnRf7ubEQajO2L
         chf9U1eH6DkFlWM2tFlVaPMLmgt4XKC5bnY7xhmAbjt9QtavB4xfIxiAPf1aZwDNYGWD
         tuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EA2HK1w3Mx9SWECBezKw/os0mvoFNvlKu8SCzQeFYZA=;
        b=M5MZD+Dlb1hY+qWRBshF/tbpLrso6bna7eUD2CCBfy4JLGf6yqQefmoGyG7WhKUmz+
         thLZMqgv66FUkuKySClzMrLyWWenrV5WH8oPiEPOzHv4IRLeCsbYGZnAczYtuV3MqzB8
         ud3Iru1flEwT5c8nWdtgvVGMJWZinaXQpfg4tuTwbW6vJ+XBjjq3Ehb24tmYSGoKGTTk
         oNCY78W6BXVy0w1EoIeWFcCADADhSY4gbUUufujco1D8P2SJHz/bKCLdFV9Rv1Q8oSFD
         VLnEIQNJeGvOS8Fmz7AI7o39NO4X0AIih+/8zMqiaWTvPDiOzxNEcJGWn4GJqJk4YKqT
         Np5w==
X-Gm-Message-State: AJIora/PX6mjLHkT1wGvsmcJBl2aLDVs/el0RoOExBLRTQmTX4Z/2BHT
        7fNNC3+YztR6oNlhNoIFm6mrag==
X-Google-Smtp-Source: AGRyM1tkKK+8SkFXgg4yB2FmoXvs0dFKzuwaGe5efFkEcCAcjGZEp5mVYgw8z+6ar4LH+dWt44D9XA==
X-Received: by 2002:a05:651c:1549:b0:25b:d2dc:2e8f with SMTP id y9-20020a05651c154900b0025bd2dc2e8fmr13780446ljp.334.1656871897227;
        Sun, 03 Jul 2022 11:11:37 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n24-20020a05651203f800b004795311530asm4821761lfq.209.2022.07.03.11.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 11:11:36 -0700 (PDT)
Message-ID: <ebe6eaef-8bf8-3a35-4048-d0b079b52ff2@linaro.org>
Date:   Sun, 3 Jul 2022 20:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: soc: samsung: s5pv210-chipid: add S5PV210
 ChipID
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629123543.94515-1-krzysztof.kozlowski@linaro.org>
 <20220701173524.GA1185040-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220701173524.GA1185040-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/07/2022 19:35, Rob Herring wrote:
> On Wed, Jun 29, 2022 at 02:35:43PM +0200, Krzysztof Kozlowski wrote:
>> Add bindings for the S5PV210 ChipID block.
> 
> Is this new or was undocumented?

Undocumented, I'll mention in the commit msg.

> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/soc/samsung/s5pv210-chipid.yaml  | 30 +++++++++++++++++++
> 
> samsung,s5pv210-chipid.yaml

Hm, even for files under "samsung" directory?

> 
> Surely there's other similar blocks. Can we start collecting in a 
> common directory?

It's a soc-specific driver, type of soc_device. If you think it's worth
a place of its own, I can put it somewhere dedicated.

Best regards,
Krzysztof
