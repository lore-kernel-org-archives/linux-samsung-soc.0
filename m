Return-Path: <SRS0=bmd/=X7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57410C4360C
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Oct 2019 15:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2088E20862
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Oct 2019 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570377046;
	bh=lSMjgXPZs9Bjcgy50wVBiUIOcJ6KPN5qm29crgO6m4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xA9SvMlKjnGxUtGKfVLKv00+nwmCX7mL3IhrGmeK7j22Jky1+bzQITI7gDITxK75+
	 VRaborJHfi5LomL5cWRvlw+d692kssDVVm4n1Le2JQ1nK4vHKsjqdkanxwhH/TPaQf
	 n3dp4MIuTWvGv/kbxuq8ewBmhrI2sbUq/p/rs4ls=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfJFPup (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Oct 2019 11:50:45 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39098 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfJFPup (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Oct 2019 11:50:45 -0400
Received: by mail-wm1-f67.google.com with SMTP id v17so10003166wml.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2019 08:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ihZ1J3ZnIPiA73wefgYVCtrwYXxga5nx5ubr6pcfzNA=;
        b=oKcy6hHC3va6XjJP+naB0Qs4kftDx1cL5YAH0ufJlQ+ORShOnz5KW9pgecgfGjqLgV
         4CNl6uR8ZKDnKIMI0NgFz43Rj4BlH5tSqXGkRyRK4boNKDOJRGRTkBL0lzJ2iHuguWGb
         Z4PIKCSf1Xg+Pfz95AQGs2ByzJLIehiORBqm+jryC0qR6yT81obzxopugycW9A9y1tpi
         HevmgUhFRLTjd7Ei4CHevUlOOmJxnqSv6Z55trjFWhGFDbM9oLvhKvNp1C/msguaZItY
         XRrs3swlaQ3N2Svt/TVy1L+hQmjXjYWQKGqUi53GBLypoDL5xU8JE2i8oPS+9svN+1kK
         6+7A==
X-Gm-Message-State: APjAAAUqdk9HpTbA+JhfGk+CvwRy3xRELYDk41KCgqnC7P7+84iOznn8
        3rFsHAnd9Cq792R74IsFpAo=
X-Google-Smtp-Source: APXvYqwpUFsuKFkFV0yCU8MvlAdLaQv9iI4DkW6U4F4MT16OU0valHv4JPerqP/5dUS7Vp1E01kGxw==
X-Received: by 2002:a05:600c:d4:: with SMTP id u20mr18486573wmm.66.1570377043407;
        Sun, 06 Oct 2019 08:50:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id q66sm10609123wme.39.2019.10.06.08.50.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2019 08:50:42 -0700 (PDT)
Date:   Sun, 6 Oct 2019 17:50:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Message-ID: <20191006155040.GC29365@kozik-lap>
References: <CGME20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375@eucas1p1.samsung.com>
 <20191003100814.11545-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191003100814.11545-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 03, 2019 at 12:08:14PM +0200, Marek Szyprowski wrote:
> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
> be in 300mV range.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> [k.konieczny: add missing patch description]
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> v6:
> - rebased on top of v5.4-rc1
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 34 +++++++++----------
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  4 +++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +++
>  arch/arm/boot/dts/exynos5800.dtsi             | 32 ++++++++---------

Thanks, applied.

Best regards,
Krzysztof

