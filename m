Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E186C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 21:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjA0VXi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjA0VXh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:23:37 -0500
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B9D1205D;
        Fri, 27 Jan 2023 13:23:36 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id n24-20020a0568301e9800b006865671a9d5so2611688otr.6;
        Fri, 27 Jan 2023 13:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyNyx9MRAGwe4fu5uXWV7BSlMqMk0+yLaGW1dutDc6o=;
        b=Vp4kT+kISzEkkdWmVrFRH3FAYDLvEybO25EvDPx/lZDgNp8dY0pk8fObIo6Ct8PEyb
         JHQ6k5ar4AekajXKTLp/YhObuOHvQgpROtqEcmyFyQ4Ge9DIsciO3Z9d4o7eY0tEs2i+
         heVcE3zBtj3TV/2E9JQLJeGT96vmNGLa8KubX6/Oj8uYiehst7WGrdKxH3fZeik26o3O
         ZwVkniYPY3KD1iJXw/FabiPhgRAPi1xZvAOWMlch0kzuc3CE4AqEzmN7gk6U7SMiO7my
         S0PT38bo1X7JEs7stCdQT7hj2JiKjgFqN8EQb6KED6+yraWM14N9Zy2DVyc/OaNcSJVb
         tm7A==
X-Gm-Message-State: AO0yUKVyIZtnL0OdVQMrw5BfmjWN535B/UTtgovfowUVUuoOuOhY1krs
        /3tIPU6fMjEfBmv4eG82qw==
X-Google-Smtp-Source: AK7set9hoFnAHHCAH5ojVpwXzh1BY1WWbz9NHe8AkgB3/OjD6iE1GIHKEd1c+U+9Fx68eEdgROItRg==
X-Received: by 2002:a9d:5c84:0:b0:686:4860:fa2f with SMTP id a4-20020a9d5c84000000b006864860fa2fmr3572939oti.29.1674854616198;
        Fri, 27 Jan 2023 13:23:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k4-20020a9d7dc4000000b00684d5bd56dbsm2246654otn.66.2023.01.27.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:23:35 -0800 (PST)
Received: (nullmailer pid 705463 invoked by uid 1000);
        Fri, 27 Jan 2023 21:23:34 -0000
Date:   Fri, 27 Jan 2023 15:23:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     phone-devel@vger.kernel.org, replicant@osuosl.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as
 child
Message-ID: <167485461395.705377.3305250197466853388.robh@kernel.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
 <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 27 Jan 2023 20:40:50 +0100, Krzysztof Kozlowski wrote:
> The MIPI and DisplayPort phys are actually part of the Power Management
> Unit system controller, thus allow them as its children, instead of
> specifying as separate device nodes with syscon phandle.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/samsung/exynos-pmu.yaml      | 71 +++++++++++++++----
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
