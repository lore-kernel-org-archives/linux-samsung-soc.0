Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4745C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbiBVPDV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbiBVPDC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:03:02 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EE613DE03
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:01:59 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A21173F1D0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542118;
        bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=nogJOYgMjP3q+1b/iv2nOshul4hi1Qzqf45kW8TCCOWPllzgXgILW5EqmXlmGCYLj
         FQEoq4nn5jmJh/JmPCd34AMkX0IeGBP93PHeGlzxIwPfegABA10huL4vLq4KEiMweG
         hL4wO8m6VVIiMgZ4QWQlbjUqakBj67AR0hDFx7b9G71y/nRH3bhSvMym642cWIgegg
         D8CtidGbLgmZzG3dBzKf5AEU1FzxhfQ0Vwyk6P/bIzzmt+zVvbINfFIzZ9PYcZhKrn
         RrfODmhSqW+XyMtFOmengPlhpEkmK6wFUmfDvpJiCP4UWn1rKGrmj5vS51nivFgtkN
         5jfv/E9UoCKRA==
Received: by mail-ed1-f72.google.com with SMTP id dy17-20020a05640231f100b00412897682b4so10331563edb.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
        b=XsHbVQudvYK6BKwVS4dkisjZimQD+aLDIHp4BKhmv6bhrRSafHFQ5jIU2q91JS3X1P
         yAQTjn/JD9/9XiBwAAaH4wiD5C1yvVWqf5yVh+4ovFEzAodbf/7cfsaVF3YpwyPlwdhr
         JYGlgJttlKKZFzSEtzOIertmSAsmuWE+T0foQCGngf5+atvJaVdA6HzMOhA81PmnarI9
         YGO8cbPJ9ks54vjEmVbD7DXE1JBaxhmmi5XutnyZqlg5SvPgZdQ0Os5gGaxpNmI0G92m
         U+1LQdK34/MMIbah9hVFfCIXuG6ZrX1/1TwVHcwjz1SeHBtQIvwHbG3Hd91kWVSuL/Qx
         qqyA==
X-Gm-Message-State: AOAM533gpmVYLzxJ/aLPyY2WGQcnWcPnxay05NqCUhQqzMgZJhv5cdxK
        gOCotCb8l+Vy7mjNthS2yZG1qDXv3wcP3TpxYVkFDXwjUPBkrpsWueKyY86q3/EzYR+sddukzQ7
        +PpQdSU0n87P5Qz8SjYyQBRFH/4FSuOCksoU/CXYxQyY8pMLh
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id v5-20020a170906b00500b006b48861597bmr19372062ejy.238.1645542107962;
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl5ajALOLJhstZXNm4FFrBok2iV4kiyLbSmxL7nyMkd0sVGKDRLluG1qlnkwVf1Pl3ETi9Pw==
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id v5-20020a170906b00500b006b48861597bmr19372009ejy.238.1645542107580;
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id ci16sm6345629ejb.128.2022.02.22.07.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Message-ID: <4e459bbb-ca6c-4ca2-efe9-8ab4d4f3b648@canonical.com>
Date:   Tue, 22 Feb 2022 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/15] dt-bindings: ufs: qcom,ufs: convert to dtschema
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/02/2022 15:58, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Except the conversion, add also properties already present in DTS:
> iommus, interconnects and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
>  2 files changed, 241 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> new file mode 100644
> index 000000000000..356217124222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -0,0 +1,241 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Universal Flash Storage (UFS) Controller
> +
> +maintainers:
> +  - Yaniv Gardi <ygardi@codeaurora.org>

This email bounces ("User doesn't exist: ygardi@codeaurora.org"), so
maintainer is needed for Qualcomm UFS bindings.

Best regards,
Krzysztof
