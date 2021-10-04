Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3504C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACE0261381
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhJDOmw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:42:52 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44852 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbhJDOmw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:42:52 -0400
Received: by mail-oi1-f179.google.com with SMTP id e24so21769938oig.11;
        Mon, 04 Oct 2021 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZG8iaXegU3CYz3ffGQN34dJt360ed6JXnQKEGpH3pTw=;
        b=luNPo5VHVB199soVD9eD1Q4Yt8SNb6RfiZ1WG1zom/pLNdvoDopAFNZKgIa/R1mDzB
         0Pny7viVGu3vF7VLNJVHlJlhxGxYRFnr+xnh/sYuIipjWyPHWjWrG6xUxrAakDMHVtrC
         LBwyJNKO5Wn0xj8i9iSebeX8/zrrz5LKAwFwma61Q6O/mpBcp0aifeGyJ+aWRO9SFup5
         8XI5gIbkBqInY05Qdc4AvCe4BYOtNfRrOdknUUYN6o+/Y1JBf7FKpEflgwo3kBhWDtQN
         IRvROkbSxzgD/7fiiHwqZCT4b3tGgp33H6Qk2nOcENUVgMHF9ujmMM/mte0auS439lJz
         dXkg==
X-Gm-Message-State: AOAM531ZG1SPl51rLN/GmfRyhlRIuY9Oey3eioxMrnO5aOhhhAA812Ac
        4K/XxUMXi+GB78a5kYxE1g==
X-Google-Smtp-Source: ABdhPJyjkqTZp9Yi3C463UquFWlE0F6JkV4G420TSvLih4TJV6SsuIPerMb71DizjPlWqvjgJCG1Vw==
X-Received: by 2002:aca:6108:: with SMTP id v8mr14010901oib.139.1633358462807;
        Mon, 04 Oct 2021 07:41:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s29sm2920303otg.60.2021.10.04.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:41:02 -0700 (PDT)
Received: (nullmailer pid 1261850 invoked by uid 1000);
        Mon, 04 Oct 2021 14:41:01 -0000
Date:   Mon, 4 Oct 2021 09:41:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/10] regulator: dt-bindings: samsung,s5m8767:
 convert to dtschema
