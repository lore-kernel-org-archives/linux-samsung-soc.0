Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C339C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Aug 2023 05:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241914AbjHPFks (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Aug 2023 01:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241961AbjHPFk2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 01:40:28 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C779B26A4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Aug 2023 22:40:19 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so14833606a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Aug 2023 22:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692164418; x=1692769218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USJC4rpReyW+hwtVRVOdsjwJafjpOqRaJ3WmgpmCGIM=;
        b=k5e/30EsXvfXpGX01sx0sXsAOLqB7+6MUKPHrEq4a3LTu8aE5E4v3XaYP+NeBXmySy
         Ynnwvbr2wkMuJuPVWUA+vRnW6j6RIJqfpsHhbR9RYGl743YsIFzPJOiq0KDpZnZAK9Ll
         Tz22ZDIEkXO9CaNwZFf1NWbRqQHXqXnuNs9VB7eK5nIdkJKA8+RQV0t6M43MxhmXmWMb
         U0U9VDqTzkMSljTBN8FfbH0KKZ0lLUTErOdOCdE4iGbA4bu1jL3ct3xsqtFIjDNvuS5Z
         1TY+vOpqpukE/JOwLf0URvnvR7AnDJLnRqb7y84t/vXPJq01Z9RRQ4WaLmCbnBwIlUgM
         Ulfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164418; x=1692769218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USJC4rpReyW+hwtVRVOdsjwJafjpOqRaJ3WmgpmCGIM=;
        b=WuBMzErBsr6p5XDQonx/Or8MzdIRCKx+yTkIBhvN0DbtUsm+4zErVKTvQ/KTZNpFnU
         v+LQ+gGOSK2mds7vRi/JD5ddczofs54ky4JMXAkKLpHSo5eH+7a66UiRmYfAGHolHxOY
         lSDO9/VhuYwUs7IxNxne58+ZdDXU9zeAsm2xs4w/g6kt7e4ouHmeXQQlKssfyaIJd/Wk
         /ywnOKezX+dxin6deU0CiaBVzBt7dyNllBvLKVz87iJpczNZTgjWizap1S+XMpPYpQkK
         0u4qGllyDbr+CMLbgN68j5TubJRzj0o77eUlwlRr1FE2umJAK/NFKtrHWkSVKv+9ezPq
         cCsQ==
X-Gm-Message-State: AOJu0YyYDfRmp5Y1/HuZscyfZZRonfowLPGV+n1tr2UQ1egm4xzrVnHE
        LfI3ZsfnvtTL/tdMBDkOKeOr0Q==
X-Google-Smtp-Source: AGHT+IH4DWL6x7gAbnrg5y+pHdZZyj3rUVGs96XdIkDFPXvPhUN+hMnhvwaeC1baPY9OqB7ySNqtkQ==
X-Received: by 2002:aa7:df04:0:b0:522:4764:8baa with SMTP id c4-20020aa7df04000000b0052247648baamr1330178edy.12.1692164418258;
        Tue, 15 Aug 2023 22:40:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7d9d1000000b0052563bff34bsm3783876eds.63.2023.08.15.22.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:40:17 -0700 (PDT)
Message-ID: <bad3c49b-a571-bbba-4c20-d2c6f2d2ce46@linaro.org>
Date:   Wed, 16 Aug 2023 07:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add FSD EQoS device tree
 bindings
Content-Language: en-US
To:     Sriranjani P <sriranjani.p@samsung.com>,
        'Rob Herring' <robh@kernel.org>
Cc:     edumazet@google.com, linux-kernel@vger.kernel.org,
        alexandre.torgue@foss.st.com, ravi.patel@samsung.com,
        alim.akhtar@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-fsd@tesla.com, conor+dt@kernel.org,
        mcoquelin.stm32@gmail.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, pabeni@redhat.com,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        richardcochran@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        joabreu@synopsys.com, devicetree@vger.kernel.org,
        davem@davemloft.net, swathi.ks@samsung.com
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112605epcas5p31aca7b23e70e8d93df11414291f7ce66@epcas5p3.samsung.com>
 <20230814112539.70453-2-sriranjani.p@samsung.com>
 <169201998303.2086680.8457687937999615543.robh@kernel.org>
 <000001d9d003$b3a9a8a0$1afcf9e0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d9d003$b3a9a8a0$1afcf9e0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/08/2023 07:36, Sriranjani P wrote:
> 
> 
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: 14 August 2023 19:03
>> To: Sriranjani P <sriranjani.p@samsung.com>
>> Cc: edumazet@google.com; linux-kernel@vger.kernel.org;
>> alexandre.torgue@foss.st.com; ravi.patel@samsung.com;
>> alim.akhtar@samsung.com; linux-samsung-soc@vger.kernel.org; linux-
>> fsd@tesla.com; conor+dt@kernel.org; mcoquelin.stm32@gmail.com;
>> kuba@kernel.org; netdev@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; pabeni@redhat.com; robh+dt@kernel.org;
>> pankaj.dubey@samsung.com; richardcochran@gmail.com;
>> krzysztof.kozlowski+dt@linaro.org; joabreu@synopsys.com;
>> devicetree@vger.kernel.org; davem@davemloft.net;
>> swathi.ks@samsung.com
>> Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add FSD EQoS device tree
>> bindings
>>
>>
>> On Mon, 14 Aug 2023 16:55:36 +0530, Sriranjani P wrote:
>>> Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
>>> Ethernet YAML schema to enable the DT validation.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
>>> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
>>> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
>>>  .../devicetree/bindings/net/tesla,ethqos.yaml | 114
>>> ++++++++++++++++++
>>>  2 files changed, 117 insertions(+), 2 deletions(-)  create mode
>>> 100644 Documentation/devicetree/bindings/net/tesla,ethqos.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m
>> dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-
>> ci/linux/Documentation/devicetree/bindings/net/tesla,ethqos.yaml:
>> properties:clock-names: {'minItems': 5, 'maxItems': 10, 'items': [{'const':
>> 'ptp_ref'}, {'const': 'master_bus'}, {'const': 'slave_bus'}, {'const': 'tx'}, {'const':
>> 'rx'}, {'const': 'master2_bus'}, {'const': 'slave2_bus'}, {'const':
>> 'eqos_rxclk_mux'}, {'const': 'eqos_phyrxclk'}, {'const':
>> 'dout_peric_rgmii_clk'}]} should not be valid under {'required': ['maxItems']}
>> 	hint: "maxItems" is not needed with an "items" list
>> 	from schema $id: https://protect2.fireeye.com/v1/url?k=f50e335d-
>> aa950a44-f50fb812-000babff3793-de26ea17ef025418&q=1&e=897786e4-
>> 5f9b-40d8-8a7f-399cb69c7ee8&u=http%3A%2F%2Fdevicetree.org%2Fmeta-
>> schemas%2Fitems.yaml%23
>> Documentation/devicetree/bindings/net/tesla,ethqos.example.dtb:
>> /example-0/ethernet@14300000: failed to match any schema with
>> compatible: ['tesla,dwc-qos-ethernet-4.21']
>>
> 
> Thanks for review. Will fix this in v4.

Test the patches before sending them.

> 
>> doc reference errors (make refcheckdocs):
>>
>> See https://protect2.fireeye.com/v1/url?k=ccb7f6d0-932ccfc9-ccb67d9f-
>> 000babff3793-2137ac63fe6ddef8&q=1&e=897786e4-5f9b-40d8-8a7f-
>> 399cb69c7ee8&u=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fdev
>> icetree-bindings%2Fpatch%2F20230814112539.70453-2-
>> sriranjani.p%40samsung.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
> 
> Sorry, I could not get this comment, can you elaborate this. 

What else to say? You did no stated any dependency here. The base is
explained.


> 
>> If you already ran 'make dt_binding_check' and didn't see the above error(s),
>> then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
> Sure will cross check.

Why do you ask/comment to bot?

Best regards,
Krzysztof

