Return-Path: <SRS0=8fUM=BI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A6FC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jul 2020 16:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DFCE2075D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jul 2020 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596039850;
	bh=bb4zuQGhtPo9xAh3UaRQ5Q1apxoMxdA4XPIwcRvHT/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MWqK9fXWWsoG//aiXLSq32AQpYLuxqrbUdnOqzfvCeUffJ/BX8OG1Q6K25hDzO0Oi
	 Pb1Kh9mSui13O6sSAHNdQS4YoIqZRAT3FVPRSaCIApM3V137YDUzd8TedBSXEvj/Tz
	 KncRRdBP4Y8nGExKZD2AnmVUcxY42e2L5bpb7Tns=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgG2QYK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jul 2020 12:24:10 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36781 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2QYK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jul 2020 12:24:10 -0400
Received: by mail-ed1-f67.google.com with SMTP id c15so8199908edj.3;
        Wed, 29 Jul 2020 09:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cS3+221AHZYDhz8vJwUJuKP1AL5RGbuh31j+wmF7oUU=;
        b=HaXsLnWCRyw1DnOyqxxvE74vXS5+sxNfgVysLy5RfmVYX5vrkyvzLAAjFN/eFgmDKV
         d+VWg+cliMSixH3yIctXTL2ZtX8CFIJzghI9vI1d7Ka2eMmHFWcjvzR+qFOnFZ5XHPc+
         J0Oqfuit+3itRUB1PBGaQT/1HscSU/AJxPoviUCxNzlpYPiSQD+MbrBlZ73oy2Th53VQ
         ipQG4keYGJkuNQdzoD91sRz2izJCRM8q7GB0sgjEEQ9CF3fXVTCWe3iTC0/CYm/NITS3
         te4xRBIZyCq4b32bx1mxC9gmjwGa0hl3bShVhg/h3aKnGvDq/Zb862XHqyOKCfyIpEL3
         Z6NA==
X-Gm-Message-State: AOAM5326zs3sE2HCjlp95MXbxHIw/DLZvpq237XJ/gJ6ZghpaQ2Z7Gw0
        mfMVvYkFwZ7UvXI/eO9J5Is=
X-Google-Smtp-Source: ABdhPJzrXVWpA0e/54O+SdDq9PueVFgMc6upBS6jL4XfQLfXkn58bf/2j89VIVWgToUmT/t20TgnfQ==
X-Received: by 2002:aa7:d58c:: with SMTP id r12mr33304657edq.160.1596039847872;
        Wed, 29 Jul 2020 09:24:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id dh16sm2193450edb.3.2020.07.29.09.24.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 09:24:07 -0700 (PDT)
Date:   Wed, 29 Jul 2020 18:24:05 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: samsung: Document DT bindings for Midas
 sound subsystem
Message-ID: <20200729162405.GA5302@kozik-lap>
References: <CGME20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619@eucas1p1.samsung.com>
 <20200728131111.14334-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728131111.14334-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 28, 2020 at 03:11:09PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v3:
>  - change the sound-dai property type in cpu, codec nodes from
>    phandle-array to phandle
> 
> Changes for v2:
>  - fix wrong *-gpios entries in the example,
>  - mark sound-dai properties as required.
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
