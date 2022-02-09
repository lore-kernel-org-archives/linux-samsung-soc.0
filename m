Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F46C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Feb 2022 22:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbiBIWbY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Feb 2022 17:31:24 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbiBIWbV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 17:31:21 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C3DE018E48;
        Wed,  9 Feb 2022 14:31:19 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso4203821oon.5;
        Wed, 09 Feb 2022 14:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2H8hHKbSak4dAt/WhHv3nOZEy8FegniKIozqHwrxQUg=;
        b=4vLPX/rjfQhpaEyiv3SlS6f7YW8+zQxwci5qhFBta+5YhX7aEa+wmeSC/UcfrkzDdt
         gkox+uzdGChX8hILVAqN4TmK8usMhi+L9wOu7B1KTgZOxE94C8KS4Bw0h5kFatg8BZLu
         X2gSsf+pSvvRMpG7o0GwDJeMYTxabai4mYkZIqbaR5TjhAXJhUZ4T+trS0EP/nWuTDXU
         GNbXltrWmEid5uB3Lc1nWLGrRuqIK+OAd2rDJwwb2qywfmCYa/SJQmUrl9zyGGYb9Lb0
         fL4rPmk5DamLW2JfiWlQHBancX+Tof6sYtrAntNSksy72uTVQvmZsSMRX7Y4pPa15K+i
         rJpA==
X-Gm-Message-State: AOAM532/53LIqCg60/Z7j1Py9cO4MV8qvAjBbEaNFVYWHzIJt1Fr1qc0
        OfEHHDzZaei1gTkkKF2uTA==
X-Google-Smtp-Source: ABdhPJzhi4uQOX9O9kvx3kgG70SzZYn5g9JOrkWV8J385lKTQ8Qbnf+hYiD4swGjoh9lC2WmCJMqxg==
X-Received: by 2002:a05:6870:f809:: with SMTP id fr9mr1433761oab.88.1644445878946;
        Wed, 09 Feb 2022 14:31:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t21sm7139033otj.26.2022.02.09.14.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 14:31:18 -0800 (PST)
Received: (nullmailer pid 1059554 invoked by uid 1000);
        Wed, 09 Feb 2022 22:31:17 -0000
Date:   Wed, 9 Feb 2022 16:31:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: phy: samsung,usb3-drd-phy: convert to
 dtschema
Message-ID: <YgRAterZZUpvF3UT@robh.at.kernel.org>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
 <20220129193646.372481-8-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129193646.372481-8-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Jan 2022 20:36:46 +0100, Krzysztof Kozlowski wrote:
> Convert the Samsung Exynos USB 3.0 DRD PHY bindings to DT schema format.
> 
> Except the conversion, add also vbus-supply and vbus-boost-supply
> properties which were already used by the driver and DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/phy/samsung-phy.txt   |  53 --------
>  2 files changed, 126 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/samsung-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
