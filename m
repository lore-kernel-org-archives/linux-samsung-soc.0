Return-Path: <SRS0=0Qh1=7N=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E04C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 May 2020 00:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 793A32074B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 May 2020 00:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590883715;
	bh=vPVMwMifj/bpMWbGPxUi+uNL+vBHSk9Nn5YsO2IKxxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xj5kEJxZXcxIHEnUT2m0zOhNokEBz9Sl1Uz9dG83Hd7FWLSegHgBV/kQkL9WR1zXF
	 66S51qrE9TqSOs1tj3fWyBAo4YmmKxsSNqMhxqHSnUm/eAIsmOmGyjYYg+oOj4sALE
	 hVbH+y0DejXwHMtqP/VzUENqxf1gGkYz+/gSVQOw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgEaAIf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 May 2020 20:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729522AbgEaAIe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 May 2020 20:08:34 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C882D207DF;
        Sun, 31 May 2020 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590883714;
        bh=vPVMwMifj/bpMWbGPxUi+uNL+vBHSk9Nn5YsO2IKxxU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ye8Fo2mczopyLo1ob1diXWW16znwynBE+2PS8SYTdutOvrF6fUiiyZsJixjjlMzXJ
         XuuRfBeBELwzCQi63Xm7fLhI+BQgJUfT7Dvo/yFWzBKi+Tvc7eao+I2X8IPANwF/QQ
         ItZVnMjy7oOjV3O+C2cQB8U06NNjgT5XUonvKu2A=
Received: by mail-lf1-f48.google.com with SMTP id u16so1847483lfl.8;
        Sat, 30 May 2020 17:08:33 -0700 (PDT)
X-Gm-Message-State: AOAM53116GvZsujLYuBO4vf+ighOfNMYloWxb99jYMccKDGcLlOmkzi4
        9G/DegsGJLXDKuzFEJooz+5nnoilawTf9Bcu6ZI=
X-Google-Smtp-Source: ABdhPJx30aOLCYD8rhRQWuNuFBNi6DG6GHiGFBCH1V8mZXSiFUlhvrP9bf+Ajogwaw5NyNDhtFnAPjOErTVI/7WeuYc=
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr7982786lfe.85.1590883712070;
 Sat, 30 May 2020 17:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f@eucas1p1.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com> <20200529163200.18031-6-s.nawrocki@samsung.com>
In-Reply-To: <20200529163200.18031-6-s.nawrocki@samsung.com>
From:   Chanwoo Choi <chanwoo@kernel.org>
Date:   Sun, 31 May 2020 09:07:55 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1Cin346tRz=+AH1x9QT=z0UGOvCC=NaAM9xLjGM2dHjg@mail.gmail.com>
Message-ID: <CAGTfZH1Cin346tRz=+AH1x9QT=z0UGOvCC=NaAM9xLjGM2dHjg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 5/6] ARM: dts: exynos: Add interconnects to
 Exynos4412 mixer
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Sat, May 30, 2020 at 1:33 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> From: Artur =C5=9Awigo=C5=84 <a.swigon@samsung.com>
>
> This patch adds an 'interconnects' property to Exynos4412 DTS in order to
> declare the interconnect path used by the mixer. Please note that the
> 'interconnect-names' property is not needed when there is only one path i=
n
> 'interconnects', in which case calling of_icc_get() with a NULL name simp=
ly
> returns the right path.
>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> Changes for v5:
>  - none.
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos=
4412.dtsi
> index a7496d3..eee86d2 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -776,6 +776,7 @@
>         clock-names =3D "mixer", "hdmi", "sclk_hdmi", "vp";
>         clocks =3D <&clock CLK_MIXER>, <&clock CLK_HDMI>,
>                  <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
> +       interconnects =3D <&bus_display &bus_dmc>;

I think it is really good and necessary in order to support the
minimum bandwidth.
Until now, I had to add the additional code to support for this same purpos=
e
into product code.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
