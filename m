Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51926C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 22:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243439AbiBGWEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 17:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243436AbiBGWEM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 17:04:12 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BD0C061355;
        Mon,  7 Feb 2022 14:04:12 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id r27so18606724oiw.4;
        Mon, 07 Feb 2022 14:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q/wggRenO/vzVBS70QLnVZiNuU5fxQ5DeAwQ15+x+oU=;
        b=DJLs3M/Nv3lDB21M0EaNn+2iR1yXn7AlF+h9tiwxg2Vhsfow7Y8YmB50HfR7kI7Fl4
         uxGszlxmjy34xxHNbClyqrOQE47aR4E6Eh8VVdKPjMTbPqDsYE3aLhqSxzVqOZzRawEX
         C9xtea5DAFiM8nANuz+Zo+YqA64tbjBRI84elGyFom5Oba+/MYoEB8G41j3o/JSPZFEb
         NLHi8UG4JURSmM0gKVVVYMKgDwjp9mbuWOCjF2VQU4jM5QEIve6WR0nAWWyh1hlJgZeB
         H7g5OXoJ5YW3hoKRhZKaEyMpWK7d9HBU4qksvFxGunTNBwSLkY+FuGsZirNC1vMgcDzL
         2hEg==
X-Gm-Message-State: AOAM533Qk4lbgM0mK0OUpHltOhR7tAt9ulUqZLR7H4mpT9sJAdS3PL4r
        vNgLpy61GTer9HdZsrvZsg==
X-Google-Smtp-Source: ABdhPJx2GaomN8+6iVxLTWHVeOW8B30rYogggWW6K4pN5aer58lexokJMRHrT3DHesQ//EEEmHQ8UQ==
X-Received: by 2002:a05:6808:252:: with SMTP id m18mr465112oie.285.1644271451568;
        Mon, 07 Feb 2022 14:04:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h17sm4516681otn.60.2022.02.07.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 14:04:10 -0800 (PST)
Received: (nullmailer pid 1006262 invoked by uid 1000);
        Mon, 07 Feb 2022 22:04:09 -0000
Date:   Mon, 7 Feb 2022 16:04:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Henrik Grimler <henrik@grimler.se>
Cc:     martin.juecker@gmail.com, cw00.choi@samsung.com,
        virag.david003@gmail.com, robh+dt@kernel.org,
        semen.protsenko@linaro.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: samsung: document chagallwifi
 board binding
Message-ID: <YgGXWcW2s/yMdPr3@robh.at.kernel.org>
References: <20220115162703.699347-1-henrik@grimler.se>
 <20220115162703.699347-2-henrik@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115162703.699347-2-henrik@grimler.se>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 15 Jan 2022 17:27:01 +0100, Henrik Grimler wrote:
> Add binding for Samsung Galaxy Tab S 10.5", based on Exynos 5420 with
> codename chagallwifi. It was released in 2014 and has several siblings
> with similar hardware.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
