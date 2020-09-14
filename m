Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7E9C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF7921741
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600116704;
	bh=w4lxA1J45V/5PBDEW4je/imIxIdJJ1Zo4Tgfzu8lLmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=D4qHOP1M/wpVTThsr421RaVJY9LMb73+/0NliSJEDL8HrbixWGXQp61lAdnJRRbfA
	 8+un6oDeSPvMCleeW6sR4364sjasR8eXF/Tem6SNqwDtIJxzr6wc2w7XC6mKy/0G2y
	 LmTObdxTCQLLkNZswHWbxmB2rjst75PVjNFi7JeY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgINUvn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:51:43 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42810 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgINUvm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:51:42 -0400
Received: by mail-io1-f66.google.com with SMTP id u6so1626667iow.9;
        Mon, 14 Sep 2020 13:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=veG+zgFelzs7P/4CDsW/IyWMer1s9H9FMEOpA6pNK+s=;
        b=iV1fA3Zgij2RsVOPgdswsm8CxHeYMAv+7qyayZ5nSoV2zRn2rVe5a3ajeaRoR7S1Qc
         CF9CA+jmBr1t0OzzoIVKzY/gFgXHH5ZTfYtpjydZN63uflkBlaIRRV6vuH4JT0JByBOF
         Zo4Cxa8Yi8qia717fkzPs7YBaCGJDxL8+UlGd8ZUW/4Eub6jXskvgo4kVOXO5AlyBqjU
         jNf8S63qq0hIjeDwCEcQicMYs7c5IRIU//Lq9+kEVyjmQdzXhsOyNk20BBGo3t8RYjhd
         jBJlvGZ9doJUCtx41KlQXXui8k3SW56gp+AGUULqoyw9Z5bpXlLH3HwCUbtrIgpNtPGZ
         XwFw==
X-Gm-Message-State: AOAM5338pDBdcgvY1Tz/9F3PWxtqWpQEsFijHR+MrGu2NOgRWi5HeFMR
        Uprnv8qeaOAZzKVe5rz5QA==
X-Google-Smtp-Source: ABdhPJxqSOICQ+yvso2zHHwy8r+0Fr59OAQEwH7kQzNJeCVKrnQq6PVIOwAtkxhLNDCTjrOkNtEGOg==
X-Received: by 2002:a05:6602:15c5:: with SMTP id f5mr11740218iow.42.1600116701429;
        Mon, 14 Sep 2020 13:51:41 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 9sm7245845ilj.83.2020.09.14.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:51:40 -0700 (PDT)
Received: (nullmailer pid 224785 invoked by uid 1000);
        Mon, 14 Sep 2020 20:51:39 -0000
Date:   Mon, 14 Sep 2020 14:51:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-samsung-soc@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: gpu: arm, mali-utgard: Correct
 Maxime's email
Message-ID: <20200914205139.GA224734@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-3-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 03 Sep 2020 21:14:35 +0200, Krzysztof Kozlowski wrote:
> Update the address of Maxime Ripard as one in @free-electrons.com does
> not work.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add Ack
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
