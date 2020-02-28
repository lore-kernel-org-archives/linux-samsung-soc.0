Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47A6C3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 11:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AD7224677
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582889490;
	bh=YaQIckvk3yQad9OwpqmULudpDfXtLw2K1pm27Zaklmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=D2/uGMiU2oWHiXlTf5TzYThf6lMtv9xtOClzclnpRk6t9RkJYNkOkqy7EtXvkmfKT
	 u4Pfy60J7J9a4lJpHe+k1SYVsPSdTFDbz28ID51mMkDwpd6q2cxm/9W5mFaHBtdrCe
	 mjcpg+70UMDqN7LygDTDlbXNbT1jGcUJ9LMFcTQA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgB1Lba (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 06:31:30 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36830 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgB1Lb3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 06:31:29 -0500
Received: by mail-ed1-f65.google.com with SMTP id j17so2979313edp.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 03:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s06gTDtg/+91iVR7SFC4D41arfeCaTJ8f9QzMxQOUv8=;
        b=Qvp7wvMK8AmPTKbRNcIAVIX5K+fyWCvejgfP5hKIj6sL4p0UQ2jro4FBgtqUFR54JR
         jB2uXByPpFY4Y3/uDc0FVBr/QjXQUjsygv6Yp0JqWq5ePwyzXo6egqxr/bbkKuuxp/X6
         lcgt15Q/Z+JOqUsxC1UreWKoNG93XqWFJDysRHXauC6mnXGyEsBBLVUTUMFYw+GX6tA+
         NZeUi6NFSvmS9HwmhZDyxn1sAPdWfBWy3MrySzsOtQIsyQ5EPJ5dGTq3o+kVwQCfXnON
         NC97OdkDSyAF6+SWGIu+uR3XK+lHDuJsZlLTk/dOXtLhbjuKvxzyt4y/gNy7rukagMGJ
         2Onw==
X-Gm-Message-State: APjAAAUjy/q9p7Mtmn0XfVS/6wd0sZPB9LktC127V2rJQnwEIFsphMKp
        hJUsVbMlpyQ5AP1VNGs64k8=
X-Google-Smtp-Source: APXvYqzGBaIZxd3oIYOuotg30sQRx11BQSlHMicAEvdwujYgc/hpgMgWcI+FsNXjm2462AQIfMD8Cg==
X-Received: by 2002:aa7:d712:: with SMTP id t18mr3853034edq.0.1582889487948;
        Fri, 28 Feb 2020 03:31:27 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id t11sm518007edj.78.2020.02.28.03.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 03:31:26 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:31:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228113124.GB9458@pi3>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228101120.28819-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale.c        | 4 +++-
>  sound/soc/samsung/littlemill.c     | 2 +-
>  sound/soc/samsung/lowland.c        | 2 +-
>  sound/soc/samsung/odroid.c         | 4 +++-
>  sound/soc/samsung/smdk_wm8994.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
>  sound/soc/samsung/snow.c           | 4 +++-
>  sound/soc/samsung/speyside.c       | 2 +-
>  sound/soc/samsung/tm2_wm5110.c     | 3 ++-
>  sound/soc/samsung/tobermory.c      | 2 +-
>  10 files changed, 17 insertions(+), 10 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

