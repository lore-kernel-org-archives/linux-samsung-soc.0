Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5A9C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244533AbiARSYP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:24:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42910
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244482AbiARSYP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:24:15 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B38D13F313
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530253;
        bh=mLcBql6ry0uXjx6vo+gnKoiWq+07y5Vfuzwy6oiJwJQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BclXKtgMuktLR9ztLq8dXBnoBMlCFMg2oT8kO3LSxazq4XYb4j85k73w2/81q4c95
         1JoZmtcEF+bocLmHQm2OOdN+yeGPkvp7hDJmcCO5nKWtCV6Mq9kPb8Npa3a13VJEhY
         ddRCN0+xpzTMzCzSTlExtZLRXa4khaQMEN7GvqyI30zkfNWCDUdYchb6C2xav5DRi0
         zP/3rXvz+WYb5faDs9kEMp8OrxBxgmudcsrcJ0asmXDo4YuBzdTamn3yqpNBcdCC1A
         FjPtqj7/MxfJK4KWk/AqMRF/SSEwjMXs+8j+4oadmgToksH2Xp3TbJXj+i1nkauf6/
         8IPCLSCjDBHeA==
Received: by mail-ed1-f69.google.com with SMTP id t13-20020a05640203cd00b00403cefbefe7so1028076edw.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mLcBql6ry0uXjx6vo+gnKoiWq+07y5Vfuzwy6oiJwJQ=;
        b=IVD2sm/7D735q7817B2MXjEhPoXpYneJcsh8EI/OL/IPNVWcA1sXG8QPzwNa3OoPm0
         FIx1CGAocwWAqJvkD0wg1/vYjRUnoaDUh7MlT++dLXmaCcTjwENN2MB3ukN9Sb/+e3+Z
         hwDiW2MOIzbCVjBWqmlhs9TOq+wexzRC7ESBnpxfXIjVpXVhloOyggJkKUfeH+zo0vss
         cGAMbjuuZL37Kpc+2ethwOMBMRNi33nsPE0yNxVfnfB+WyiTI2wzj4KdTdyhfjHBWI4t
         YlNKr5Os8FTU4/W9vLNqj0hObMtTPA+oorLupMRKaLma5arayE2PbQPn6A6jFjr78e9f
         16tw==
X-Gm-Message-State: AOAM5323+aExE0LWV6G1Qa0SI/6cDi+Un9Kn0B3P7Gedg5PAdvPz3o7B
        fxL3c/+AgVVqSjwFiNEEWoN7Tx09fTY8+WJrF5lyqw5RqTIWtTyQ/i2wPjoeUM8egkxxjqSKhK0
        jFtTifPo7USIkjjnKNIbNfbmVBZ3F4Yd4eCT67cLwwjD30NMx
X-Received: by 2002:a50:fe90:: with SMTP id d16mr26971839edt.361.1642530252980;
        Tue, 18 Jan 2022 10:24:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztrE0/iDUvJZuDQ5B9d9jHRgMofzZ3cOcTTHrRpyH4UXtBTQXBgCc7/qL6dnTKZQKwt/9lDg==
X-Received: by 2002:a50:fe90:: with SMTP id d16mr26971820edt.361.1642530252835;
        Tue, 18 Jan 2022 10:24:12 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b2sm191457edv.37.2022.01.18.10.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:24:11 -0800 (PST)
Message-ID: <735d1001-abcb-67d1-75a6-17db11cdec40@canonical.com>
Date:   Tue, 18 Jan 2022 19:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 03/16] dt-bindings: clock: Document FSD CMU bindings
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150022epcas5p21912423606220552a78c7e22e4133a05@epcas5p2.samsung.com>
 <20220118144851.69537-4-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-4-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add dt-schema documentation for Tesla FSD SoC clock controller.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../bindings/clock/tesla,fsd-clock.yaml       | 198 ++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> new file mode 100644
> index 000000000000..dc808e2f8327
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> @@ -0,0 +1,198 @@
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

I am not particularly happy about FSD naming (so SoC name, sub-arch
name), but Olof was fine with it, so I won't oppose. Bindings look ok.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
