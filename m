Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB8AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Dec 2021 03:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhLZDe4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Dec 2021 22:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhLZDez (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Dec 2021 22:34:55 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6A1C061759
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 19:34:55 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id be32so19722780oib.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 19:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KU7qyVWCeCPhrgSi7WlMC4yfAlwyr+FRaOQribuaQs=;
        b=brOuap0t2AD/GGjjhEn5TAeC5+UUW0xmzP361kI7ixJHUVcKIp5lYQjBX7VLjQFIFq
         LCV1OWhaA3Feg9qHemx4H8Gwtqiufe6s6df35XyBAt+LNcfCSHGX88D5sx8CzG4u1CgP
         UhK/zLHFrXR92zRIQkgM0mVpvBX3MMRgLgJQMn8XxtGpgHMVsfqkp8w6yxf5XmqABUvD
         GBB+G1ivvfhHha1CjlZlXVZ7ZBeDUKwEUGnyUPtLbdEjCWKF99dTNuHNkcrni94iJGjN
         yC+F+Df7hfbmxSxb238Os89lCmzjeXp4NfUx0oEs6N2fNA1TKxWE/0sZvd/Fi+yjAe8h
         rRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KU7qyVWCeCPhrgSi7WlMC4yfAlwyr+FRaOQribuaQs=;
        b=0qANQzWbaCWZ6MNKA5GXCrc+Q4xJQE1g0obCH4og/njRuDYJLprMuos7nuFvMOLaXm
         YJ7zXxRI3L77D5cN6l08XykI74hV/UukrfrhCOyZ7nqCuIcdJ9ppySKeoHAy8sIftg9Q
         rerIRrxwA3Doai6hUhK4Nh5dtZjFn0h/tD7OmZo7UvB0zvpnlo5W519sM3PDtCswH1xj
         7gGTIP7Y4L6PjD93sLxJRQ2cZaFOOhSB2YdsWRLr3CeVT/4aLxk19WD1arZBdxruro4X
         5xpb+/svIQbx1qo+t/HtAFm8E6qkmqzD+IjFr32YwhBMYjD1piUfNxIWpaXrhgjWe6P7
         52og==
X-Gm-Message-State: AOAM532HAej54YkzzpP5TJWfDx1uArdAlcW4RpdBSJzlScHo9hq9wJRD
        zNYufevGblvRHA9CZXB/YJ69FnA0TMpXIX9XYXqv2A==
X-Google-Smtp-Source: ABdhPJxsyZ12l/8bne3hB0Nc/6/qpU+8uLgJXjDkYJntGVFZtUPE+k2NElPi6OpYSWuYp7PlDdCDJUCIqE8uXK1g0jM=
X-Received: by 2002:aca:120f:: with SMTP id 15mr9087993ois.132.1640489694029;
 Sat, 25 Dec 2021 19:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20211225104129.56077-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211225104129.56077-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Dec 2021 04:34:42 +0100
Message-ID: <CACRpkdbDuC5wbPcQBuP0WfXZ_JtF6Hh4vmY9fxFo57arb4kENQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v5.17
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Dec 25, 2021 at 11:41 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Samsung stuff for v5.17.

Pulled in!
Merry christmas!

Yours,
Linus Walleij
