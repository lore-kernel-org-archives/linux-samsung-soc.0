Return-Path: <SRS0=1mvF=YQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B388CA9EB9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 07:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1BC8214B2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571816779;
	bh=wng/OVZqLP3FtbX5YFrlvc8XNo7x+Kpf4uwYGDaFXjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LqKVN1eR0B6EqVO0XK1dnS6rX3D4ne49Ust2OtALItMJxJqOQVMp2r3XYWr3R1fvu
	 s6BFLG/aRv0Ug0aHEM4GME45Pc98I+xpUXvdjFMvPUvjlcAlUbhQpFhiJfLj81HWb8
	 HWypeJ/aOcJiNia5DpJHfZFlms1+5aK1ciE5X6Zc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389956AbfJWHqT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Oct 2019 03:46:19 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33084 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732328AbfJWHqT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 03:46:19 -0400
Received: by mail-ed1-f68.google.com with SMTP id c4so15001112edl.0;
        Wed, 23 Oct 2019 00:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5cJFGnfLeRNgTrejWCo2JM2J7Q5Kj7+5yXSkE585T8g=;
        b=nA1wU+WeqJIKHOcWipN4SoPcpQ0oMz3M+SQ6ld/ZtSSiyuhqiIDUl4xepbos7IRaxS
         HucOZSsy/0qgWIEUS01DMLPMjID0+5N4Kl4HMDX6XuppCi2USKb5x58P2W5dH/afXJ/G
         EN79Jhb1ZboSbsDIX4HB42S0PmGCHY3K5TdB9KGw9SZJE9ehYFFy4mLr6mBX8Jm85+Tu
         TVVAXxR5nr/hg0DNnr1HL6u0/r97VmWA50hTBKZuca3lq5tPpPlRYu88g/vBESuAJYwZ
         DZwbUa5RFmrtLtaOXevdwNxrw6FRBccvHnT988oOpcYGmKfHp9hTfbMnScIIjnCX6QsX
         U+7w==
X-Gm-Message-State: APjAAAX/psXmVf8Y3oiBQeLVjnwpXH8a89P3yBjiZriV45v57sTU6jws
        9q4P8XwEkADuTMudbLMwMs4=
X-Google-Smtp-Source: APXvYqzwo127f2Iz7ehA1LnTrsZcl7hp3t2+nQciVRf1/t+0Tgb7ww/0KlWvmquQUUnvDGf76nUxRw==
X-Received: by 2002:a17:907:4150:: with SMTP id od24mr31033483ejb.135.1571816777344;
        Wed, 23 Oct 2019 00:46:17 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
        by smtp.googlemail.com with ESMTPSA id z25sm400624edl.58.2019.10.23.00.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 00:46:16 -0700 (PDT)
Date:   Wed, 23 Oct 2019 09:46:14 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos542x: Move G3D subsystem clocks to
 its sub-CMU
Message-ID: <20191023074614.GA10247@pi3>
References: <CGME20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3@eucas1p2.samsung.com>
 <20191023074118.3012-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023074118.3012-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 23, 2019 at 09:41:18AM +0200, Marek Szyprowski wrote:
> G3D clocks require special handling of their parent bus clock during power
> domain on/off sequences. Those clocks were not initially added to the
> sub-CMU handler, because that time there was no open-source driver for the
> G3D (MALI Panfrost) hardware module and it was not possible to test it.
> 
> This patch fixes this issue. Parent clock for G3D hardware block is now
> properly preserved during G3D power domain on/off sequence. This restores
> proper MALI Panfrost performance broken by commit 8686764fc071
> ("ARM: dts: exynos: Add G3D power domain to Exynos542x").
> 
> Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marian Mihailescu <mihailescu2m@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

