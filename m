Return-Path: <SRS0=uax/=3S=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B92C2D0DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jan 2020 18:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69FFC20716
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jan 2020 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580322563;
	bh=wCqb2TVb1tPQ6Px9UNwI8Jlhg1oz5U7a9tFtQPBjlRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v+DzZpibjs5i1jPQW2RbeiIrhgK/ByvHvZO8bVKaJhfsyFYIrTBnwQTJ4DA9u/thS
	 s0befwKbYOfxbbg+IbFklYdHrlqpR4hIYXfgeNWQgPpvBRPgUj5UppSfzf9DYCvpNn
	 oroVfLvbjOUJVwTzUCYBun+hdolSGXqCIHLplA/k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgA2S3X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jan 2020 13:29:23 -0500
Received: from mail-ed1-f52.google.com ([209.85.208.52]:41690 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgA2S3W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 13:29:22 -0500
Received: by mail-ed1-f52.google.com with SMTP id c26so788322eds.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jan 2020 10:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4qkJva2WsjlzXbLrXwOCyzngWVPfhRPEm+QIF0TxRCs=;
        b=qWK3qM/RshZ2j4oe7PiXwpNKR7qP52y/UaaIacpB3T8qzFiwvtIRGXtzJWne94i+85
         pbeVx50gVolZ1kJv/fBZO9YfU8C/VlfvMam0GvdWF85b7oDXRubMm9u/eg0OSv13wB4W
         VvGPX4Y9nqtRQh8hfv/vVJdO7KgUoAepCWr2jHaNArLiHhOIQ7AmLs7oqnnUqjM2jMxO
         iCucDpooiXZ/seaB3AWTabjHedWeIlJ0RUp8257frkp6d7t6XjropZj2jj30ezAg8xw6
         m094hvEOpUdc90AsMlS3IR2N7lln4KYoRd9Elws+x/unWKdnHyDonnL7dgCf6ohClLMH
         TX+w==
X-Gm-Message-State: APjAAAVFA933CU/JQ17g5rWzDoX2/ddOIgtIWgnQarhW6ql3cOLtGBhj
        HPcjt7eGeRN6sZ3Zc8Lp2Fc=
X-Google-Smtp-Source: APXvYqz1/cdG+k42XUqB4QSIVvZhpddvdczacL56EyIVANpjoiUGIhsZmLCd2Gpp1rr/aNnryIFmnw==
X-Received: by 2002:a17:906:3cea:: with SMTP id d10mr719187ejh.32.1580322561227;
        Wed, 29 Jan 2020 10:29:21 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id x2sm311343edi.95.2020.01.29.10.29.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 10:29:20 -0800 (PST)
Date:   Wed, 29 Jan 2020 19:29:18 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
        kernel-build-reports@lists.linaro.org,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: next/master boot: 148 boots: 10 failed, 136 passed with 2
 untried/unknown (next-20200129)
Message-ID: <20200129182918.GA13626@kozik-lap>
References: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
 <20200129161113.GE3928@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200129161113.GE3928@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 29, 2020 at 04:11:13PM +0000, Mark Brown wrote:
> On Wed, Jan 29, 2020 at 07:54:18AM -0800, kernelci.org bot wrote:
> 
> Today's -next fails to boot on Odroid X2 and XU3 with exynos_defconfig
> or multi_v7_defconfig with SMP=n.  It appears to get stuck in a loop
> probing the I2S secondary DAI for some reason:
> 
> 12:07:05.997409  <6>[    6.421596] exynos-bus: new bus device registered: soc:bus_mscl ( 84000 KHz ~ 666000 KHz)
> 12:07:05.997653  <4>[    6.429763] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 12:07:06.006838  <4>[    6.439652] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 12:07:06.015764  <4>[    6.448666] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 
> and so on ad infinitum.  Vanilla multi_v7_defconfig is fine and just
> displays a saingle copy of that log message.  Full logs and other
> details here:
> 
> 	https://kernelci.org/boot/id/5e3176467f121dbdef2824fc/
> 	https://kernelci.org/boot/id/5e317b7322dcdaa3e5282500/
> 	https://kernelci.org/boot/id/5e317c0f6bfd765fb42824f1/
> 	https://kernelci.org/boot/id/5e317517be8559c7542824f1/
> 
> I don't *think* it's an audio issue as mainline seems fine and all the
> ASoC changes have already landed in mainline for this merge window.

Thanks for the report.

Marek spotted it as well and sent a patch

Best regards,
Krzysztof

