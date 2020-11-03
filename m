Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0131DC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 10:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A24022242A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 10:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4Jd+CDT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgKCKjD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 05:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgKCKjC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 05:39:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7F2C0613D1;
        Tue,  3 Nov 2020 02:39:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id h62so7442893wme.3;
        Tue, 03 Nov 2020 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lKQ17IPb7XkEk9VmHe7lbOl+kucSR/sl5DThRohkCuY=;
        b=Z4Jd+CDTZwzwUOLQmJelyH3HZ647W8lXM4NB+GuFKxVHVrBSoDznGpQOQ805SiLWTr
         QfNL0HP5V6LVFBMPr0EzKlfjQwD1eJxiL5smpBxIasjtDb2mx242Z3sc1mGOgCAHAhMp
         2vtWRv5e2KS37x0G3f/63XaenLOr0TQqOrT0mB6JbZv4DJms+v1pESxqYb/B9lV7EBy1
         EDKNZZqd+fI1kyKWUDWXMO0bIq8o3QXKiyEwi5ze1+szjTu3fYaWhThpQMrfkoJuLOxo
         4ZGy27ti8Lep8I7VYjgrFA9lhmTjtr8yvodyBuqSgkuqAn85xJO704iZIzsPoHUYc4pA
         WTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lKQ17IPb7XkEk9VmHe7lbOl+kucSR/sl5DThRohkCuY=;
        b=qKj/FifoaadRxY/vVrcOlactLzZ66DZUO4GsUPnpS9yExx82j7IdZSOGSfHbte8vWh
         FkIk3o/zMtGPnmI5ouzapVFIA9vbc7stHli8LPJ1VkzQiADHC2pP6iFnprSXEteaPMnz
         Iyt6XgBZ5xyoBCqseXvcCBWver7aqVh7S50SyGu209tXEOSYkBh723Hyev3OtaDHCGFi
         5ek84COyD/rsFjzGrY0zsEQF6IfD7JAycBiNll194hKLqVKYa3Wlo4+pSWo17GVxz4DS
         EbSuZTKoRd3X7x9D/rqYXzOUxVgtMzs/n4pL0R+obIe7PoBXKaGkXWyGBL+pdTMcnYHS
         w9hg==
X-Gm-Message-State: AOAM533OmMkirhMndGJGFq3jP+A+kG//W9Fx6QLt1I+0pzXWxwjQ9Aji
        TH8/YWFSvlhT3YW2IkB51ffqfs+EuzNrgpB+
X-Google-Smtp-Source: ABdhPJyouNt9H5SUaT0tXZRhK9LqTSBuP9bSfjs2EE9ur1RqX83VQ4v/WZkeZAfDjtJ3pNhr9Q75YA==
X-Received: by 2002:a1c:2e0d:: with SMTP id u13mr2807042wmu.179.1604399939907;
        Tue, 03 Nov 2020 02:38:59 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id z14sm2606514wmc.15.2020.11.03.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:38:59 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:38:56 +0100
From:   Martin Juecker <martin.juecker@gmail.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201103103856.GA7770@adroid>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
 <20201031175836.47745-3-martin.juecker@gmail.com>
 <20201102191845.GA64695@kozik-lap>
 <CGME20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b@eucas1p1.samsung.com>
 <20201102212118.GA2366@adroid>
 <0af4946e-a573-ad5a-5558-de439d49434f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0af4946e-a573-ad5a-5558-de439d49434f@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 10:51:08AM +0100, Marek Szyprowski wrote:
> Hi Martin,
> 
> On 02.11.2020 22:21, Martin Juecker wrote:
> > > ...
> >>> +
> >>> +&fimd {
> >>> +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
> >>> +	pinctrl-names = "default";
> >>> +	status = "okay";
> >>> +
> >>> +	display-timings {
> >>> +		timing0 {
> >>> +			clock-frequency = <66666666>;
> >>> +			hactive = <1280>;
> >>> +			vactive = <800>;
> >>> +			hfront-porch = <18>;
> >>> +			hback-porch = <36>;
> >>> +			hsync-len = <16>;
> >>> +			vback-porch = <16>;
> >>> +			vfront-porch = <4>;
> >>> +			vsync-len = <3>;
> >>> +			hsync-active = <1>;
> >>> +		};
> >>> +	};
> >> What happened with Marek's comment about this?
> >>
> > Should have mentioned it in the introduction mail. I had a look at the
> > simple panel driver and it's not enough for the display in the p4note. I
> > asked Marek in IRC whether it's ok to have this in a separate patch set
> > to have a fully working display and he agreed.
> 
> Yes, I agreed that the display can be added later in a separate patch. 
> However in such case I would simply remove the whole fimd node now. 
> Without a panel it is a bit useless imho. With a proper panel driver you 
> will also get rid of the timings subnode, so there is no point adding it 
> now.
>

Removing the fimd node (or the display timings) would break the DRM and
display output though. The display is working but missing proper GPIO
handling and the possibility to adjust brightness right now. As it is
connected to the LCD power domain, it's still turning on and off as
expected as it is setup by the bootloader. I know this isn't a great
solution, but I'm already working on the LCD driver. Not sure when it
will be done though.

The display timings are read in exynos_drm_dpi.c in the exynos_dpi_probe
method. As far as I understand, you can either provide the timings in
the fimd node itself or in a connected panel.

If this is not intended, I can of course remove the configuration.

> Best regards
> 
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

Cheers
Martin
