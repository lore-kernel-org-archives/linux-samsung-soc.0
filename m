Return-Path: <SRS0=sIcv=X3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0243AECE58B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 09:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C21E921A4A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Oct 2019 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570007259;
	bh=HrhzSLp9ttreuBStr3Ki9oHQCWUVlmw2FTDtT3omnHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PPWNAilDmvuqBfbTw2Q/Yny4Pl/OcJoJJHefh/qbNbGy7lTB3FlgCZcc30LtbxVSY
	 zGbS4zdFvrna6sqQH42Stgeunr8pcVt4eG6k8gSP1NRrwaoJ6YHTTRTlYVofq5A5g1
	 r3qXwI3gPKecxfi+bfapDQfeQbCeQW4xRZPgZc00=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfJBJHj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 05:07:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37518 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfJBJHj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 05:07:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so18716542wro.4;
        Wed, 02 Oct 2019 02:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wmpz5RuQl4+LkrdtaeVCi0SsOnoazimWPFchI6DG7mU=;
        b=JZmEiBJK2NWf9rGliDRwaa4aUx6g42eceTCBlUDmvH34ikh0524jqr5jaPJtGaCZnk
         uo4zSJOSqmvCE0O6W2SvgsSZLMx11JsYieVVZFJq/m3YWZIBlAKO8HCi5Ucd5iIrijOf
         o+YW7DlWHxmnpOQK8QaNTmLkvnCK7a7pIJWRpKBpRiUPuUnFH6yVzMHj5F8Z0rn5Meb+
         6LEf35cKgfsuLcDIOrRXOLLsqDo7UKQw5Y/2TLG3yOZGiWHW12nSkolqXFH3Ok3bk3xC
         r5UFifaOOHWdpsLGlmKx1AeW3bc+WRP2dmcPzP/rb73RdY6e1xRC/shnEsx7fqDrurnp
         agBA==
X-Gm-Message-State: APjAAAXXHPBuoIIZxfn41ErCdxE3XRcOzxhk4pdIgC+MVpOfviwsgqu6
        kQsXMsKuMN0B6VdM9m+0MSg=
X-Google-Smtp-Source: APXvYqz7bLFVQ1qA2cArCniNLhwbQ7R9EIAx3/zD+qRuSS8toxAEEk99hekD0gQOG5RvcOx0esBCrA==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr1839530wre.176.1570007256626;
        Wed, 02 Oct 2019 02:07:36 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id o188sm12431377wma.14.2019.10.02.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:07:35 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:07:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
Message-ID: <20191002090733.GA9610@pi3>
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
 <20191002085309.9473-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 02, 2019 at 10:53:09AM +0200, Marek Szyprowski wrote:
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

