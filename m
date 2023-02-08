Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB077C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 23:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjBHXtE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 18:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjBHXtA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 18:49:00 -0500
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C505C1C31B;
        Wed,  8 Feb 2023 15:48:50 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id bh15so279771oib.4;
        Wed, 08 Feb 2023 15:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pFN4XN5IOSjqHXZe7STREqc2+KTA7BT+fzTQ0lXMbI=;
        b=r/K9vcJeX4iD9HHBcIENcuIopR/q38ke4KNXiFarTuHl4s42CqWUt/lk7i+phUH0+M
         MZKSy+xShfZM7w+8PArOqLzEi/yL484IJJEO5wxjW4tnfDXEt7KYFfOt89/Pz80ztYCJ
         q9RzmYuAXZ7MoVQ6JtW7494ka1JMVMPBzhKFLWuK+t0LGClqXdgkanBhiUkd/+bmFQgQ
         TdWImGzpgy7LwSfZ5tG0d66Rsvl+XUH0YaRuuqXLAnfr2SlJUtmS8Jret5YUZ/TqQXE3
         We++UNpdOQwH5ZuLEqsQcztZjxEvhlUsa/CLjhfEPBihjZJIFAEx8n876k4udehDVDzh
         4RNQ==
X-Gm-Message-State: AO0yUKW9Tc7dg01WXfphey+DEQZ3S+ZSus9Pe4c7GvYzJFvgZU414n2q
        peK9oxoc4byumo6m9iI2Jw==
X-Google-Smtp-Source: AK7set9pGOVPesSSEyBTYKndLL9qA/0zpiAw3aqhFCR8gM9dsSzRQBfFGvawKONfONJSfDy34dt4sw==
X-Received: by 2002:a54:458e:0:b0:37a:9e56:2a53 with SMTP id z14-20020a54458e000000b0037a9e562a53mr4077591oib.47.1675900130055;
        Wed, 08 Feb 2023 15:48:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id do20-20020a0568300e1400b0068bce6239a3sm4764994otb.38.2023.02.08.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:48:49 -0800 (PST)
Received: (nullmailer pid 2937575 invoked by uid 1000);
        Wed, 08 Feb 2023 23:48:49 -0000
Date:   Wed, 8 Feb 2023 17:48:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-pmu: allow phys as
 child on Exynos3 and Exynos4
Message-ID: <167590012866.2937519.2772013731906369114.robh@kernel.org>
References: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 07 Feb 2023 20:28:49 +0100, Krzysztof Kozlowski wrote:
> Just like on Exynos5250, Exynos5420 and Exynos5433 the MIPI phy is
> actually part of the Power Management Unit system controller thus allow
> it as PMU's child.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/samsung/exynos-pmu.yaml      | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

