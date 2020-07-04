Return-Path: <SRS0=5g2u=AP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D62C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Jul 2020 10:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60553208E4
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Jul 2020 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593858173;
	bh=5m8/7zS+1VBFKotYEfoawEAzm4yV5slnHduPy48fO2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tpuSLxm+OlPutpSvnuJbKKdsKXe7DYgzuUYm8OsYVrPMERAJzvLPDy25T7xZ+rNoh
	 rAAMcVWelRM6zGvXf2exCqOpOkH0BvORbrw0kdojNy7dzLVWfr5W7auCoRbKKBT/C3
	 PXmutmlfckL/fxTvc3RXqRdRWmAQIGVsKveqwWMI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgGDKWw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Jul 2020 06:22:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37766 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDKWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 06:22:52 -0400
Received: by mail-ed1-f68.google.com with SMTP id g20so29798539edm.4;
        Sat, 04 Jul 2020 03:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+jrV0HqUbkt9Cx5rpAJlhzgehxEYGZ5fXXCayKBNA8w=;
        b=qyOaGvEr2L8LFRXof5womsWD5GCZcG8QUeV1VebLNEzfjfHXddoWyFnAIlJpLeuEOl
         MCSzQpciI4GKiCzcMe8YeTz18kpMlag0nw+DAjnPB2Iq3IYUiEoBcT+WnPByIfMVS8cF
         qD7lXJGMs5ZGI5hmPCTTrGLgqNDtpllEzcAOW8Aespw1nH9bpNliRiWsg8vqXZesYB8G
         qkrqY87NvKw78iKssLJ+G5yHzA6Xcq98DlvXH4qQje/QMuiI+lbxMkWkEEZiT5EjrCOy
         9KILHC5jEsbWvTmz1UdM9aYL2uApuLpddeEcgjdiXu5VA/ounolYvMWD1y0xTlBb4FJL
         H+Pg==
X-Gm-Message-State: AOAM533ZScj8Ir/1X7bKqrK8bHA3gtLo/krDMuPAmJhCP0pk8KlNDK3l
        rE+3YBJEZ3sxLmcv0pdyRrI=
X-Google-Smtp-Source: ABdhPJydT2qa3CL2K8I9FiDko44uIMNxsxpERrU9lCToYFS85q0/39Ygxmz7gRja65rU5l2pJFMR+Q==
X-Received: by 2002:a05:6402:31ad:: with SMTP id dj13mr2189528edb.88.1593858169754;
        Sat, 04 Jul 2020 03:22:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id ck6sm14236971edb.18.2020.07.04.03.22.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 03:22:48 -0700 (PDT)
Date:   Sat, 4 Jul 2020 12:22:46 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: Add minimal bootargs
Message-ID: <20200704102246.GA5975@kozik-lap>
References: <CGME20200703184543epcas5p4adb3db7693094c72477b8469d9f205ba@epcas5p4.samsung.com>
 <20200703182536.9190-1-alim.akhtar@samsung.com>
 <000801d6516a$b6efcb40$24cf61c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000801d6516a$b6efcb40$24cf61c0$@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jul 04, 2020 at 12:19:40AM +0530, Alim Akhtar wrote:
> Adding Krzysztof's correct email address.
> Sorry about noise.
> 
> > -----Original Message-----
> > From: Alim Akhtar <alim.akhtar@samsung.com>
> > Sent: 03 July 2020 23:56
> > To: rzk@kernel.org
> > Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > robh+dt@kernel.org; Alim Akhtar <alim.akhtar@samsung.com>
> > Subject: [PATCH] arm64: dts: exynos: Add minimal bootargs
> > 
> > Add minimal bootargs to enable earlycon and console.
> > This really useful in case kernel has crashed early in boot process.
> > 
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> > b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> > index 790f12ca8981..d7b42d5a3b2d 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> > @@ -24,6 +24,7 @@
> > 
> >  	chosen {
> >  		stdout-path = &serial_2;
> > +		bootargs = "earlycon=exynos4210,0x14c30000
> > console=ttySAC0,115200n8";

Hi,

The console is already chosen by stdout-path and earlycon would use it
as well, so no need for the address. It should be just "earlycon" if you
want to enable it unconditionally.

Also, why did you use different serial for console?

However the question is, are you sure you want earlycon on every,
including successful boot? On most of the boards we do not enable by
default. If developer needs, he can choose it for example via U-Boot
"setenv opts earlycon".

However it's a development kit so it could be enabled on default...

Best regards,
Krzysztof

> >  	};
> > 
> >  	memory@40000000 {
> > 
> > base-commit: 9e50b94b3eb0d859a2586b5a40d7fd6e5afd9210
> > --
> > 2.17.1
> 
> 
