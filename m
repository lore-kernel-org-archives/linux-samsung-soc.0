Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9476DC8301D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D15324137
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgKOKjq convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Nov 2020 05:39:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39500 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgKOKjn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Nov 2020 05:39:43 -0500
Received: by mail-wm1-f67.google.com with SMTP id s13so20963366wmh.4;
        Sun, 15 Nov 2020 02:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zu0rhM4q83IY0WgccKoFdr2ohPj3HXFQklS1qVvBPpQ=;
        b=eTphyODATjti29sofpfW8umUcceUOjQZ4kzMUNgHIMtAgO857/Hiol4EvVsSPnwqNC
         iAzvsRChR/3n7Zv1fmHl+Sun0IAuCxlP0edpv4ieMv4AKVR4rwBRheC0POf8Si7mwI/k
         cdqybFMAzDfUUfhbH0es3AxDCziXsXXHaEwQjc+WOp4PhhZGdteG/7v+QWYoMPRam8k/
         lcKvuLmWCTue/dk4Et0jzDEKBEFTyXdxztJCfXiBfHuOX4R6lFkP2YLEyLpUQwxBauPK
         qun+qWFzTwj62WaDbF/gMtsUUgNy497JD0xKrixKlIQ3KZ6kbG+ijXOBqRqLDo8n7m6Y
         8bhQ==
X-Gm-Message-State: AOAM532XpRrmQ2XmFGrbJatS2cGGAUD4HzmQlFB6DyUvZTAyxpRZySl1
        LFKU6lh2Cb06AAvyPho6vpM=
X-Google-Smtp-Source: ABdhPJwmQgaGiHS8oigoQQu/6HMU9o0zeF37D49I/RtSUG56hFv3wLVOITXpIIU4+mm+Z7G5o9pX9g==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr10498035wmd.61.1605436781293;
        Sun, 15 Nov 2020 02:39:41 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y187sm16066232wmg.33.2020.11.15.02.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 02:39:40 -0800 (PST)
Date:   Sun, 15 Nov 2020 11:39:38 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/6] ARM: dts: exynos: Add an alias for the Ethernet
 interface on Odroid XU3
Message-ID: <20201115103938.GB5751@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca@eucas1p2.samsung.com>
 <20201103184412.18874-3-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-3-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:08PM +0100, Łukasz Stelmach wrote:
> Add an alias to enable bootloaders to find the Ethernet
> interface and assign a MAC address.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

