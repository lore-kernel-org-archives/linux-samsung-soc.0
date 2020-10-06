Return-Path: <SRS0=VHj3=DN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AA9C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 21:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A21D208B8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Oct 2020 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602018967;
	bh=T0/GhN/+kZwEkOkFiYjc6hrGX+zzEGXSqVUzdCQSe0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KmD940NAU4NLn75rVzKvavuZsPN5pCzPHQgPxaq1hvV6CsFbeDlGR8vVvI9fkDuPV
	 uS0thc4oY/C/x43igb796Z8dVNfYGfDINh8xzbqIwa9gQ0i0AELh6+JjXPDxN85tQO
	 O5nu6mvOnRUP51j4cwsuKkGj5LLHI+/TAoiUYsjk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgJFVQH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Oct 2020 17:16:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43576 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgJFVQH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 17:16:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id n61so175038ota.10;
        Tue, 06 Oct 2020 14:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IbyeGvvWhzTHOAuw/P6MUaM6DrcIT8/THDuAFkHtSjU=;
        b=jHXfcV9FJzbeYKMqET1GJkqt/7nryPNqRdVa/5OAn0yrYXh54uBa6SADUERaSz6VK+
         W+qaWed2twjdMO7VIhPgFx1bQy9WaLoxDwLBVYiJ158VsHHTmkfkpuR7R7Shv2Zyoxls
         wGwhKv1CcQefiWikcsHz1l4hQ3SF3B/9CvCWo1qeTW9ojaOpsC6LT8cOxvmS4J4+qfcz
         9F2eDprkXiUylCPoMtCzN1KfR2pRhyyadj12c9mFyJtTKmCsQLplepYH5aZudUQLkV0R
         VP4AvhsLaPRrd4WHVPcBrB/X4KqBnYbpv1tho1yr6U4OQ81cajcbRFMz6ei5PV1BTx7C
         GAdA==
X-Gm-Message-State: AOAM532oIhyk9L0G/cmfU+cephRah5L17s0icGmG49rRlJv7/RpdROa7
        ku0SX4PEL6tDhDhWZQ892g==
X-Google-Smtp-Source: ABdhPJzme7ICJfAh4x6/f5YZz4HcReSSoSxSjh2yih5oKdYeNR9pa2svBIHO/o1MslcSrhrmw6RfSw==
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr3980094otb.122.1602018966154;
        Tue, 06 Oct 2020 14:16:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v18sm115045ooq.11.2020.10.06.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 14:16:05 -0700 (PDT)
Received: (nullmailer pid 2856256 invoked by uid 1000);
        Tue, 06 Oct 2020 21:16:04 -0000
Date:   Tue, 6 Oct 2020 16:16:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] phy: exynos-mipi-video: Add support for NXP i.MX8MM
Message-ID: <20201006211604.GA2856199@bogus>
References: <20201003225020.164358-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201003225020.164358-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 04 Oct 2020 00:50:19 +0200, Marek Vasut wrote:
> This patch adds support for MIPI DPHY found in NXP i.MX8MM.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt   |  7 ++++---
>  drivers/phy/samsung/Kconfig                   |  6 +++---
>  drivers/phy/samsung/phy-exynos-mipi-video.c   | 21 +++++++++++++++++++
>  3 files changed, 28 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