Message-ID: <YVsSfSBeAZ8DFYfH@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-7-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 01, 2021 at 11:41:02AM +0200, Krzysztof Kozlowski wrote:
> Convert the regulators of Samsung S5M8767 PMIC to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/samsung,s5m8767.txt    | 140 ------------------
>  .../bindings/regulator/samsung,s5m8767.yaml   |  83 +++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 84 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
> deleted file mode 100644
> index 6cd83d920155..000000000000
> --- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -Binding for Samsung S5M8767 regulator block
> -===========================================
> -
> -This is a part of device tree bindings for S5M family multi-function devices.
> -More information can be found in bindings/mfd/sec-core.txt file.
> -
> -The S5M8767 device provide buck and LDO regulators.
> -
> -To register these with regulator framework instantiate under main device node
> -a sub-node named "regulators" with more sub-nodes for each regulator using the
> -common regulator binding documented in:
> - - Documentation/devicetree/bindings/regulator/regulator.txt
> -
> -
> -Required properties of the main device node (the parent!):
> - - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
> -   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
> -
> - [1] If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
> -     property is specified, then all the eight voltage values for the
> -     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
> -
> -Optional properties of the main device node (the parent!):
> - - s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
> -   units for buck2 when changing voltage using gpio dvs. Refer to [1] below
> -   for additional information.
> -
> - - s5m8767,pmic-buck3-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
> -   units for buck3 when changing voltage using gpio dvs. Refer to [1] below
> -   for additional information.
> -
> - - s5m8767,pmic-buck4-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
> -   units for buck4 when changing voltage using gpio dvs. Refer to [1] below
> -   for additional information.
> -
> - - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
> - - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
> - - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
> -
> -Additional properties required if either of the optional properties are used:
> -
> - - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
> -   the possible 8 options selectable by the dvs gpios. The value of this
> -   property should be between 0 and 7. If not specified or if out of range, the
> -   default value of this property is set to 0.
> -
> - - s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
> -   for dvs. The format of the gpio specifier depends in the gpio controller.
> -
> -
> -Names of regulators supported by S5M8767 device:
> -	- LDOn
> -		  - valid values for n are 1 to 28
> -		  - Example: LDO1, LDO2, LDO28
> -	- BUCKn
> -		  - valid values for n are 1 to 9.
> -		  - Example: BUCK1, BUCK2, BUCK9
> -Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
> -as per the datasheet of device.
> -
> -
> -Optional properties of the nodes under "regulators" sub-node:
> - - op_mode: describes the different operating modes of the LDO's with
> -            power mode change in SOC. The different possible values are,
> -             0 - always off mode
> -             1 - on in normal mode
> -             2 - low power mode
> -             3 - suspend mode
> - - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
> -                                   GPIO controlling this regulator
> -                                   (enable/disable); This is valid only
> -                                   for buck9.
> -
> -Example:
> -
> -	s5m8767_pmic@66 {
> -		compatible = "samsung,s5m8767-pmic";
> -		reg = <0x66>;
> -
> -		s5m8767,pmic-buck2-uses-gpio-dvs;
> -		s5m8767,pmic-buck3-uses-gpio-dvs;
> -		s5m8767,pmic-buck4-uses-gpio-dvs;
> -
> -		s5m8767,pmic-buck-default-dvs-idx = <0>;
> -
> -		s5m8767,pmic-buck-dvs-gpios = <&gpx0 0 0>, /* DVS1 */
> -						 <&gpx0 1 0>, /* DVS2 */
> -						 <&gpx0 2 0>; /* DVS3 */
> -
> -		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>, /* SET1 */
> -						<&gpx2 4 0>, /* SET2 */
> -						<&gpx2 5 0>; /* SET3 */
> -
> -		s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
> -						 <1250000>, <1200000>,
> -						 <1150000>, <1100000>,
> -						 <1000000>, <950000>;
> -
> -		s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
> -						 <1100000>, <1100000>,
> -						 <1000000>, <1000000>,
> -						 <1000000>, <1000000>;
> -
> -		s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
> -						 <1200000>, <1200000>,
> -						 <1200000>, <1200000>,
> -						 <1200000>, <1200000>;
> -
> -		regulators {
> -			ldo1_reg: LDO1 {
> -				regulator-name = "VDD_ABB_3.3V";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
> -				op_mode = <1>; /* Normal Mode */
> -			};
> -
> -			ldo2_reg: LDO2 {
> -				regulator-name = "VDD_ALIVE_1.1V";
> -				regulator-min-microvolt = <1100000>;
> -				regulator-max-microvolt = <1100000>;
> -				regulator-always-on;
> -			};
> -
> -			buck1_reg: BUCK1 {
> -				regulator-name = "VDD_MIF_1.2V";
> -				regulator-min-microvolt = <950000>;
> -				regulator-max-microvolt = <1350000>;
> -				regulator-always-on;
> -				regulator-boot-on;
> -			};
> -
> -			vemmc_reg: BUCK9 {
> -				regulator-name = "VMEM_VDD_2.8V";
> -				regulator-min-microvolt = <2800000>;
> -				regulator-max-microvolt = <2800000>;
> -				op_mode = <3>; /* Standby Mode */
> -				s5m8767,pmic-ext-control-gpios = <&gpk0 2 0>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> new file mode 100644
> index 000000000000..3192a06b5ef9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/samsung,s5m8767.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5M8767 Power Management IC regulators
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +
> +description: |
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  The S5M8767 provides buck and LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
> +  additional information and example.
> +
> +patternProperties:
> +  # 28 LDOs
> +  "^LDO([1-9]|1[0-9]|2[0-8])$":
> +    type: object
> +    $ref: regulator.yaml#
> +    description:
> +      Properties for single LDO regulator.
> +
> +    properties:
> +      regulator-name: true

This is fine, but technically it is not needed. There's not any 
requirement that items in 'required' be listed under 'properties'.

> +
> +      op_mode:

Needs a type reference.

> +        enum: [0, 1, 2, 3]
> +        default: 1
> +        description: |
> +          Describes the different operating modes of the LDO's with power mode
> +          change in SOC. The different possible values are:
> +            0 - always off mode
> +            1 - on in normal mode
> +            2 - low power mode
> +            3 - suspend mode
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false

On child nodes, I think it's better to place this up with the $ref and 
'type: object' since the indentation can be hard to follow. 

> +
> +  # 8 bucks
> +  "^BUCK[1-8]$":
> +    type: object
> +    $ref: regulator.yaml#
> +    description:
> +      Properties for single BUCK regulator.
> +
> +    properties:
> +      regulator-name: true
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false
> +
> +  # 9 buck
> +  "^BUCK9$":
> +    type: object
> +    $ref: regulator.yaml#
> +    description:
> +      Properties for single BUCK regulator.
> +
> +    properties:
> +      regulator-name: true
> +
> +      s5m8767,pmic-ext-control-gpios:
> +        maxItems: 1
> +        description: |
> +          GPIO specifier for one GPIO controlling this regulator on/off.
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee486357cf45..5a7cb990b182 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16602,7 +16602,7 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
>  F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
>  F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
> -F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
> +F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
>  F:	drivers/clk/clk-s2mps11.c
>  F:	drivers/mfd/sec*.c
>  F:	drivers/regulator/s2m*.c
> -- 
> 2.30.2
> 
> 
