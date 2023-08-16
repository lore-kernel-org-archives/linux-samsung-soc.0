Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8043C41513
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Aug 2023 06:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242082AbjHPGSm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Aug 2023 02:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242080AbjHPGSY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 02:18:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADCF1FE6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Aug 2023 23:18:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so56798455e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Aug 2023 23:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692166701; x=1692771501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mx1UIYShAlyyGP0ErV9nIroDLEozIanzm7Ts9TKbkrM=;
        b=sGRsL/QwaCaMlCql1uvOL6IGh0E98/pBn3LrQQXZsTX8IqKKEWtEAB2CZwq+H668RF
         JbqBn8YtMPi6ldm/E8BbYohvY6iQa8T24TGbSt0iyICvjA2Z+TckZ/Z+jZOmX4mHKw8+
         DiimN6PrAGcy8YoVTAylTFhDeKSOSIkwt8Yh2QK2IRHPksPknXZpTUvoZDcEIa8hgCTo
         WIaFh7qkGangROXZNy088IpQUAeeYFjHAMfXXOMX3iyL8Rmf98u8ZgHcufFlF6x64c8a
         8cyCl0uN4/fNsetPTh/N4UANeU2pkXVVlOqppc2hh5I5zE+5Yxpdh+PCnfXNnYcwfnjG
         34LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692166701; x=1692771501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mx1UIYShAlyyGP0ErV9nIroDLEozIanzm7Ts9TKbkrM=;
        b=elsnE8NAiZ8ZQ3QqRwDhlFFd5m/frABygOjAzn/EWuqsKWIOUEwYxFpM0r/IH9HlF9
         7cg8Ff+7li6ACwpTqNSm7zwU2enUOK8ajoDnndPzRh/zYqsjoof+TvKLKybZUBxSkPeY
         ijlk4TKUBtTQL8X6DdZIGQQd8ZfjCmvO43CkXtz3zsuchKjL8PEcQB15LwIvdnAPpQE4
         lzsS3EOmUoErODp1D3HqrdRLfvMv/YKXjR6Qz0oo+i51bVT6o5E27DsguTEPKtSv3E+1
         //oBjg7hICnJrC2WXMJoGC06gT/XqKEiHvGZAlnP44qIBODXPyG2uMAMvV0vP+LEI6um
         QpIw==
X-Gm-Message-State: AOJu0Yy2l8hpDrlUXei27NTeLfg+IuiMNp9QZBGdu2xSknc64YvblIk3
        8/+nqgRl3PE2odvej35DFZhJ+A==
X-Google-Smtp-Source: AGHT+IE+Q/6wB3/7hbdxzeM5zH2YL/GCM/loFcZttKMzb+hJ56y2b4Px4vAxawaocigURv4jii3uIA==
X-Received: by 2002:a5d:6386:0:b0:319:8b4d:5ec with SMTP id p6-20020a5d6386000000b003198b4d05ecmr797710wru.34.1692166701144;
        Tue, 15 Aug 2023 23:18:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g6-20020adff3c6000000b003197869bcd7sm8630690wrp.13.2023.08.15.23.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:18:20 -0700 (PDT)
Message-ID: <c9344953-9367-0ab0-fa42-3117d17643eb@linaro.org>
Date:   Wed, 16 Aug 2023 08:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add FSD EQoS device tree
 bindings
Content-Language: en-US
To:     Sriranjani P <sriranjani.p@samsung.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, pankaj.dubey@samsung.com,
        swathi.ks@samsung.com, ravi.patel@samsung.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112605epcas5p31aca7b23e70e8d93df11414291f7ce66@epcas5p3.samsung.com>
 <20230814112539.70453-2-sriranjani.p@samsung.com>
 <16eab776-07d4-3c31-7e82-444863303102@linaro.org>
 <000d01d9d006$a211d880$e6358980$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000d01d9d006$a211d880$e6358980$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/08/2023 07:58, Sriranjani P wrote:
>>> +
>>> +allOf:
>>> +  - $ref: snps,dwmac.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: tesla,fsd-ethqos-4.21.yaml
>>
>> ?
> 
> Will fix this to tesla,fsd-ethqos.yaml 

Test your patches before sending. REALLY TEST.

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 5
>>
>> Why? I expect it to be specific.
> 
> Sorry, I could not understood this comment. In FSD we have two instances of EQoS IP, one in PERIC block, which requires total 10 clocks  to be configured and another instance exist in FSYS0 block which needs 5 clocks to be configured, so we kept minItems as 5 and maxItems as 10, but looks like latest items schema do not need maxItems entry so we will drop maxItems entry. In my understanding minItems still required so it should be kept with minimum number of clock requirements.

No, the code is fine then.

> 
>>
>>> +    maxItems: 10
>>> +
>>> +  clock-names:
>>> +    minItems: 5
>>> +    maxItems: 10
>>> +    items:
>>> +      - const: ptp_ref
>>> +      - const: master_bus
>>> +      - const: slave_bus
>>> +      - const: tx
>>> +      - const: rx
>>> +      - const: master2_bus
>>> +      - const: slave2_bus
>>> +      - const: eqos_rxclk_mux
>>> +      - const: eqos_phyrxclk
>>> +      - const: dout_peric_rgmii_clk
>>> +
>>> +  fsd-rx-clock-skew:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    items:
>>> +      - items:
>>> +          - description: phandle to the syscon node
>>> +          - description: offset of the control register
>>> +    description:
>>> +      Should be phandle/offset pair. The phandle to the syscon node.
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  phy-mode:
>>> +    $ref: ethernet-controller.yaml#/properties/phy-connection-type
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - rx-clock-skew
>>
>> Eee? Isn't it fsd-rx-clock-skew which anyway is not correct?
> 
> Sorry, I missed to change this in DT schema before posting, I will make this to fsd-rx-clock-skew. 

Remember about vendor prefixes for every custom property.


Best regards,
Krzysztof

