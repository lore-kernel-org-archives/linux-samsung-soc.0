Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD84C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 272E620878
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603937107;
	bh=9JoIOPWH+HQtzv4V9b9dFmFXVyaAvTIDrJAMbbUXvLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nUXH6q1U//n2QIMhJg0sQpOmWZB94q/InO74KK8kQkSrjE/phC6hdwCmw/7/iexov
	 zXLLM3OtWQpPdJ6hLB2J0bvol+MWzQH+27tff19TntcTf+JTO4szugiGES1sxgSq0H
	 dL3bWUhAYY0HM/sEoFCnHPsSd2gjrv4SJBXQbi2U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgJ2CEs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:04:48 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:42917 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgJ1Vsr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:48:47 -0400
Received: by mail-ej1-f65.google.com with SMTP id h24so990104ejg.9;
        Wed, 28 Oct 2020 14:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=83VZz+pORqDca+ZojpaQmhO3avCC0XnIll6kPzbfGaM=;
        b=YgGLHCJ1Dr2HPl5xg1KBfOZVuqnbLyPLnypDV3aluhLnkw7rXdqsdjlK6IcCpTzaF1
         Ab3eLda0/Mmvc67a05sloKukffbxl/TGvCTKQq3yRwbAau0XcAbwSGxOBmI6X2UawwNZ
         4p06km/952HVuXTLdBryh7PerR4iJyKY9EOOXml7WgUzorvAvvtnD0gILja+lHVwd4PO
         Z6AjydSMs3OlfgT8hqt2kxcsY23/v59pz51thJl3TyruxpSDr34Jkm7RBbQxQD2b4HB2
         aYcMTfjql9CWSzeepz4uQ++js6lcZC6Cq9bClBZdLg/da8tcEL8IMWwBOKAUKTX1ykX1
         qe8w==
X-Gm-Message-State: AOAM533pr3+9ccurnXmSNA151FDoTJ+1D87UE0aBoDrgcU7B+JwvTzVe
        egI60h64D7JtKC9VjotiecE=
X-Google-Smtp-Source: ABdhPJzB8cUta6V7xPwL4y/FEh44Tmmhk4LV/F40m2/CCzzkySz/YgZearhnQDl/zEf+L4LstELAvQ==
X-Received: by 2002:a17:906:95d1:: with SMTP id n17mr1155400ejy.75.1603921725004;
        Wed, 28 Oct 2020 14:48:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u13sm409317ejj.4.2020.10.28.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:48:44 -0700 (PDT)
Date:   Wed, 28 Oct 2020 22:48:41 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 00/12] ARM: dts: samsung: minor node name cleanups
Message-ID: <20201028214841.GA266845@kozik-lap>
References: <20201027170947.132725-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 06:09:35PM +0100, Krzysztof Kozlowski wrote:
> Hi All,
> 
> Changes since v1
> ================
> 1. Use names proposed by Marek (light-sensor, audio-codec, image-sensor,
>    power-sensor),
> 2. Use amplifier in max98504 node name.
> 

Applied all twelve.

Best regards,
Krzysztof

> Description
> ===========
> A new Exynos4412 board was recently submitted and it (as expected)
> copied all not-the-best patterns from existing DTSes.  Let's fix few of
> them so any new boards will not copy old choices.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (12):
>   ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
>   ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
>   ARM: dts: exynos: override GPIO keys node by label in Exynos4412
>     Odroid family
>   ARM: dts: exynos: adjust node names to DT spec in Exynos4412 boards
>   ARM: dts: exynos: remove redundant status=okay in Exynos4412 boards
>   ARM: dts: exynos: adjust node names to DT spec in Exynos5250 boards
>   ARM: dts: exynos: adjust node names to DT spec in Odroid XU
>   ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
>   ARM: dts: s5pv210: adjust node names to DT spec
>   arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
>   arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
>   arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2
