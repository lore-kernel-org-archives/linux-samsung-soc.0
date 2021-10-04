Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE0CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11465613C8
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbhJDOv0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:51:26 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:40635 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbhJDOvZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:51:25 -0400
Received: by mail-oo1-f48.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so5418464ooh.7;
        Mon, 04 Oct 2021 07:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zqTBWhIGTkge588tlOlIrfK3r/w7kMo+9XK0mXqjZqQ=;
        b=bwyYgED23rBoIB/Z7AIzqpXzmH8UrYBikeXvbUiRohrpKGAU3crGBbqu4pEpERh3RY
         1Xi+8kan1k+j2pcfYinvgfZhLiSC7bQpW7mG+u7LUP3BvnPaib2/mzcy8Uc1Hmu2FU9C
         lGrsW8ItTpXg43OpEuhQD7ZPKtI4/0z955NYYHoy/EQWuUzeb3WUWkTIlifNSs1d6jH8
         fgFimQjvoAZikYrI4bEYXpfSSVC+Ry2X0qkOKKRGs5oaJlqyV9NJTtqUpgUAx3C2rAnH
         JHe77Nw7WZ47dLnOH7w/UKFrZB+QoJvDStL0j2/KELyqTiDRSgY+IMuqMa15ecRnYsuj
         M7zw==
X-Gm-Message-State: AOAM5334wf0BOVa0kagGzGuBf7q470uvQCIih6F3cm+/RRo4MIcZxV06
        0FS9eJFxj895eg5HsA6Hag==
X-Google-Smtp-Source: ABdhPJzXy7KgLng3agv3eJiTS+0A271mqQdfMvGbN+PFcw6VwIunXw/BAyiUhYdaWCEr1vFZ7jM78g==
X-Received: by 2002:a4a:e292:: with SMTP id k18mr9320265oot.80.1633358976337;
        Mon, 04 Oct 2021 07:49:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o8sm2790157oiw.39.2021.10.04.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:49:35 -0700 (PDT)
Received: (nullmailer pid 1275157 invoked by uid 1000);
        Mon, 04 Oct 2021 14:49:34 -0000
Date:   Mon, 4 Oct 2021 09:49:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dt-bindings: mfd: samsung,s5m8767: convert to
 dtschema
Message-ID: <YVsUfubIH+p5ZRdu@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-10-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-10-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:41:05 +0200, Krzysztof Kozlowski wrote:
> Convert the MFD part of Samsung S5M8767 PMIC to DT schema format.
> Previously the bindings were mostly in mfd/samsung,sec-core.txt.
> 
> Since all of bindings for Samsung S2M and S5M family of PMICs were
> converted from mfd/samsung,sec-core.txt to respective dtschema file,
> remove the former one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 269 ++++++++++++++++++
>  .../bindings/mfd/samsung,sec-core.txt         |  86 ------
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 270 insertions(+), 87 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
