Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DA9C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 19:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E326A6117A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 19:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhJFTLq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 15:11:46 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:38738 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239343AbhJFTLp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 15:11:45 -0400
Received: by mail-ot1-f50.google.com with SMTP id c6-20020a9d2786000000b005471981d559so4406860otb.5;
        Wed, 06 Oct 2021 12:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XXPzrlRNSvZUe4SiE0xybZeK1VafzSZG6M/PPM6Jsqc=;
        b=0xr3aEcPAY0zJIjgCVOwSo8gUl1uZwEqsCarWnj22R2NOeNwm8nLzst+EhTcUTcy8d
         m8ZFjzy7q4Yij0TbtFU4YIRmUtd4mxiVZKQDBT3ty2wYAvK7RU+3rndj3vmEfEvEyCZI
         07EO3e5GFQM0nJL+iBTAslYetEKgkYAwjIdVe0hBmfAgBqjaA1KMA5CtrGnVf7zx34Sr
         JfYkQhKWDc17coFuTe8OK3PwCJgVuPdZ8ywZS/Vj9yxMAOdWjEC3SIuh725i6us6ePeG
         6f2ne/iaereFqkAU152EFONmVxdis/mx1v3OzaQB2tngH9EhrDAPWXQajrYwCLCLARqD
         SMQw==
X-Gm-Message-State: AOAM531u8OtrGYnPgfdelvgJSLE/ks+prdLQiFPjTkUrvTd1+6WAgSXR
        9khRYmF8breI4ks4OE1YQA==
X-Google-Smtp-Source: ABdhPJx15PPZ/Sp4jiguY2xyGQXBzop3CVtvzjN4FK7KhMUcxyeAfU1Rz92H7nLnJ0892+RoMu9+Fw==
X-Received: by 2002:a05:6830:1513:: with SMTP id k19mr389585otp.41.1633547392838;
        Wed, 06 Oct 2021 12:09:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a9sm4279056otk.3.2021.10.06.12.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:09:52 -0700 (PDT)
Received: (nullmailer pid 2227188 invoked by uid 1000);
        Wed, 06 Oct 2021 19:09:51 -0000
Date:   Wed, 6 Oct 2021 14:09:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 06/10] regulator: dt-bindings: samsung,s5m8767:
 convert to dtschema
Message-ID: <YV30fzEB/NlNhA+C@robh.at.kernel.org>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <20211006132324.76008-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006132324.76008-7-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 06 Oct 2021 15:23:20 +0200, Krzysztof Kozlowski wrote:
> Convert the regulators of Samsung S5M8767 PMIC to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/samsung,s5m8767.txt    | 140 ------------------
>  .../bindings/regulator/samsung,s5m8767.yaml   |  74 +++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 75 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
