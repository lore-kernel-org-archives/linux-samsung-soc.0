Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FEDC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Dec 2022 17:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbiLTR0g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Dec 2022 12:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiLTR0f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Dec 2022 12:26:35 -0500
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C458E109F;
        Tue, 20 Dec 2022 09:26:34 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-144bd860fdbso16255953fac.0;
        Tue, 20 Dec 2022 09:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4M2G5tAP96aHEIkyll33q5MFWXKDDZiGpZ9U6HjjopI=;
        b=fHtGsY3iOATQ7ARPLKIKUWk2YzOPT5oI63t9Li+6ZK+DO5b1mQjOcQ48RiivlYvIdc
         e3bJZRJg3UZH2Ho4Akk8lubtdIlbtldQnn9k3mN9NfHwOQKLkKsYIxqWWw5CNdMS2ycX
         dZArGPv0e7eQR2n//k1aloPR7nW2OeOQXOelK9HE69tq8RVtwOtJ6KcT/gz1SRumMEVZ
         yvI4t7JUcFRdRJPbVEM6vN7t3rrzEkVLYB1VWMsaS0xJdDP8meHdIaOCcE0p/EhMGFu5
         ffF3ddMgcUr45bqWjxh0D0PqpyXxWPb9XdLtqBezFzyAdq6Hu0WYkFbq7ztpX05wZsWk
         BJmQ==
X-Gm-Message-State: ANoB5pkYB+n1KVpYkxkqhUYvvRuCZfoxWA/SRyQNLLxiICxZgkkzFyGV
        oAIyKmLyErz77Vni2sEVOA==
X-Google-Smtp-Source: AA0mqf6PMqjVBcS2KbfPfigLZKoFqm3zbK1aNyc6aBW3vGD43BaZGHI5hNI7IiHtjf4xgVp56uF32A==
X-Received: by 2002:a05:6870:44d1:b0:144:d3f9:ff14 with SMTP id t17-20020a05687044d100b00144d3f9ff14mr21897111oai.14.1671557194070;
        Tue, 20 Dec 2022 09:26:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be13-20020a056870588d00b00142fa439ee5sm6222204oab.39.2022.12.20.09.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 09:26:32 -0800 (PST)
Received: (nullmailer pid 778943 invoked by uid 1000);
        Tue, 20 Dec 2022 17:26:31 -0000
Date:   Tue, 20 Dec 2022 11:26:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Fancy Fang <chen.fang@nxp.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v10 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
Message-ID: <167155719100.778885.10539247780206262698.robh@kernel.org>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-18-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214125907.376148-18-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 14 Dec 2022 18:29:06 +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.
> 
> Add dt-bingings for it.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v10, v9:
> - none
> 
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
