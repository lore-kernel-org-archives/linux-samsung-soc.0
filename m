Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEFDC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C279D20936
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604095;
	bh=Xn4SmNxRU6gd+VLWTlg18gCFH8dywHLyTP/skfFT6j4=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:List-ID:
	 From;
	b=W8BCua5cwrIOPwX3OYPPMJ+FNM0vwqg1oYGr4HataF7hYB+KIgkgLS/bKxLLmZaCm
	 Hk+346efRhwqx+HxHCFaIxav2N/ss5rA2fbcl33ZXWTk+jKiNnH9ILWraarfvD65Va
	 a5GyYNndf5c3SeYrWtZvtADbbEpLllAqKcS3vHsw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgKETVf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:21:35 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42614 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKETVf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:21:35 -0500
Received: by mail-ed1-f67.google.com with SMTP id a71so2753694edf.9;
        Thu, 05 Nov 2020 11:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SXOT4Ha05JRH9XIGE86k+ThfN6+97v9ePThWg9I1aWg=;
        b=GSOHeygprsTOAOfyZ6ld8eeqgWonHvASZNHDdVnQSt3fNJ41xO9buUFe9h10aCUQFP
         n/wuMkX/AggQ0NNrJIGrVGwgtRmI3krDrvYufUa+0BhkTJbFky9bCHUp/+uLx29ZRbHJ
         MKiHGUrqENCfjrQ0YSlEO9dBfgPhuPUtqmIvreh1pbKhogw41d+/zb9UYex8VCRZpApc
         qpLzU9vGgK2BEkvcAHDBRfLYIwSzBL5gxlZmiyYajz70WYYapGjBE37ACFIP4jIompDA
         Ud8ecsxqONrFSgNHRxsI0RJEHyUI4ysqkPtDR5AKXAYrpNuXVnX/+hlTl2jafyJ3cyGK
         Htdw==
X-Gm-Message-State: AOAM53146VnAi5Vh35LwZDEghbEw/cwYKMY8m9/ORtk8oNCCHtz+Qzkt
        3+vMaQH/fwl5OU95tBlGzTE=
X-Google-Smtp-Source: ABdhPJzamN+b3t8RVYm3dUfqbywH5YAPGAvThm/Cl7XjorxQUsVoEfyxFHug8uRGD7AcQ9aH0WTA4w==
X-Received: by 2002:a50:fe14:: with SMTP id f20mr4034542edt.61.1604604092783;
        Thu, 05 Nov 2020 11:21:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z2sm452183edr.47.2020.11.05.11.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:21:31 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:21:29 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: dts: exynos: Third round for v5.10
Message-ID: <20201105192129.GA236593@kozik-lap>
References: <20201004133818.2947-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201004133818.2947-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 04, 2020 at 03:38:18PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof

Dear Arnd and Olof,

I got a notification from Patchwork that this was merged but I cannot
find it in your for-next or fixes.

Shall I resend it?

Best regards,
Krzysztof


> 
> 
> The following changes since commit 6995a4c46331e39646e1bbe4418acf5cf00ef536:
> 
>   ARM: dts: s5pv210: replace deprecated "gpios" i2c-gpio property in Goni (2020-09-16 19:17:25 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.10-3
> 
> for you to fetch changes up to 944752bf9083b95fd02c8e240dbc62a24008bdc9:
> 
>   ARM: dts: exynos: Add a placeholder for a MAC address (2020-10-01 20:45:36 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.10, part three
> 
> 1. Revert a commit from earlier pull request adding input clock to CMU.
>    It causes probe reordering of clkout and CMU clocks drivers.  The
>    clkout driver does not handle probe deferral thus this reorder causes
>    its probe failure.  The proper solution is actually to convert clkout
>    driver to a regular module driver supporting probe deferral, but
>    before this happens revert is simpler approach to fix Odroid U3 boot.
> 2. Add a placeholder for USB Ethernet adapter's MAC address on Odroid
>    XU3 board.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: dts: exynos: revert "add input clock to CMU in Exynos4412 Odroid"
> 
> Łukasz Stelmach (1):
>       ARM: dts: exynos: Add a placeholder for a MAC address
> 
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  1 -
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
