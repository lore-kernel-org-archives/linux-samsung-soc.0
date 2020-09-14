Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C24C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA124215A4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600116386;
	bh=ep6DL/JotcN1HAdlLvsniIKKVd/W4T0SXennHmZ+KIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mrzwRfkoNnRYiuNvqLxfj5hUDdMIPqxoQrta4s4b+wQIzuXV+xLGFfMstxCecFoQw
	 O2aWKy0GRovDGDfURllwHqovbJzCld7a0tAkwd6xJf7bUXdB50vlCPu6KqaCazpFbP
	 La+QXu1itOUuC8+4xl0uZNITOFzMkrKsUSMe1bbU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgINUq0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:46:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32818 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgINUqZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:46:25 -0400
Received: by mail-io1-f65.google.com with SMTP id r25so1685558ioj.0;
        Mon, 14 Sep 2020 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=klOkVDd1B3SyX8ctPYt/wmAghOkhqsHMZBP4sDYpJxE=;
        b=TOQcexeM07KXoko5KqQjNHWPMUOzmxsfN+Os2yHTMG75oZMWPPRHWj/1hoaoFSdMok
         aQhKv9KS8hBT1eTNg4jDtRIOEyU0b8qkkfySWRbgRMmSJoEC2spQIVkSgU7P7wMhH7Ux
         LyewMPX1d0IzcgTTnIk4Hr0YRpBG2WnF6FuE6djwwaYnjL37Mo/Mi5z2KW7KT1VQ2OYB
         Y04DjE3sJA/JQCjx4j0/Fi9PzTavcw+afbFKBc1SU4+F82qlR2GyjruVxEF8E2A5mhSe
         hsXOXUegT5RMFDGLa+CimhLOddD65jVww6R9YC35JqnYTO3ok44G7DAiUbX5qeoIEsUb
         O9oQ==
X-Gm-Message-State: AOAM5332z5x801/akjqhBiQqNnv+ajYwPH4BR+uo/nBuroaImRBKH2Jg
        5h3PV1a2gIFSvG2+M4akCqQh34VXWbJc
X-Google-Smtp-Source: ABdhPJxuj9gzARMP5MYHn3yUpfkvf/IjIbb2zP3NfyYXRzndAAyM/cVQavu3G7EXtFGnMDzQQp6RBg==
X-Received: by 2002:a5e:9419:: with SMTP id q25mr12789640ioj.205.1600116384765;
        Mon, 14 Sep 2020 13:46:24 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o4sm3630066ilg.56.2020.09.14.13.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:46:24 -0700 (PDT)
Received: (nullmailer pid 215606 invoked by uid 1000);
        Mon, 14 Sep 2020 20:46:21 -0000
Date:   Mon, 14 Sep 2020 14:46:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: pmu: Add missing
 properties
Message-ID: <20200914204621.GA215522@bogus>
References: <20200903191311.12293-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903191311.12293-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 03 Sep 2020 21:13:10 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (assigned-clock-parents,
> assigned-clocks) to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
