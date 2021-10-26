Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C4FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD1C760F02
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbhJZPbd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:31:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:40237 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhJZPbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 11:31:31 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MSKly-1mCt9W2ZC4-00Semh for <linux-samsung-soc@vger.kernel.org>; Tue, 26
 Oct 2021 17:29:06 +0200
Received: by mail-wm1-f43.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so2580214wmz.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:29:06 -0700 (PDT)
X-Gm-Message-State: AOAM530jVwSXp+jG1155YfWWb/pa40ORdSjwpyc2o5TQAnMaIU0UqgYw
        tM4Zb0NHPflOPahbgQinN3eL902efAWJBE8vO5g=
X-Google-Smtp-Source: ABdhPJwUHpsOrThxJ7PMSi5UMOgHC/s6cLM5xggqEP9OYbwlu2E+PpcpuWQjE6DvwVvK2nJqeunCdT5x05N4/EDXuMM=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr15403059wmj.98.1635262146250;
 Tue, 26 Oct 2021 08:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210901123557.1043953-1-liu.yun@linux.dev> <CAK8P3a2AxmdhGKhGxfQetfzE0nKaaTRBmX=0OEPoaxkkZwABNg@mail.gmail.com>
 <957585d9-2f0f-7181-bba3-69c690c92f6f@canonical.com>
In-Reply-To: <957585d9-2f0f-7181-bba3-69c690c92f6f@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Oct 2021 17:28:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2WwhA8Obz=1yoGbRTTS7w1VU1bUZKkSYxBFhGXo3woGQ@mail.gmail.com>
Message-ID: <CAK8P3a2WwhA8Obz=1yoGbRTTS7w1VU1bUZKkSYxBFhGXo3woGQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jackie Liu <liu.yun@linux.dev>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jackie Liu <liuyun01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cQ+Of3HJw6ktGhxncg51t5DVQfzAAqFL5/Jh9l3E7ijrQYj10Nn
 QHpHXUB7MSYRmMfzAzRciYRNGAmZ3T8YSPd+/Bt+bUy+C7N+Q2hSa30I9UWphVC64UIydvm
 7n4eRH0qUffJc34KyYZFpch5vmxGsHQk+lSegWFw1+6t7DNadJNVo7IJRwVgTLv36xn+m/A
 lJj87fmXya4MoXBDn4CjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sK5JzR4WDHc=:V3djjVp94wOdq2Iu2/p79h
 pPZfjhvtLTvyGfREgn2KKIfkWjFKoZzLubl1CXTyEKlzYbms4531vM45hcQKLdXyNanoaENFN
 rQaw5anr7vv0PaRH4U+8cy7STiZempyQsbrHht1mRZuCgyTeK7bHDQtxThIo/VqzPheaBbmL7
 J+XDonpOvGNQzXHCj1k/T2flki+Mwp9uBXo7GX0cgt5YzmHyGX+MeCP6IVMzwHQnRBL8swZXG
 WmDbPeznJSnF7IPQG4Ll5HEGAHx8+UkCmegecsycv/6MjTL4o9N9Ea19fLPsOlgIt5BKMcJ+J
 herZq1uOjbGrtnZpTonCJvi8oacN34788L7TYY1p9/o2TWYOFnkQzEs7SG+fyC8WTixpISZyL
 m13riz2C4uW7uhdB4J7S7qZnQDtnmos3AVVd9SUgPY/VpldpZMAZV+Aq6S3afOeF/7DTFQyPX
 Bh8U6JV7lEFdO2VXsoZZ1jDAoz/5M04RVcj8to4Tuh9X5yA0W4FQwT+iXEB/4Rt681sb4d6Kj
 1DUNjpLXgXS1AQF+f7ao2WGaKo4cnjDoblai5QTGxQ+6czmo2qeXNj82ut8YuqTc3Xcs5r7em
 hIZMEucl7h6Z3ly+KUoHfkzXr8rRHx/z/n8qYK+9hIITjG+O5QpVKPEdBZ2OT7r9eAgptK5sm
 IMxZdOCJauGwXJjPcR7/ptwbRIwbMVLzoLvMTitI7SAqlRv99g4bGQk2n7MfmFH+ZAAiIX9hl
 JTZG4nMLbnHi3Gm6WlYSRuY2oHC/sWHAPmUwULozToc7xW5mmrXLQZP2WrxvdpVvJCZk8a/hg
 pNSpR4lsddg+FXr1yz2YQ63QD+ZIIrVnRoOpPjNDIwweOMH6W4=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 26, 2021 at 5:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 26/10/2021 17:10, Arnd Bergmann wrote:
> > On Wed, Sep 1, 2021 at 2:35 PM Jackie Liu <liu.yun@linux.dev> wrote:
...
> > Nothing actually uses the return code of s3c24xx_init_intc(), so returning
> > NULL on error there and changing all the checks to that would be a much
> > more straightforward solution.
> >
> > Any chance you could send a follow-up to do that?
>
> I can work on this but you know this is a legacy platform and none of us
> can test it?

Sure. I was actually hoping for Jackie to send you that follow-up.

      Arnd
