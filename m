Return-Path: <SRS0=iB35=AY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F86CC433E8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D926D2075D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594652355;
	bh=nzASuH9Aa6QzRRlwVHAvFBo4qZ+A3sWOlJRsPr6CAsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kgqmyjpHfaCv9AqNgDg0zn0J24hO0khKVWqVZeySMmqIjTiB9HPuGywW9eQlRsJlO
	 q5fiL29JQl8E7mkpcieJ9D1LUgAIXWPMaatn7+Vze8UQrFzyKbSNwkQriD1XKl1cj2
	 T9vOx3T2uLPJvUx5ufG3W2bsNYsqKXd3MCVBO21I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgGMO7P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 10:59:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38951 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbgGMO7P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 10:59:15 -0400
Received: by mail-io1-f66.google.com with SMTP id f23so13790305iof.6;
        Mon, 13 Jul 2020 07:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5WwrQCBfCGD1oAlfh4Q+LcNaL9+7pA+S/ObwRTYKA7s=;
        b=LKLwd+S4MPDacMi32SyNCh3ZWLF8Wi3Nm7XoF/zpJbaHECabq46sghtrBNoOhJ1zBN
         jH8/EEcuj13F1D+L3feeSgrT/t48kQt9xTdkdEQ5O3j3r0Wwe6vkfZfzs73bCJw9A7/g
         Dz7P1BalARhLYMr1KhokwD75VX7EKCLbg8KnMcEUafNFTicQTHA2aP4VnIWJ34Pwr5jO
         jLjYj1Q6wXqMdfG3xl3wM0ZskQ14Tq3cOPAqHF8smCsSfCQm20FWNcEhc1QvZWDXi7Ri
         r/FtJX08w8SySDJUGFCsYkjZZwYi14923eJA7LXDQi4DMUcrfKsvcCp3xu3tPulu1T/s
         NJcw==
X-Gm-Message-State: AOAM530NEkcYhN/YZYFdzF0qyXkqpOa2YvZNOteZfYav5Hk1vKIcParC
        bypAaLWoUO0s/rPRGmY3eWOnOKxiEQ==
X-Google-Smtp-Source: ABdhPJzHZq+wMFL1ggb2CsSFLDEJagYQZrr2Q2lLGCkDm5iY+m/zhSLIJpn5qI8RV2IDmpYmYErCOA==
X-Received: by 2002:a05:6638:12d2:: with SMTP id v18mr502732jas.4.1594652354184;
        Mon, 13 Jul 2020 07:59:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y12sm5507378iot.49.2020.07.13.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:59:13 -0700 (PDT)
Received: (nullmailer pid 173994 invoked by uid 1000);
        Mon, 13 Jul 2020 14:59:12 -0000
Date:   Mon, 13 Jul 2020 08:59:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        simon@lineageos.org, linux-samsung-soc@vger.kernel.org,
        b.zolnierkie@samsung.com, alsa-devel@alsa-project.org,
        m.szyprowski@samsung.com, broonie@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 1/3] ASoC: samsung: Document DT bindings for Midas sound
 subsystem
Message-ID: <20200713145912.GA173446@bogus>
References: <CGME20200710173512eucas1p101c03994a728150f18428295192edf25@eucas1p1.samsung.com>
 <20200710173500.22365-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710173500.22365-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 10 Jul 2020 19:34:58 +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/samsung,midas-audio.example.dt.yaml: sound: 'mic-bias-gpios', 'submic-bias-gpios' do not match any of the regexes: 'pinctrl-[0-9]+'


See https://patchwork.ozlabs.org/patch/1327065

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

