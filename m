Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D94CCA47E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Jun 2022 13:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353475AbiFONtw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Jun 2022 09:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348258AbiFONts (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 09:49:48 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D163FBD5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 06:49:48 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id x38so20602691ybd.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U88w6rJYcyJnx/PiUJFBepiomOwqP/IlAl1ZUElx+ME=;
        b=jJ3LLJifolkoYZ1YfbdVFN+8wHt8g2celG7g1c4F5G7jOrEHq/sEKBkogiMU+yAlmV
         70E45k5zMfIX+LJr1FRtG2V9pWcgV1WU32SP6J18wKxMTBlt48cPYfehNldHyzZJzQGw
         dQ8C5Tv2EW0YMKanBUnNoreZDtTGDHPWZrhJk+bU25QQXgjhFy+E+C1DfBzjmHLPI+/E
         zyBjliyX6QovEvO9M9WVz/b/2yfiI3r/AWgyYoT6tYQRA4DKRFlQlpqPA5FSNIGxYZBd
         OuNZ3xqj8AUDtwNXaO3MLwy+Py19AxS+rU/cdpZ5XlMmsmp0qaPHeDxUORjE2mcPKTZ4
         ulVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U88w6rJYcyJnx/PiUJFBepiomOwqP/IlAl1ZUElx+ME=;
        b=JQimgQOKSZaHwD6MNgq6zFCyshSHC3QgbzmHHQHxEYu0JocSZSXWoqMV4m4CUAEbhi
         wqaPf4FhfbBu9Anp/6mqydeZ6odgwCN8TCQYVRDj34nvFTmBr8GwhPQfHkglpEwJI7f3
         3Oh3TGbTnvGnl/dKpJCa7o4i9fFH8kWLnvTDqYSNkLlo04XzQPsGVT0/M4F0mrKiMDP8
         /pEP+D4T35Xv2RPjYY7phQwaBAitAn9oAaD1VW/s00+wagg9pcah4YzTpnxr0JfRcJJS
         uC/BOxhBppgBhWZZHRqI/YwvmntQf3Q/raRscw4rDQ69v46hlzwqgCtxZs8okKR9mshr
         oUPA==
X-Gm-Message-State: AJIora9ywf42RjyGklmpKSwvRXDu9BlEBSc3djO517ZKZ/QwxkyxBYW0
        a/sYo2zj4Tswx3X8T3eL/97Sup1Vusoqdu0+yyXmyE5wzU4=
X-Google-Smtp-Source: AGRyM1uRGcS4u7CE8T+7q54IVeoVZ6QJLPafoXD4TtCs8MF/xkhyj+z422B9IZUbR9Pzir4GWckGrm2ekxu3ik3++Cw=
X-Received: by 2002:a25:3417:0:b0:664:aab3:7c44 with SMTP id
 b23-20020a253417000000b00664aab37c44mr10357824yba.533.1655300987386; Wed, 15
 Jun 2022 06:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605160508.134075-8-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:49:35 +0200
Message-ID: <CACRpkdZ-1FZv+SXGTG=3Tj4C7M9RNCASHNz-UeULVmu0z6kNeQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] pinctrl: samsung: do not use bindings header with constants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jun 5, 2022 at 6:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The Samsung SoC pin controller driver uses only three defines from the
> bindings header with pin configuration register values, which proves
> the point that this header is not a proper bindings-type abstraction
> layer with IDs.
>
> Define the needed register values directly in the driver and stop using
> the bindings header.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
