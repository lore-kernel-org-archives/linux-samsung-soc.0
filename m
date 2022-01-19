Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C94C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 19:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357191AbiASTtw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 14:49:52 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58020
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357188AbiASTts (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 14:49:48 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2EB763FFDD
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642621786;
        bh=dmsErNaRfriLUQ7jgb1pj+z+Bm18TKaEXTieKxP3MNs=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HlQzRz8+CRcEr+pFW51QBxf7CEhkxPNRB4cvj0Nzis4Hb5GpEkcer9G/pk2L6mpKa
         AWbCrEh1CaMDW6B536RLMEx7Fbu/3WghxLJe0oFuk8jJZX34G1MBJlL+3GHB7KNmYq
         M8D1uyJ4WV4ukzf2bmGiT+6io9xUZGTV2oXCp78tZx/qMA58GEHNkytCy5pU4mvHM3
         EZLIejLIx612NsBdJxOERD5xsvEZB+fIWDQecQL8oow6wFVFUawfZpJ1tjF3ofnolK
         hV8tUzZ57lSK0CnUMWnjiXjrMaU9dc5IrD941UW95n/ov5dNjYPhkp8V5x9UVPYNg7
         TXn223KBzN+eA==
Received: by mail-ed1-f72.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso3674447edb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 11:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dmsErNaRfriLUQ7jgb1pj+z+Bm18TKaEXTieKxP3MNs=;
        b=P7LqHVs58g/bT5amGErF3lLsr8sliMrJ1Sgk+W1pnHkPyMHVusmgGsgpUgBdvpK9b5
         udS7g+xuStbu2VgMGeiKm0YqfUYN2lpmsrSDq1qvKXZrul7tJwfWK7dqgHsX25qTZ0Td
         HQUdJhbn8GzxorcxK74KkHUtSu7qE05bFz4fLB0McJmYXpTZeqfB3ZXPKxmMOKQmarH/
         TRAlGmFzQpGz5GvW4PjY3CbzJdSvYEalNb3dPxiyzCSCRCkdil60Qk3gwB2vKBS0tLBK
         Snofk8gGCpREUesSniR113nnU1jh83R5e1ihrNLKKU2sumTF2dA6xUbAZQ7k3YHN/+m0
         XNUw==
X-Gm-Message-State: AOAM5318+BzPtM7DsP3gwtNZN/7deNyWGwDEANsFf6jcKBymoX/g84lP
        IlL1I5ZZ+5rxLGhezURv4EXFx2Keqc6G790hvkWWJA1mjaL+TyozNQ0qtfRx0im6Ip2jWRfqFdS
        vJlAQBaVH2z7U3rIgVgtx1AZgPt6nVykkccZTGosNrg6Sv4hx
X-Received: by 2002:aa7:db8f:: with SMTP id u15mr31741146edt.36.1642621785853;
        Wed, 19 Jan 2022 11:49:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm7E7JLHnP0IxJR0A8wZMRPT/L4qGOUdI9+u8XzF5UfnOBvGC8X9Rx6LzD1fgoC4pxVXU6Jg==
X-Received: by 2002:aa7:db8f:: with SMTP id u15mr31741131edt.36.1642621785658;
        Wed, 19 Jan 2022 11:49:45 -0800 (PST)
Received: from [192.168.0.45] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id s7sm211711ejo.53.2022.01.19.11.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 11:49:45 -0800 (PST)
Message-ID: <5f912896-0635-fbe7-4fda-f4cb569190d9@canonical.com>
Date:   Wed, 19 Jan 2022 20:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 2/4] spi: dt-bindings: samsung: convert to dtschema
Content-Language: en-US
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
 <20220112100046.68068-3-krzysztof.kozlowski@canonical.com>
 <20220119192758.z3lvlkaeyeiqi73a@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220119192758.z3lvlkaeyeiqi73a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2022 20:31, Pratyush Yadav wrote:
> On 12/01/22 11:00AM, Krzysztof Kozlowski wrote:
>> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
>> controller bindings to DT schema format
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>>  .../spi/samsung,spi-peripheral-props.yaml     |  35 ++++
>>  .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
>>  .../bindings/spi/spi-peripheral-props.yaml    |   1 +
>>  .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
>>  MAINTAINERS                                   |   2 +-
>>  5 files changed, 224 insertions(+), 123 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
>>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt
>>
>> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
>> new file mode 100644
>> index 000000000000..aa5a1f48494b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
>> @@ -0,0 +1,35 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/samsung,spi-peripheral-props.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Peripheral-specific properties for Samsung S3C/S5P/Exynos SoC SPI controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +
>> +description:
>> +  See spi-peripheral-props.yaml for more info.
>> +
>> +properties:
>> +  controller-data:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      samsung,spi-feedback-delay:
>> +        description: |
>> +          The sampling phase shift to be applied on the miso line (to account
>> +          for any lag in the miso line). Valid values:
>> +           - 0: No phase shift.
>> +           - 1: 90 degree phase shift sampling.
>> +           - 2: 180 degree phase shift sampling.
>> +           - 3: 270 degree phase shift sampling.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1, 2, 3]
>> +
>> +    required:
>> +      - samsung,spi-feedback-delay
> 
> I am not quite sure if this required would work here. Let's say another 
> controller also uses a controller-data node, but it contains a different 
> set of properties. Won't this cause an error to be raised for that 
> controller since this property is not there?

The controller-data is Samsung SPI specific (does not exist in any other
binding), so why would controller-data get added to a different controller?

Best regards,
Krzysztof
