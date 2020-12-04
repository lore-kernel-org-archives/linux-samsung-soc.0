Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2005DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 08:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B866722573
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 08:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgLDITE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 03:19:04 -0500
Received: from mail-ej1-f68.google.com ([209.85.218.68]:35691 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLDITE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 03:19:04 -0500
Received: by mail-ej1-f68.google.com with SMTP id f23so7449447ejk.2;
        Fri, 04 Dec 2020 00:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VemDQ6EGsBsmNy3s9ek1G18QMI3vy92u8aJPDPxveeg=;
        b=QGE20SG9uC4742ZZ3Ri0Ex++TH4TM//6WPsZk3bI5exQq0lrbqpZMF1p8s9S8rhhTR
         tLbtTx+uZotXoQcxBwkNLQLyfb4dA8GGsBge0n5uVDVBsk90GBmS5VqsWksqTUgZFXiM
         tSUd/SeVPF/ZqTSYVizz4n3dzyJHMpffA2QYgvPUw1OU9LFWdvniV7erZN7uU9yo+zht
         skIRgGCqEUOIcx5gW9qq5Bb6OJlkhRHD9ORvyNkwcPv9h8Pkf/6O/hbeK//nIOZQrQd6
         VygSp5WscnZZVeAkkW1KlK052F3PgHo4TJqzGeVKNeqW/FA8NlNXEHz/IuuraNKsfo5A
         TZDA==
X-Gm-Message-State: AOAM530eWSaBCnvTF9/dqiSD53DJ7SMVNNcaAz/o3c679pDHCFJxk6BZ
        RfigG8rnRJRQ/qyEFGxbONE=
X-Google-Smtp-Source: ABdhPJwL0al19RhXuOfgb8PeQPspdUlFB4mwc2b7uxWixr+3jMaX8oS7lNdpsirID5U93f3GAg7S4A==
X-Received: by 2002:a17:906:c046:: with SMTP id bm6mr5770776ejb.436.1607069902146;
        Fri, 04 Dec 2020 00:18:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z22sm2504364eji.91.2020.12.04.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:18:20 -0800 (PST)
Date:   Fri, 4 Dec 2020 10:18:19 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile
 tests
Message-ID: <20201204081819.GA3891@kozik-lap>
References: <20201116175301.402787-1-krzk@kernel.org>
 <20201116175301.402787-2-krzk@kernel.org>
 <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 16, 2020 at 07:54:03PM +0000, Paul Cercueil wrote:
> Hi Krzysztof,
> 
> Le lun. 16 nov. 2020 à 18:53, Krzysztof Kozlowski <krzk@kernel.org> a écrit
> :
> > The Ingenic DRM uses Common Clock Framework thus it cannot be built on
> > platforms without it (e.g. compile test on MIPS with RALINK and
> > SOC_RT305X):
> > 
> >     /usr/bin/mips-linux-gnu-ld:
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function
> > `ingenic_drm_bind.isra.0':
> >     ingenic-drm-drv.c:(.text+0x1600): undefined reference to
> > `clk_get_parent'
> >     /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0):
> > undefined reference to `clk_get_parent'
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks for the ack.

David and Daniel,
I think there is no dedicated maintainer for Ingenic DRM, so can you
pick it up directly?

Best regards,
Krzysztof
