Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9361C352AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 19:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3E0A21855
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569957299;
	bh=KRWwDUjuYrWYfhlFoR0q+6E5iThKDsYloXtwzgfW1tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zapr+MMwL5+BRcC4Xd8AR4FJtEuXC8DIcL2CmggVI28llTSJfOLyNoY9JCAqzEc2s
	 H9/wbOQ/82m27ihGYr+mruQEk+cOTskpkOnNn2IFdITvZ8WFWKSnNDqq9L0EI38EHq
	 HgxLCAmntR1NBKpOwBdWPTtraowW256bibYuvL6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfJATOz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 15:14:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39904 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfJATOz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 15:14:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so16872005wrj.6;
        Tue, 01 Oct 2019 12:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=41zioRpPj4uUtrKEWiJWOoLz4WrwGwcXM74LPOiS+FM=;
        b=cEPFHs3+/G+7zv6wa3fnkLE8N+lHZHFTAFceGe7rt4IJNtcvuyoL6ca7y6vRcbocEQ
         uTOUcCYkEBw21hlpWAi4Z8UMO0RWedS4Zi/neukb2Mp7AEI61lNPnt1jH1n4wlpOh3Wt
         HmQr38rb/7Ojjg35l2//vPOxZ/6ZeEQycryXMnRrL0INqwMT3RiR5WEu6ZgqjBVh3hwy
         GRfw2BtnKcWL0P/2MvM4uDo5nnWqMlLn4R9dKUI7UE15V9MNEVZRVIPvU5DMwUh73g9G
         GC0nc52Gt/pB4pnIiRNkAnRLUnOk9bCdOZWHzPhPDDHffrZ2SZ0azJr9cAdzP8NLrU75
         sFbA==
X-Gm-Message-State: APjAAAUIdX+VKBDgvdV6ArK9Z13mD5TqPHvibrP3vvLsoGApXCa9RJMc
        edKmmBDQihxiZcmO+quftiA=
X-Google-Smtp-Source: APXvYqxdcfRJ2B+krwLZO7yCFgoNqCDeu+etnp/KPZS30tFnQjB4BrYuw4dTVXICPqknxg9vvF6eJQ==
X-Received: by 2002:a5d:4944:: with SMTP id r4mr3300877wrs.283.1569957293051;
        Tue, 01 Oct 2019 12:14:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id t6sm6585093wmf.8.2019.10.01.12.14.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 12:14:52 -0700 (PDT)
Date:   Tue, 1 Oct 2019 21:14:50 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maciej Falkowski <m.falkowski@samsung.com>,
        mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com
Subject: Re: [PATCH] arm64: dts: exynos: Exynos5433: swap clock order of
 sysmmu
Message-ID: <20191001191450.GA30860@kozik-lap>
References: <20190919131944.11007-1-m.szyprowski@samsung.com>
 <CGME20190919135115eucas1p2e1c9c090c5a75211e5a137c598721287@eucas1p2.samsung.com>
 <20190919135053.11849-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190919135053.11849-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001191450.dzuSe8cx7naZWZLFYSUgbomu6wMaMLZARLrywUReKmw@z>

On Thu, Sep 19, 2019 at 03:50:53PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> dt-schema supports only order of names "aclk", "pclk".
> Swap some sysmmu definitions to make them compatible with schema.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 54 +++++++++++-----------

Thanks, applied.

Best regards,
Krzysztof

