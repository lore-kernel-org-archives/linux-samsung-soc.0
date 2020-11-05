Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF362C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 788EA22228
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604564538;
	bh=3CoYNGroCFVTmSgFkaJnEaEt9p08LW+3ePMyJAyRnLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jtmh5o9t5eUToC81K+d0yp5FdB+9kaHkP+oekicdSwEzi7nza6n1xBgDQ6puIkMQd
	 MxCNrvQrCwpvbftTjKYPfvFh40XkjPsmorriiloNt2XYc1MKzXcTi2vpOvPuoWh+l5
	 D5P1MJyk+xub//qtV7XtRzSrf5oERKRGvowqiukY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgKEIWS convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 03:22:18 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:32786 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEIWR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 03:22:17 -0500
Received: by mail-ej1-f66.google.com with SMTP id 7so1377575ejm.0;
        Thu, 05 Nov 2020 00:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B8HtzyMM9O+CRTsQYqsIESSwVGUTg6Wa5A4yh2zKQ6E=;
        b=rUfaY4J2r72yFjk2xInkHNZjc2rwvKFyP2zJujVzSetTqxeVqZO1UsyzeXSsE7ETLO
         HSOnmoi2XRYU8raa9pU1Z7rE1HEHbiDu85aoxJwY0gHK+d8Yt+5nLf+6A2wg3ZTgYkEC
         zPcN2um1awlyZ5l14hcQdO3SMO+RL0RKrU3Y3ED3Xn90EGuvg+772tBataDGQisIKg0T
         sllqT1bgkSB4/GoUD56vWQenpFtz8LE9vIMt6AXON4wOERB4S+BJN5wmdzh2r/7U/cIv
         5a0IIt3qOPmayRpCooNoK79NOd9F49s10L8M5aK/RqjPgiTBGKa56VAwuVb6x/RhuRho
         eRqA==
X-Gm-Message-State: AOAM530mDcbzmI1AXxNitA9Eqz5GIxbRMgtsLIP5MuIqI4TtyVXcjZ6e
        yykL8UItBMMI/MC59ZoUXBM=
X-Google-Smtp-Source: ABdhPJxEcCye0FARmvqFSOW2XgIPl8QMRmWvFp0w96blAo58WKGlqSn76S6VqZq1AGAT3HFY0rDKdg==
X-Received: by 2002:a17:906:4bc9:: with SMTP id x9mr1155633ejv.37.1604564535540;
        Thu, 05 Nov 2020 00:22:15 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n25sm487185ejd.114.2020.11.05.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 00:22:14 -0800 (PST)
Date:   Thu, 5 Nov 2020 09:22:12 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
Message-ID: <20201105082212.GA23722@kozik-lap>
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
 <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
 <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
 <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 04, 2020 at 02:44:10PM +0100, Marek Szyprowski wrote:
> On 04.11.2020 14:13, Marek Szyprowski wrote:
> > On 04.11.2020 14:06, Markus Reichl wrote:
> >> Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
> >>> On 04.11.2020 11:25, Markus Reichl wrote:
> >>>> Recently introduced async probe on mmc devices can shuffle block IDs.
> >>>> Pin them to fixed values to ease booting in evironments where UUIDs
> >>>> ar not practical.
> >>>> Use newly introduced aliases for mmcblk devices from [1].
> >>>>
> >>>> [1]
> >>>> https://patchwork.kernel.org/patch/11747669/
> >>>>
> >>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> >>>> ---
> >>>>    arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
> >>>>    1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> >>>> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> >>>> index a5c1ce1e396c..aa10d5bc7e1c 100644
> >>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> >>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> >>>> @@ -13,6 +13,11 @@
> >>>>    #include "exynos-mfc-reserved-memory.dtsi"
> >>>>      / {
> >>>> +    aliases {
> >>>> +        mmc0 = &sdhci_2;
> >>>> +        mmc1 = &mshc_0;
> >>> Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc_0)
> >>> and 2 for the SD-card (sdhci_2).
> >> How to deal then with sdhci_0 (from exynos4.dtsi) vc. mshc_0 (from
> >> exynos4412.dts)?
> > sdhci_0 and mshc_0 both operate on the same physical MMC0 bus, so this
> > is not an issue. They cannot be used simultaneously. The latter is just
> > faster, the first one has been left there mainly for the software
> > compatibility.
> 
> I've thought a bit more on this and I would simply prefer to add generic 
> MMC aliases to the top-level Exynos dtsi files (3250, 4210, 4412, 5250, 
> 5410, 5420) to keep Linux logical MMC bus numbers in sync with the HW 
> bus numbers on all boards.

I like this approach - I don't see much benefit of having different
numbering between boards of the same SoC.

Let's match old U-Boot behavior (I assume that people switch to PARTUUID
around the v4.0 mixup, so they should not be affected).

Best regards,
Krzysztof

