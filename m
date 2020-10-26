Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEB5C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 15:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44CF82224A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603725393;
	bh=tAcAz6PbSW/8UCabRYX74zXLXxJe0VJ0IQ20TF23f6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lHxzEM1i5Cmf8dp+W6OEz5NivOxanjYD6jWogjLPluF+IaAO8+MOjtMOi6sGSTnGv
	 A+Uytpg+zDrjf0ZBmasBjOax7i30QeG6MSHyfWLmFdpNyPIJXAI7MuHc1wlMf/Ogsc
	 zWl544HESnT0DlDwEpkBjDz5e/9UoXyMVHFKdAiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783552AbgJZPQc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:16:32 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:38686 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404034AbgJZPQc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 11:16:32 -0400
Received: by mail-ej1-f67.google.com with SMTP id ce10so14116299ejc.5;
        Mon, 26 Oct 2020 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ykn7mDr6IhgGPaHcJ3ODS02eBmjPYrOJE/dTqRU9Lm4=;
        b=Icywda8CCtcospo/+MQz1jQ83jTDgkg4oHEpreSqxj13EQbRTl9IRYuDwhuZ4ivgM9
         TkUjWYr0Ke0Ob6Wvl/YZlTsir8JCo7MqfTStRIOeCQgLLW8+PO0pO3s25AKfB/VTGtjt
         s1bxGAoUr+94tyOahx+KQ+DNZOWiE+JlrigyH+tynswAeXRMQHEn/Kj9RtKslrQoOwQ0
         cZ+NW7McivO3Mip85/BdtCZmKoWFTR3IpH/9LaNm4O/3QDxwpjg8oh3cajCu1ouxcjkN
         c1OmUVcDetcFIu+w2cTf6fP8BWGLzLgxpye6FhSVr2z9IdMzedui5Ok4apPj4f5Mek9a
         N4LQ==
X-Gm-Message-State: AOAM532BiyWEtB/kPhDeKbQSlXXwK4bG1QpxHZomwiBaDhxxn9YrOqGj
        2wUWADSiId2HQfsPH5wnE6k=
X-Google-Smtp-Source: ABdhPJyFdl9tOTZ46nbpEA1jYNhgGin081i0VgSbLf/9INiPjEinm6ayfLrzWjebiXYrKUHhWfyciw==
X-Received: by 2002:a17:906:430a:: with SMTP id j10mr15929122ejm.21.1603725389660;
        Mon, 26 Oct 2020 08:16:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id a19sm5354005edb.84.2020.10.26.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:16:27 -0700 (PDT)
Date:   Mon, 26 Oct 2020 16:16:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: exynos7: Mark aclk_fsys1_200 as critical
Message-ID: <20201026151624.GB87050@kozik-lap>
References: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 24, 2020 at 05:43:46PM +0200, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), mark that clock as critical
> so it won't be disabled.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
