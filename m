Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9420EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 15:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378606AbiDDPfq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 11:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377810AbiDDPfp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:35:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC41A193EA
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 08:33:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h11so13430160ljb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 08:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0BaM8mE0ADfMYlXtw7vleG40fbepoqGgL/4MX4webNM=;
        b=ksDgHMx2Bwif416kkxyTK83wbuEWqRC/SQPlHJuG9GB8hDgBz44MZMx/1HGX678eDC
         2wnh9ws+cUzeMzUdTaIyPQtYnoElHOckaTUs5tcDi/avbQ1x6JIoh4RvUzQOcbefBFYP
         POlWTz3c4d6YS1O0FNwvfPTZvfop8awZKXrfXMrZX16BNQ0qSZfcr86eDyI6BKWogCZ3
         DmyA08M1g8ZGRvb+ZjxFdcrjs7y9CNRW1GUgHQ5pk94DWguaGetZDh3W5V1yB6beKXIi
         u8vgw/L+145ltC71pdu+f2k4braelrsCFxwLBBG0l4ADlpwbtqqXFl4MDxcnX79WDnYY
         0xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0BaM8mE0ADfMYlXtw7vleG40fbepoqGgL/4MX4webNM=;
        b=hJnYgVdEyjTvlyuWy0NOF5Atg10E2doDRZkyqghtgyi0fFpOtzJZxAxXPyuNliWGz9
         fDmUdgvMZgJAFDauqO7InGglfBbB2C2LXU+fb6QfZks/TuWtkUlSaeUkOunFWgSdBADG
         v97S5Er7O0XRzaA6ejFxYVHIUQpR9sHlTmb/fgGvwsQ9iY/EkuQETSKEft+k2HOiaR/a
         0TqIpdohX2ojDFBrw90luBL2ZLmGwA6uXUY9MbmUAzqOn+6erk//0X8WNrzscpxqKPEC
         2LsUtw9/U0sof9mb6bzcRWU0eOoLk/pkorJYvV28rIj4BFjFE2hehj6rfXuteCMW8MeV
         mPdw==
X-Gm-Message-State: AOAM530x69ygE0e3TGhmXwY1LsOI+Sgpm4xqdKKM9MxW34flveL7gU1X
        X8ASS+q/2yIurjWTWzbJOf3hNnzBeHtdfe0wIlKfZA==
X-Google-Smtp-Source: ABdhPJyJFY5IsdzIsRzag1xsA1I+Oi7D6rt+gN+XZTY4yAeNA4Wv9+v4zOmYqngowRK8wWY2VLqvd6/DtzNfEQUcpQo=
X-Received: by 2002:a2e:a268:0:b0:24b:1296:a1ab with SMTP id
 k8-20020a2ea268000000b0024b1296a1abmr89360ljm.169.1649086427030; Mon, 04 Apr
 2022 08:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134106.103588-1-krzk@kernel.org> <YkZFgGNRPUqJIY6x@robh.at.kernel.org>
In-Reply-To: <YkZFgGNRPUqJIY6x@robh.at.kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 4 Apr 2022 18:33:35 +0300
Message-ID: <CAPLW+4k4RwOcUiKZU05nb7tcpM2MTxdJ_m=8byyGvHdJbHRbRw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: samsung: usi: refer to dtschema for SPI
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 1 Apr 2022 at 03:21, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 24 Mar 2022 14:41:06 +0100, Krzysztof Kozlowski wrote:
> > After adding DT schema for Samsung SPI controller, the Samsung USI
> > bindings can reference it directly for proper schema validation.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> >  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>
