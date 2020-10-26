Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AC4C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 16:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2E522409
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603728154;
	bh=fKEZOvNGoIAwDBGIyJjXjPZCYCRM5l9Bf20qzPVgSmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qbnyrj2q8e7zPt129uTI/A4wAR/YQwfeYYR5FEeLLZit5LGJxHrq3Jpt3GvNmDPXL
	 UK9MarASbEUcQ9p3+YAvpUwb6XlLcHjx/hyE3NKJO0he/OErxmKNp8ZvzxTHrjpkDO
	 FECr9/b4odg+clp6QBzxb8r4F8P+JWKgCC2dpEUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771819AbgJZQCc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:02:32 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:42598 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1784665AbgJZQAa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 12:00:30 -0400
Received: by mail-ej1-f68.google.com with SMTP id h24so14339982ejg.9;
        Mon, 26 Oct 2020 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+2ilN7ald/i8qFIcZftd6gynJe1RkBbgFa1OiazdUr4=;
        b=Wg5FqLgtCI51HsL827Hcld+cps/3dGS8gNO10OVJ49WBiXXX/skIgTnUAJKl/jQGcm
         PjzOvgo6Ifx+pD7pCi7X0QmWxlNtV3pAYbUH6F6eoSoPLcvNV4QzcTZT5yVEA2AgYeNe
         LSom/EQ2kk1Pdh19aXcxoJPlIGwFtAsEjlzmpibcJYZ7aED1E/gEp+D69tu3H9i6o4zE
         7jTMiZbs9iYrmFSLo/sBBTcMOMZQ3NyI/VMhMcjv+p/oETR0qykO2NnSTiSerOR7hsPD
         FadEZAObqHps6xkZHlb9KBRLTODafHxzZrdOHkjUE6jm0xhngWk/1pwF+vpnlvD+EUu2
         qsXg==
X-Gm-Message-State: AOAM532vIsclK026pzOt1bcxIpXn/Zwh7hIiNp7H7DtS+sqN95QILX9X
        Drxoiq1glpA1FkYte0fmqxQ=
X-Google-Smtp-Source: ABdhPJyvg6eEEIyV+jHpkCOg8YGyuyblnT8jUrG0+702LCySTgaupP8Ox2g50lJMwLg4I27bMT45RQ==
X-Received: by 2002:a17:906:892:: with SMTP id n18mr3457787eje.1.1603728028166;
        Mon, 26 Oct 2020 09:00:28 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id n10sm5419248edo.55.2020.10.26.09.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 09:00:26 -0700 (PDT)
Date:   Mon, 26 Oct 2020 17:00:23 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201026160023.GA120575@kozik-lap>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
 <20201024144421.34435-3-martin.juecker@gmail.com>
 <20201026144830.GA76312@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201026144830.GA76312@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 26, 2020 at 03:48:30PM +0100, Krzysztof Kozlowski wrote:
> On Sat, Oct 24, 2020 at 04:44:18PM +0200, Martin Jücker wrote:

(...)

> > +&i2c_7 {
> > +	samsung,i2c-sda-delay = <100>;
> > +	samsung,i2c-slave-addr = <0x10>;
> > +	samsung,i2c-max-bus-freq = <400000>;
> > +	pinctrl-0 = <&i2c7_bus>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	max77686: max77686_pmic@9 {
> > +		compatible = "maxim,max77686";
> > +		interrupt-parent = <&gpx0>;
> > +		interrupts = <7 IRQ_TYPE_NONE>;
> > +		pinctrl-0 = <&max77686_irq>;
> > +		pinctrl-names = "default";
> > +		reg = <0x09>;
> > +		#clock-cells = <1>;
> > +
> > +		voltage-regulators {
> 
> Just "regulators" and no empty line after this.

Skip this comment, it's obviously wrong, as the regulator driver and
bindings require the exact name "voltage-regulator".

Best regards,
Krzysztof
