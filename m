Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DA4C2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 17:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D1822409
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 17:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShwxGnHf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgKORss (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Nov 2020 12:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKORsr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Nov 2020 12:48:47 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9396C0613D1;
        Sun, 15 Nov 2020 09:48:47 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id q3so16337608edr.12;
        Sun, 15 Nov 2020 09:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v/wAb02mQCQZsBiGAL1qlGOpcmGC2tOVn8KZIvlgQc0=;
        b=ShwxGnHftRZhk3XROqm6tuG5nxh0xz0OXFbRH92hxKFIuDCu6SLBS6VqG13zRM88EY
         0MHJldhlQB7V1cjo90AoGRQeX/kW5jyL8O8luUXpnnvboW5SgUq2bb5ILfKyJWTKaIXn
         0JjxlI/ZJ4Z1ne8GvP2DzMYANHArdGDHZt2pVqkx2yWlSfA6+WOYEXl4ZwxR1UXQqCv0
         aqoMYwj2X1FhdU6uqqeDBYgoIwbDKo0MgaWsufZ5acloyi31N1eCMHBvuu//r27qRqtG
         G+DuVCGqqe4n39CtTOUsxjW6827z2AZDsI+oDpNQjuUpJ3pJrNIS1bmzF83ec0ozQdh+
         2tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v/wAb02mQCQZsBiGAL1qlGOpcmGC2tOVn8KZIvlgQc0=;
        b=AyjeBJb5N4qdKcesjGqW/hfR4L5XhQkyzRfzC57nWCgz0ycOF+kN1Dib0HwlMEHnJB
         Gl4kK/t9BOTaraT/LyC0yaMywXQb/FkeqaKgAnm9UPpXs04wLoD8067iqFzX6OPVwsOf
         hrHoqjLpoKgduN92Zwk5vsqFfMcDjNHGj6fCP4P6RgDo/gAMCVmChwMKkmts3EJvzCt9
         TC+4mCkYlNStZ3RFsrOSlbNGe/0BuaF0PI8RWzEuujiVoTkiaWX32N/wXJeJXq6KXtB/
         jlga5AAsFhx4aK+RCuLIzKgrXiHdy0fyN9pC+IwY56dCTWCHlgsOLY8CLYy9LL8Sqqk3
         QETA==
X-Gm-Message-State: AOAM531twsGPv0TWYSb7JPxkWIbsL/KSd8ujZQ3jAFbodQM3Wg+cq6HP
        NbhbUPOvOHnORh01cggYgWs=
X-Google-Smtp-Source: ABdhPJxMKaggjAxmwLnhbvDD0mwEkG1xb0o9sQyb5qL3GgJQaDnRk1qzczIkVay7AadxAaz4TaAasA==
X-Received: by 2002:aa7:cdd3:: with SMTP id h19mr12337772edw.330.1605462526347;
        Sun, 15 Nov 2020 09:48:46 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id e1sm9521554edy.8.2020.11.15.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 09:48:45 -0800 (PST)
Date:   Sun, 15 Nov 2020 18:48:43 +0100
From:   Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201115174843.GA33100@adroid>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-3-martin.juecker@gmail.com>
 <20201115103251.GB4587@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201115103251.GB4587@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 15, 2020 at 11:32:51AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2020 at 10:25:23PM +0100, Martin Jücker wrote:
> > The p4note family contains a couple of variants of the Galaxy Note 10.1
> > tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> > only version.
> > 
> > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |    1 +
> >  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   17 +
> >  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1132 +++++++++++++++++
> >  3 files changed, 1150 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index ce66ffd5a1bb..55ffee2b20f8 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
> >  	exynos4412-odroidx.dtb \
> >  	exynos4412-odroidx2.dtb \
> >  	exynos4412-origen.dtb \
> > +	exynos4412-p4note-n8010.dtb \
> >  	exynos4412-smdk4412.dtb \
> >  	exynos4412-tiny4412.dtb \
> >  	exynos4412-trats2.dtb
> > diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > new file mode 100644
> > index 000000000000..9f559425bd2c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
> > + *
> > + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> > + *		http://www.samsung.com
> 
> Here and in other files - why did you remove your copyright? My comment
> from previous version: "If it is true, then include the copyright of
> original work as well."
> 
> Best regards,
> Krzysztof
> 

Hey Krzysztof,

in the second response you wrote that "usually we keep the copyright of
original file", I understood this as only the Samsung header as it is
done for the midas, i930x and n710x. A lot of it is basically the same
but with changed gpios. I really don't need my copyright up there if
it's not strictly necessary.

Cheers
Martin
