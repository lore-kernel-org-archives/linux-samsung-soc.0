Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B03C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Jan 2023 21:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjA3VWR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Jan 2023 16:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjA3VWQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 16:22:16 -0500
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B228544BD6;
        Mon, 30 Jan 2023 13:22:14 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-163bd802238so4722997fac.1;
        Mon, 30 Jan 2023 13:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ+eBx2LRsO5FUwHyxKkgCUPaWB9Ix+NfxqKDqjGEZM=;
        b=ibXibB9pE8JxQ6F48tJXS18A68mqtXfrNVPo20xZoepabyE5GkI4P+NG/0os2eswX+
         N5GZWslrR0GnPJLaINztKSwdS5ndbqYqARm5nccUJ+nFr4yo6LD8cWcliKi+e2PmASMU
         4aR6w5HWlvCt8fvbxlg1hCEmkon9alQlTCOkl3hKUEfuHHXbJlxh6oNrnH5KgK/gcpdY
         N0cHpxDYP+/K7sJmHq+jxQU5I4XVWnamDQqDn7us2YVcu9rC9lstGN4kmwu78pNqStCh
         s1Slm0XKZdlXgIuZ4ekE26KNfxJ1wvUVPaiZyeQFeAlZ7fQqJS3T7ZnrXEnvwfDr/TJG
         WABw==
X-Gm-Message-State: AO0yUKWicP0X20q2TXlQ4jNTHw4ioLoyy2g79w9XlGpJTKNxBRNqlDcj
        hSQ/m5tCo/oiwafs4GSSLA==
X-Google-Smtp-Source: AK7set/KeFL8Z5Buy3G3kH3IByoTxOzC/qb7dQzVJ/ttEJb5jzKY4nOhRTb7M61cPH8Rz6GF2oM16A==
X-Received: by 2002:a05:6870:c18f:b0:163:97bd:814d with SMTP id h15-20020a056870c18f00b0016397bd814dmr4734826oad.27.1675113733933;
        Mon, 30 Jan 2023 13:22:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n18-20020a056870971200b0014fe4867dc7sm5695918oaq.56.2023.01.30.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:22:13 -0800 (PST)
Received: (nullmailer pid 3516638 invoked by uid 1000);
        Mon, 30 Jan 2023 21:22:12 -0000
Date:   Mon, 30 Jan 2023 15:22:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        phone-devel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-usb@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v2] dt-bindings: usb: samsung,exynos-dwc3: allow unit
 address in DTS
Message-ID: <167511373111.3516190.9618063650854117643.robh@kernel.org>
References: <20230127211748.260718-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127211748.260718-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 27 Jan 2023 22:17:48 +0100, Krzysztof Kozlowski wrote:
> The Samsung Exynos SoC USB 3.0 DWC3 Controller is a simple wrapper of
> actual DWC3 Controller device node.  It handles necessary Samsung
> Exynos-specific resources (regulators, clocks), but does not have its
> own MMIO address space.
> 
> However neither simple-bus bindings nor dtc W=1 accept device nodes in
> soc@ node which do not have unit address.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Use ranges with values and drop reg from usb-wrapper node.
> 2. Keep "usb" as wrapper's node name.
> 
> DTS fixes are here:
> https://lore.kernel.org/linux-samsung-soc/20230127211527.260060-1-krzysztof.kozlowski@linaro.org/T/#t
> ---
>  .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
