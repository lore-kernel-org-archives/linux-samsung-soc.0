Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FCFC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Apr 2021 18:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5F0261249
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Apr 2021 18:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhDYSoq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 25 Apr 2021 14:44:46 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53967 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhDYSop (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Apr 2021 14:44:45 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2Dgk-1lTTwr2Yxi-013awD; Sun, 25 Apr 2021 20:44:03 +0200
Received: by mail-wm1-f51.google.com with SMTP id p10-20020a1c544a0000b02901387e17700fso3881590wmi.2;
        Sun, 25 Apr 2021 11:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM530AYuBAN1lAxkVCZbMOz23fxd+UTHGFcv3vvUOwBmbqSOwvziP9
        CHfxykqMVH2wbV1F8pH3y8nBuWGBbm+uHk+KpdA=
X-Google-Smtp-Source: ABdhPJxk8Cw891witQOlXeRmkFHINEXAk5zny8zOJdaAwPmTCFzs4Yp7Vl/Lbnt9BFA1Uemev0COBEKbNWi1smiPeN4=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr16495157wmi.75.1619376243197;
 Sun, 25 Apr 2021 11:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210425174945.164612-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210425174945.164612-1-krzysztof.kozlowski@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 25 Apr 2021 20:43:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2piuYczrajMuHCf6qtqadKciVY2XqdxZ0mrRtCdz2f9w@mail.gmail.com>
Message-ID: <CAK8P3a2piuYczrajMuHCf6qtqadKciVY2XqdxZ0mrRtCdz2f9w@mail.gmail.com>
Subject: Re: [PATCH] ARM: exynos: add missing of_node_put for loop iteration
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PuYTrD21SCWqUprfalDI83cCV8yUDhs+0Ey352KZ8LcRgNv4KE4
 s4gp7vcgLB7m1wvQHwnf/Hm7FphwfAXgyYDXfATLPSFsQD4lQIvW2u9DvkDaf7hYpNlhG3w
 afpsyKf2JmfXEDMS7vsiVgNAoSFQgPo/C0NPr2PRzKH82FZUSRWJUOSFmQR5zJZe8LOjh0K
 SUPDQWiKFOzLLXkCjsoTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:moPMetVWEz8=:kiTDHLc7VBMh4rGRaoRJ0P
 PbRC52jJepXtttZEvup0ru8RkrR/ESn45+kG2StmAxbQEtTLmjUaFaU9IfUZCPYT7gyo5sdVQ
 jao9bG7nHJ3kxWRlvJuWFqGwqPED8zU1a/N7DbsiC+Bq/HApvc2QpO1WFVjFt+DaOL4ARd81G
 yAJlYXRjeP6SmqjG8z4djST0ppSbnlRWW9Eb9bgewQxpJZV+z9ySo6j2SKyjMxHEThDajUc5x
 VXL6hn8f0yNMwo9PXWBjCpN67bs3wTwfJyjP3cWnvZIDG1GkiL741ZW4dF7+m1Lw384RRQURu
 kbJ3/5deoQNMJlJtBM3im4G16/bcz67KTyNpdwxl31TTG+0z5mKyuxSihmlkK2FZTDQgBN1cY
 XEex0iAgj566qt1nQEmTc5ToSkDtQGi06IoIie/TheJONzAfVYm4mZaxuVASiWL8lbJ9c4RdF
 0RhmD7XsKiBvBS/SvuDhaDN21A/hyh/kRlcNRvuiwXKqNB0hZXO0JR9mv3oepA6HhVwUWFKXx
 +PClarcf9ecbW8xm8WPKbU=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 25, 2021 at 7:50 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Early exits from for_each_compatible_node() should decrement the
> node reference counter.  Reported by Coccinelle:
>
>   arch/arm/mach-exynos/exynos.c:52:1-25: WARNING:
>     Function "for_each_compatible_node" should have of_node_put() before break around line 58.
>
> Fixes: b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I've already tagged the pull requests for 5.13, so I guess you can
just add this into
your next fixes branch.

       Arnd
