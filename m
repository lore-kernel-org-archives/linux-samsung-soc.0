Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CA5C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E32820728
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604505;
	bh=ZFNdJ6h2FHT3h6C3Z+1reJPef6Z20ts+vvinNiMCLW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xOn42sLfTK5VCkSzlRDQruWYNAeifCOiveTt/RDBtM8eIjOgOlobCx38fcGOCBRCK
	 sdcwPWWf+Ab7HGmrFBEOjlQRf+5QHNR6Lqjhlk/zwqqzKfPtDUramd72gO4hvnZ8Jd
	 7d/+0Oo9GyMBr+vNSZfWXS+5pOZuxlYCVWO5t9cM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbgKET2P convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:28:15 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44391 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732241AbgKET2L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:28:11 -0500
Received: by mail-ed1-f68.google.com with SMTP id w1so2770313edv.11;
        Thu, 05 Nov 2020 11:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L5Nx/D4qCEIUW4gE21+dzvrg9cDCOjiDSqZH2Z2oVls=;
        b=NoN2Gaa7ZwZYLFKoW1F8LHFEznfu1QuluOMxUsSCaymvBfK1kip2Khhen1xj0r6fbI
         X1rCkYRvk/33LjYo22rA/+Txiu6Ih+mvgEsSvTB2kIpSbFLKdzOyKEArvpj8w9CeduGz
         Wtl7i+dlx3jFeGu+nGT2dWYdfqOoNVf6C3Tfc95+8FzFj/dIFedERkcjTZwg2z3xo31Q
         agPoE7BjyF9mA+hb7HBzSw1JeCcntmtEOXCWJaPe8X0Xj4yK8CdA9fqI7BlrTD1HwFZs
         +uEFdBEPZlo3Hoao046y+veXm+LD0D5jXsaaDECaY9eUYEoIW76xB2NMdm2GcR0RVP3B
         bLWw==
X-Gm-Message-State: AOAM532MpakFMSXYyyJK1rS8TnbjKBYVy9lFCnl//VW8zHPPxLx5U9hd
        8HiOEvZchpUZxy5juP+ZyoTgfotMZvbYZg==
X-Google-Smtp-Source: ABdhPJy53Az9j2ow/GZR/jjjQYcZGR2hHKN1jejZE+AtpPyXNtuOC0IUaaYujNF97TtTMmzRJrEx4A==
X-Received: by 2002:a50:fa92:: with SMTP id w18mr4147185edr.44.1604604489275;
        Thu, 05 Nov 2020 11:28:09 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q8sm1525015ejy.102.2020.11.05.11.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:28:08 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:28:06 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 5/6] ARM: dts: exynos: Add Ethernet interface
 description for Odroid U3
Message-ID: <20201105192806.GD236732@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd@eucas1p1.samsung.com>
 <20201103184412.18874-6-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-6-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:11PM +0100, Łukasz Stelmach wrote:
> Add Ethernet interface description for Odroid U3.
> 
> Add an alias to enable bootloaders to find the Ethernet
> interface and assign a MAC address.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroidu3.dts | 12 ++++++++++++

Thanks, applied.

Best regards,
Krzysztof

