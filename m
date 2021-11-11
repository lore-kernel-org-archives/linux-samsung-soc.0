Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D45C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BBC60698
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhKKJt5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:49:57 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:47965 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKJt5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:49:57 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MORVA-1n4J2i35I6-00PuZE; Thu, 11 Nov 2021 10:47:06 +0100
Received: by mail-wm1-f41.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso3878992wms.3;
        Thu, 11 Nov 2021 01:47:06 -0800 (PST)
X-Gm-Message-State: AOAM5336zBAUg7YcL11oBjuAS3tkHsTA+/9PuGLgVK83mw0ZV+yczodQ
        wc8vO9onPvXqiaPWz5K3gyNLLxP/ZhBntdmqSZQ=
X-Google-Smtp-Source: ABdhPJytHCAvrusWObWXzwN05EvfvHYgGKkC9PhNhP9qYR3xoRRQty5Xb2cddTFTIJyn31v4h0uZFAzmnl0NkLvvoPs=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr6991598wmn.98.1636624026313;
 Thu, 11 Nov 2021 01:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 11 Nov 2021 10:46:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3MezegptR_-XPVm=RtOn4UYsb+TPEKjCGb-XRt9ke36A@mail.gmail.com>
Message-ID: <CAK8P3a3MezegptR_-XPVm=RtOn4UYsb+TPEKjCGb-XRt9ke36A@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: include header for prototype of s3c2410_modify_misccr
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:m9FBGnzcA+5320/xWvi5qaXZmde75/1th7Vy63Bfp8F3PqMcFHb
 FxfOgwTYJaszbZeA80291gBme2xF3Q7yBiLJaf5x+tpH0IV5Fiz3LHeoPbLZpHOwohOMbcs
 Z+I6SyzUECQ3IAfEt+ueNuvboaKIj+OHRvExfpHtD0dOWOKAz3Zan1fTyVnZQcepwherTeJ
 kgdJyEq/psCjh7UPoWxzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FRL8s1huR+Y=:qZ8r0wsFFbcw/1+z5yr6TL
 mUqmsAaLtKhXGGCYYsfa+09n2YU2CCCLg18QcMeeJ7045cV2T7zlIKt3pZ6Cq+x/TTHLcJaId
 FMytGVSdeU6EIseVTTG/j/SX+PwZXCsSV00CCCnVQbLMrvDqGlXO+xZKLo+a4tsKx0WulXvIx
 Mo8aWXvSBuNYoMmwciMSxZpJRiEY4JsuZBo+OF1hi5HTXkGoU9dZ8TcJH3lJF/3CwYhO6jIRh
 dqz3SGvpwGPqjzH6gjNNhpz0bOAABd5XK3BKXtKabGmzNJyu0HjjRu9fNTUJ3xdfs191gOpAn
 4/r0ipqlA09dZ2UtCPmg7sFMLb9hSNOU8ILxMjHCx60z7ORz2rGQxAv4eVaLhzWFpQg2wxQI3
 WXToMZ4WinXoWNN2Lh/gakLQHd88G3IQMRj2lYb/IT17p3Xs5I/82NcwNxyTz+CCEnqdc3eFN
 OZqwYUqggiRSQQkCfdbBn1QmRP1KSlHMpY83r043Zci7W/l5Y2TsiQ0r9gwqshXpkupM6CXIw
 b7OreyUYKCVZrnLFL/aRAzjK2cPrHWF3VT3xuhpOY5NECBXDpTy9X3SZrlySuo9DlBt0Nwke3
 aRtV4DFVddL1Wsdl9RK2jhGSEYS2CHJVFWh6jC8ngQonJJHUCHkQ4fse5sW8xGHHddqCvlowP
 2VRToLcohA/IPUF5cHVc8nQ+U3z69suhFZB4aeker2+s7Rh+MXvdPFAuCQnFUL+b5cvc=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 11, 2021 at 10:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Include the header with prototype of s3c2410_modify_misccr to fix W=1
> warning:
>
>   arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
>     no previous prototype for ‘s3c2410_modify_misccr’ [-Wmissing-prototypes]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thank you for fixing it,

Acked-by: Arnd Bergmann <arnd@arndb.de>

If you like, I can put it into the fixes branch of the soc tree directly,
otherwise I expect you'll send it in a pull request later.

      Arnd
