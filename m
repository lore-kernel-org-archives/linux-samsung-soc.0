Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E4AC35280
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F40A222D0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570031039;
	bh=QRH716dNO82ZShlc8OxmBsKfMncO9cOobHsqAD0GzFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2Bwj+GP8G6QGzBRTErylRbZXsFwHsL4AiF2cUnS9/7CxpnajCJLdNm7juc9uLdckg
	 sIkKgFyntnmAQqclbSTRXyUU4DrFzavDuTgMwcvMWIblLL4fgnxeFvdLJ/glqb2EQw
	 uM7+MNiIOrsjSUR8hjMi/cXGqwrbZLRi/bmXXjcg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfJBPn6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 11:43:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53304 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfJBPn6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:43:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id i16so7740800wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2019 08:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BgInN1Nm5Xz9lxIBW18bkLobu6WVKomQUn49FzyIe5s=;
        b=W1vdigtmAVHZW0AZUw4A6dP2hVbZusomOJOyHqhcDD2G9K/8GnzA8LIvlaDuJPZnvC
         aMRIv2dtpptWRfJBbe/I9jwTj263BDn2X/3bU8TkZRGQ21MoO2/Be2P7EirOX5UCFek7
         AcQWxVLBxhE4LrkubgGwKZzKb7e+8tR6fFa+2/ELVAy9EeHvbCm7HmqFqYLOgDJAyf3i
         AGDyf3psdejSMNhThGeVP1sSa3/YotxjWe87OZk9gVVyi2QRYHPnIAah5JVssfshyhPQ
         BXuSyhcu+hQbCzqO2WbkI2ibYn9yAgjXI+P/BVlhhzcf5XkyCcEOJLcGM9TcUbALUSqN
         DiPw==
X-Gm-Message-State: APjAAAUDIrMla0onpnd/iu0fxmYUyTpnYO+PhW39sM5X0ju1LEQnEj22
        684lhMVUeeYyUuBJ6UpGJZU=
X-Google-Smtp-Source: APXvYqxw0nGRH6noCVgxK0QDW2pmYmb+ZnY8s23aA0YUQ7g9MzImAf7r7D1S79iqPtTz5v7BkfUwaA==
X-Received: by 2002:a1c:2144:: with SMTP id h65mr3615911wmh.114.1570031036574;
        Wed, 02 Oct 2019 08:43:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id z5sm2033823wrs.54.2019.10.02.08.43.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 08:43:55 -0700 (PDT)
Date:   Wed, 2 Oct 2019 17:43:53 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: exynos: Add support ARM architected
 timers on Exynos5
Message-ID: <20191002154353.GA3469@kozik-lap>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p10bac7ebb742d968bca251f21dd3aad11@eucas1p1.samsung.com>
 <20190828121005.29368-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190828121005.29368-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191002154353.P4wEwvSVF2r5SXSgxt0SejYiOU6XnDkHnLbgDSNOrzc@z>

On Wed, Aug 28, 2019 at 02:10:04PM +0200, Marek Szyprowski wrote:
> All CortexA7/A15 based Exynos5 SoCs have ARM architected timers, so enable
> support for them directly in the base dtsi. None of the known firmware
> properly configures CNTFRQ arch timer register, so force clock frequency
> to 24MHz, which is the only configuration supported by the remaining
> clock drivers so far.
> 
> Stock firmware for Peach Pit and Pi Chromebooks also doesn't reset
> properly other arch timer registers, so add respective properties
> indicating that. Other Exynos5-based boards behaves correctly in this area,
> what finally allows to enable support for KVM-based virtualization.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
>  arch/arm/boot/dts/exynos54xx.dtsi          | 9 +++++++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++

Thanks, applied.

Best regards,
Krzysztof

