Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D763CC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 13:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbiFBNeF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbiFBNeE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 09:34:04 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0990C24F1D;
        Thu,  2 Jun 2022 06:34:03 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-f2cd424b9cso6739270fac.7;
        Thu, 02 Jun 2022 06:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XHtk5lPpdv9aQAbo7PKve7P48uRcjksH60tp9ht2itA=;
        b=MARl5DeTa+DJF3hPP3bAG5ROxA4In8sKgkAfNw2/nWefb2WZCs+kmfZ+c7f3gWLi3h
         CqSn5j7loqUHid1PlEtwV3jzGF+bjcXiC4uafxFYg4MG2MTwoURVYfQgEdNCZSI7JV2J
         zZ/kwajLLFB68dawmAlSuIVd8hguLDBESCyCzO5Ty+oqRebrpVg3vhuDxk6hyhnnDUI0
         bDbSm3wv4Mo4i5qH63cjt3/BshBKq5gbCjvu/f1mAfiYJwyoDI5TO8vmMBF+nHT185S8
         DLW99Q9HKaZD7w0PbOWL2bDnCCAMDSLkMirC9u95nYXI3koUf+ukfg63hZbjDRImITTY
         OGmA==
X-Gm-Message-State: AOAM531w7z3FkheVFXVmEGMIm3JuOL4fMQG/xdmLpjrB1/Ef8pniRBgd
        qMZyxAOvEO0yTh4EDe8Ksw==
X-Google-Smtp-Source: ABdhPJx//mfc+eM2LN+DoKp6lWIz4rF2Z6Mc8WKwbK4L2ekRpxSTIGTOBLF3BgtjdPw8kO8Bn1KZ3A==
X-Received: by 2002:a05:6870:e256:b0:f3:3165:6741 with SMTP id d22-20020a056870e25600b000f331656741mr2829438oac.60.1654176842322;
        Thu, 02 Jun 2022 06:34:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870618700b000f1b1ff7b8bsm2010860oah.51.2022.06.02.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:34:02 -0700 (PDT)
Received: (nullmailer pid 2158251 invoked by uid 1000);
        Thu, 02 Jun 2022 13:34:01 -0000
Date:   Thu, 2 Jun 2022 08:34:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: add samsung,boot-mode
 definitions
Message-ID: <20220602133401.GA2158209-robh@kernel.org>
References: <20220523121244.67341-1-chanho61.park@samsung.com>
 <CGME20220523121210epcas2p43ff75b7972f3d2ead844b12aec95f936@epcas2p4.samsung.com>
 <20220523121244.67341-2-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523121244.67341-2-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 23 May 2022 21:12:43 +0900, Chanho Park wrote:
> Adds samsung,boot-mode.h header file which contains boot mode
> definitions for bootloader. As for now, there are only boot mode
> definitions for Exynos Auto v9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  include/dt-bindings/soc/samsung,boot-mode.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
> 

Acked-by: Rob Herring <robh@kernel.org>
