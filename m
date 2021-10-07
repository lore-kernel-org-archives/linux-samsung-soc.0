Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32230C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 18:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0883861040
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 18:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhJGScq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:32:46 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38250
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229511AbhJGScq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 14:32:46 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 55DFE3FFFD
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633631451;
        bh=udvQb5YkJZw9BC1VpFEKFml8jvra6kBTS8xwiHMdWjo=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PidBQAMKAqlqRGuycfRit5J9xXYiA/nbivBPe8xwK/0vJ6rX3lATVTM8NVfhXsDe2
         d516+gs5IuCR+JyuoEgA6fSLW4fonQF6202cNhgDQslyyx/nwoLwcH24bt4uWbxeUn
         YwgHykYX70QzRQh2s/k0dNM+f8mzhDWjGtKyxJDT1jx91aUUgmDsWq/T9h/E7Hsxr2
         n/+kaEjlfeevta+jCQNBQXaXaYrwf6o/uA+laN5I7lnhr1ofdteks7Zbe0bZpfWMbU
         p6qw9R3X8WiGRMOIi/wg3qYle/2fIbvwQ0eRcSaoCGcZFDgrjGZ2wKCPcoGE6t/cnM
         l6Q9JjRnhehkw==
Received: by mail-wr1-f71.google.com with SMTP id j19-20020adfb313000000b00160a9de13b3so5389904wrd.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 11:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=udvQb5YkJZw9BC1VpFEKFml8jvra6kBTS8xwiHMdWjo=;
        b=CBCIjMH8MHqv2k0R4hfPAeL5TPrQ/D69Q4+KLRpl7VQnlP9dxczNTPB9DFKeyvGIMP
         2P+Mx1He2Z2z2e9s81ZZgeuQyFItGR1/Nj4KoYjSFg/QcLFTlfY5uL6LHS9RfyJ6wJbR
         h/+0iRzne+PJiEK+44ReDd68UWtdUVhFCwK2x0ukY9E4wD81OnkWG8TF2+gm6qTwgndu
         XYZ2u8OdzRaJR/XtJPSuuwy2o2RFqLT7ZTiR3WQlAHmQoT/zXDcApWTQtQF7NKaZetT4
         IUzZ1FzRB59UT7gWXYEzMhGYhC2IYwFACwc/Hq0MZL/EMm7jLAK5KZrhQjd+NicI6CIy
         lRvA==
X-Gm-Message-State: AOAM530ueS08yappr+bBK6TQJ014RoHdiD9lMUQbpYCl4o8hsBPXNdLM
        j9YMFzR1NGoVpBDt6WufX1B5GfEARQ/0W+OruqsXJp/IFjZ0N1OgUplWmm0X8p7OcviO3WrLluQ
        T9w/klI90ZVLzRaqU1B+XNQ2Itv1nc4l9m24au8ZhUs/aBxN4
X-Received: by 2002:a05:600c:198e:: with SMTP id t14mr6479271wmq.124.1633631451019;
        Thu, 07 Oct 2021 11:30:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT2n5BgOJPrzei+gD8cQeD3zwKMCoP1yPY+ofWDlle/pakNskAkBXVb2MkecmqRlMJyRGQpQ==
X-Received: by 2002:a05:600c:198e:: with SMTP id t14mr6479248wmq.124.1633631450810;
        Thu, 07 Oct 2021 11:30:50 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id k17sm9578584wmj.0.2021.10.07.11.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 11:30:50 -0700 (PDT)
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211007120855.56555-1-chanho61.park@samsung.com>
 <CGME20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41@epcas2p3.samsung.com>
 <20211007120855.56555-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Message-ID: <67df638a-5415-0107-1b83-287f0f871817@canonical.com>
Date:   Thu, 7 Oct 2021 20:30:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120855.56555-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 14:08, Chanho Park wrote:
> SADK(Samsung Automotive Development Kit) is the development kit to
> evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
> 256GB Samsung UFS. This patch enables only serial console and ufs0
> device.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.yaml  |  6 +++
>  .../boot/dts/exynos/exynosautov9-sadk.dts     | 52 +++++++++++++++++++

You need also Makefile entry.

>  2 files changed, 58 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 0796f0c87727..2147e664d5bc 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -199,6 +199,12 @@ properties:
>                - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
>            - const: samsung,exynos7
>  
> +      - description: Exynos Auto v9 based boards
> +        items:
> +          - enum:
> +              - samsung,samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK

Double samsung.

> +          - const: samsung,exynosautov9
> +
>  required:
>    - compatible
>  
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> new file mode 100644
> index 000000000000..e59ef39a368f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung ExynosAutov9 SADK board device tree source

Any Copyrights? Not needed, just mentioning...

> + */
> +
> +/dts-v1/;
> +#include "exynosautov9.dtsi"

Include gpio.h here, because it is used. Probably you can also remove it
from dtsi - I did not see it being used in there.

> +
> +/ {
> +	model = "Samsung ExynosAutov9 SADK board";
> +	compatible = "samsung,exynosautov9-sadk", "samsung,exynosautov9";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &serial_0;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_0;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x77000000>,
> +		      <0x8 0x80000000 0x1 0x7ba00000>,
> +		      <0xa 0x00000000 0x2 0x00000000>;
> +	};
> +
> +	ufs_0_fixed_vcc: fixedregulator@0 {

Node name: "regulator" or "regulator-0" if you think you will have more
of them.

> +		compatible = "regulator-fixed";
> +		regulator-name = "ufs-vcc";
> +		gpio = <&gpq0 1 GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +};
> +
> +&serial_0 {
> +	status = "okay";
> +};
> +
> +&ufs_0_phy {
> +	status = "okay";
> +};
> +
> +&ufs_0 {
> +	status = "okay";
> +	vcc-supply = <&ufs_0_fixed_vcc>;
> +	vcc-fixed-regulator;
> +};
> 


Best regards,
Krzysztof
