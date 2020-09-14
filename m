Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A545CC2BBD1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 645F6215A4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600116698;
	bh=gOetgkENGQ1NEl2OkvMBd83yYb+YWCDR6YFpfnikSDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WaYj46qJnh3uH4rAr5FGpDwtXlPoLXTm2tMY3jqXgCZDY0C9i59XcbNKzsXAhBW4U
	 xv1fzKDn1LMZrkXkt09q5Kz2r7R4oFJag1SQLvQ8fwoA1FHfKrDeiWKiggEcamx93Y
	 Sca+paH9eiCu+wjGUUQgS1LReHL91kxEY3w4yh00=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgINUvf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:51:35 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37434 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgINUva (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:51:30 -0400
Received: by mail-il1-f194.google.com with SMTP id q4so930096ils.4;
        Mon, 14 Sep 2020 13:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/nkoIQBB8aeAjFrAyH3N5nJASsyTVOS6e3/91uOJWL0=;
        b=dF0GNDObWGgoQA8xvrXzLsZFFhS2cs693Tqph95/VX6htiMKb/BN8Ew+UMqggBjVg+
         wjoTUURHwgcu4gMYE/yqaHIG++sZk6UzgovkMFhY4mxWyPZn0juhnnv7kfqa/8ogXi8+
         /YcZ538OYwCSmCy6wdk4Fbp+Whj+u1hW4b9kPdfUyHYCcGXHfdQDIAU6tMvvoy7844hD
         h10/yv1cVNE5vvvGkWKPPp3pskGvW5hldp86fRGtekluRVikqfBAbUHTtVj7GWCMMP/M
         N865pJVTdX55tCOLbVgwv2y6sVWdMnU+VGD7Uv79BnL+FJxDmVE0R/C3okT8TxGjjgxI
         skqw==
X-Gm-Message-State: AOAM533tt9QDw5L5aIgLdcoV34HMfGBwRG2WnDnbnDjUNf6kj5kim/33
        oKaKWsjhYQmhJKXWO+bmfQ==
X-Google-Smtp-Source: ABdhPJySW4fP7h19hziwUa7lpqPD35KoCpqwbLWwpSzQ2G6BsEECfMvDt20Nm11mQDnWHmGgEX0ZXQ==
X-Received: by 2002:a92:cc83:: with SMTP id x3mr12988306ilo.232.1600116687680;
        Mon, 14 Sep 2020 13:51:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h15sm7389741ils.74.2020.09.14.13.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:51:27 -0700 (PDT)
Received: (nullmailer pid 224256 invoked by uid 1000);
        Mon, 14 Sep 2020 20:51:25 -0000
Date:   Mon, 14 Sep 2020 14:51:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/6] dt-bindings: gpu: arm, mali-utgard: Add missing
 properties
Message-ID: <20200914205125.GA224203@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 03 Sep 2020 21:14:34 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (opp-table) to fix dtbs_check
> warnings like:
> 
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: gpu@13000000:
>     'opp-table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
