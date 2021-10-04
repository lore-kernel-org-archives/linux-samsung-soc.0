Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA99C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1778F61360
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhJDOhB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:37:01 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:36367 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbhJDOhA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:37:00 -0400
Received: by mail-ot1-f42.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so21770668otx.3;
        Mon, 04 Oct 2021 07:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s+eyEtDZE+wOaNHfUUU+auwXvNdUlr8/HySj7dhTYmM=;
        b=Y3uoXfOSPC0C6lFaL2ejwYh/7DN2qWcQaQXH2K4PCAUEx7R5LJp/8lxGZOPlZN6JKR
         gHo4zmp5LVGCMs1TLWmwtk02KgyhE1EJ9lAwDZSmIWqfEkSWRI+vKK7FymH4ebkR7TRk
         AMydfESMeIhVEvtl0rFNqYR5cJ2qWfTZsT/fEByGXFOZlT7F/Kf2rEvsMRmUeYOVSPsT
         DArOYAJWIxw/7DTz3fxoPYyye8bWuC2V8XmE03eFWbwL/Lafdod5BJZ6M+xMAorxu/uM
         K5o1r0t+A2U4VVJ6iEvkE9siN0pLEqglEiE7jg38DQbc3mt/e4AIQ4hc3ZDU7iCRCoP9
         NZEg==
X-Gm-Message-State: AOAM531Ow0hGy2uCBN4QwkPFO3rn9TSY+athp7gxCVNl3GiO4GaoP+2m
        /WtgRgNI+xxHx6pUIexTDQ==
X-Google-Smtp-Source: ABdhPJwHW1BibJJ1mEMOff0BlVIm6NDlO7a6bKXYJMMhpDDDyNa34AdXZnjtUTSu5iB+ASfcwZ0e4A==
X-Received: by 2002:a9d:7d8d:: with SMTP id j13mr9912030otn.220.1633358111079;
        Mon, 04 Oct 2021 07:35:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 63sm1317883ooj.7.2021.10.04.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:35:10 -0700 (PDT)
Received: (nullmailer pid 1253036 invoked by uid 1000);
        Mon, 04 Oct 2021 14:35:09 -0000
Date:   Mon, 4 Oct 2021 09:35:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/10] regulator: dt-bindings: samsung,s2mpa01:
 convert to dtschema
Message-ID: <YVsRHfxk6cGQN8NG@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-6-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:41:01 +0200, Krzysztof Kozlowski wrote:
> Convert the regulators of Samsung S2MPA01 PMIC to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/samsung,s2mpa01.txt    | 79 -------------------
>  .../bindings/regulator/samsung,s2mpa01.yaml   | 69 ++++++++++++++++
>  2 files changed, 69 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
