Return-Path: <SRS0=5Eo2=74=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B2FC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 06:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6571E20757
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592203992;
	bh=NvSJ1PB19AWqmMcyu5h4aidShHyw5pMtFwcm0uekpp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WCHA8vWwwnmCybSVjUo7CvmDNdj4DA5tYo9cyux+KuhDqA44HW4mgdG5626zTmcCv
	 U7kDDLpr+Sqs8RZVSXSioCxU/3jy8vouNVvi4Vq8PxoTZ3yY4vq5FSAfMLv1+U7Icg
	 gWfHhklYKXaMY7jZYXKr/7sBT83oha/aDtkxi2tE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgFOGxM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:53:12 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37985 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbgFOGxI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 02:53:08 -0400
Received: by mail-ed1-f67.google.com with SMTP id c35so10668138edf.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2020 23:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/AfpOYZPL9pctU584Hu//DW6ALfuAyd/5lsal4VySO0=;
        b=Egn0PDdfck/14S/L3xTutR3CdDWPrSCd2qI4+3QwufFaWFDD78FULzHbuzf2lzGEBN
         IIkBCD5O8cZh9PEBo66zsBGECCYuEbWfngnuxz4KwHdmBiu4b+4CRzGx5DjYG7MRyl2o
         hOUVPHsrKcRsxyknFrNpWEowWXYppkDQNdajxcpJgxjSJPbWcqIpQdtfPUEZJRmhUpL4
         kRG2/lkIy+CSn4oI203s2bmhIdO4lY+YvJhXr29kDq4G2Ri59lLxl/ihUo5SQIXWuJEL
         6zcbZSDoTxo5mtNfh6L8WDcZIQFtslJRl6x3hErQ4g+/ORwmeevd341uyIYAHFbcipcx
         3e2Q==
X-Gm-Message-State: AOAM531VG0A+nf4wRCMuGNyLeJ8polIDReuaOBVks46QjyPFE57Ag78J
        +l0nYwUbwapT4BN0O13QO4Wzezpd
X-Google-Smtp-Source: ABdhPJyNWaOxErndDQeAmFZ7B8Sh6njH9EikIUVvdkaq55BNWa66od1DaazJVQie9LWaKuW90cLV8w==
X-Received: by 2002:aa7:c60e:: with SMTP id h14mr22872129edq.104.1592203987036;
        Sun, 14 Jun 2020 23:53:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id dn15sm8511812ejc.26.2020.06.14.23.53.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jun 2020 23:53:06 -0700 (PDT)
Date:   Mon, 15 Jun 2020 08:53:04 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Enable Bluetooth support for Artik5
 board
Message-ID: <20200615065304.GA16233@kozik-lap>
References: <CGME20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3@eucas1p2.samsung.com>
 <20200603104647.25958-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200603104647.25958-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 03, 2020 at 12:46:47PM +0200, Marek Szyprowski wrote:
> Add a node for the BCM4354 Bluetooth chip on the serial bus #0 on
> the Exynos3250-based Artik5 boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 41 ++++++++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

