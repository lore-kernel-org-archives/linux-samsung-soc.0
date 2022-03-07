Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED85C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiCGJYJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237064AbiCGJXW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:23:22 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8111D66633
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:21:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id n15so8018973wra.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FEjD5UnY3g+LJSLtm81A4hBh6vcWY851fxWX9klidBY=;
        b=S7UDc4e5bGd9CFcmgYIIsHJSuiXGjtH5EdyDFEEpI1ILcpNuKoVaSebz8vvnCfklhA
         Q3ZhwpthHRwsoyg1QRPPpReHy/Hkk4DNuZNfye2Y9ubNuPFN1VFTTzeu+tT88/6yEglK
         +g91WFyJRb4sfb0ET90aImvI8rW6kdLZ5NKTqLen4mOzqfwFbFrBm3fUuBkXsZqYRHeL
         CpALospQSfVtoSpsR5KbRfjwsDBfm+uss1lpYi8vYG9iyTNu9AxBmC+1/WpZprY7DYN5
         A2t/svZ1+oe1/9KkKFmiN1nwoYbUwcBs9Xd6xmfxXEa1s6uilZUFxBTRygnTSNQIyXea
         46tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FEjD5UnY3g+LJSLtm81A4hBh6vcWY851fxWX9klidBY=;
        b=cKuzeZxXd70XBLVTigivdjzWb9bXD3DnkGL5arO+BzB1ZbG01d09/43Rhq4peFluS6
         kZQG9EIGkTiUplToptNOxXQP7SIq4/zgtXRFiQRVaVpU+4VS76snF7Gd8ZPf6//xSIoP
         smtnPU7pZiQWBxVmqkvC9MkdgiJ6EGiayIw3+V6ZyOqXepRx9OwoepMLU3yxRRl7Gt1m
         4mo+FVoV7IbhGXud5HTkAWSNYHinOXTBkcxNlHMh35lsHDctd76MYaahaiBzdZFAHVyY
         o7y2pbBnsN8o/tU/jrWPAFhuC1ftjmxLwyidxafRDteEg4wNALRMVHdMKA3y29EMPboR
         1b6g==
X-Gm-Message-State: AOAM532JrcWYKOXK2CP6L2N3zSB9iLq768d1F/AEZMWp1eBcgLBozT6I
        g/uV3MlarldfjlRHj9zK5EMCsg==
X-Google-Smtp-Source: ABdhPJxNUOpnh3+aVjnLQhhuXGLFg25COoG20HVZw9DPDpFrcABTTJyv32aW4ES/yVz79d/Hwc0WPQ==
X-Received: by 2002:a5d:4487:0:b0:1f1:232b:794f with SMTP id j7-20020a5d4487000000b001f1232b794fmr7769355wrq.715.1646644905072;
        Mon, 07 Mar 2022 01:21:45 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id ay23-20020a5d6f17000000b001ea79f73fbcsm10517130wrb.25.2022.03.07.01.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:21:44 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:21:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 2/4] mfd: dt-bindings: google,cros-ec: reference
 Samsung SPI bindings
Message-ID: <YiXOph97XObDB2X4@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124082347.32747-3-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022, Krzysztof Kozlowski wrote:

> The ChromeOS Embedded Controller appears on boards with Samsung Exynos
> SoC, where Exynos SPI bindings expect controller-data node.  Reference
> SPI peripheral bindings which include now Samsung SPI peripheral parts.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/google,cros-ec.yaml          | 29 ++++++++++---------
>  1 file changed, 16 insertions(+), 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
