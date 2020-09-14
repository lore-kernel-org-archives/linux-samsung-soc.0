Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MALFORMED_FREEMAIL,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29154C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 06:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFB32208DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 06:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ3kcprX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgINGdG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 02:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgINGdE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 02:33:04 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A57C06174A;
        Sun, 13 Sep 2020 23:33:04 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id e23so21527372eja.3;
        Sun, 13 Sep 2020 23:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=+zWKNmxOOGJkUHebwsTYQ6mc4spYZ4aje4SzHCAk110=;
        b=XZ3kcprXlCIeiXQsSMjiNkLiTp/URhZzh806g+QB5c2yj127CT3KA4juOvAPsOw39x
         fRK1jJMVS0neuIhmvHUPr/7e9++n/jWNMWU3borskvWPMcv2uKJ0S67OPS1YaASKT2Gq
         aQGB4BO263uw92OclfMGe0VpmkmyGeg6PnK9fHXV9MC8zdMovf3acBwkSr+ewmZb2lZ4
         gmFQJE2CtzDJr+cEXo/55vBM8PxziyIz1NgsJzAtMkzvRWNb/Ym1LqCCvr9CkSPEvtMq
         ka2Nf6ZBQPDfWlEBaDkrUrvOr+aB+38ziuJR/IfGoGJTBQr0J425KySK/9bBf6Ty7TpU
         hwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=+zWKNmxOOGJkUHebwsTYQ6mc4spYZ4aje4SzHCAk110=;
        b=JzW6SPeZaciZt1k6SGlRkvlcpIWTzulqPMiUnEHCR5U9yX26fV91CofoFPZKt6mET/
         O/4Qu5CynEZmUQH5dgCmgqvQSF0Pw7lo3m86srnDBuErPxE56avPZM+p4lLwiLg3MZcI
         kNEJAYLOYkCWuxpZMEc7+RqUYKhHaPGrqjJIV3wlvevUk4WZso1RZV+ZUDrhLB4KkPVX
         H5iN7gmi+IS/0skBOhisXsjTDcqtHsTXjlkpoNqUKWzUWLdvnuDxKef5UATTwVwLjA0n
         n9j7hlO7UOomha+k6mx6Fuuj2lDRrlqiNGipNaCFTZmyXkVD3lIfgZDyWaCGEEnKeqiF
         nm2Q==
X-Gm-Message-State: AOAM531evZL916U5TsFouxH8nvzWYCUkufipx4rdyBtdvuBtfCKHtL8K
        k0GVuV2FCWbQdpfFrWuLohw=
X-Google-Smtp-Source: ABdhPJzf2Au88TObtH5Ip+6/fozXZbgrbKrqtODjaYoPfyP31mlfnKCZT3U8rBS2fUNxs79TyN2uQw==
X-Received: by 2002:a17:906:56c2:: with SMTP id an2mr13415924ejc.118.1600065182668;
        Sun, 13 Sep 2020 23:33:02 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
        by smtp.gmail.com with ESMTPSA id a26sm6962614ejk.66.2020.09.13.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:33:02 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 14 Sep 2020 08:32:56 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc:     Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
In-Reply-To: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2009140819130.17999@felia>
References: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On Mon, 14 Sep 2020, Lukas Bulwahn wrote:

> In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
> MAINTAINERS, seven entries mention the list being moderated for
> non-subscribers and eight entries do not. Clearly only one can be right,
> though.
> 
> Joe Perches suggested that all vger.kernel.org are not moderated for
> non-subscribers.
> 
> Remove all the remarks from the entries following Joe's suggestion.
> 
> Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Krzysztof, please pick this minor non-urgent cleanup patch.
> 
> This patch submission will also show me if linux-samsung-soc is moderated
> or not. I have not subscribed to linux-samsung-soc and if it shows up
> quickly in the archive, the list is probably not moderated, and hence,
> validating the patch.
> 

The patch showed up within seconds in the archive:

https://lore.kernel.org/linux-samsung-soc/20200914061353.17535-1-lukas.bulwahn@gmail.com/


So, linux-samsung-soc seems not be moderated. So, this validates this 
patch.

Lukas
 
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d0862b19ce5..de8741d24cb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2399,7 +2399,7 @@ ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
>  M:	Kukjin Kim <kgene@kernel.org>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
>  F:	Documentation/arm/samsung/
> @@ -2441,7 +2441,7 @@ F:	drivers/media/platform/s5p-g2d/
>  
>  ARM/SAMSUNG S5P SERIES HDMI CEC SUBSYSTEM SUPPORT
>  M:	Marek Szyprowski <m.szyprowski@samsung.com>
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/s5p-cec.txt
> @@ -13321,7 +13321,7 @@ PCI DRIVER FOR SAMSUNG EXYNOS
>  M:	Jingoo Han <jingoohan1@gmail.com>
>  L:	linux-pci@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/pci/controller/dwc/pci-exynos.c
>  
> @@ -13729,7 +13729,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
> @@ -15275,7 +15275,7 @@ F:	include/linux/mfd/samsung/
>  SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
>  M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
>  L:	linux-media@vger.kernel.org
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/platform/s3c-camif/
>  F:	include/media/drv-intf/s3c_camif.h
> @@ -15324,7 +15324,7 @@ SAMSUNG SOC CLOCK DRIVERS
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:	Documentation/devicetree/bindings/clock/exynos*.txt
> @@ -15338,7 +15338,7 @@ M:	Kukjin Kim <kgene@kernel.org>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Andi Shyti <andi@etezian.org>
>  L:	linux-spi@vger.kernel.org
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/spi-samsung.txt
>  F:	drivers/spi/spi-s3c*
> -- 
> 2.17.1
> 
> 
