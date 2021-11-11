Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CE0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 16:42:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4819161264
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 16:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhKKQo4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 11:44:56 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56687 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhKKQo4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 11:44:56 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8oKc-1mgNHX38OU-015uAI; Thu, 11 Nov 2021 17:42:05 +0100
Received: by mail-wr1-f47.google.com with SMTP id r8so10767656wra.7;
        Thu, 11 Nov 2021 08:42:05 -0800 (PST)
X-Gm-Message-State: AOAM532Z+w+8SsgL78FVABcQUZaZ+T1ec2cuGNN8CKSDejqBWmygqN1F
        eB9sA1ZCUIQBS2QLOEWcbmt38VeIawq/OClHTS0=
X-Google-Smtp-Source: ABdhPJx5ixmh9byW4TqjJFz6i36pu47gOG4MxdfEYwBa5JydmjzUlgQx1s3/1U2xifm5YWSSfQVw+Cg26iEzj2rLnyo=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr10347630wrd.369.1636648925333;
 Thu, 11 Nov 2021 08:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a3MezegptR_-XPVm=RtOn4UYsb+TPEKjCGb-XRt9ke36A@mail.gmail.com> <16fbb472-4a82-1267-9971-db453ba009e3@canonical.com>
In-Reply-To: <16fbb472-4a82-1267-9971-db453ba009e3@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 11 Nov 2021 17:41:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0iwx4vZD=_zLFh8ioSrE=M--c=yqRZjxV+bjV6vs8sNw@mail.gmail.com>
Message-ID: <CAK8P3a0iwx4vZD=_zLFh8ioSrE=M--c=yqRZjxV+bjV6vs8sNw@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: include header for prototype of s3c2410_modify_misccr
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:Cs/rc3gJ8ojIGgdSVIXXfhFLSRK8r4TlA31y65LNadohR+T0v2L
 s2Mt33oVTImE4oDEshV/YwvEwCxq1YEQWnvnZ+QAcO6p8ISgsWPYByEziMWJQvgJ8OpcWvt
 rTrEHL94Fv2q4D/U/e3SAPX/inWjEPldeTYfdR11w4GnsW9hvcusrX4yJN8C3o8eOB0rV8N
 wKS8vth2jV6C+hifG8esA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M4rL7yPVZm8=:vnkqUG2+9anc8XP8PL1oyG
 TeSJDCe4OOdtj/xWUQ90OfoH2jqaxfHR5TsGcppIBg4f+2aDnxUk9+wIjR6CivQHHj0VLFxZy
 hij4Vinnp1Y0nV/H+WFGc15z7QmhjAFq4oE0LrV0TMKgfzNJKbfPN+AmfDlVKCTibcokFFxlJ
 Q3lW+q0yLYkK4vPlUgGfY41+pQO9hKReE/LLiUauCGGNxiWYATAxu+tInzOJd3IeLl0xsdOGX
 ej6yL77KrpQZWeZbLtxQTCorCMPFaNuYLSDBxSsClWqBlylCmuneYqO/8z5VDysRKjsrS2SAj
 jFe6+Dp+rHKR61TiwEhdu3nXKSZKR4t28FlWZCZdzMXYHXgqFLLHxUlHuIn3SAeWfbChR/TYb
 yJuNVvx19q14DevBAEn7hjnkrZsxDexgpja1CgZt3A0wB5F4yI0Ojf01hWwewahGG98GFEq6R
 Ul7VlpVt9yi3JhJoSuFjhgRFfa/dnLiyVwikxxx49zQqWjLOaZKDaQmF3SqDqIsD9PV19VHo5
 3LtlAo3LQ7ZVrcudrUtxwr+Un15CR7MaogFH3wYYlYDiXjHRy7QuamqM1lBhnbwFvyOYgt6KK
 hi8uLAD95wH6av4J5PWBBXNQ2QLTNpgCBE9BXrUvV12Elg5ndtio67WAdiWqpyJlL/HnAqjkG
 QylQcU2hOJvLsOs5iGrsPjky4DsQsiTBOFs4LMIRp2+3X5383jKK0fpivue+Jh0/WdSw=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 11, 2021 at 10:56 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 11/11/2021 10:46, Arnd Bergmann wrote:
> > On Thu, Nov 11, 2021 at 10:11 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> Include the header with prototype of s3c2410_modify_misccr to fix W=1
> >> warning:
> >>
> >>   arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
> >>     no previous prototype for ‘s3c2410_modify_misccr’ [-Wmissing-prototypes]
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >
> > Thank you for fixing it,
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > If you like, I can put it into the fixes branch of the soc tree directly,
> > otherwise I expect you'll send it in a pull request later.
>
> It's not a serious bug and was there since long time, so maybe let's
> send it via regular pull request.

Ok, sounds good. I was worried for a bit that this would break builds
with CONFIG_WERROR, but of course that is already broken in
many ways with W=1.

        Arnd
