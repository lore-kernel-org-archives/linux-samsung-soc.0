Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48878C55178
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 19:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D746621D46
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604691631;
	bh=D0wRiw2dQqzAY6SXS5hG4aoUZgwGxUmz8Bo12GFvowc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=m5PGr+XKTmrG69uHyxDvYkMYyvQzHnTkeYKWR8g9cTOIy7XwjzE6JNA4WJ+LScrmn
	 HlPvuMCFiKNlvqN/t0uePjY6RjnbSNNUU+Y7N7avyR5m3smitMztBlxRbdOcoLwAgI
	 K9eAOZmeVAkfo3ObzGSexlBa1Mc1gOVwm8R6oFFM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgKFTk0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 14:40:26 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:41621 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgKFTk0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 14:40:26 -0500
Received: by mail-ej1-f66.google.com with SMTP id cw8so3506815ejb.8;
        Fri, 06 Nov 2020 11:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Lsx0BLiIBQClJ+hjj1DjHQZ+VLxhoRYiD5jiQAzlNqU=;
        b=VZCV/KHyxFyGNFJ/9k1EmIhE8k3lza5MywKTI6AgaU09ip4U5kp5EjGh2RRaxhoSqy
         cjHXMtsesdjwIH40S/YDbg8quPfzTmjuLrZotMEvOYmngVCheEic6vYvjl7lH4WZIPVJ
         wJMpXzlrgsx9UF46TrOmdPuxhC76HMRSjeTMN9Gud8KZwqBIl4523eyPlfJ92CZVKOzy
         vlfmoZb+g8hlkZ1WESDPdKryu/KA2SEUwuc+HxtMzqXox2bd5QGKDFT2yKNrYuGVLjK9
         TRWrXr/lgNdFsAlG8gELDjfDfjwQIBae51KjABKNHDvT/n0Os+hSjo/SYuz+RXQCLDEX
         GEIA==
X-Gm-Message-State: AOAM532jr5jgK1VPRpT9MES2ErX7FsaL0ie0Qz3NR23lD7pkoMvJgHdr
        yyR0lBh87AolRiwHc7Q6/io=
X-Google-Smtp-Source: ABdhPJygzCmjigRYj2XRa9EbFQPdonoUhJ1mEXtGL6Cep7fhMJIweWoIgWZiRNe+eNvKqhcWB+pcug==
X-Received: by 2002:a17:906:f98e:: with SMTP id li14mr3796498ejb.75.1604691624222;
        Fri, 06 Nov 2020 11:40:24 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id m1sm1699847ejj.117.2020.11.06.11.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 11:40:23 -0800 (PST)
Date:   Fri, 6 Nov 2020 20:40:21 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, jim.cromie@gmail.com,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 5/5] ARM: defconfig: Enable ax88796c driver
Message-ID: <20201106194021.GB329187@kozik-lap>
References: <20201103151536.26472-1-l.stelmach@samsung.com>
 <CGME20201103151540eucas1p1be7fe9add1ea297afa95e585be5234ae@eucas1p1.samsung.com>
 <20201103151536.26472-6-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103151536.26472-6-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 04:15:36PM +0100, Łukasz Stelmach wrote:
> Enable ax88796c driver for the ethernet chip on Exynos3250-based
> ARTIK5 boards.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig   | 2 ++
>  arch/arm/configs/multi_v7_defconfig | 2 ++

Thanks, applied.

Best regards,
Krzysztof

