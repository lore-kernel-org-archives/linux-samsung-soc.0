Return-Path: <SRS0=zhUZ=44=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A25C10F27
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Mar 2020 10:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9A812192A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Mar 2020 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583921551;
	bh=eu4q8Kr0Yo/MkjFlfVI0XPfrYSTxt67t9VKpWGh1W+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I7t9Or3MveGGX1dI7MHFpGtQ/MKP/yENcqc9QPKiWTLGqqxNUCgKl/JaAE8qY0a4p
	 r7TuoYVxF+l+umbYjXzBHlmvS7Cuw24AKIytY5/mespPZ26Y3uoU++d8p18ZCtc8oM
	 7OhnnqcafDJmNGKqJBhz2jOrdUJAz9HpAFRc4Yvg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKKMa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Mar 2020 06:12:30 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45909 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCKKMa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 06:12:30 -0400
Received: by mail-ed1-f66.google.com with SMTP id h62so2113735edd.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2020 03:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W4464YPdC75JibBxIGKbtPb0SqLSw7NS1Cu56JQ7WAo=;
        b=r9vmx2nkmhWKXV3LBxzGZ/iqhOekdzHuj6unGPFgtCPdi0GyBxKge0M1YUgl4Rt6EA
         Db83v29gmJ3uGIeo6ErIpdULL0+Iwaxp0xDKW4EZ6xsSTC5crMFdbU1/zgTnk7e7/CM4
         uF8TMbZMpYTSFXMUK94QOm5mAG8dfqP/M2BrIGR4J72ewS4fehbd+LQBH+6wBgTPXJ5Q
         TCKNcZbVGKdXAC+3nn2e6C6OeCz+fjWJgg8P5n8FiXnPgbAQAKatPhXSmDnNOvJe5nbm
         pk35HF0IHRP5SXvbprj+oJjGh0gGbaMQEuQiRoJSHzaaTsOVp6qp/bFQbNsrtjj9TzzO
         9zqg==
X-Gm-Message-State: ANhLgQ3JoWlLWdSuaeqKZ3UK1yhhgETyfBHaB2QiziWVNrTC4Jg672eW
        noxcSwMwBM0aKIy1D+hHjrE=
X-Google-Smtp-Source: ADFU+vsSBCgVqWMjBrRUYeGU1ktdUEQd+G9PE0iGk90GNpyaYNlJL+NjjgN9oPj337+V1m82TeItkw==
X-Received: by 2002:a05:6402:31ab:: with SMTP id dj11mr1947532edb.143.1583921547399;
        Wed, 11 Mar 2020 03:12:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id y89sm3213271eda.97.2020.03.11.03.12.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 03:12:26 -0700 (PDT)
Date:   Wed, 11 Mar 2020 11:12:20 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix regulator node aliasing on
 Midas-based boards
Message-ID: <20200311101220.GB26284@kozik-lap>
References: <CGME20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8@eucas1p1.samsung.com>
 <20200305152108.20688-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200305152108.20688-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 05, 2020 at 04:21:08PM +0100, Marek Szyprowski wrote:
> Commit d4ec0cb05064 ("ARM: dts: exynos: Add support for the
> touch-sensitive buttons on Midas family") added a new fixed regulator
> ("voltage-regulator-6") to base "midas" .dtsi, but it didn't update the
> clients of that .dtsi, which define their own fixed regulators starting
> from the "voltage-regulator-6". This results in aliasing of the regulator
> dt nodes and breaks operation of OLED panel due to lack of power supply.
> Fix this by increasing the numbers in the fixed regulator names for those
> boards.
> 
> Fixes: d4ec0cb05064 ("ARM: dts: exynos: Add support for the touch-sensitive buttons on Midas family")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 ++--
>  arch/arm/boot/dts/exynos4412-n710x.dts      | 2 +-

Thanks, applied to fixes for current cycle.

Best regards,
Krzysztof

