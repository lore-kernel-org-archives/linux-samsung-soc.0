Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB77FC64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Feb 2023 21:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjBOVCV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Feb 2023 16:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjBOVB7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 16:01:59 -0500
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2FBE399;
        Wed, 15 Feb 2023 13:00:07 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id p24-20020a056830131800b0068d4b30536aso35938otq.9;
        Wed, 15 Feb 2023 13:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3uVftK7AZ/j+xhg5u645pp081Ha+YRGATJlUND6eME=;
        b=O6OC55qTn4BrsU2DjL4ofMQXHHPsLTBovYkCwjuTP82SNcSzgeAwvWr4ZoPvr+sy07
         qHQ51cWcMIWyQKJ2GX81tvEppzGhy5zrrLG8vmct8cmTM7ycviR7rwN4Wj3FcEPe3U8j
         /u/DST5pZoevWKH9kHtmQRr2BlVJ3ciNdWKegy2PHRQWx4FJSebn3ZtcNLDAdAOFakd7
         A/1PFzepj9ji7WPCJpp0WjpzmK40+5fqI69P7QVtVQ5Ef7yDbKFWVyNWlMjkU3uXm0kL
         b76RtxPglrVtG9EaANQbJOpTPdhrFlzX2xrcjB2FttHaz4Ej240LEEYQDpW85yFj6kyf
         W9tg==
X-Gm-Message-State: AO0yUKXg+DdF7od/iCqmgCG29R9scGyZsDw5OjTwp41GPd3gbXiwmFbM
        mj+95fNOuUKsB/rCqz0t1ZSNeRr7hA==
X-Google-Smtp-Source: AK7set/pijDjIeoitlJ32GBaZQwniCNhKj363JGBlFK4HRuQv3IqcqwMaHMF7WTYU2MraGivSMXDsQ==
X-Received: by 2002:a9d:6442:0:b0:68b:d40e:e21f with SMTP id m2-20020a9d6442000000b0068bd40ee21fmr1622868otl.34.1676494806408;
        Wed, 15 Feb 2023 13:00:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i21-20020a056830011500b0068d51cb1fb7sm7854438otp.6.2023.02.15.13.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:00:06 -0800 (PST)
Received: (nullmailer pid 540293 invoked by uid 1000);
        Wed, 15 Feb 2023 21:00:05 -0000
Date:   Wed, 15 Feb 2023 15:00:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] media: dt-bindings: samsung,s5c73m3: convert to
 dtschema
Message-ID: <167649480484.540235.9433262097274757030.robh@kernel.org>
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
 <20230214104508.51955-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214104508.51955-8-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 14 Feb 2023 11:45:08 +0100, Krzysztof Kozlowski wrote:
> Convert the Samsung S5C73M3 8Mp camera ISP bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/samsung,s5c73m3.yaml       | 165 ++++++++++++++++++
>  .../bindings/media/samsung-s5c73m3.txt        |  97 ----------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 166 insertions(+), 97 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

