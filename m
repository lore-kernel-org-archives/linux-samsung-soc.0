Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8404EC43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 18:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448A9208B3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600107390;
	bh=xU23LwM4Ogjff7eNhZz0naSZIX0TX6fB30IgqldEW7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xuFT3fxOler0bTHPppVN6/zNHiuQBHP0ZENc9/a5XFf9KQGe20awi1DD7OIdFWmU3
	 ptIEYTEZdIYv3P7jZYyS6giUsfhq4Xh9RZ0hIYxM5gZAE551gjJmRhZlNMdntZWGQb
	 2mIMYe78dR+v1J+4AFwSTTSocS1g7IV+eyN1OdVc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgINSQ3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 14:16:29 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42820 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgINSQ1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 14:16:27 -0400
Received: by mail-io1-f65.google.com with SMTP id u6so1108000iow.9;
        Mon, 14 Sep 2020 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gkgh20bzSMEzQBjaR/yXNkvt2d9QAmenQ6iuJ6sWbhQ=;
        b=R0g/mKZWKD4fp75F7SXh/u4VWkMhyJzgiTQZlD9Ppn/u+Fs0xUfjr9WEEMz++QVlYv
         +P3wSpNeVjNiTKCiu0ADGDBJ1jd954Uc5KQ0GGhDDxQH4H84KVHUGtUQufkv37emWoMA
         5f5+g0d01wfGICN2vYP2JBRiUMHzIV839F73R2tn92M24cRhfPRQFiucWATOAVd8r+oM
         dqZinkgwniEd4AJw95YjgeP4+XlPGZUeTptWU/7nQPC+gDtSpff0umOVfBefwOuCxbG2
         iDbCLUaRQZRJeZrgOGKdzgM4IxtGaGiaB+6Y4nLejE1Y+2weAEFqvYqetyYo3iIUi+yC
         zD5A==
X-Gm-Message-State: AOAM531JqDspnUgPj23y0oUez36REtSgI8AAZoitQ8i9OVT8s7QCJwgk
        OWo/4rFzGF1h/uzBgXaX0Q==
X-Google-Smtp-Source: ABdhPJysQTS83/P0m/NWQcM+Si2V+AT/0soNX7Yd+tqoN1X+CxgOiIkfng9Eqf/6+mv48oGeuJ5e0w==
X-Received: by 2002:a5d:96ce:: with SMTP id r14mr12026983iol.146.1600107386676;
        Mon, 14 Sep 2020 11:16:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y10sm6300353ioy.25.2020.09.14.11.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:16:26 -0700 (PDT)
Received: (nullmailer pid 4172155 invoked by uid 1000);
        Mon, 14 Sep 2020 18:16:22 -0000
Date:   Mon, 14 Sep 2020 12:16:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: samsung, amoled-mipi-dsi: Do
 not require enable-gpios on samsung, s6e63j0x03
Message-ID: <20200914181622.GA4172076@bogus>
References: <20200829172532.29358-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829172532.29358-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Aug 2020 19:25:29 +0200, Krzysztof Kozlowski wrote:
> The samsung,s6e63j0x03 does not have enable GPIO, so do not require it.
> This fixes dtbs_check warning:
> 
>   arch/arm/boot/dts/exynos3250-rinato.dt.yaml: panel@0: 'enable-gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../display/panel/samsung,amoled-mipi-dsi.yaml       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Applied, thanks!
