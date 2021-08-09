Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043C0C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 15:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBE8460FF2
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 15:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhHIPke (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 11:40:34 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:45702 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhHIPkd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 11:40:33 -0400
Received: by mail-il1-f176.google.com with SMTP id a4so2790467ilj.12;
        Mon, 09 Aug 2021 08:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WGG1rgFtRWD1atfnJsAF0SThE8u/EvqDg7sgN/w+dis=;
        b=HL9X881+3xa+TfKMUkGg+aoKCemBW2IUhTVhvfAK21/G5qm33RHxVPynZlXJL9cNTD
         mQQ9zGtC6B5lPqfXcaiMbJdWhakq8r7tm0tjLiAoN2z+p4ZiaVXVmUXoSxyaEuzlFArK
         +EquFj8UK2HKdHOQsRSMvcmRGCt14XWFldtW2bLxUZiNIrdaPYgiiOP+aEi0ryzeh96A
         asJU4o9zy0RcfoocG9Rsa/94bAFHJgx+pVollJeW6QKf8CDcmXqNhPLzMlVKgiD/BwUY
         d/edjXU+rawdG2+ULI3HQgTRLY2cU74fY9sQIaBjbicRUt0IxqPWz9POt+ps6JP8uNHx
         ti0w==
X-Gm-Message-State: AOAM533kYNL0tWGZkbduYfL86iq4y/qgx648Q1qnWBwl3lpfyMwzBx5q
        /GMNtc13+YX9cxnPugEbtg==
X-Google-Smtp-Source: ABdhPJywuE2hAgbXEHN6zUQXjeNJC1IZeSbz903m/sxmpQ1vfDQzR1MYr8dFmcKRUxYh9JmHI9ys0A==
X-Received: by 2002:a92:3f0b:: with SMTP id m11mr216280ila.265.1628523613009;
        Mon, 09 Aug 2021 08:40:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k4sm9351790ilu.67.2021.08.09.08.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 08:40:12 -0700 (PDT)
Received: (nullmailer pid 3895397 invoked by uid 1000);
        Mon, 09 Aug 2021 15:40:08 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20210809135942.100744-3-krzysztof.kozlowski@canonical.com>
References: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com> <20210809135942.100744-3-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/3] dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
Date:   Mon, 09 Aug 2021 09:40:08 -0600
Message-Id: <1628523608.157762.3895394.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 09 Aug 2021 15:59:41 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S5Pv210 Audio SubSystem clock controller bindings to DT
> schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/clk-s5pv210-audss.txt      | 53 -------------
>  .../clock/samsung,s5pv210-audss-clock.yaml    | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.example.dts:24.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1515121

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

