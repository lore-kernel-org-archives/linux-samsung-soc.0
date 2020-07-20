Return-Path: <SRS0=3vSf=A7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89FBC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jul 2020 14:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 763232065E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jul 2020 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595255420;
	bh=uLZdOx+ugO3fAAgHDNsz+6h/1/RsOEwJYSUL0Q8KoUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OdVBsVEeQa7DH9KZUDwux4hK5/PizewDVnATramzCw44AEL03eIiLFvhcfb7l5Cpg
	 BTsnWS3gD2WpHj5fKD0cl41ygRwqvUF9d3anttpv8IMDcQcbyb/z5xramSH5o4Dpm4
	 qxKOjhxSEEWFuZib1GJ+e6vE0qZSZ8WFpnN5RDqE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgGTOaU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jul 2020 10:30:20 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44047 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGTOaT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 10:30:19 -0400
Received: by mail-ej1-f67.google.com with SMTP id ga4so18254095ejb.11;
        Mon, 20 Jul 2020 07:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vg62TiVK1fLPM3VJFvJufp+q6lBcbIw2n/ZWrxz9ifw=;
        b=UeCEfE+iQB1hVMp7mn1vIzX06qfBrpHyhuCK3Autas35SJY/5IA6LFU5yLJZOgWk1F
         ac36Kxh/PTDMWVvgnJ2zZ7hMsQIeDbbAWp0k1j7wWS+nLaFzFGk+piARAPN+DfhHi+ul
         0oGraV0jv5fl4yOMMeM1zyrM+T0gWR9fhZSpUg4Ko08Ny4yRNvfgZgMeRjpCDqBQg4p1
         J6cTbR7+aYqeb8MzWEx2A0C/mT7EbBT8chXvQ0/c9cIURPL3W3yuE9gL0S3mvjvv76+6
         95rJ1V2w8P4kLxfRhgwaG4kCN4RSvx2/7747DxGXNu70iZbGJkGWpNy09DxabvP9PC1I
         dh/A==
X-Gm-Message-State: AOAM530MYqKAYm4nioJNoWXaPpG13bJdx47i9XDt2eF13ssTeKjnRo7B
        lgGRUy9lrvSvxyALZiut7gA6Px4hVEM4jw==
X-Google-Smtp-Source: ABdhPJxGqJjPlBcTJ4tDcgq0yl0vCLwNrgvT0pmiXL2brT9v+CjPAHofyWuzcsnq711IlFM8YzA+rg==
X-Received: by 2002:a17:906:4145:: with SMTP id l5mr21191590ejk.334.1595255417451;
        Mon, 20 Jul 2020 07:30:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id kt1sm14639230ejb.78.2020.07.20.07.30.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:30:16 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:30:14 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: samsung: Add sound support for Midas boards
Message-ID: <20200720143014.GA22554@kozik-lap>
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb@eucas1p2.samsung.com>
 <20200710173500.22365-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710173500.22365-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jul 10, 2020 at 07:34:59PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> This patch adds support for voice and BT calls, along with standard
> audio output via the speaker, earpiece, headphone jack, HDMI, and
> any accessories compatible with Midas boards. This patch also supports
> headphone/headset detection and headsets with inline buttons.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [m.szyprowski: adaptation to v5.1+ kernels (DAI links initialization)]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> [s.nawrocki: removal of the clk API calls for CODEC MCLK, the jack data
>  structure moved to struct midas_priv, coding style and typo fixes,
>  conversion to new cpu/codec/dai-node binding]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/Kconfig        |   8 +
>  sound/soc/samsung/Makefile       |   2 +
>  sound/soc/samsung/midas_wm1811.c | 543 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 553 insertions(+)
>  create mode 100644 sound/soc/samsung/midas_wm1811.c

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

