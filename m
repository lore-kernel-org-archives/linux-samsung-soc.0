Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D40C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbiAMMkk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 07:40:40 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54012
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234660AbiAMMkj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 07:40:39 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 05494402A6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642077638;
        bh=NtF9Qcv8dCyv4imQqdPZ0gphBbiJgf6BkMwibu0qdek=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=L9XSYT2EtpUagpr2p2HuraY0FOZZAlYM3LdHXBYCAxjIivc/jUhdsCG3xfPUHeME9
         jRFPoXCqB+N5Rwr1j873Wb4VDkXlPCyn+zuonpeF+GMCuIvMt6RlKVu+PzlDhrfkmN
         RsprcpUp4siZR5ePbuVSKqDs2FMWDZtBoaTaMupUdwQ0CbZRFZF14tvssf4lXlbQ12
         qO4IaUako93yX/cT59iyNCehK0WTyH4PnpWAJrexQ0Vf9mpv9hYb58yhudi1cBnASs
         32czrIK+o9FtUaDL7322U2vSLFvhdjV8ft1KkCKjFCOHrjT/BUM8/tPvj1LKGv1bWT
         EVAALO17p788A==
Received: by mail-ed1-f72.google.com with SMTP id x11-20020aa7d38b000000b004004e4fc8fdso2697476edq.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 04:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NtF9Qcv8dCyv4imQqdPZ0gphBbiJgf6BkMwibu0qdek=;
        b=B8LvoYDoKbvGu1kBT1vCI2LlnN4ZOrbQFs55in7DXCqWNCFEoskHhRntazgIjSqr6j
         lJ6DBB2WVa4vhfqakpDitmsnpSlNUSbrCSWev1UUez+QyYTcXYrmppWqwkLMDt3KJ/Wb
         +TxcKDiDc97ogmvOwqe0+g/tqteLvCxBXvHJMHx+Avjj64h6OcY4DPdchpavS5jdW60V
         azxynpJWST/tDodTj6DldUva4F/jenOuUJhyKy1uMXQj4CmM1Kg0zBKBhVp4rw6VAZeZ
         91tmkkUN5ZRb9yBb1XU/vX00RtJ4WWp6tEoA6ct/885XqN4womhgR1iXTRW5h9vv5V67
         yQXA==
X-Gm-Message-State: AOAM532/Erg0xtLEJ5NlwaWqWlgAZz193fNs0dV8ZiUNbW0o13ySVRwq
        aJ+MYsyL1uHrwJd3LqpXLQ8k9G7H++Uxpln6auuuROwY8e2oTlkNovbdnof6W0kY3l9iGdgfjH1
        plNhmd+xShdkiZ1nu5SHmtDqII23w4+rRL0x0/QfWdZsGtKS4
X-Received: by 2002:a05:6402:655:: with SMTP id u21mr4010419edx.30.1642077637574;
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzysO4hAvoMYoJ/ruIH66z8VzH4bfZ21Ozb1u+/RRfHvZ0YP4DJm75J85RG/HrmE+6HlqV7UQ==
X-Received: by 2002:a05:6402:655:: with SMTP id u21mr4010406edx.30.1642077637409;
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id sa13sm858440ejc.28.2022.01.13.04.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:40:37 -0800 (PST)
Message-ID: <c87f500e-e43e-465c-94fa-050c2b0de083@canonical.com>
Date:   Thu, 13 Jan 2022 13:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 01/23] dt-bindings: clock: Document FSD CMU bindings
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122311epcas5p4b7c253b49dce3bd3580407fcf312e70e@epcas5p4.samsung.com>
 <20220113121143.22280-2-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add dt-schema documentation for Tesla FSD SoC clock controller.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../bindings/clock/tesla,fsd-clock.yaml       | 212 ++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> new file mode 100644
> index 000000000000..58f341e5004d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tesla,fsd-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD (Full Self-Driving) SoC clock controller
> +
> +maintainers:
> +  - Alim Akhtar <alim.akhtar@samsung.com>
> +  - linux-fsd@tesla.com
> +
> +description: |
> +  FSD clock controller consist of several clock management unit
> +  (CMU), which generates clocks for various inteernal SoC blocks.
> +  The root clock comes from external OSC clock (24 MHz).
> +
> +  All available clocks are defined as preprocessor macros in
> +  'dt-bindings/clock/fsd-clk.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tesla,fsd-clock-cmu
> +      - tesla,fsd-clock-imem
> +      - tesla,fsd-clock-peric
> +      - tesla,fsd-clock-fsys0
> +      - tesla,fsd-clock-fsys1
> +      - tesla,fsd-clock-mfc
> +      - tesla,fsd-clock-cam_csi
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 6
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: tesla,fsd-clock-cmu
> +

Nitpick: Drop the white-spaces between if-then. It's easier to spot the
if-blocks if they are together.

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (24 MHz)
> +

Drop this whitespace as well.

Rest looks good to me, except the discussion about the compatible.


Best regards,
Krzysztof
