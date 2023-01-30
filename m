Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C94C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Jan 2023 21:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjA3VQA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Jan 2023 16:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjA3VQA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 16:16:00 -0500
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583A5101;
        Mon, 30 Jan 2023 13:15:59 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1636eae256cso12574948fac.0;
        Mon, 30 Jan 2023 13:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWEGTFkEGCDwt0FDdOMuv/dycXI91d7WGTYMVLBwuV4=;
        b=tNB8rzRkdF5BINfTNbgajG4EF8ZRhCdHbLf2SpiEXSz/5lFQD8JCcsk+P0oXUoBdWn
         G/2RGUPS/Hio+oc/qFRO68VzWZM9cxk/vz4pNM6tEsUDgyl6gHGfgB9/QA/He46wkjLD
         DM2AGfCyHacIzSYXvdOxt3evOkL/UdXWtowRHkVXtgiF6H0BqOf/vHOZiAqcpZfS2Hm1
         uFRr1xvdoxDN+wHm2YV7qjzqswfLUjQggzm3trhIN1wQRYc7+uzxiVuKe5A4Rl01OkvQ
         tuHA7Y3fxZpcGYPy/WMUmjkMY/Rhi6qP+xY9yxGWtO4XxnR7FJnYnRge+kulnRr95Sc6
         c7hQ==
X-Gm-Message-State: AFqh2kqTzS3FKApBhIT/xTkQkz5SfkEA3izPb2BGspQjwWdW0mtKCzEL
        cEI3rgMDcGMzPNbUz5A4bGa8VsVxDQ==
X-Google-Smtp-Source: AMrXdXsTk6bSgzcgfo/aY72f07w1LwS4ubdDx+nCb3KYjoCCBxMPlbe/5r67QDTxRQUn6JtsKvp4iA==
X-Received: by 2002:a05:6870:b50a:b0:15f:b59a:55f1 with SMTP id v10-20020a056870b50a00b0015fb59a55f1mr22963203oap.16.1675113358561;
        Mon, 30 Jan 2023 13:15:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x8-20020a056870e38800b00144e18d8525sm5702732oad.25.2023.01.30.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:15:58 -0800 (PST)
Received: (nullmailer pid 3443932 invoked by uid 1000);
        Mon, 30 Jan 2023 21:15:57 -0000
Date:   Mon, 30 Jan 2023 15:15:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Grimler <henrik@grimler.se>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, replicant@osuosl.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/8] dt-bindings: phy: samsung,dp-video-phy: deprecate
 syscon phandle
Message-ID: <167511335663.3443736.11676143782553912242.robh@kernel.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
 <20230127194057.186458-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127194057.186458-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 27 Jan 2023 20:40:51 +0100, Krzysztof Kozlowski wrote:
> The DisplayPort phy is actually part of the Power Management Unit system
> controller, thus it should be its child, instead of sibling node with
> syscon phandle.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/phy/samsung,dp-video-phy.yaml        | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
