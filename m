Return-Path: <SRS0=JmOj=DP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A443C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Oct 2020 07:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8822421924
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Oct 2020 07:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsFHLmxE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgJHHdm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Oct 2020 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJHHdl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Oct 2020 03:33:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658B2C061755
        for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Oct 2020 00:33:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so5427076wrv.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Oct 2020 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
        b=ZsFHLmxE7BINX3sLNhZmok4EUe+DHyNsoKFxHXdX3XoSP/qHZ6sO4YdEVZnTldhdY7
         26iJvDlQBO5kneSJgq8Ui40Fv99Qfopg22haKLGa7CTGRmxvfG5orLelU4lG2qZiGElE
         dkoMO11L1XEeGCXndx2NoKnjCR9PDvPpU+7dELIvNgPtdPpnwhuLZKm4h4zdb6JXoeU2
         xxWCenu7xveYXeRW/fFuM7i4SAdQdP8Q2EPua1MW2787y1cWhN8CJkWCyic9+GFesKWz
         w+b0z7cnlPzn6cPtmqVDDXtZPtjWeZ8S+kbZJoZdAm8Cdr4W17C7OiYCPMJiNDQuM6GZ
         Y2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
        b=aRAi63qag3dA2b/Bdkwj/eJL8Vh49LlXI6zbqrGxdneeB8eV5LpVwCkhUnUR8cI0wX
         NmWgSHEeE8Qc5nR+JJuOWimgB7gqdfhNLkbkXYLPQE7ObFddY/Il1pX5q7YFaTYPCGG7
         lYTzbPId3EEgFx5wLcFWM/G5Z53yfEoIIR4h5yukcw+/zvXYc6Ug7ozkA4EdKut5ttEe
         dDSKw0jAmaJ1ZK6+kaIKexgnz9JHpch9kB67O2jQjlx5UHPazi4GF2LMym0L3XTfvqKx
         BBQywIGKzq/muXHdRvn/i7eHrYzQ9y5ngSXMwl51gWP0re3IaqO5wJdEWXiBG91h2EsJ
         KVkw==
X-Gm-Message-State: AOAM5335ZTXsXspARWpUSCZwOeOm9/aUbIoNKfsVeEuSX+11XmpYxHQb
        4kYazUJ4+F+/9fAU4xZLUTYdXg==
X-Google-Smtp-Source: ABdhPJzabvtfwLmhnEYubgjfeo2bB0aroK/nU1F0zOHh2mrKpbUH4p2gKhjVT7qNDholk5mCIJP9Ag==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr8460241wrq.157.1602142419967;
        Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Received: from dell ([91.110.221.232])
        by smtp.gmail.com with ESMTPSA id s11sm1385391wrm.56.2020.10.08.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Date:   Thu, 8 Oct 2020 08:33:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201008073337.GG1763265@dell>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201007100359.GC12224@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 07 Oct 2020, Pavel Machek wrote:

> Hi!
> 
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> >         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> 
> Okay, so I need Rob's ack here, I guess... and rest of the series is
> not really for my tree.

This patch is not for your tree either. ;)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
