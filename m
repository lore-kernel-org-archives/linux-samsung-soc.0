Return-Path: <SRS0=nK2D=3U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7D7C33CB2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 11:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E18DD20CC7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580469618;
	bh=xwjjN5J8CFIufn0lECaN5bOmcEB1oo1meYUqANG8Zd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mnJ+GKpW5bb+geN9muDWRHRIgCtoZxOQW+LpCaVDXnY6vv+5BuSZ5WgC+d8XdL2M+
	 YOgpE21w6y39EGy3zNT0Fs8a1r3VqYra3VrU+uBJvFCUhBxCc3+qP1Ant7/7GsttDz
	 L12EIXOFim03qmSS9olC+cRmrm9axiYXs0+jBXMM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgAaLUR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Jan 2020 06:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:52960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728268AbgAaLUR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Jan 2020 06:20:17 -0500
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B340D20CC7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jan 2020 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580469617;
        bh=xwjjN5J8CFIufn0lECaN5bOmcEB1oo1meYUqANG8Zd4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tXukDH04nS6aP21UOYaeaKTDFbNABWWxAlJrTXCKO8JiQDlrm4wGDftJ3lwhdtNsh
         tPg5k9X49If7OGw5ynavVy0QSXQkKAv6EKvacq/ataIYkiE5QjsD7XPRYwHh/SxlXp
         dw/lpkRZA7wvVTnWSUtOHmY9xMk7go6ryslVrR48=
Received: by mail-lj1-f180.google.com with SMTP id x14so6644797ljd.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jan 2020 03:20:16 -0800 (PST)
X-Gm-Message-State: APjAAAW7zX4msFyYeswCpVeTSLuUqDWMMR56Z3Ka1tTqnH1Mgqq4oAWN
        f1nb9C23qbrCYJ50zAxQoCY1UWQO5Pyb8KsFQEk=
X-Google-Smtp-Source: APXvYqz2mSwKzqmHFdqtstfi6QYB0sZYBq5UKCv/zeJtD8KDA2FzdPu3vAH+ILkRJuNtbuK8EnZJJxf/F2IJWls9MAA=
X-Received: by 2002:a2e:9705:: with SMTP id r5mr5653154lji.114.1580469614760;
 Fri, 31 Jan 2020 03:20:14 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb@eucas1p2.samsung.com>
 <20200131103709.15763-1-m.szyprowski@samsung.com>
In-Reply-To: <20200131103709.15763-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 31 Jan 2020 12:20:03 +0100
X-Gmail-Original-Message-ID: <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
Message-ID: <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Fix broken reboot on some Odroid
 U2/X2/U3 boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 31 Jan 2020 at 11:37, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> The bootloader on Odroid U2/X2/U3 boards configures main ARM clock to
> 1GHz. During the system shutdown procedure Linux kernel selects so called
> 'suspend-opp' for the CPU cores, what means that ARM clock is set to
> 800MHz and the CPU supply voltage is adjusted to that value. PMIC
> configuration is preserved during the board reboot. Later when the
> bootloader tries to enter the 1GHz mode, the voltage value configured by
> the kernel might be not high enough for the CPU to operate stable. This
> depends on the individual physical properties of each SoC (usually it is
> related to the production series) and varies between the boards.
> Typically most of the Odroid U3 boards work fine, while most of the U2
> and X2 hangs during the reboot.
>
> This commit switches suspend-opp to 1GHz for the Odroid U2/X2/U3 boards,
> what finally fixes this issue.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index ea55f377d17c..0126587c7fab 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -534,6 +534,15 @@
>         cap-mmc-highspeed;
>  };
>
> +&cpu0_opp_table {
> +       opp-1000000000 {
> +               opp-suspend;
> +       };
> +       opp-800000000 {
> +               /delete-property/opp-suspend;
> +       };
> +};

Looks good, thanks! I'll take it after merge window.
However if there is a resend, please put it after &cpu0 label.
Otherwise, I'll reshuffle it while applying.

Best regards,
Krzysztof
