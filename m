Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DC1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236433AbiCGJYM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236846AbiCGJXB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:23:01 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA1165432
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:21:15 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j17so22206741wrc.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z++oIgLafXSWYzcuMvzuaJFII2S7/dNacUD+5s9e3lE=;
        b=hzpRNCmwIRvl2PnTInjpN07IaDzfCRSiYLTekTpM7viCd/oAtBLz8ouI1E1FZY6mzi
         mQbVv6MwjNZ2DULoEZPEljY3khTdAthfULL+9jzQbOHhw+yDesW2p6yB+bvAiTDM2d42
         JTdP5Q6cP/6Y9a3kqnFMW2oyknnYJpPZLyLKhUfMBuSKqOOaX9jggDsSIU1XJnQ8WwUo
         RSyjyStPWatCsod3QHifMR8cGWDmDI5Vhl2Ml3mKxwhW9Zy/fXFe5XEk3tfrOP4ychRY
         HwORcN7Y2BdKO6bnGag7+ya29Y6SaXwPhVXGslEigp++QFj7ivTAS63NQQVVG+1rDBW5
         rEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z++oIgLafXSWYzcuMvzuaJFII2S7/dNacUD+5s9e3lE=;
        b=1uZd++5L3ZNkwXmcdijFgD8yTBoYrit8lg9eNXTy/HCk7k2Dl3mQWEIIGVAARQpsmE
         E08yt8xeV9YXjWo3vW3/1Cb9GmF01lVAMx4oKxwoH7up9ri9/xEziDIqJkatHvzUal0r
         XsZoH7RJjKFK6AUaj08XW8uD/jz/5oJ+8Kwu77KOwhuhfrAYKX9rhNMKswdZ7XOyVHt/
         xkhkwqGctjJ8sDROxQsrL4YVPVn2GkuBXMTwC2eroS3nkkzTDZbV4eXWNoJbv7vBSG/c
         E1ZPW8saiMmSGFRadu7QjMias9CMJ79jrAx2Aa5oac4luNWTU+YjqmZYfttPBpUztiQi
         aIVw==
X-Gm-Message-State: AOAM531ELXu03Xek8wbIgghR9ZTDS/QtsJL0U3XAhzdcqu8mi1owwMYG
        7/BDYackJqUbrx5kfEIXl68Tfg==
X-Google-Smtp-Source: ABdhPJx3m1IKG9MxT8EF/vts7cSLbTdPwiNTjrx0c6TS4KkTZxh1HAKynTCLgkerHctOra4RsLvroA==
X-Received: by 2002:a5d:59ab:0:b0:1e3:2576:215 with SMTP id p11-20020a5d59ab000000b001e325760215mr7758961wrr.496.1646644874308;
        Mon, 07 Mar 2022 01:21:14 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d6707000000b001f067c7b47fsm15297609wru.27.2022.03.07.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:21:13 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:21:11 +0000
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
Subject: Re: [PATCH v6 1/4] spi: dt-bindings: samsung: convert to dtschema
Message-ID: <YiXOhx+VGyn/koTC@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124082347.32747-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022, Krzysztof Kozlowski wrote:

> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
> controller bindings to DT schema format.
> 
> The conversion also drops requirement from providing controller-data and
> its data for each of SPI peripheral device nodes.  The dtschema cannot
> express this and the requirement is being relaxed in the driver now.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      |   2 +-
>  .../spi/samsung,spi-peripheral-props.yaml     |  33 ++++
>  .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
>  .../bindings/spi/spi-peripheral-props.yaml    |   1 +
>  .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
>  MAINTAINERS                                   |   2 +-
>  6 files changed, 223 insertions(+), 124 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
