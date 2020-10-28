Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E49C55179
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4940C2245A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603921847;
	bh=lRbFFqtr8SH4jEEaVtEeat87C4JtiT3c6FEQ82Tgvd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GifRPcSTo6EVJmkuuSiK7BtK2rUqoveEIDqeM6ZdyDr05wRMOdjhDQI48Ho2vwgKE
	 n01pDinwTxq/50R5r62el8nbYBhQ8E5yTWVEAtTXEb9yrZAqTAyUF9wuF/3zmQnyEJ
	 Dsn/sMzBL7WZpjcvdVc1hLs5R8wTYp6um9Aik7dg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgJ1Vuq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:50:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35539 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgJ1Vup (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:50:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id x16so898713ljh.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mEgti6gYJQiPiwWJ7KIXNJeGtUpIZ3SQDpuO+SIa5KI=;
        b=QdoE3JO5v/Wk9Qkc28EOwlkT7UhLZl3SDiagwffrWMq1FiasWzdfe/NBQYm//710Vy
         aUnBjp+HT6tpSIvbgWhw9vfa0y5p02o2AVzUWKJCZvJ6eqmnWnW1e7uwlNbqk7s9Va//
         fmAb5zOMW+uXDByRqAyHec8PEQFs2mZJqpiYybHtGbqP/BW06i6tlj2P/Qim4M4D4n0K
         HFA2d4fuu3qfJ/0Rgj1tIqUXDPhq3qV3x9wyNnz140y4CtYl0E2ZyhlzTyjnPsOqP+9t
         e0hxTaDUhAaumLfMOug5SEsZQ9G9k3TmG0ZKD/R9lolQG9YFIjmlkmVAxdldGrPq74z2
         vkZQ==
X-Gm-Message-State: AOAM533fghEb/cOfsx6ZISVKAAaNCdXiuRGwNRA8z/LLgNXK0xZ1N709
        mt0yuYJob78GIIns7Y6Dwns47p/p85UcGg==
X-Google-Smtp-Source: ABdhPJwbmTpwK7f1E17+uQ0pBrs58ZVyUZ/wZK84Cf/52f9fwJ96BtyTk12yDORXHjwqs+ibDqW9cA==
X-Received: by 2002:aa7:dc42:: with SMTP id g2mr365460edu.11.1603911927591;
        Wed, 28 Oct 2020 12:05:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id x22sm222472ejc.102.2020.10.28.12.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 12:05:24 -0700 (PDT)
Date:   Wed, 28 Oct 2020 20:05:22 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Enable BlueTooth support for Midas
 board family
Message-ID: <20201028190522.GC159042@kozik-lap>
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
 <CGME20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98@eucas1p1.samsung.com>
 <20201027142330.5121-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027142330.5121-3-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 03:23:30PM +0100, Marek Szyprowski wrote:
> Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
> the Exynos4412-based Midas board family.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-midas.dtsi | 28 +++++++++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

