Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C28CD80B7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJJMJT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjJJMJS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 08:09:18 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AD799
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:09:17 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-579de633419so68105857b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939756; x=1697544556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEaEMkX8vOBOdzxYFvJA9DgnPvy6/WwAYugNg849Uvw=;
        b=CcR9sARPY+YNl/5TT4P/jcN/awaRsn37ZxpPJO9y2VJEcMnSCIDqv11N/oPEg3gM6W
         dNaiHAqjtNFruWYrGGX9ZTsZysKZzjOEWUtU1C7EFbC4apdBiUHl5GWdYHmr/QH0d2gi
         dcCogU32IUS7I6BtpEjMR1n5usmCwpm3BaGkYJV643Hwo+Mf7zw9O5pJJoso/p4SmdUO
         kvxRvK45QVzC8ZljpLLN4BDVyzZRMsMe+uITUZ/I7BEA2aGJLVSbaedxWMz5q+GF7XeV
         dvNNnH0MOiTTNPNmnQKD6ViCaavd6fX5vZulvTdcVcwpmQwx0JyrBTEhTb1+AddmKsWE
         V3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939756; x=1697544556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEaEMkX8vOBOdzxYFvJA9DgnPvy6/WwAYugNg849Uvw=;
        b=F5jN7Q0SflsEjqtYW+28uj45uLbfBx3ZHyM9J4Lyltk95Af2uTLAj8P6hyf2GuFdOt
         bZcnrAtngpYsMAuZkOAmnh6ROGKkEn32SHu1DRuC1ecTAAfW03a14PsOjosHGXSoNJw0
         YHqXlRf8+pTtMglV24QTq6zoDJRuCMaYlpwdjiGHYSBZqV3+US+XIEwA7xLwSTk803SW
         lpDEQIb4I7aPoghAloIjawi1YJ5gg6/wm+//UcMzWd+KhpIgmThCZfvTE+4nG19MvfL6
         M2MHV8hL4PpeSEYgA1XcHpDiYCaPZka2Ep7R783jz/PnmW8VaagWMgGVWhTmvB5vV0em
         HMAA==
X-Gm-Message-State: AOJu0Yze6hntX8paCzfBrplFWlzR28AoOloxuQYRgObXeuTf3Swwu73i
        OcwpHMcRjS0BOyf+5HayDZijT6jc+RTV+uaxln1ybb88itNPz6kT
X-Google-Smtp-Source: AGHT+IHRGEq7DdXjBkp0ZcsqBXe3LfpagEhnnJNKWYx9uqyU6eZI1qB/e8NPka/ZmWvype1vTBLGlZHCNknfRy93KUQ=
X-Received: by 2002:a81:5b02:0:b0:583:a3ab:b950 with SMTP id
 p2-20020a815b02000000b00583a3abb950mr16029722ywb.50.1696939756492; Tue, 10
 Oct 2023 05:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20231006130032eucas1p18c6f5c39614768911730fa6ed0201ee3@eucas1p1.samsung.com>
 <20231006125557.212681-1-m.majewski2@samsung.com>
In-Reply-To: <20231006125557.212681-1-m.majewski2@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:09:05 +0200
Message-ID: <CACRpkdZULAeKE_DZX9RVhu0tSutdB_wMgoHhonB3H8DAdjKBEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix Samsung pinctrl driver static allocation of GPIO
 base warning
To:     Mateusz Majewski <m.majewski2@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mateusz,

On Fri, Oct 6, 2023 at 3:00=E2=80=AFPM Mateusz Majewski <m.majewski2@samsun=
g.com> wrote:

> The object of this work is fixing the following warning, which appears
> on all targets using that driver:
>
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
>
> This needs a small refactor to how we interact with the pinctrl
> subsystem. Finally, we remove some bookkeeping that has only been
> necessary to allocate GPIO bases correctly.

I see that Krzysztof has already taken care of this series so I just
wait for a pull request (some days work is a bliss, thanks Krzysztof!)

Yours,
Linus Walleij
