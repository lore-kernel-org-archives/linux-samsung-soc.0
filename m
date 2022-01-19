Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F67C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 14:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355161AbiASOgL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 09:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355247AbiASOf1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:35:27 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585DDC06161C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:35:13 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id w21so4825966uan.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLgxgM2afbaDj1scoJJyoJXdiR5WXv+QSndG8neOGUo=;
        b=g1zH2Kto7io35PJPi5MA+AdWvRs/0eqilwW0xwumESemPMzRmJ4FiG5KL20XG4a9+E
         ee+c7e0BCEU59SOEeNqGgDnjB8x6U+ECkau1S+4XFUMlWLjcFQr9uxY0xdaArjtHALyP
         //yLUvFGrW79FCQZNZbEHvWdwYyVsA4x7pMj+ePO6p7ryavNQUweENCuLgUYF8ArNmsP
         4YRRNO6GUQpsRoqaLYBkyVi7xCj/2FoyuguxApYPuhWpKsRmgyWhHU2iBR26OgQknxPW
         AmIJH+RDicT11VS5ehBInkko6OnJ/9ggrYuRUeNFJ3bXyeg+4qdx0ffE3xIpdB6pMvtk
         HUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLgxgM2afbaDj1scoJJyoJXdiR5WXv+QSndG8neOGUo=;
        b=1ewKgbMtVWA/eKAHV/oHI5DvRPj05hcGD3qb4VOglxw0lwTzQmurj3QWL5S7Whw3oW
         /fzT7weQMg509pEom/Y92amUOGvqVq9vgt59mV5jejmk68lMkuuxLNZHJIt2ICAAS38n
         j198X+E18r2fEYuKoZYknhn6xJJSpl0RbsCWaRK77IAT2JGkXrr95K0mPVAu7AXjO0tw
         Hkf6ks4Ovp6qIzn+O+IlzvS5nI4OXY42Y/Rx/HJV+9RQqlxeUnUYN6Dtxyx2C14tovp/
         Xd0S4bmb9sB9xhAns8IBD1me5fwjx1xlwko5mdlCmIBtjRASRBPhkpHsc3SIAyFSchGg
         XRTg==
X-Gm-Message-State: AOAM533z+M9xdDWhaxHVcrf3aLwuOohPkOBlRFdBzGUqsBjEtE5nIEWm
        eP0Qih0ntSxAUjj0pw2jyoo4DdpcN/FuJS0IpQMJ6A==
X-Google-Smtp-Source: ABdhPJxOruJaoz/pWwTVy4wuzkYZkvTsWWKQ2sxSaYu79R6cOGJjr6S5WsMsXxmmNtYFC++JOIanZkWJ/VmgFGUTkfk=
X-Received: by 2002:a05:6102:108c:: with SMTP id s12mr11738010vsr.20.1642602912348;
 Wed, 19 Jan 2022 06:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 19 Jan 2022 16:35:01 +0200
Message-ID: <CAPLW+4=vEYm6dGSCXtmiXUVe7FT6p=6Uk=MCvEsEgcdTz-R0NA@mail.gmail.com>
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

On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Second pull with DTS for ARM64, on top of previous pull.
>
> Best regards,
> Krzysztof
>
>
> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
>
>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
>
> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
>
>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
>
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v5.17, part two
>
> Add initial Exynos850 support and WinLink E850-96 board using it.
>
> ----------------------------------------------------------------
> Sam Protsenko (2):
>       arm64: dts: exynos: Add initial Exynos850 SoC support
>       arm64: dts: exynos: Add initial E850-96 board support
>

Hi Krzysztof,

Do you know if this series is going to land in v5.17? The prediction
(by phb-crystal-ball) is that MW closes on 23 Jan. I can see those
patches in soc/for-next [1], but want to be sure those are scheduled
for v5.17.

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next
