Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A606C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 712A36112D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhJUPUw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 11:20:52 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41673 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbhJUPUv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 11:20:51 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTzjI-1mDpl53KLK-00R0pi; Thu, 21 Oct 2021 17:18:33 +0200
Received: by mail-wr1-f54.google.com with SMTP id m22so160814wrb.0;
        Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
X-Gm-Message-State: AOAM533Ol4Rd6uSfF7F9fwTBmQ6amkvo/Ty7Cr1RfJDYi9kodtnx7GVu
        i+rah/1nhstCPxm39Pw1vyHuyCnyr6V3KYmW090=
X-Google-Smtp-Source: ABdhPJzubqshEiLe+W75XqiMDuKS74vXTaVdmhaIE7BX2wz7LJCvkZXMHN8SDJ7n99D+gIARU+bX3b9fQpoTH7B8Bao=
X-Received: by 2002:adf:e292:: with SMTP id v18mr7748646wri.369.1634829513272;
 Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com> <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
In-Reply-To: <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 Oct 2021 17:18:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To:     Palmer Dabbelt <palmerdabbelt@google.com>
List-Id: <soc.lore.kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UFAvS9CFkNwX4C04eNqJM0tbV5THijnsdNYt6Vsfjvf6biU02w4
 iGZnO4gMRz8G8JPB1S69IJZZhmfrASArN4VYUH0KzYm/HxcGQ7M4PkPALV6L+ZgzD0WZSEk
 Xn1F5tPf8bkn9frLKfqStG+rpl3sAPgF64FMUra7YUcpX99dMv5gjnYTBlJsE2OQp2nO7Nw
 pHfR68DwkEOv/usrOwx1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bpCer9h28mM=:ILudqA/Sg0IJPSOcm44a1t
 YOba41b6ObCPMUP16QRo8JfXQjJj0dNyS0+HEbZ0XBiO3UQe8pqrXFzeLyXnh0zAgtV8mVd9n
 PFwcSsMtdFdSe2QQ9/psu9qQGk+JVWJRuDSEi27lPRXFuztvAtwN9Pa3uI/MS/cQ/Bkp6XFM9
 o21dv9aB6k31MMBiTG1R7Xs9SuIg+gOiRt5hOGII4VpqFQzwpDFNLfSwGowVwA1K2DNMs3X+X
 jZ+W9p3p0oYrL1yJ+2UI+pn4WU2V9QO6SoAV9B99gsGyjoAROE9MNBDDxR2M/sfuJME67Bvc8
 OJhd8ckBGsu/ApGYpgd6tAHkAtPa4vYoJtvHM2tpivqVu384JPuKI/DUGBnO1KbmS2TgTYpXU
 iLp5Zj9ZEhicPTNAhj2gk4z60hmWPo9Qrkz5f2oKdQBE8cxtwOwfffB4iUThtN7zrAXG+lGcH
 lt34WRUpgeEY1/kBxhpXQ4XoijYKW5KM/6t868vtTQofik/FJmcITnzYSid9F6kRz5PEXngzy
 UD1gMk+bKknRfKggzAoqngSLmuTg5S1uVJTlGDin3BKrZuoqTNH3frmQ1DKhPek/7bKpIF1kK
 lX7DkF3u677dmR0C8JfnTLvoMUvpEFF9lyK/Ymtf2TPN79YehNpwpaOdL6jyd2E7XWhukN5Ar
 KpXRU7qFrPSLO3a/WCDSFzOyS+Rs9QOONq1VjWdw13zMH6ao/nn9/Ldbi3bjrbE34FNgEVMXS
 IFO7rNzgRl649HiycOB0fsOjNIcfcGsHfGOPQqMAUqJ5agXYoycpgwQVVQmxKPmgwOt8v2vLP
 Vk1PjAQngIkFtYCRGOGZXwPE51j7Yu3Av5XjZ1wA4y3102JHVY=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> >
> > There is only one Microchip patch here (plic/clint). Others are for
> > SiFive. All the patches are described in the pull reqeust:
> > https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
> >
> > I had also second set of RISC-V patches for Microchip. These were picked
> > up by Palmer:
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>
> Sorry I missed this.  If you guys took this through the SOC tree that's
> fine, otherwise LMK and I'll put it in the RISC-V tree.

I haven't merged it yet, please add it to your tree then.

        Arnd
