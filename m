Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A62C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 May 2022 22:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349854AbiEPW4o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 May 2022 18:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349855AbiEPW4n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 May 2022 18:56:43 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EAD29C93;
        Mon, 16 May 2022 15:56:38 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-edf9ddb312so22152473fac.8;
        Mon, 16 May 2022 15:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9JpR0VbPHC9Ot9LMXLbulS3SOKAjNY3sH8Ig5/561d0=;
        b=nG4FYGjZ+YlrsT11SiFZ7M6nz8J3Mo3yDUVt39dyaby9sJMlVzT3WYLPg0CkguPQWD
         LhGGGh6S8BH+lmWdnmXnaYM1k/G2pejJ2WHiAHfJKpL/9GceEJVs1BZiHP1/wBdatcqM
         hOok4+FCSr30CUz4skDxE8AnbU5cl955lmDI9TDLHOQbPzKvyByJjO3tM0BqB9gL7YF6
         wcRirWrlE6TD9z/DXyHytMf6cEkdSHsbo0i7CejYPai0C9kDaShB175I4p+2FoWqZ1Jk
         pHZr032jyAX4Jsy+ht99KTSq/p+BGPIumxjxmPpo+4SrAM5+EwrtHfHuzeJkxn1Sm1Hs
         TeGQ==
X-Gm-Message-State: AOAM533zFi3bbzj6jew5Q6YtIEPZzQb3HSxcAZDxj9bjWpwvKKW3Va5Y
        z77861hh1PhCfEdGv4zGeg==
X-Google-Smtp-Source: ABdhPJwxKQk9+/mRedofsllv+p9O0Iv9HVxFpCS4EiHKJmsKR/DTsoiZSjr53bOAe0CGl8MZjRB6uA==
X-Received: by 2002:a05:6870:469e:b0:f1:6a40:e7dd with SMTP id a30-20020a056870469e00b000f16a40e7ddmr8836756oap.260.1652741798040;
        Mon, 16 May 2022 15:56:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y22-20020a4a6256000000b0035eb4e5a6cfsm4578810oog.37.2022.05.16.15.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:56:37 -0700 (PDT)
Received: (nullmailer pid 3474248 invoked by uid 1000);
        Mon, 16 May 2022 22:56:36 -0000
Date:   Mon, 16 May 2022 17:56:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Inki Dae <inki.dae@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adam Ford <aford173@gmail.com>, Fancy Fang <chen.fang@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 11/12] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8MM support
Message-ID: <20220516225636.GA3474191-robh@kernel.org>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-12-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504114021.33265-12-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 04 May 2022 17:10:20 +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.
> 
> Add dt-bingings for it.
> 
> v2:
> * updated comments
> 
> v1:
> * new patch
> 
> Cc: devicetree@vger.kernel.org,
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note:
> I will send separate series for updating to yaml as the existing binding
> is old that it has some properties need to fix.
> 
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
