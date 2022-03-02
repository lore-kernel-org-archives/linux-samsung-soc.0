Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE045C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Mar 2022 19:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244126AbiCBTOG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Mar 2022 14:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236207AbiCBTOF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 14:14:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF68D4C7A9
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 11:13:21 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BA6383F609
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646248399;
        bh=nWN18YCuqRl/uRs3hr2tykiON2ELXmcF+JeLOTz8WVM=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
         In-Reply-To:Content-Type;
        b=BKH8unMgnA36vN533TGsYaZmKvqaBj+e77qWP/qMCTqmTK5NwJgmd9A3QvWiNxd7J
         JILptaXXXynAVb/a4aJAXFY6G+P/7LHHvpbdrVUiVRYkS+9K1gykcYv1e9APcOywrs
         jz96X2rr0JMwyJDZZaQU1jX4SDDU7kK7EtBsBNVKV4X/uGt6zlMhP3HQqrVwF3fZn+
         uZL5TuTe3PrdyuO6PtpMkuGE+38dWqJ44j5BZSHkqnbF7BR0TbVGAOUikFqreQ+1Tn
         LI2Vmu8Y/JXp51F+ES/2xysA0OlAZukIgFhJK+lJMsGS9k52ZoST1rWlPZdCJZfRLn
         b6Y/JiEl8iWQQ==
Received: by mail-ed1-f72.google.com with SMTP id r9-20020a05640251c900b00412d54ea618so1530068edd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Mar 2022 11:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=nWN18YCuqRl/uRs3hr2tykiON2ELXmcF+JeLOTz8WVM=;
        b=r88dMLx8gdo4+GpHkNjL/cbZMMX2lcwUaT73zx9H741vU+C/boCLgRwbLhn0sfACoT
         7l2UZMkrM6UX1Wc6TrPBiAYic3FzYVq273zXTKGfUe1HGlAdQaC2YjviSZzAn7zDHYaX
         4nn5T+ny7xa1erw36H0hOH+JNgAsfaCX1MON5UEGLtU7LI66uJ2VYTylj9KyN7HOcJyT
         fyleoccjOX5hstgNlMHIeOVcCLcVurKTR+jj9Wh36fV5sd/Tlvojp6gV+ymHF7QuUxOd
         88SiHqCCyPwbfxDt36gQJva+VRjPngXjHZKiQ5O1Isq0QjwKxDUYWZ7+pjwViAaxIvoI
         Nfzg==
X-Gm-Message-State: AOAM531SkmGMO3iP1Dl1qz8Bkpx2Kc5rkesb4NboA+p2irSiefdLSm75
        +rrBHjwj1iFDYpUArxIi29KBONan9XQDfNtZqpBFJV0YE0H/iVcb+leJG1M977QiawpIkJDmlB1
        eaNfaUiW0WfWLJswRnPzcVWYdnhtWCqhfOSD1xIisiRFuFIGE
X-Received: by 2002:a05:6402:5254:b0:410:def7:132c with SMTP id t20-20020a056402525400b00410def7132cmr31148669edd.161.1646248399340;
        Wed, 02 Mar 2022 11:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwI4j6gWeIOi2qnxBgySGJ3MirXtSZaxxp8XNc3bVTjxuQCxpnQLqwIspZ33EzOhvRBxsyeQ==
X-Received: by 2002:a05:6402:5254:b0:410:def7:132c with SMTP id t20-20020a056402525400b00410def7132cmr31148657edd.161.1646248399113;
        Wed, 02 Mar 2022 11:13:19 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id kb28-20020a1709070f9c00b006d5d8bf1b72sm6584566ejc.78.2022.03.02.11.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 11:13:18 -0800 (PST)
Message-ID: <37766d33-b967-52f9-eceb-d86ac61e0c07@canonical.com>
Date:   Wed, 2 Mar 2022 20:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/4] spi: dt-bindings: samsung: convert to dtschema
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
Cc:     linux-spi@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/01/2022 09:23, Krzysztof Kozlowski wrote:
> Hi,
> 

Hi Lee,

The patches got reviews/acks from Rob and Mark, so I think they are
clear to go via MFD tree. Could you take a look?

Best regards,
Krzysztof

> Changes since v5
> ================
> 1. Add new patch 3 (fix indentation in example).
> 2. Patch 2: reference spi-peripheral-props in else.
> 3. Add tags.
> 
> Changes since v4
> ================
> 1. Do not require samsung,spi-feedback-delay and fold patch 3 into patch 2.
> 2. Rework message in patch 4.
> 3. Add tags.
> 
> Changes since v3
> ================
> 1. Patch 2: correct path in exynos-usi.yaml.
> 2. Add patch 5.
> 3. Add tags.
> 
> Changes since v2
> ================
> 1. Patch 2: drop child device schema, as Rob suggested.
> 
> Changes since v1
> ================
> 1. Patch 2: describe devices matching compatible, correct issues pointed out by
>    Rob, add reviewed-by tag.
> 2. New patches 3 and 4.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (4):
>   spi: dt-bindings: samsung: convert to dtschema
>   mfd: dt-bindings: google,cros-ec: reference Samsung SPI bindings
>   mfd: dt-bindings: google,cros-ec: fix indentation in example
>   spi: s3c64xx: allow controller-data to be optional
> 
>  .../bindings/mfd/google,cros-ec.yaml          |  31 +--
>  .../bindings/soc/samsung/exynos-usi.yaml      |   2 +-
>  .../spi/samsung,spi-peripheral-props.yaml     |  33 ++++
>  .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
>  .../bindings/spi/spi-peripheral-props.yaml    |   1 +
>  .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
>  MAINTAINERS                                   |   2 +-
>  drivers/spi/spi-s3c64xx.c                     |  14 +-
>  8 files changed, 246 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt
> 


