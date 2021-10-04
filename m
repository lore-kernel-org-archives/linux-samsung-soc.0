Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A221BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F1656137D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhJDOpX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:45:23 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:46908 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhJDOpW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:45:22 -0400
Received: by mail-oi1-f169.google.com with SMTP id s69so21746177oie.13;
        Mon, 04 Oct 2021 07:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zDVVJq28wXDcpBhUokx8cs1aK2vmkAUOpLGjqTXSJYk=;
        b=wTI8wkUJ35S36jZl5Ng+2WmW8te5uGm7XELoicj4A8lMHcl4boAt9VQbj8GT0LFVs/
         8yOVf8yz5T9VoMFbNk9SPRaqEVFrTVGKBy/BbHge7+Yl4Mq7S3bI9SYOK3Km2vZvF/si
         8V+kY9kPoKaQrE8diyXB7+OOIjnyRT6jaaq66UUj9iBsKubBxImwHpbDIwj1b6VRiriK
         zBwr49iRecHKI8A5M0RJJ8osmwwvYmcqpPnC05NebhDcJ35OxpU378qd1USz0oBA9sOM
         jY1Ju63/1jkhBH8sJyIg5onoE8COqNFTomrEBBpn9U9dcrcs9rxtaiXc7ss3mjdNLaaM
         lTHw==
X-Gm-Message-State: AOAM53265KHER4sxU+ZjvwDzVMpZX0fnWpc0cGXLElInqHFkhQ6y0Vhb
        ua00MEDgV8h5/1bajb1BlQ==
X-Google-Smtp-Source: ABdhPJweIGJ/Y6Z9BUXWu/6+zr/uWDlhRBE9zQ29RhtcRrQ3YCPZBw9E23J9zoBJD1gdHIZ4W4HuKg==
X-Received: by 2002:aca:604:: with SMTP id 4mr13398948oig.8.1633358613505;
        Mon, 04 Oct 2021 07:43:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf15sm2851505oib.4.2021.10.04.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:43:33 -0700 (PDT)
Received: (nullmailer pid 1265918 invoked by uid 1000);
        Mon, 04 Oct 2021 14:43:32 -0000
Date:   Mon, 4 Oct 2021 09:43:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 08/10] dt-bindings: mfd: samsung,s2mpa01: convert to
 dtschema
Message-ID: <YVsTE6qBdz8QRxrf@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-9-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-9-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:41:04 +0200, Krzysztof Kozlowski wrote:
> Convert the MFD part of Samsung S2MPA01 PMIC to DT schema format.
> Previously the bindings were mostly in mfd/samsung,sec-core.txt.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/samsung,s2mpa01.yaml         | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
