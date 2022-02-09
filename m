Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Feb 2022 22:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbiBIWaA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Feb 2022 17:30:00 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbiBIW35 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 17:29:57 -0500
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E756E0186FD;
        Wed,  9 Feb 2022 14:29:12 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id v67so4041690oie.9;
        Wed, 09 Feb 2022 14:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y1j55Hi253ENIjk9c8eQJUDKu/kw6HxF3YDkUmKAaFA=;
        b=G0vAC57Dgwk9uvKHGVEozxcUGVggynzVliFXgbipR5s4TMOKL36l4WIGMOfs8IXVQa
         rxv+YTj5KT7Dp8WvOjbp5QxNL1Haa48ONnymSfOfHz/3hKdKQ0VGy5P9iVHnUqO6LZcN
         tZdm+vBpUOTDiqtW8G1XiljFbbJUy8Qow5v3MKqtSbm22pa27SLxkPNLDncKjzb3uqDN
         DrMOYbTbcZQNCatFuxMYsqWWRhRyu9hFd3a1PD76Br+hD5ulncZ9YO2BG/hmg8pB+DF0
         H80gO8qRe9Y6cSNgU3JfGnodpl8otmF61y6CB17/bCw1uyyIt0BHCVlAsMbVuQJwGAZB
         +nOw==
X-Gm-Message-State: AOAM531FXRQyOqN2r1c0SYe+LRuFS8u2vRkTcfuX87PcseF3dH6/GFWc
        QmMXJ5AMnaEfrUeoafboew==
X-Google-Smtp-Source: ABdhPJyWHZDh7iGpE68bYX52cJf57I+WPA/yoHKidBDIJKLnhHEM6X7QjjesMGIyqJ36cy6LVjG3dA==
X-Received: by 2002:aca:aa54:: with SMTP id t81mr1901323oie.126.1644445751859;
        Wed, 09 Feb 2022 14:29:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id ep17sm7660740oab.21.2022.02.09.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 14:29:11 -0800 (PST)
Received: (nullmailer pid 1055586 invoked by uid 1000);
        Wed, 09 Feb 2022 22:29:10 -0000
Date:   Wed, 9 Feb 2022 16:29:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vinod Koul <vkoul@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: phy: samsung,dp-video-phy: convert to
 dtschema
Message-ID: <YgRANt0hByXkupTj@robh.at.kernel.org>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
 <20220129193646.372481-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129193646.372481-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Jan 2022 20:36:42 +0100, Krzysztof Kozlowski wrote:
> Convert the Samsung SoC DisplayPort PHY bindings to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/phy/samsung,dp-video-phy.yaml    | 41 +++++++++++++++++++
>  .../devicetree/bindings/phy/samsung-phy.txt   | 11 -----
>  2 files changed, 41 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
