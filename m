Return-Path: <SRS0=luaX=4P=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA0EC4BA24
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 10:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D760624695
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582800956;
	bh=jzoZGQxXoSos3Kt0eTYT9i4yctKxqHJO8p55xNibTA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Jzy30M9ve4RtUHt3VACDU0+TYvxNpxom89xN+AGhDKKafgy8NFp75wWNWvKmd64/w
	 84kRxvKibRWl/pTBGSylftmJB05GMj/c/XLvZ4K2GtAKvmp0COKniqrS0xSkJO5ydp
	 BUbea0Cn3oAdyhitYHEjtU1FCBB9n6TdppTcd12w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgB0Kz4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Feb 2020 05:55:56 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33261 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbgB0Kz4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 05:55:56 -0500
Received: by mail-ed1-f65.google.com with SMTP id r21so2770305edq.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2020 02:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=clYKIoFW412WHGE+KDntBxZNkGUmCTS5wWtcgasn50c=;
        b=b4+5btqskqjOS4KHIjWjWFD8do1Symcnl6InPFiSg+usv+gRldcXc7NX7vJshbXAym
         52GScUgcGIuBXrRikmy/YWZN2lulyKCKdttU2gitJtJeMC6kv1Or/JedN/S5UZfwaUp+
         SBbPc2V1LRIqukLd5Hy1w41pz7jvgqwgxg7/hTi0ac9KEGuSI0lTvJ2OAZ/nfRjcyy7M
         UBoV/WfNpeu6USNC6Bp9LBI2SmNlOO155WIBEdXQZJJCrdDO52AQraeehX8YxAYobmbg
         FNbklwBkgcKiUft8NBIvzia1gClL8rAKBsZJnfIPOBiJ82nhcvL0SemJwyy9lZU1NER8
         YhTw==
X-Gm-Message-State: APjAAAWKXB1k3QfyQr6adnL25wUe4E8f5KwcKiKsu+MOUhrxiBgFGf6q
        LP00q4qX8iFCGEFu4h7RcrvGa4eEWRU=
X-Google-Smtp-Source: APXvYqzLtWxhvHMowgDMMXcDs3FXPNCfq4RqHzEllQZ/keMxaYbNECAgb2QszP2PRADn08yXhn8fcA==
X-Received: by 2002:a05:6402:b2e:: with SMTP id bo14mr3641008edb.13.1582800954241;
        Thu, 27 Feb 2020 02:55:54 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id r2sm53656ejs.26.2020.02.27.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 02:55:53 -0800 (PST)
Date:   Thu, 27 Feb 2020 11:55:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: make Samsung USB2 PHY built-in
Message-ID: <20200227105551.GA7995@pi3>
References: <CGME20200227093037eucas1p21e47bb8372b87ce1a3efd9ac943b6c7d@eucas1p2.samsung.com>
 <20200227093027.17349-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227093027.17349-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 27, 2020 at 10:30:27AM +0100, Marek Szyprowski wrote:
> Exynos OHCI and EHCI drivers are already selected as built-in, but they
> both require Samsung USB2 Generic PHY driver to operate properly. Mark
> that driver as built-in, otherwise having Exynos OHCI and EHCI drivers
> built-in makes no sense.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

How about going the other way - making EHCI a module (OHCI is =m
already)? multi_v7 requires initrd anyway for many boot configurations
so such change would not affect much.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 7c8a1c310bbb..04a68efb3ddb 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1055,7 +1055,7 @@ CONFIG_PHY_QCOM_APQ8064_SATA=m
>  CONFIG_PHY_RCAR_GEN2=m
>  CONFIG_PHY_ROCKCHIP_DP=m
>  CONFIG_PHY_ROCKCHIP_USB=y
> -CONFIG_PHY_SAMSUNG_USB2=m
> +CONFIG_PHY_SAMSUNG_USB2=y
>  CONFIG_PHY_EXYNOS5250_SATA=m
>  CONFIG_PHY_UNIPHIER_USB2=y
>  CONFIG_PHY_UNIPHIER_USB3=y
> -- 
> 2.17.1
> 
