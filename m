Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB373EB64D7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jun 2023 10:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345536AbjFPKwo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jun 2023 06:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345318AbjFPKw1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 06:52:27 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F00749DA;
        Fri, 16 Jun 2023 03:44:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-518ff822360so693938a12.1;
        Fri, 16 Jun 2023 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686912256; x=1689504256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xSVktpHbB6u39pGveB2DCDLtiuQTPMQ40315tih9Wp0=;
        b=pA/9jYbhoBFrt8Y6CsEMxZ+Ey1HKLYXpp/lZ6QdCXPxLhOrFg1ZlsfnTRoNnWuhv6y
         qtcm3YsUeKnAv32llmNSbtmzqJDTjOiSs2yaNciMU/awpH3/phg5ZLRBDn2dKi5UWVNP
         oCmxqmzh6SFXY8bkqTXR+Bs4x39lQbB1e/lRkjBLtLDtryL9v5K8Bvnc1KVPIHQNOxi3
         o1utDjC3B6ZYAHaYgnT20ZTmd/JUt44Z3eVi14BHzzgSA/skp/s7/at1cZApUhcbbVBe
         gynSqAQew8Ci4/qxrjCYBoBlvhgVvn+mUt3yxCkG9u/nBknDQ0pwyNLXidTndL1Prv1r
         A8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686912256; x=1689504256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSVktpHbB6u39pGveB2DCDLtiuQTPMQ40315tih9Wp0=;
        b=FfsiLDzomF1mK8ZrLAkDvkYvOk//fa/qCfKaBbZl4lpvaGeWeeFOmRobiu325AzCRM
         pT1myshTgPJR9F1GGp83fxKnTeo6h3TqC6r9+x0Q1Imx0BTH2pGdb+pQRJ++bebyhi86
         5eL1GwfzOLOGH6XPjyK+kGHu8gOJf4N4nIWx1ttJq8wxJ076mToFkr/bfIMkRoYjgVDA
         plt7xhUonredjLb9CWigmF90kvuXkcYA0+coGmllgixnktifbqPFtmp2N3Cw7aRNwUSz
         Ke/GBUdEGmVWCln3Z5J6yYasK4nj2dAd6vxEeYdMw9UZkBHuTdkXbGfT9sJECoyoA7vF
         bZ1Q==
X-Gm-Message-State: AC+VfDwTVGSwYZoul0HgJdv1+eTROwFPt1NhxVAoN02wtR8MyNXIzzQ0
        olrorMmFxu7lIOPsvuTVxeU=
X-Google-Smtp-Source: ACHHUZ72qZT5HrfbksdWGP8O1yIdwqbhBciwabu3teTrwhC8QfH3HSQkZXHBJmA1ZpI3Ck/Vmx8Z1g==
X-Received: by 2002:a05:6402:1649:b0:51a:3f7c:af1a with SMTP id s9-20020a056402164900b0051a3f7caf1amr505930edx.40.1686912255849;
        Fri, 16 Jun 2023 03:44:15 -0700 (PDT)
Received: from [10.0.0.102] (snat-11.cgn.sat-an.net. [176.222.226.11])
        by smtp.gmail.com with ESMTPSA id d13-20020aa7d5cd000000b00510d110db58sm9764934eds.80.2023.06.16.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:44:15 -0700 (PDT)
Message-ID: <d04179d15137f4852acef3c677c57844806b0f49.camel@gmail.com>
Subject: Re: usb: dwc3: HC dies under high I/O load on Exynos5422
From:   Jakub =?iso-8859-2?Q?Van=ECk?= <linuxtardis@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thinh.Nguyen@synopsys.com, mauro.ribeiro@hardkernel.com
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Fri, 16 Jun 2023 12:44:11 +0200
In-Reply-To: <0c28b53e-a6c6-908a-0b3f-107b22231a4b@linaro.org>
References: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
         <0c28b53e-a6c6-908a-0b3f-107b22231a4b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

thank you for your quick reply!

On Fri, 2023-06-16 at 11:26 +0200, Krzysztof Kozlowski wrote:
> On 16/06/2023 05:11, Jakub Van=C4=9Bk wrote:
> > Hi all,
> >=20
> > I've discovered that on recent kernels the xHCI controller on
> > Odroid
> > HC2 dies when a USB-attached disk is put under a heavy I/O load.
> >=20
> > The hardware in question is using a DWC3 2.00a IP within the
> > Exynos5422
> > to provide two internal USB3 ports. One of them is connected to a
> > JMS578 USB-to-SATA bridge (Odroid firmware v173.01.00.02). The
> > bridge
> > is then connected to a Intel SSDSC2KG240G8 (firmware XCV10132).
> >=20
> > The crash can be triggered by running a read-heavy workload. This
> > triggers it for me within tens of seconds:
>=20
> multi_v7 has devfreq enabled. Does disabling ARM_EXYNOS_BUS_DEVFREQ
> change anything here?

Only slightly. The FIO test still makes the xHCI controller crash.
However, the timing seems to be slightly different -- I either get the
crash in ~10 seconds (most of the time) or only after a minute. Before
disabling ARM_EXYNOS_BUS_DEVFREQ it seemed to take about 20-40 seconds.
On the other hand, I have tried it only two or three times before, so
this data may not be conclusive.

Full kernel config: https://pastebin.com/iLSsYfBF
Full fio output: https://pastebin.com/9NehLhQr
Full-ish dmesg here: https://pastebin.com/1Zgd1gVg
All of the bus-* devfreq sysfs nodes disappeared in this configuration:
$ ls /sys/class/devfreq
10c20000.memory-controller  11800000.gpu

The memory controller driver prints some errors in this configuration.
Disabling it with CONFIG_EXYNOS5422_DMC=3Dn doesn't seem to affect the
crash. I also tried to set the cpufreq governor to performance instead
of ondemand and that too didn't help.


> Best regards,
> Krzysztof

Best regards,
Jakub
