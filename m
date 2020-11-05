Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E1C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC792083B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604220;
	bh=Bd/DETyKkn5FDNiXRlkOEEYzhdUQt+HMZUYUwO1HVjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VKzeC7FDPUWNW7JyxOdTUCwZAKmb+1S1uHEJGQGdGIZScC49KQGMKwYzIGDSKxRb4
	 L4KZBk/fqs3i7wPEVY5Te9FsgpdZn6O+TmaFOsfrq8Ov1qLiN2UQgkMo42ES7ndPSL
	 fcibHb1mJ2Mq6dwizjyRz8wQKWCg+ZyJNAeAHe0Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731740AbgKETXj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:23:39 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42874 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKETXj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:23:39 -0500
Received: by mail-ed1-f66.google.com with SMTP id a71so2759898edf.9;
        Thu, 05 Nov 2020 11:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PRMNbjZ6QLLOh7qCFdRupa1xFEt8zmNgzH+kjYgEd14=;
        b=HE+p+GnlBCYHGNx4jUuj4MlpgjaZzkeyFLl6iZHs+zfQoRIdrDFxJ+b1LAPoLiMIis
         KU8Kl8WC1bh+QQXqeD+Fl/xT7Q6tL30HaMAI+pK/Arh+1lNDjv2a0e0HIWr936nPDXBA
         oamEWMgYE4jDOTTcF60dM/AFDjsphc2fxtRbSEyeIVKiflPswYtRnkte+IiaNdcJW2mq
         jie5CbsZZrgT26h2dJ7PQxAfudPlVCq2FNI6c9mD3MuN++tQltzTvFG77FRjTOMvFj7u
         uUb4svTF0nPwyNH0TqNIMiDII046Rm7VrGH58r1zHwQ6Uey3LGqj4ORezS2u8Jn4ir54
         BBxA==
X-Gm-Message-State: AOAM530mpuMqIFMDJsgsoPUGfm2E6KZIZ2TtAxH92yijpp4N1PuxdG8C
        6RGMHQt419UTreuqh0LLi8mnhgZv4oAtxg==
X-Google-Smtp-Source: ABdhPJwKi4iEp4R3wDxThGFQKhQqddbPlVt6jbk/F3NnGD0POQCyTtchBnnQpPXs1XOH0mJ2s+p/CA==
X-Received: by 2002:aa7:c34c:: with SMTP id j12mr4346640edr.17.1604604216761;
        Thu, 05 Nov 2020 11:23:36 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h26sm1517094edr.71.2020.11.05.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:23:35 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:23:33 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/6] ARM: dts: exynos: Add Ethernet interface
 description for Odroid XU3 Lite
Message-ID: <20201105192333.GB236732@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6@eucas1p2.samsung.com>
 <20201103184412.18874-4-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-4-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:09PM +0100, Łukasz Stelmach wrote:
> Add Ethernet interface description for Odroid XU3 Lite.
> 
> Add an alias to enable bootloaders to find the Ethernet
> interface and assign a MAC address.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  .../boot/dts/exynos5422-odroidxu3-lite.dts    | 22 +++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

