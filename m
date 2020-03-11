Return-Path: <SRS0=zhUZ=44=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE205C10F27
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Mar 2020 10:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E8FC2192A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Mar 2020 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583921055;
	bh=PW+xweN2Q7jYNezcTamQcWSnVlLslbrRKfPGhg7xWFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HHQ0hr5YVW5GiyiEEsaY8OkKEGei5v8T6Tmth+IcBkCjLuceHGd3kGy67e5jVVp2f
	 xbd8CbbfxCkskcySr2S3aZa3B9pbXXxewLIhgR90jxABnCJBXfUBhkAF0jO8BYQDYr
	 TZxDzR3Qj4IbK+d6B9Scc5PcFJ/LejIe8fec0OFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgCKKEP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Mar 2020 06:04:15 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34869 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgCKKEO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 06:04:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id a20so2159942edj.2;
        Wed, 11 Mar 2020 03:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tXEV6a1Ws8IvISOaUIezdbLVB68GaitP/idupt6rUWo=;
        b=bDTWoq6rqRju94sNtgK/8D2gEOSerAHLi2x1DYE4VtVYY1/uo1wyA+if47pp5FNKFt
         posGRmMOTQc5G6rgop1C39I8WpMgAE0b7eU+84BFipjqTryhrT/Rrvdab+lgG/mqe6ET
         7fYARr0g7qr5S8elYhcC50bDUDQ9wBgN6h0+poppd9WH1creUvBlUA5SGiQ5V3KtCUnG
         MchyzL/dSYTiiu1+z92m2kEx5A5q2F3UQQvGk42DSStj0ZC0OKWAscj95/5KuEdJwpUd
         mz1DPUwv7NRUL4tNJRxfbLz/5RYRuscqur0zaQG6ALfPpNVATqcnkFQl7zQCSegl8A/Y
         DrIA==
X-Gm-Message-State: ANhLgQ0Gf1KmUqcAkHw7MAb3QJPJXGi0oqN3gumrxIzagCF5RbRqgeZV
        bAuRQ0QJ4vERBuDhzSNHy2QrrH88
X-Google-Smtp-Source: ADFU+vub2vwxY6tQwSODpquvuutT2E7kmTD4yYGy4xS4Yl04fzvjGNRKQ9UWwHJ/LbfRpHiOHe+UOQ==
X-Received: by 2002:aa7:d042:: with SMTP id n2mr2013199edo.88.1583921053361;
        Wed, 11 Mar 2020 03:04:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id jt21sm3185763ejb.76.2020.03.11.03.04.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 03:04:12 -0700 (PDT)
Date:   Wed, 11 Mar 2020 11:04:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos: Fix polarity of the LCD SPI bus on
 UniversalC210 board
Message-ID: <20200311100410.GA26284@kozik-lap>
References: <CGME20200304143756eucas1p1557bba245d3b9878cd2adc970e6d58f6@eucas1p1.samsung.com>
 <20200304143726.15826-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200304143726.15826-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Mar 04, 2020 at 03:37:26PM +0100, Marek Szyprowski wrote:
> Recent changes in the SPI core and the SPI-GPIO driver revealed that the
> GPIO lines for the LD9040 LCD controller on the UniversalC210 board are
> defined incorrectly. Fix the polarity for those lines to match the old
> behavior and hardware requirements to fix LCD panel operation with
> recent kernels.
> 
> CC: stable@vger.kernel.org # 5.0+

Thanks, applied (with slightly adjusted Cc-stable format, as in
documentation).

Best regards,
Krzysztof

