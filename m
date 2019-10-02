Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761FDC352AA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25D5021D81
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570031986;
	bh=z23Kbmr1+OYxEepjoENRVm8EgZj4obqodPZ/fZjZEUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=shAnaTxjgQ5OZiMoQB+nIl+MVdFEvnudxPhh7NBuWkqcxYdLZ1hIM2MqhkzbKemLD
	 jdxE2h+EIwhE7BbWymKu66IpdcjzrvflrsaLYFidkJL39C4p78voNnxByEYT1349d9
	 SQXF9lfFKuzm/X9WFKqTOfHdSxHA5zlXkPEQjgT0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfJBP7p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 11:59:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36651 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfJBP7p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:59:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so20308092wrd.3;
        Wed, 02 Oct 2019 08:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HowoqpTxX+tooJzzTk62IKsKTseVshqzxoAQBtxdT6A=;
        b=B2KqUUVaqWvRETEopI1xqsNhiFKxzx0BfjHY41oN2mKYlpkdp7kB9x2eneupEA5DV8
         yzA44C/li893vGHTwmimJANNxsmjcYZH9oXCIH7yLZP2pYMiDBtVo+rf5RxVgJEqyjVO
         h+yj4OVCma7MnOrmxzuREO5i4VrWvi8oGK06Upzq0hagxY2u5QNKyZpBVVPqDuzC9vJo
         Epji/vOelX76FNjPMHDsf7mLWrxa+xCvYDnm44U1YJrBG+mdWjcv8Fd559pAIVcL2rvL
         LZoB6zKcnVuadUDt+PMpP/JMuKYZ29toje3cdxuQg2Vxe34o4ynfZgeZZXMibiG7gQlT
         RiLg==
X-Gm-Message-State: APjAAAV1e47c5a+/kueFSMn8QnSf10iCGlgzpsz0mBQumrXs8abij4rY
        ELw+lcmYG+p/Pnvc2DCUN00=
X-Google-Smtp-Source: APXvYqw+EuT/kFsVrBo2DafLzOqNTI2lNlStE5tvXMZ2SbznqaldLFDUBG6OK3gH+1TalVUU7oR36Q==
X-Received: by 2002:adf:afed:: with SMTP id y45mr3280619wrd.347.1570031983294;
        Wed, 02 Oct 2019 08:59:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id h17sm11629617wme.6.2019.10.02.08.59.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 08:59:42 -0700 (PDT)
Date:   Wed, 2 Oct 2019 17:59:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH RESEND] ARM: dts: arndale: Add audio support (WM1811
 CODEC boards)
Message-ID: <20191002155940.GA10341@kozik-lap>
References: <CGME20191002152842eucas1p281f3fb4b7efffaf74fa89ffaa4108b3f@eucas1p2.samsung.com>
 <20191002152831.18509-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20191002152831.18509-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191002155940.8oWken4pThQ0OdyyAox1ZCSf1h2FqL1P0t6QHCJpNHM@z>

On Wed, Oct 02, 2019 at 05:28:31PM +0200, Sylwester Nawrocki wrote:
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
> Changes since v2:
>  - none.
> Changes since v1:
>  - moved &clock, &clock_audss parts to preserve alphabetical order
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-

Thanks, applied.

Best regards,
Krzysztof

