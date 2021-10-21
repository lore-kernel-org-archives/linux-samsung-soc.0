Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F198C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B75611CE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhJUM0I (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 08:26:08 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38159 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhJUM0I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 08:26:08 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNyA-1n1sRb0lGS-00oq7C; Thu, 21 Oct 2021 14:23:51 +0200
Received: by mail-wm1-f49.google.com with SMTP id o24-20020a05600c511800b0030d9da600aeso569957wms.4;
        Thu, 21 Oct 2021 05:23:51 -0700 (PDT)
X-Gm-Message-State: AOAM533nYoAv7Nga0rYzq0eXeDcPw6Pp5vaYi/kyJhXZ6px6l7ilUFQS
        WKK8LIn3AXyK7v5dYcAZlREEUWsJS6DTlA73+aQ=
X-Google-Smtp-Source: ABdhPJyySfMSOhtA5bv4hxMOMgjYtqe9qUbX0g4CfeIRPIhQyBDPW11VeAk2UNQWRemVY//cA3QTl+gSHiVN9uJF8ao=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr6575841wma.98.1634819030835;
 Thu, 21 Oct 2021 05:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 Oct 2021 14:23:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5cU6HKrOiO2TBoYF1mEMk9QxcLbM2PxzkkRnZAeqqqIWG+vefuo
 EqZXivRcg+M2vtLRx/R11SojLlW0T9kkajzh+sFNZOOGm0jT60UofPeskhs9AF4/GC8CB/j
 fiKCVy186ggQ9C2M1Q0mRgGNq4Ad1lVYHUmoLP6VSvY8mNSl0m+lEuw0yNgNVJ5zEGYeFyi
 XwI+KB7q7yNh97L24cE2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Kx47QAr4+I=:B9JWvyalr6w/+sGWkXYoLB
 vOEJ2rFMp5JWqoqchaL0mHbdBLDlivySlVqhf7umoYb1Op8qYsJvwqi/1OoZyluiMDKn31MC/
 AdGQmedPIWg6GilNUQ41ZolP/GOFkBj7wxBVr2doLKwXbHOVV3gCy+AdbzpXTYE461lBRwo+X
 WiS3GA9oKJ6j3ODv7Vl8JRGWD1QkbJzCWmjVE/HYNzxCQ1yZvHI5tx84kk0JA71PM3BbCbqrq
 K9mHqYtGj6ochJNzfZTeNzF/5o/nnaiSr4WVsm9pWPKLsH0vNswwoJhg25SzHhwqYKgrLLjBs
 QyCCfMHkhOgajucIiVxpa5mTpFCLIqzb8AoPaNCaGBqtp7LpDWUkNWyg1k/bW88TTnnSp7vnG
 DTRsDKMOS+PwaBfbpHsynPeLawxYlok8mokZRJR/nQWJz8qdjwEJQbAZk7VLq9bIxR6OFpYg2
 CFct8f4t8xGuMCSCylZ96a+bRmjWqf7V+cwNOsbXt5w85HVs5CzGLqudpMH5Js9hwLXnrDEYz
 AShybyjl+cQVHY8YsUPOWHAf7JwPMCMKVZoPgz7do4eApV/MFCs9U32nyf0cDGAMI8JsGGJYo
 yErpe8gyRCXQnKH1WlwBsa/Gbec8Xnn9BbkBGv482KOWOd9AgBPxLx09rCuOJXTZflgLunrfv
 6eX8CwX0XlkyhD+bJJy0GFXqSa2bLIdRMWxkJ3LClEKdjko1nc0n6ircFU0Za5ztH3eWAoUNS
 YTHCgSdlZSmnVPHZ/86aEhEmlDBmTS0wuo0r1zXzx49wQQI4Sm/2DPLQZsGppoX6iEfVnFvpx
 8PKa4D40B1HtVz/VDloqhJ8eLSnD6g/8AjArDJDfDFdyXqLCQo=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi Arnd and Olof,
>
> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
> August 2021 (v1, v2), resent in September and pinged two times.  They got some
> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
> unfortunately Palmer (RISC-V maintainer) did not respond here.
>
> The usual RISC-V patches go via Palmer to Linus and I am not planning to change
> that, but I want to get these fixed.
>
> Could you grab these to soc tree?

Sure, I can add them to a separate branch in the soc tree, in case the
riscv maintainers
take them after all. I notice that you have only Cc'd Palmer, but not
the other two
maintainers or the RISC-V mainling list. Adding them here to maybe get their
attention.

        Arnd
