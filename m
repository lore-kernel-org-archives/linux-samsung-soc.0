Return-Path: <SRS0=9Nct=CI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA50C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E0AA20EDD
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598799138;
	bh=UyMcgqQCjD+AmnQN2g91ApVfSC5axAQz+xQrmTck7vw=;
	h=Date:From:To:Subject:List-ID:From;
	b=zlgYm/j38SrL3oaBJwrU09mu1cG5/3VToTyHEjEDx0z1hrJd4ciIrjS7Vd+FRaCCK
	 ga2BLngWXEsF/gyalQtdwLsgqeOMYGMq6lWWeOD05tZD2mv6rc/xNadYJMLMJdw7GN
	 ynpVl8qlTUbiPJx43PmJeyPd55PO5AJPOS4gZb4s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgH3OwR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 30 Aug 2020 10:52:17 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45807 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgH3OwQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 10:52:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id l17so1792114edq.12;
        Sun, 30 Aug 2020 07:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=JInRKa5P/pXOvzGMuyZb8WwOS1qKpjTCXU9RADDlcoQ=;
        b=gN/ETr/b1EzH139iEP0mJ2xvvMExMkHf40Ld8WvJul6jdQPFKxhIWza34a8sFXA0/2
         ZaAIKzAnT5iuoKNuCAqPCorM5BhWEROiBdu83/O2BripVf6UE3bm3wonHiitxw0ibiiB
         ISilWhosxepV4punrBVLM9uOkWK+KdePTHS5yvXsf189/TCtCC2g1X4toO98VEkWZozj
         XWEydQn33UFlQj61p4+NNGJUd/Yc+1i5joj7Mx9jfVHA9Kyp1kIzBVZ8XqJaxRVI9gEg
         oK0ClRtzUA8lbl+pTebYjj8da6PfrGLqIRvDs4WC7/XkM2O/B95LEwmgZKGMZsBBA0zy
         3TUw==
X-Gm-Message-State: AOAM533yflyNEGvp9dhO+s2yarSHvfLIjlapRyAro+6xz+dav9ESE9D2
        KfWxSkG3XJW26PKztJ+AQ14=
X-Google-Smtp-Source: ABdhPJyk1tNpQR3IAXH58BjB0/xsboXGviduJJzQXUkMXdep+WLwQmONDT7CuD1yMT9iExAOvT0o1g==
X-Received: by 2002:a05:6402:1bc2:: with SMTP id ch2mr7505694edb.235.1598799134825;
        Sun, 30 Aug 2020 07:52:14 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id c90sm5139905edf.43.2020.08.30.07.52.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 07:52:14 -0700 (PDT)
Date:   Sun, 30 Aug 2020 16:52:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Proper ranges for memory controller (exynos5410-smdk5410)
Message-ID: <20200830145212.GA29592@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rob,

Maybe you could help me here as I am trying to understand where is the
error (cross compiling on ARM):

    $ make exynos_defconfig
    $ make dtbs_check

    arch/arm/boot/dts/exynos5410-smdk5410.dt.yaml: soc: memory-controller@12250000:ranges: [[0, 0, 67108864, 131072, 1, 0, 83886080, 131072, 2, 0, 100663296, 131072, 3, 0, 117440512, 131072]] is not valid under any of the given schemas (Possible causes of the failure):
    arch/arm/boot/dts/exynos5410-smdk5410.dt.yaml: soc: memory-controller@12250000:ranges: [[0, 0, 67108864, 131072, 1, 0, 83886080, 131072, 2, 0, 100663296, 131072, 3, 0, 117440512, 131072]] is not of type 'boolean'
    arch/arm/boot/dts/exynos5410-smdk5410.dt.yaml: soc: memory-controller@12250000:ranges:0: [0, 0, 67108864, 131072, 1, 0, 83886080, 131072, 2, 0, 100663296, 131072, 3, 0, 117440512, 131072] is too long
    From schema: local/lib/python3.6/site-packages/dtschema/schemas/simple-bus.yaml

This is a Exynos SROM memory controller with four banks like this:

arch/arm/boot/dts/exynos5410.dtsi
    376 &sromc {
    377         #address-cells = <2>;
    378         #size-cells = <1>;
    379         ranges = <0 0 0x04000000 0x20000
    380                   1 0 0x05000000 0x20000
    381                   2 0 0x06000000 0x20000
    382                   3 0 0x07000000 0x20000>;
    383 };

Converting it to:
    376 &sromc {
    377         #address-cells = <2>;
    378         #size-cells = <1>;
    379         ranges = <0 0 0x04000000 0x20000>,
    380                  <1 0 0x05000000 0x20000>,
    381                  <2 0 0x06000000 0x20000>,
    382                  <3 0 0x07000000 0x20000>;
    383 };
silences the error although I cannot check whether this even works
(I don't have this HW).  Is it because of simple-bus schema which
expects an array of arrays of 3 to 7 size?

Best regards,
Krzysztof
