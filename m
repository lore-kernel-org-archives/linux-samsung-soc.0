Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0AAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Jan 2022 01:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353624AbiA3BgX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 20:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346537AbiA3BgW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 20:36:22 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851F8C06173B
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 17:36:22 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id c19so1014693ybf.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 17:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePWnPQTx8X6MYeBISgp7KTdEgQnoqyN/q/sb9qzde8E=;
        b=MVYYp87Ald/WvBJI0FeEtTwNTEL8ZX5BKn5Gopf+hawZh0s0006iGXxczWIORh0D9I
         YAWEfVnJXa1SI6A9PKoXdO7N16Mp3SHAFaWEp9IwpFlfEVxDdkn4E6CbOQDjtbxN91GC
         QSHcdjfi+G1YzQArUH9SzTkQh5WF9PGNGTef4yrXFnInEja3CgdtoBYinMfqirqRevDb
         JspXlNrfCynypoWIKPb2yTdvZhuFupywOIazhqK0PfvpTQoWeJSy84O9RAsc4QfPgrLR
         bbLeVifMqFRRjo2QNoFgZK856VokJFzS3VT96XMJthOnLkwJxAR0W/dRnOfzDeY94TJ4
         h2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePWnPQTx8X6MYeBISgp7KTdEgQnoqyN/q/sb9qzde8E=;
        b=54AXW8rJVRetMY05Mp2spSuTxgClV6HItah8YnNtFri3s1pQlnwYdLcNjJH42X5Gku
         u3qCWma7euDLQ63JDvShnHTB4NMRumyrJqSHgSf5vIf7C9/4sVxp7T0HugsLfcxT5tLT
         B2ZLj4bhSMIRHG0e6Pmjuk6XhckCIyTn7N1uavEBNYB7uc8857L5IMrtodcaG4Vy4ZO8
         SScD4tX3/wSVHKqHAb1W2fKZCOH80MRbPJOl3J3eHnBOoiXPZ4XniAym1guGkz/8epM0
         7OgDJVr7iuxdvTERq3b2qIvYgobJd1bBkSNDYQbKdtqEl5DSYfmEWMlHi81SsbVu/4Dq
         SOlQ==
X-Gm-Message-State: AOAM533VVgzf0n+KRQcvScXFkgFgWIY6jT7H8kq9fLKgB91mA9gl/SE3
        Kt0c8oZrNQcEx0oQFmIGDXBBjLIZyucbbmSV6kx3VQ==
X-Google-Smtp-Source: ABdhPJxhoLeKPAxrSTTOVHmmuO/wKAH6jov5kna/TtVWgdNXPxRG1wPA5Qbv6Ikjg7GGti3nfiG7wePGvRBsfe1+8cw=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23694467ybb.520.1643506581687;
 Sat, 29 Jan 2022 17:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:36:10 +0100
Message-ID: <CACRpkdYt1qM2gBefaWbWyh-a09c++wgR+12QrHZMneRK1mA9Xg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts/drivers: samsung pinctrl for v5.18
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jan 29, 2022 at 12:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Linus,
> I will send the pinctrl driver bits in separate pull to you.

OK I'll wait for it.

Yours,
Linus Walleij
