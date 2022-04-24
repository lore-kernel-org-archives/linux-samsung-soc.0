Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6756EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 10:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbiDXLBH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 07:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236948AbiDXLBH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 07:01:07 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E94213D37
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 03:58:06 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dk23so1122009ejb.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dcNY2DH36HPv7NbH4purwsl1q+khfyhVwK0k3NHViJQ=;
        b=KCChKWY3LlDWgFSBqGp9yeG4T9gr43DDNemWkKzBgI7Koo72cNSdkdmgD8N29EFfwu
         3y/8KEI93fLbbeCmaQjILvMimg+TDsF+7UevM71yuisnE6oNQNhEEHEugeQ8wGRkoDEp
         lfmQAcL/guRAbuS9F5y6ldlpurqt25X9MVdJE8mQk0nH5XH+Gs0YlVBn99JGraozOXNI
         OEhOKkDjysukELr7lVM/FLjw3bRMGMFeuwpGzpQkzpHpZDSkfWMRL2eccdjUBESBguhC
         6uVrQ8FdlZI7AfkGxtxe96CpbNfqPdx/XxeL/IS9VPgcoxvZLeJ9W4QN0OWjBVTYmKwV
         mrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dcNY2DH36HPv7NbH4purwsl1q+khfyhVwK0k3NHViJQ=;
        b=gZdKNjEWm6Z376NeIZ6llp2Og3exnXQJ1eLEXgz9VdGGLswqzSn+BYjputAGc+pO7o
         LLdIGf8mDEnFGcB61tyFp89LrAPNjTf595UJomqGvUPRJc7IUaS++1DzvjM5wtWQesJd
         HglgJoDFYTAPjcFg12Al70VugxPNiLQHAKBQsqvfds4EYO9XMQ+5hThCGqJ/xxBdwSky
         lYvCoelxiIdne6eX+xTWoosIVQOEvqojHP8U7UECawqcwOx7pdDla8Sy/DFQyWIPN0eL
         58O1mvdgNP/2zkkI478hWWRhEuBsj/36lY2xaKDNIqyUcV899lQVM/4abEajlnDEFOfL
         cf3A==
X-Gm-Message-State: AOAM533DJ9z1uzAH6uf6/M5ZJr3QXFmGo2sG/zlqu2W3zkwnl6zSQ1dW
        HWPTdTXjgh9LdyKly9v4SarSNg==
X-Google-Smtp-Source: ABdhPJyUFJ0vMQAvNuwElDV7zr/Z3xxqNhh5KELlIMnFlY1Kk/PGfBGshVXfd3Me0GasMv02FUY1+A==
X-Received: by 2002:a17:906:94d6:b0:6e8:d608:c960 with SMTP id d22-20020a17090694d600b006e8d608c960mr11929923ejy.96.1650797884710;
        Sun, 24 Apr 2022 03:58:04 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y3-20020a50ce03000000b00425bfb7f940sm2997125edi.11.2022.04.24.03.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 03:58:04 -0700 (PDT)
Message-ID: <2642dc72-81c3-b535-a658-025eb23679d7@linaro.org>
Date:   Sun, 24 Apr 2022 12:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: mtd: samsung-onenand: Add new binding
Content-Language: en-US
To:     Jonathan Bakker <xc-racer2@live.ca>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20220423034316.366488-2-xc-racer2@live.ca>
 <CY4PR04MB05678FDFC8BF8B15174ED639CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB05678FDFC8BF8B15174ED639CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2022 05:45, Jonathan Bakker wrote:
> Add a yaml binding document for the Samsung OneNAND controller.
> It is found in several older Samsung SoC, notably the S5PV210.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  .../bindings/mtd/samsung,onenand.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung,onenand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/samsung,onenand.yaml b/Documentation/devicetree/bindings/mtd/samsung,onenand.yaml
> new file mode 100644
> index 000000000000..25012248add6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/samsung,onenand.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/samsung,onenand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung OneNAND controller
> +
> +maintainers:
> +  - Jonathan Bakker <xc-racer2@live.ca>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s3c6400-onenand
> +      - samsung,s3c6410-onenand
> +      - samsung,s5pv210-onenand
> +
> +  reg:
> +    maxItems: 3

Please describe the items or add reg-names.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: onenand
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2

Drop minItems.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Don't need these, they come from nand-controller.

> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s5pv210-onenand
> +    then:
> +      required:
> +        - interrupts
> +        - clock-names
> +        - clocks

Others require it as well, don't they?

> +
> +patternProperties:
> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1
> +
> +    additionalProperties: false

Also not needed.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

With dropping all duplicated properties from nand-controller, this can
be unevaluatedProperties:false. Unless for some reason parts of
nand-controller schema are not valid here?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/s5pv210.h>
> +    onenand: nand-controller@b0600000 {
> +        compatible = "samsung,s5pv210-onenand";
> +        reg = <0xb0600000 0x2000>,
> +          <0xb0000000 0x20000>,
> +          <0xb0040000 0x20000>;

Align the entries with first <> entry.

> +        interrupt-parent = <&vic1>;
> +        interrupts = <31>;
> +        clocks = <&clocks CLK_NANDXL>, <&clocks DOUT_FLASH>;
> +        clock-names = "bus", "onenand";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nand@0 {
> +          reg = <0>;
> +        };
> +    };


Best regards,
Krzysztof
