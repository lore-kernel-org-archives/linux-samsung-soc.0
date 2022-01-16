Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Jan 2022 21:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbiAPVie (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Jan 2022 16:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236218AbiAPVia (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jan 2022 16:38:30 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEBDC06161C
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 13:38:30 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bx18so2500092oib.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 13:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HR3K23prsUMyCbrYWQNTlRCKaozXns392za1xGffNJE=;
        b=PTHBntgNGcGtWqPyxE+jOxDaAOgIU1CCwc/x1QaLJzZTV6FEBjdXStTwqKGbaEaYhG
         mQO0wuQgpopoZtaDw2iBlltBJUORg8pOj9HZFBKhbMd+wZ9UV6fM+ixKICzz5P7rpacO
         7tjv0XHvP+zuM8nq1+JtNz0LZZUBMBuJeNAtwLef2i+Tow+kHGFjzOtdB9itBx9PNvbT
         KH+md7dVrwj5mLisM6UK7NnzFd78TyeOsPop5ZbQqA5bealuon23ZOdWg9C6Z656L8b/
         xrY3FlQkm16UNgKCX/Hno4CicAOkjMMkkz/xDWdQo1eurfJOeqiAMCxsEYLYrRKCNPkj
         RNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HR3K23prsUMyCbrYWQNTlRCKaozXns392za1xGffNJE=;
        b=SWuApsEDoidPMB7XJ6S8DyRVhGrB/aSA7zWwz3hVfqfcIXhINug4k1ENfvNAhYRX6G
         aHhwrIsbZKcFZxlKvsZZ437m+ka2eFdkhbs7gwjKDZ0pMdi00LVznvjUGyEBEKG31dZt
         wUsv7tZwzHksYGqBDczGKzD3qZXWdokkR7tPPK3NL+bnJpUTHe254LuVGpz7c1dO9oD5
         z9/d4vhHtJ23tIku+zz6N2O3pEZES2rFkH0sX5l5En/8RGaoub7dlT2d6D6iuKMqrYAm
         oA7MgoKmZxqODSqIPPDdbfdr534qKiE0T0i1rEa4sIBvuLaukivtmuyQrp7vLhUwQhba
         63+w==
X-Gm-Message-State: AOAM531rMe4d3eQHoixcYon00DnCbI5+Q4lwryqwd2eeDMmce8wfKs5W
        8iSHDQfWVuaPWg6NQZi/TZ0cPMRqcQ7BF+22V8/t/w==
X-Google-Smtp-Source: ABdhPJzgjCBYMq6KY6MkbuygV1J/mBuVzD/YEm2ImA0kCK4gMfbXNFUBiT9ygVZV6q2XvrLyOHltZrObbbdPpw17Vxg=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr10857559oiw.132.1642369108822;
 Sun, 16 Jan 2022 13:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
 <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com> <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
In-Reply-To: <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 22:38:16 +0100
Message-ID: <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jan 16, 2022 at 6:10 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Anyway DTS and dtschema will have to wait for one release, because they
> depend on samsung pinctrl driver change (patch #2).

What about I put that (and maybe this schema) on an immutable
branch so you can pull the commit into your for-arm-soc branch and
put the DTS changes on top?

Yours,
Linus Walleij
