Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33569C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 13:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237380AbiAaNPo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 08:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbiAaNPo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 08:15:44 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2222C06173B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 05:15:43 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id x13so11729225vsl.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 05:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ipkj5NQgewYwcirkC14ppPiVF1og9gtn+2K+RG2IIQU=;
        b=T+opQyN0UjbrtKQNYPePvH3nZo+gxTny2tnIjrLlZ6Mu/EMFt5xUjf6YksjwBazO+s
         1vWJK2iJ1WXUz9ZD5CJHDElUKo7l/b19FRLeJXlbL4NsVm9nHmjMogfBMWnAuUC3FGo3
         2YMzeEMdQQKF23qcbbSSlNgoe2ZnTPM+PNDvbkFATGDMI6RA6qF8RPhxP3pzrhXXwsiM
         Xbec2B7tgCzghyWyZvoBzeQ458vNjDtZOID6uDf8nou8w3ItB0/DuHR9t+gik02aXhRE
         2Wr4xEnTSiFyduevUlqfRMQ/zTr88Vz1P7SnQn5Tt4ubCXM9XXIuaJ34w36MT0qAfNMr
         emcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ipkj5NQgewYwcirkC14ppPiVF1og9gtn+2K+RG2IIQU=;
        b=yfi0obNeIsOQuaU+DaEObba4UN08znqmALIT8D/eGAptgRb/DALvQCI9+xiabTo2Zp
         raRvAPpynSjPIOev56rm8zJl+SVVcel++FFyrIVzF+4ZqBVyp8RgRN9obr9n1y+UoqvR
         qZLX1gez4h0ybsGn2rrS0HF1WTMFwOL0c1jmdwyu3B1f4TG4fiHNH542XYdkhrZW+MMd
         siLgSSxTZQssuX4opzrQUZaT10SrXLJN5TF34+X2J7maiOhsiV9ht2pZEo2KLCKRagbD
         FQamolaPOyiJKAdg8gFnM0X85/Ba2eVPs/FU+L1O0zK19+MfQ8+EMFNnWO6sYWDh7EcH
         kb7w==
X-Gm-Message-State: AOAM530CiXhula7KVKT37aLqUEY2aGJLBgo2JU81cDr4x4akmlPQ3o0y
        sddGBP0Or6BYX0X2x8/UVAQn0lyzqOrsB18kjlunPw==
X-Google-Smtp-Source: ABdhPJxEOKUEWCzILNauqLlTJF9iFhrzAq8fmSlLI7Tkxf8To//0DUiH7TaeLvj6uEcDBJ7wbJpn5wxfsdrmlxVznVk=
X-Received: by 2002:a67:df83:: with SMTP id x3mr7975308vsk.86.1643634943091;
 Mon, 31 Jan 2022 05:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com> <CAPLW+4=Hj-vamn5EoV-SmB5JwEbuik9hF2XuhB+tU11GwXPQdg@mail.gmail.com>
 <51ce758d-b96d-c9b1-b439-e97cc59d1052@canonical.com>
In-Reply-To: <51ce758d-b96d-c9b1-b439-e97cc59d1052@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 31 Jan 2022 15:15:31 +0200
Message-ID: <CAPLW+4muLWfOsVodZkxEDsAdUYFnsjA2ajg5JVryZ0tYyxARGQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 28 Jan 2022 at 09:46, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 27/01/2022 17:58, Sam Protsenko wrote:
> > On Thu, 27 Jan 2022 at 11:33, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 27/12/2021 12:29, Krzysztof Kozlowski wrote:
> >>> Hi,
> >>>
> >>> Second pull with DTS for ARM64, on top of previous pull.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>>
> >>> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
> >>>
> >>>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
> >>>
> >>> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
> >>>
> >>>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> Samsung DTS ARM64 changes for v5.17, part two
> >>>
> >>> Add initial Exynos850 support and WinLink E850-96 board using it.
> >>>
> >>> ----------------------------------------------------------------
> >>> Sam Protsenko (2):
> >>>       arm64: dts: exynos: Add initial Exynos850 SoC support
> >>>       arm64: dts: exynos: Add initial E850-96 board support
> >>>
> >>
> >> I'll send all this as v5.18 material, so this pull-req can be skipped.
> >>
> >
> > Krzysztof,
> >
> > As clock changes are merged in mainline now, do you want me to re-send
> > those two dts patches using corresponding clock constants, instead of
> > hard-coded numbers?
>
> Yes, please.
>

Sent out v6. Please check notes in [0/2], if something is not right,
just let me know.

Thanks!

> Best regards,
> Krzysztof
