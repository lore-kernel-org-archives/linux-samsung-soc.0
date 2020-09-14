Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78067C2BBD1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BEF221BE5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600116672;
	bh=Wkq9tTXOjGeP3BVJ+DnSLpHhW8eLxbTtbt3DDyjFd5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YNRGwro6UyVnAxhQDmxGtgGwXYGVa9dsJ6inCd58okPtrpqbsAisghlm1ZpUBEvMP
	 4Y2LBd6rOQca7AugArnKe3cednYucwVkC7qK7EfYMk7CbG8saWJaISjK9p3OpeAKle
	 UZQXX5tDnBIP9kWj90H2S0ahwHr3YxFHcbXaeVzI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgINUvJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:51:09 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34772 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgINUvI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:51:08 -0400
Received: by mail-io1-f65.google.com with SMTP id m17so1680343ioo.1;
        Mon, 14 Sep 2020 13:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HRDfI8tEIuTikQ6QH9FCFwWrHIhHqqKR/Ofl5jSpDVo=;
        b=cKOuhSD0o4FgKMUadcxSA1E3skgoM5k7FUOBJPts27AXoe+/KqPOhMnBi4xBG1SULL
         /zJy04oPttOyAXjlUKh/oWakSEbDxLv9emlGarLNT/lsiQ30LfcIvEJ6RCbqeP15uZKM
         pItJPzykHUSCwSbajo9FjKQr3wlyveBDPJeVMeooaopwIZr7HiXsicmz/jDYn+K9tw5u
         jG36u1r0YoSunim8PuAxAKtGh0+Jm41KSNQBHd13MsK40+lOmqJdgotYO2+ewCiUVO5j
         evheVPDaN77NTXDjSqnEzPa2Hc73IzhDJU20Cv0wgYYxmVzeF6T63m2SWt87r5BK/cod
         B3bw==
X-Gm-Message-State: AOAM531Z8VwQnFGgfiIUPnpmqGkcIS2NNmOe22e9W0XtpZfHq4++rF9P
        qPYSqg5G+4Q48wjzjVUaNQ==
X-Google-Smtp-Source: ABdhPJya5++YS3k9G7XvhrjF9A2/hADUPddalWHaT6EsdIdHB3yr90uv2no/O2qsYqOxXvHHUz7HIA==
X-Received: by 2002:a5e:9911:: with SMTP id t17mr12761154ioj.58.1600116667734;
        Mon, 14 Sep 2020 13:51:07 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z4sm6290316iol.52.2020.09.14.13.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:51:07 -0700 (PDT)
Received: (nullmailer pid 223447 invoked by uid 1000);
        Mon, 14 Sep 2020 20:51:05 -0000
Date:   Mon, 14 Sep 2020 14:51:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: gpu: samsung-rotator: Add missing
 properties
Message-ID: <20200914205105.GA220369@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-4-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 03, 2020 at 09:14:36PM +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (iommus, power-domains) to fix
> dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: rotator@12810000:
>     'iommus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> index 665c6e3b31d3..f480174fe0d3 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> @@ -22,6 +22,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  iommus: true
> +  power-domains: true

These need to define how many. I assume 1, so 'maxItems: 1'.

> +
>    clocks:
>      maxItems: 1
>  
> -- 
> 2.17.1
> 
