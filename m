Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78FBC6369E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6520922202
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbgLBUEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:04:13 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39579 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbgLBUEN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:04:13 -0500
Received: by mail-ed1-f67.google.com with SMTP id c7so5342953edv.6;
        Wed, 02 Dec 2020 12:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xOvLecaR0ppWizA+NOOjct39Te1Y+Kn9VudY2ADKf+w=;
        b=qoweBrvdgWaAlAoefCjU2lfQxq4Mq1nJ6WKYGBjntUO9VJmyuwLhOi3AngrSboZJ06
         qe47Ff4ygO/ztqL9YojK+R+vH4loxGKQJjI61SEppJkGvx99oLmSAN1t5A8V/MYav58+
         8G9dmu/R+g7zy7dVhLxPVHwGi9KT7Oyx6kqjIybF4Yv8xxWhlBY44/jkHS8YK6LED+Ao
         1l3JmukAy0quvuQerFKIjW0d1yVn2Eil+TOCdwrTBDhwzyFNYyUhnD90rKK9lSxT34Oh
         Q3/MSelrOdVWZ2/KqDooZ9m48hy2LgJzPrH+CPtFMXuN9KIDLtwc4dK0Y+/GX/HKd25H
         XZKQ==
X-Gm-Message-State: AOAM532kSweuka9u4nfG9E4xDATdFKznTCXEcjyW6a5ZluYfTKfABAcr
        V/q22awvq4zRGPUR7yW8qeyeksr8fuA=
X-Google-Smtp-Source: ABdhPJz9lPsFVuhNdRuLwqLIqROWWlB4TvdoJ9zSumuzRdfynAQiN1oI2FW99L4Obrw8X+xf/AJmiw==
X-Received: by 2002:a50:9ea3:: with SMTP id a32mr1700151edf.40.1606939410863;
        Wed, 02 Dec 2020 12:03:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id i21sm644673edt.92.2020.12.02.12.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:03:29 -0800 (PST)
Date:   Wed, 2 Dec 2020 22:03:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: s3c24xx: add SMDK2416 board compatible
Message-ID: <20201202200328.GC128771@kozik-lap>
References: <20201117201106.128813-1-krzk@kernel.org>
 <20201117201106.128813-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201117201106.128813-3-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 09:11:05PM +0100, Krzysztof Kozlowski wrote:
> Add a compatible for SMDK2416 board next to the SoC compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/s3c2416-smdk2416.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Best regards,
Krzysztof

