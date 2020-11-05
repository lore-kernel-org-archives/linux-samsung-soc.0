Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0512C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87C972083B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604260;
	bh=VOLIT/sY8C/dVCiIQZIrRhMMlhssF261tLQKGFO4o6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wDcFMCVwXBuw9r6MrjlysmJQOainzMmZ6tb3ETAX6mNYZW+1fXTEjDJZ8H+8RICBH
	 2T5uf255+UYEJ2f8jJ3ac+MbkHJcJ2PUMo3dctOOCW3BrznNGuINvN1aTYkao6K+Un
	 hhDkAlLR6k7j9yvd5bJgrS17gNeeVhP/HvbRSgac=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbgKETYQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:24:16 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:35159 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKETYQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:24:16 -0500
Received: by mail-ej1-f66.google.com with SMTP id p5so4310464ejj.2;
        Thu, 05 Nov 2020 11:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y0unNGbDweZ+faBkQQ6Z4W1YsdJlQqbXhqGtrcOFviA=;
        b=aMZRE6aiS08emS9Pz+SfdunRW4WEU+CoBv1K94ngJJnK0ftjgh6KtKVrR02blmiixk
         HsSgJ5D7JrWOY1K4/OqkN/hAvMvgK+nA7CiDBFsIp++o05kyPqyslT194IUpdhfkbUoE
         OZvXXxRY3P/tlnKKi3Ytyfg2NMmQ8heqmkqlbKxhU7D88/CKrCP/h0cimQbjrtYik1+s
         0GyCvrQA7SvKKgJKCeit67cRyJYKMbTSu2rgn5JjuaUUmdEwF2ws75VP3BSp1JbcFfQi
         poovwOQw5XA/+vnxRksKx4qlXKLoaeQ1RLG8rKAP93k49XFFU8jO7HVmo982V5n7VC1Y
         f+8Q==
X-Gm-Message-State: AOAM531ZooJIbKWZ8segDI6KEPgI/6jQVagO1Dfn1bOKjGJebCU48/MY
        9Hcm8d2kaOkF5VILMEDnKg7W+7OuD7GqOw==
X-Google-Smtp-Source: ABdhPJyvgxBQYj4xUIgUYOxoLCIj+aCbacF6UBzNtK6h8cfUS+tSAOLMjes2rgRGi2eB8ujvJH6Peg==
X-Received: by 2002:a17:906:1a1b:: with SMTP id i27mr4045714ejf.225.1604604254466;
        Thu, 05 Nov 2020 11:24:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id l8sm1507339ejr.106.2020.11.05.11.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:24:13 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:24:11 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 4/6] ARM: dts: exynos: Add Ethernet interface
 description for Odroid XU
Message-ID: <20201105192411.GC236732@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184418eucas1p2f99b978bb007670d49741421744696f9@eucas1p2.samsung.com>
 <20201103184412.18874-5-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-5-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:10PM +0100, Łukasz Stelmach wrote:
> Add Ethernet interface description for Odroid XU.
> 
> Add an alias to enable bootloaders to find the Ethernet
> interface and assign a MAC address.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 15 +++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

