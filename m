Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00B1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Nov 2023 01:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjKJBxo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Nov 2023 20:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjKJBxn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2023 20:53:43 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B05E44BD
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Nov 2023 17:53:41 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2809fb0027cso1358923a91.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Nov 2023 17:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699581220; x=1700186020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnaT0Z5B52WFIm5oJG7or3ermouAvuswFcl8mKgJ3CY=;
        b=olpycT7mQN47h0ShOHE/rUMv8r+EnZWGZL0dS1L3fOc6dLknBhWFfcJPjHQOZoAj7V
         GENzIDKqu6Wl5G7KoFrfBY7HkL5g4vkbPQFH68aVlX73+ckmXv3g4ldirNBNAytTWeWt
         cLpCyjngvIHIzq8eWNl1SlnvdWDDiqQ9qN4pqFG5j64An7acOjtOQBTs7107FoD5Y5+l
         9I68yaWqS/IyfHYoPHHf8KDW6Eaj5f2SEXD43Xjaddzx/fZ9bq9YRzKXxfO3QdO61X1W
         hQVJcNRaULHutGejeWcj7BQx1rQQhnh2m74U/zHrysA3CyvSXtGnp5Udx6mgtDvVvX0e
         wMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699581220; x=1700186020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnaT0Z5B52WFIm5oJG7or3ermouAvuswFcl8mKgJ3CY=;
        b=ScFDUL/pP3PdTY7Sxo9dTMUEuBRJG0uLi6imkHL1XfEg+1QMViGR6Luo2ZR8kLHCEW
         y3BD96CEXCyhXfyupJj080GyBM99rSEh+cXjoi1T79062Q5lt3GG9uieQaJHlODhM8hE
         f1pu5pNhkLgJUMLposKZgwBHVESxrJFr8kao+45FPwH3El5YAZ1Hnf4OponMqeNpwhVT
         fDoZ4CIUeJFAiUXSX4yC0p6wsUAhK2jSGxYlQP4EVIciT/2/mOJHccRsquTAFWlQgIHU
         bvGDCPCuPGDl9aCpeHKO20oJSU0oD0e0kFis31ZrVkzYDn2j+VLe5uJVTXHr2kHeihc+
         9uyw==
X-Gm-Message-State: AOJu0Ywk7X76xmrACdX3hDQ4j4STkJind/IcyW17G0lFzw6xQR6Mh4Za
        vIXpRFQD+OMLDrf1l38SO2YkyIDKDx5ZUmpXuhQ7gA==
X-Google-Smtp-Source: AGHT+IF2CvB03hHPzpzbnXtgNai0HmCRBWMpJ5mKjo/l3DAboCyMcV2DzhG5H1Z8kNHGm3PqfcnZOixlZXvdL1XjSbI=
X-Received: by 2002:a17:90b:1a91:b0:27d:114e:d4a3 with SMTP id
 ng17-20020a17090b1a9100b0027d114ed4a3mr3203127pjb.14.1699581220612; Thu, 09
 Nov 2023 17:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20231109190925.2066-1-semen.protsenko@linaro.org> <3024abdf-e7e1-4063-a0ba-ed415317c200@infradead.org>
In-Reply-To: <3024abdf-e7e1-4063-a0ba-ed415317c200@infradead.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 9 Nov 2023 19:53:28 -0600
Message-ID: <CAPLW+4nKG3D2WmQxWJ=v3_J8y6vz26gLWC2NSSfu5gukgr2RGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: Fix kernel-doc comments
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 9, 2023 at 4:42=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>
>
> On 11/9/23 11:09, Sam Protsenko wrote:
> > Fix some issues found in kernel-doc comments in Samsung CCF framework.
> > It makes scripts/kernel-doc happy, which can be checked with:
> >
> >     $ find drivers/clk/samsung/ -name '*.[ch]' -exec \
> >       scripts/kernel-doc -v -none {} \;
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Fixes: ddeac8d968d4 ("clk: samsung: add infrastructure to register cpu =
clocks")
> > Fixes: 721c42a351b1 ("clk: samsung: add common clock framework helper f=
unctions for Samsung platforms")
> > Fixes: 3ff6e0d8d64d ("clk: samsung: Add support to register rate_table =
for samsung plls")
> > ---
> >  drivers/clk/samsung/clk-cpu.h | 2 +-
> >  drivers/clk/samsung/clk.h     | 9 ++++++---
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cp=
u.h
> > index fc9f67a3b22e..103f64193e42 100644
> > --- a/drivers/clk/samsung/clk-cpu.h
> > +++ b/drivers/clk/samsung/clk-cpu.h
> > @@ -11,7 +11,7 @@
> >  #include "clk.h"
> >
> >  /**
> > - * struct exynos_cpuclk_data: config data to setup cpu clocks.
> > + * struct exynos_cpuclk_cfg_data: config data to setup cpu clocks.
>
> Hm, OK, the ':' separator works. '-' is the documented separator here,
> but it's not worth updating the patch for that.
>

Thanks for reviewing, Randy! As you probably already noticed, I
updated ':' bits in patch #2. Just wanted to keep this one as minimal
as possible.

> >   * @prate: frequency of the primary parent clock (in KHz).
> >   * @div0: value to be programmed in the div_cpu0 register.
> >   * @div1: value to be programmed in the div_cpu1 register.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
> thanks.
>
> --
> ~Randy
