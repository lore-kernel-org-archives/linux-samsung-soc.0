Return-Path: <SRS0=sdu9=CJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6617CC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Aug 2020 13:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40E1C208A9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Aug 2020 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598881812;
	bh=ztLmZ+941EYqr7AcuVlAnDkvVWFOEg0Wm9jORnDkfUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ObZXlj5lm6JdDVLY+G5Q5DnQJSnzt8I4PDh15hSdOWuO2lmUKNGPNFbYTgBkU/sQw
	 YDDpOue+TiUNI3VuoTW6c4btIkAHM/xq4O3BbiDfAInXYM3AlSlmfPgI1MlkdJPYI0
	 p3ThOlutznxfv8QxZcFe2FTmlr/SNTZUHdaUXWzI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgHaNuJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Aug 2020 09:50:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgHaNuH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 09:50:07 -0400
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6936214D8;
        Mon, 31 Aug 2020 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598881807;
        bh=ztLmZ+941EYqr7AcuVlAnDkvVWFOEg0Wm9jORnDkfUk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vYV/FGnlQ06Mj/nnQX76wRgv2qFhTHS7eVvVPBLvjpO93baFcabyDVe+wYQC1Lh/9
         /QyPf451GSDyQH6zTMXYOggTlJyPDU0J/9TRQJa1M3PVfN8lyPGbPgU2+hcUYgPH/W
         y7q1CTt1RI1xlnnrSJpNG2oXDCfTI9ekdZZNsZj0=
Received: by mail-ej1-f41.google.com with SMTP id b17so8570941ejq.8;
        Mon, 31 Aug 2020 06:50:06 -0700 (PDT)
X-Gm-Message-State: AOAM533s61NeNXu8scRgccjylTOak68a9Zn2VJZQIkNSZb9uNMIIuicN
        RBVLcfLyHrUbPfPt9Xrmv6ymsKosp07v30cvtSY=
X-Google-Smtp-Source: ABdhPJzSNDPf0SiyxO/14ODP0ki5tEh8fCdOy7QMsQkV/SOOG8rXrfpgfQiPmDMwBNPvJpjGjdhWCIJ1LfOLyjDXiZU=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr1217460ejx.215.1598881805398;
 Mon, 31 Aug 2020 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200829142501.31478-1-krzk@kernel.org> <CGME20200829142607eucas1p137f06c4bac607652e972f4c49d1a9982@eucas1p1.samsung.com>
 <20200829142501.31478-10-krzk@kernel.org> <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
In-Reply-To: <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 31 Aug 2020 15:49:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Subject: Re: [RFT 10/10] arm64: dts: exynos: Enable Arizona interrupt
 controller in Exynos5433 TM2
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 31 Aug 2020 at 15:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> > The Wolfson Arizona codec is interrupt controller which is required by
> > bindings.  This fixes dtbs_check warnings like:
> >
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: 'interrupt-controller' is a required property
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: '#interrupt-cells' is a required property
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> However I really wonder if it makes sense to expose this to DTS. Indeed,
> the main MFD device of the WM5110 chip is interrupt controller, but its
> interrupts are requested internally by the respective drivers.

In such case maybe the schema should be updated? Feel free to send a
follow up or a replacement patch for this one.

Best regards,
Krzysztof
