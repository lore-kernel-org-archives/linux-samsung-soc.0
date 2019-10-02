Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E218EC352AA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD36621920
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570027343;
	bh=PrAsKdZGrnjQXx1oQ4kF7pKI4z5HfyhHA3ZBiwRyvqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aCmzR+raNRhnRb47RqjLS+DkIQfQC2zTwCAvjEQmlzsi44Vl2I75MzAqcGgq4Vv9L
	 Siwmb+bqP+keH3Ndku4TgTOhugfVG8RuN5OcQIyLeR8WYT5BwqFbV+BZtm9q7hp0NF
	 ailMe08LM6HHAnyd/8sfrC5LPE0I7d0rJ+GGfctY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbfJBOmW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:42:22 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55987 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfJBOmQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:42:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so7488198wma.5;
        Wed, 02 Oct 2019 07:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zjyo+RChyczV0/eg5T2YT/WXOsDMQxkL4AjVjOH/ZWQ=;
        b=spoQr4HFyAqUAwCRGG6Y3XmmrSurdPonJqJzX9hC3j7n10D3rBO3dYCc0yrYdyzLJQ
         nkr4oLF4NLXDO7y2gV77ea9oa9VXACZkgKb2QhjbjUJHyCrOTSaTcojYo0K+GMqp3IxX
         ivcBKikcTYbRi9WeB30l2Zlx2TociXiCjsI9EnikuNcAj3mZukW5zSfsrMCKM/+xznRO
         Nusya3rc2ny6KZ90WcEW7++uxnGGbDoITEuL2ScfeBMOextfqKUJLB5t3xvHmiM30FP1
         QSsJFss6VAObmGYxa7fRyYlAdL+lyoH2dPxfVxmTtPqGpWiBm6Ai0tsAQt2Nq0TZKq1h
         3WQA==
X-Gm-Message-State: APjAAAUBc1o0ynzZcJgzhwuA0rbthOqT44wGVUyXbwL5yMbqf2DCF4rF
        dtqnL9sq/yp8mG5FWBkSCco=
X-Google-Smtp-Source: APXvYqw/q15Ex1aluyAWrCmSmp8ebyZKx9I38m8wSwWqcDT1DRpshz5FSYSiSjQmwsSdItJLt7i88g==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr3112710wmi.70.1570027334811;
        Wed, 02 Oct 2019 07:42:14 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id c10sm31210030wrf.58.2019.10.02.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:42:14 -0700 (PDT)
Date:   Wed, 2 Oct 2019 16:42:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 09/10] ARM: dts: arndale: Add audio support (WM1811
 CODEC boards)
Message-ID: <20191002144211.GB15898@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1@eucas1p1.samsung.com>
 <20190920130218.32690-10-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-10-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191002144211.OSoaZp8_lZduA51RN07PhlHHMARbU_Y_MNeXPjuACzA@z>

On Fri, Sep 20, 2019 at 03:02:18PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daughter board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - moved &clock, &clock_audss parts to preserve alphabetical order
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

This does not apply. Please rebase and resend.

Best regards,
Krzysztof

