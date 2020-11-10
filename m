Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88893C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 18:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F35020825
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 18:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgKJSVs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 13:21:48 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:41952 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJSVs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 13:21:48 -0500
Received: by mail-ej1-f66.google.com with SMTP id cw8so19001104ejb.8;
        Tue, 10 Nov 2020 10:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l9G1H7d6H8DN8me8HewkSUvFhp7esQeOJ1hEf3/Bq68=;
        b=p7aKavWiiFJFu5Eeo09kTp5eU7pkPehDc31CP/VCJ8mX2fcfVZsYL5WEJQXCChL0yE
         ydGK85hRnzXmwxjKZK19HBN0ib4nBrsxafpsexVC/fZ0WR0oibcdH8+JIL7vmu349r/K
         AkpZNoOO9NTdbmYOrl//HXXstqabesACOmZ2mLp2G3bp/KUkQ1zSGKix5mH5+jMsCHMm
         EzkV+xT8dThzus/3OhH9+9dfOmIF+XvnHeqnAT+Yzmo14GILVfP7VFnVeRfbNM5kn+n1
         0dU9oDhuO7s3As2HSrU9VIa1Bg+uDB+T5efSmbZtxRcfvbPDz5FePQJk7TRzbA8BzDpv
         k13A==
X-Gm-Message-State: AOAM532yTRIHDG/xIvtNM+aRMect+dO4ccLjW1woFJvsjcueByzB53eY
        m8ifMIIukfG39uPSu4y2GtzSHcc6L+o=
X-Google-Smtp-Source: ABdhPJw8e8YV2zvKY2C/DC1nvB4CpPz2usZQyE7wCNeNbMFrD89t/14vgLrbzkuQFpB456SmQNDhAA==
X-Received: by 2002:a17:906:ae52:: with SMTP id lf18mr22583160ejb.9.1605032506577;
        Tue, 10 Nov 2020 10:21:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n11sm1979144eds.3.2020.11.10.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:21:45 -0800 (PST)
Date:   Tue, 10 Nov 2020 19:21:44 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] ARM: dts: exynos: use hyphens in Exynos3250 node
 names
Message-ID: <20201110182144.GA24131@kozik-lap>
References: <20201105184506.215648-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105184506.215648-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 05, 2020 at 07:45:01PM +0100, Krzysztof Kozlowski wrote:
> Use hyphens instead of underscores in the Exynos3250 node names which is
> expected by naming convention, multiple dtschema files and pointed out
> by dtc W=2 builds.  Use also generic "ppmu" node name for PPMU nodes to
> match Devicetree specification.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 48 +++++++++++++++----------------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Applied entire set.

Best regards,
Krzysztof
