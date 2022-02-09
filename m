Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Feb 2022 22:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbiBIWj4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Feb 2022 17:39:56 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiBIWjz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 17:39:55 -0500
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9319DE01A2E4;
        Wed,  9 Feb 2022 14:39:58 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso4190169oop.9;
        Wed, 09 Feb 2022 14:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9LTj9g9v9fEplqwzV7DqYmU2pd1A3USTNnaU4aUzRKI=;
        b=k1lZHu2E63t943ahx0ePLHAxkuuOBw8bi8uoDjppVgExX4IrIh+I79yxfxeRagNH6/
         X70y45WGPSwpCl9kxjCUpUPvdSPQ5PUoaHPNwne/bzY6tVnH2rHK2SWKNij4dcte1KfI
         p0i25NF9HI7lRDVfTqH7unabUdyGLzjYGf8NMVspkjDT3nGkWPnRFKMoxdHBIgeFhQo7
         Ql1QOkKnyKReQUCNq/fpW0PYmnlkvwui3GKy1OhVoCySeIcsRc47kx0hbW8B9JGgObao
         s8AMzBUmYOv4gFq0pIM3u1TWDDnkCqXzVE6M5OV5efSfSIntmsgayG5jK2K0tu5A2Q7W
         Z8FA==
X-Gm-Message-State: AOAM530H9xy/GEQISedUkD4bKDqwbNptTjih2xCa9yY0029KB9SsAFJS
        sRx4yzFZ/MeDPjb4XcELWg==
X-Google-Smtp-Source: ABdhPJwA3fufMa0ThKPBXJGk56i5UtdHUNSFdzuPQv1ozVU8rJvBLQ8Uhfgheg5jwu54rD2fDfP8nQ==
X-Received: by 2002:a05:6870:44c2:: with SMTP id t2mr1742372oai.287.1644446397906;
        Wed, 09 Feb 2022 14:39:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d1sm5282504otk.70.2022.02.09.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 14:39:57 -0800 (PST)
Received: (nullmailer pid 1074568 invoked by uid 1000);
        Wed, 09 Feb 2022 22:39:55 -0000
Date:   Wed, 9 Feb 2022 16:39:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        devicetree@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        linux-samsung-soc@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 05/10] dt-bindings: display: samsung,exynos7-decon:
 convert to dtschema
Message-ID: <YgRCu8I7VqMCiJtF@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-6-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 08 Feb 2022 18:18:18 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos7 DECON display controller bindings to DT schema
> format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/exynos7-decon.txt |  65 ----------
>  .../samsung/samsung,exynos7-decon.yaml        | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> 

Applied, thanks!
