Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115AEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jan 2022 15:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbiAJPLG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jan 2022 10:11:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51670
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235940AbiAJPLG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 10:11:06 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C45740A56
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641827462;
        bh=tX3h7hnt8kxt/dVYtcBgB0Ej6aT/jkR+7hhXYExraYQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wGSybXT0T13FsDNhbOXR6vxo2ngu/3N2vuSKfzlEtHBveDYADtNoT/ghFH9/vVUSY
         fxrGN1Azil0wylAjqt91vHLl/aHcTmHFCh3RMgzIaLdReoT3FfejCRSqCOwRnpvSJK
         KSzy79wkOTPuBIAJ7t9pwljyLjr9/ezGawh1ZI1/xCKeCNx5gXCOYefEv29syOIVjw
         t4MQOI0aacWp4WOhDYa8E6E1Hddi10lQTeorjSbn1gPIb4WPW9FFyHa8/5fIPfMERY
         hiG5gH5ChXKSXbW14Qc34j0rr5l7Mopat4YqqCfVn7EBimz+iPeLksIxy76h5Y2rBq
         9PqlyLb2EgBig==
Received: by mail-ed1-f71.google.com with SMTP id s7-20020a056402520700b003f841380832so10390370edd.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 07:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tX3h7hnt8kxt/dVYtcBgB0Ej6aT/jkR+7hhXYExraYQ=;
        b=UN5v3xD7ObrnLk2h8f81H5xTsu3RxTMADWfuvYoYRu0/DC/BurAI9H7nL8mcskt6N8
         +ICnCpzPqL5eWa9D1xb0SLxQBCjLig6fq1riMcnXfL+mt77LxDcxdMeRtC5S6l0DQbR4
         qdPhjtbKyBSBkwiGkMTCjR7q9ktCjuU0aXBgHQvwIMjTPtIYX75wB0jtJPY6PR2AEKeN
         i+WIMWX4oCINv111p5zSOkjPjVK9LBQStUwdaITPZfjqDzjarq2fXM+7hFhjF+lKgnA0
         M+ECrPqGlBzODSgQ1zdiZEL6l0DuGCJsgBwp4ed3DgIYT+OZ2ZNICc6OA8Q9mBM+piKk
         JgXg==
X-Gm-Message-State: AOAM5303GCbYly1DiAqRkrLfOldfqL/rVr2o+KIZp6fhv61o6m385eSt
        BCMYKYPAbaGm+elg8siNPNiungnR3n8I+kpmzYhL6nafTjeVF/IRjLVMB/PEI48XqnMpTa4VZYc
        YTYQv06f3oO6FvmuqdCEK6ryb9goLv2r41pCt98GI+6rZ4TFm
X-Received: by 2002:a05:6402:2756:: with SMTP id z22mr74500edd.255.1641827460972;
        Mon, 10 Jan 2022 07:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwxpZo2R3+fpKQFtBTyG7e4TaBBMrhOqAuzK/7sAzUdh6Cil2bZ3WxmZvF685+f8JUGO5VTA==
X-Received: by 2002:a05:6402:2756:: with SMTP id z22mr74475edd.255.1641827460801;
        Mon, 10 Jan 2022 07:11:00 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c1sm2548737ejf.92.2022.01.10.07.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 07:11:00 -0800 (PST)
Message-ID: <372040ab-6ada-62e9-727f-6daeba8e73f8@canonical.com>
Date:   Mon, 10 Jan 2022 16:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] spi: dt-bindings: samsung: convert to dtschema
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220102155807.42758-1-krzysztof.kozlowski@canonical.com>
 <20220102155807.42758-2-krzysztof.kozlowski@canonical.com>
 <CAPLW+4miCOwFR11gdaU1nMQZdk8zVcWOcSK=Wjd3AaCagGLyug@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4miCOwFR11gdaU1nMQZdk8zVcWOcSK=Wjd3AaCagGLyug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2022 15:41, Sam Protsenko wrote:
> On Sun, 2 Jan 2022 at 17:58, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
>> controller bindings to DT schema format
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../devicetree/bindings/spi/samsung,spi.yaml  | 220 ++++++++++++++++++
>>  .../devicetree/bindings/spi/spi-samsung.txt   | 122 ----------
>>  MAINTAINERS                                   |   2 +-
>>  3 files changed, 221 insertions(+), 123 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt
>>
>> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
>> new file mode 100644
>> index 000000000000..195bfafe05fd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
>> @@ -0,0 +1,220 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/samsung,spi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S3C/S5P/Exynos SoC SPI controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +
>> +description:
>> +  All the SPI controller nodes should be represented in the aliases node using
>> +  the following format 'spi{n}' where n is a unique number for the alias.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - samsung,s3c2443-spi
> 
> Maybe add the list of supported platforms for each compatible (in a
> comment on the same line), like it was done in .txt binding?
> 
> Other than that:
> 

Sure.


Best regards,
Krzysztof
