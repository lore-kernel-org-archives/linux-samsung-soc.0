Return-Path: <SRS0=MOmf=BG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DB1C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jul 2020 17:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E422083B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jul 2020 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595870305;
	bh=+BtY1gXQuzt+gs+zPIuIDgEDq3OncCsVhwsW5Q6dSgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pfdCYQww51JV/97dt/Iy0kum1fY2K5+mRcKwwvIbvJ6Ch+C1zfWMVGdrODffDqY4K
	 RX1lb9gEyFFDMCDTQVESlQoICwnw5P+hZKZFM3BTjq86uc8DYKbRmhTyEyruYj1Pgk
	 Ci/E64M0yGWoJ5lnD0XIPyEEEzFxUmSgsz/mR7uw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgG0RSY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jul 2020 13:18:24 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45476 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgG0RSY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jul 2020 13:18:24 -0400
Received: by mail-ed1-f66.google.com with SMTP id di22so5541808edb.12;
        Mon, 27 Jul 2020 10:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0k4jIH1gSgo1iTNyMMauxWmx+NsRK7IQO1nAgcxxRgk=;
        b=oeKc4Zlj5IWLellB6AYlu1qxoGGZ+LQB4UQnuSRhSjFBqrgQZwD/WGS4UuvDJbeLEZ
         593fT4aJDHKaCn+PeaL9iSsNm0S1qHJ2W/cT5aE7HMVXY3JwlN/HVHPo40kMkf7Lw4hf
         O+b9+NxvaR9Qug/rk9TkFGXr44Jq41794SwSsdVfIMB/RRfU363kKb31YNPLO95gzSH8
         CL7VnDP6DM3kU9SeN3Zyl3DAuRHE23hxDe0JaQeoWIvzBahmJ9wNu9Uan27KE7UmPql0
         GznBu85lEzVemDwi2Q6llqFIqjm3SXUdCwFjDgZ2afWerrSAcmVdIPn9xFbyzGZAsL0C
         Rf8Q==
X-Gm-Message-State: AOAM532uLA/5iuU3w8TcyHGljQUcECbaJ18IVN+FUOzWn/en5UDiexcb
        yF6RnMyeaXnGbhJXrMm+2fgNvt26fck=
X-Google-Smtp-Source: ABdhPJxTxksxPRcpsDCoyrpO6+LcacicP6eSXof2gvuPMink0TfhYhM/bbzXRymtvtFdU28AZwGSug==
X-Received: by 2002:a50:bb2f:: with SMTP id y44mr22324357ede.351.1595870302547;
        Mon, 27 Jul 2020 10:18:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id w22sm7455914ejj.123.2020.07.27.10.18.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 10:18:21 -0700 (PDT)
Date:   Mon, 27 Jul 2020 19:18:19 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Add sound support to Midas
Message-ID: <20200727171819.GC3507@kozik-lap>
References: <20200727163027.9242-1-s.nawrocki@samsung.com>
 <CGME20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf@eucas1p1.samsung.com>
 <20200727163027.9242-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727163027.9242-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 27, 2020 at 06:30:27PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> Update the never-mainlined "samsung,trats2-audio" binding and instead
> use the new "samsung,midas-audio" binding.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
>  new cpu/codec binding, corrected the regulator nodes indexing]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v2:
>  - reordering to maintain alphabetical order,
>  - corrected the fixed voltage regulator nodes indexing,
>  - whitespace fixes.
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 42 +++++++++++++++-
>  arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
>  arch/arm/boot/dts/exynos4412-n710x.dts      | 37 +++++++++++++-
>  4 files changed, 145 insertions(+), 16 deletions(-)

Looks good, thanks. Unless few more DTS patches come in, I will not make
another pull request (it is quite late). I'll take it then after merge
window.

Best regards,
Krzysztof
