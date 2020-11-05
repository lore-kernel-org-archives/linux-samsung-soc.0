Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CBFC55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49ED820867
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604158;
	bh=/P1QVrb2ORDyoBlVATXStcEJlEqI59LPgiRcKOgX458=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KiKYi/AMVhdYqIJXQtDOJagTG/Sn0mY5xMwGLV6w24PQXia3lOyIS6aGauS7mFVT4
	 50cIXNxGU79jUVMBru92SHU/mRKpNATjOZqWEVw23MPouQ9eXtclSxytjXZmkiPrXl
	 X6lP9W8CKttl7fHw1A+WTvundDk+P5wDeSXDMCvo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgKETWf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:22:35 -0500
Received: from mail-ej1-f46.google.com ([209.85.218.46]:42097 "EHLO
        mail-ej1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKETWe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:22:34 -0500
Received: by mail-ej1-f46.google.com with SMTP id i19so4259259ejx.9;
        Thu, 05 Nov 2020 11:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uaX1eASOZxFBfMkZPpamSu6ifEHOCAPkAn/Q3pny6+4=;
        b=mFnW13fY6qyD5eFSarxtkbBceVD/ahpIN9Lz1ZdDzuP5PUp3roASk+lNwsZnA8ktsi
         tGDXpc7B83SG7qTrHDL5BbXNvs/cXWd4640pY0FRsdudWluVQOEIxBW0zM2kVtFWzwTS
         F16bBMkWVtDMTQlxn2QpCBaUBUCzEn43CPPWK1BVgz5m8hunS2qucWt98/XKPSHbNiDI
         hosNjTUQ0rm2GkK2ZVRnDx39dxKAt/J+rr9eMjKW7wGmx/Od2aSXuUrmy8ic9nCUvNiS
         Nus3yANNQtZ1AWugpHunahXmnKOv7d6GpQ7fP7i/csRSfJ2Sn9ArW20GPczeSmG9tDYW
         1UWw==
X-Gm-Message-State: AOAM533vsK4KGAHeWSL8euVQoarKUVXTrKaqEOODXxzUaSgnT8kBavuB
        imnyvCNR/ugtYT4UbnJI1d8=
X-Google-Smtp-Source: ABdhPJyrHyorflE0tf79bwNs0ohuT5FKO4Wo1BK0DPGzR7i6dQAq1wJejoyMzzjU6f0UmUmgQYYJJg==
X-Received: by 2002:a17:906:1a0b:: with SMTP id i11mr4030594ejf.404.1604604152516;
        Thu, 05 Nov 2020 11:22:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id e13sm1492879ejh.65.2020.11.05.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:22:31 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:22:29 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/6] ARM: dts: exynos: Fix Ethernet interface
 description for Odroid XU3
Message-ID: <20201105192229.GA236732@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d@eucas1p2.samsung.com>
 <20201103184412.18874-2-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-2-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:07PM +0100, Łukasz Stelmach wrote:
> Assign appropriate compatible properties.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>

This and #2 will have to wait till I figure out what happened my
previous pull request. I'll keep it in my queue.

Best regards,
Krzysztof
