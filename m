Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484A5C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 18:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DD4D221E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600107314;
	bh=R82vW1g1klOGPHfFZDHK495mf5mQfr8bgBhAoaXysKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=x/BVvYAenZNJnV12rSXF4QaFl6Lkz81hQ9/EaI5uSdpkQtS+qVoz5UXp2jmv+nNvi
	 B+w5KjXao79/ozcQxIGgzeB0UXfkDUWBl4dsnfDoQjIC3lI8kM8RbAhb5pqw3Mth9H
	 Hr2PmKnHVBg6cPNYqaKJUPwuS+780pV3fIsYvUaY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgINSPK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 14:15:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41045 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgINSPF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 14:15:05 -0400
Received: by mail-io1-f65.google.com with SMTP id z13so1108123iom.8;
        Mon, 14 Sep 2020 11:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kU/2sZrLzC+Bk/ABMelZP0JnISX9KWlKhr4rvY79f84=;
        b=OXGybTMsTuVvqSRl1W5Tfn7hk4wTODLNpj2K+WynHo1/JllC2/VEHuB9ZUcJ7yadum
         MYOlesfHPuLSsJbBDvVv8VY6/WQL84Jv6wzV26fTU94FLGnD+Pd+PGrU25Hka5IPRFDj
         nNC9Ezld0WMjKMKz5hOkKh1eDizgUMHvMKsnby7pQ5LwX7rIX0rXdJXS8E9hm7AN/G10
         AKz6L0geztwpqcAxzg9Yn9vYjbymp9g02Rt4OOfkNi2DzTIbqV5C2A+Xfgt+Y10rZG+m
         ESk9smAdzf8o8EejcdFm7g5q342doxY0AXu2wOUwuK++psu/19fSWEeNPA7iMsfyh8P1
         ogbQ==
X-Gm-Message-State: AOAM531rOSGsSRG9zUVdmF47EhNFxtMiO+SOJglnrFPfGEv3rKj0Auqx
        d362S9/BTsO726V9XpEOQw==
X-Google-Smtp-Source: ABdhPJwVe+zJQsdM1ytThZGYPxVPTrJFjBf/Wy4kmefHouTjymFTaisrIJZzO8Pc2eYtbsGGwf8edQ==
X-Received: by 2002:a02:605c:: with SMTP id d28mr14120122jaf.12.1600107304504;
        Mon, 14 Sep 2020 11:15:04 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m12sm7331781ilg.55.2020.09.14.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:15:03 -0700 (PDT)
Received: (nullmailer pid 4169787 invoked by uid 1000);
        Mon, 14 Sep 2020 18:15:02 -0000
Date:   Mon, 14 Sep 2020 12:15:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Inki Dae <inki.dae@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        alsa-devel@alsa-project.org, Chanwoo Choi <cw00.choi@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: connector: Convert Samsung 11-pin USB
 bindings to dtschema
Message-ID: <20200914181502.GA4169708@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-5-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Aug 2020 16:24:56 +0200, Krzysztof Kozlowski wrote:
> Add Samsung 11-pin USB-C connector into standard dtschema bindings file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../connector/samsung,usb-connector-11pin.txt | 49 -------------------
>  .../bindings/connector/usb-connector.yaml     | 44 +++++++++++++++++
>  2 files changed, 44 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> 

Applied, thanks!
