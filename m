Return-Path: <SRS0=2tJj=Z4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE02C2BD09
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Dec 2019 15:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3C3E24659
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Dec 2019 15:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Z0IJ7MzW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfLFPLT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:11:19 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:40337 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfLFPLT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 10:11:19 -0500
Received: by mail-io1-f65.google.com with SMTP id x1so7640690iop.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2019 07:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57pEqnXSldRzLvrDcH7m0RpCR7mrJMfc7+akKP2aM9M=;
        b=Z0IJ7MzW98V1EoUsqK/jwK58e+zbR3MCWwZW3HD+dbaIaiJJX/izGAH+xB8dCSFzaK
         DK8A4S3Gi5cLUNWfTnc7eBnKClwTl1IHJQddcZyg0/t6SYgWDgk+49P9vzOGqxNjoS3o
         0lsVkTR/ka6zEEKvv+OjuRXAcUfvPsvWmEg7K8iruy9nvPzyy5vG7h0iWdYHfij5YuYL
         uFDT9/lxvjgH2O21rzWrI4mDySbi1ksNKXiJNIZLrrPlW/ZSkSVm9OYpdUvhh0Q+sGJ6
         W50T/Ei3vLDesSTQpEImY9zug1Gb0C75wKwEx2iqaiCrzNdPGmuU97Dx0FPmVWz6Cndz
         4YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57pEqnXSldRzLvrDcH7m0RpCR7mrJMfc7+akKP2aM9M=;
        b=L5MoMkoQQuQ8cGB5UAqa8QZUZ1j/ERqklCKGwlqDSZ30amvl9HYNqQT2PV1WCnUtWu
         wk9uCsI9Kkz0nYWvtk/iyNj6z1ajw3FGoHMMBpd56aVEJbI5dyXwQEeKfBJ8jkYbpQwv
         uNoaFzLw/00sdx/Dw1P6F8myR4iZJLyNmxn4xJQk8pVkQ+GG+xY47Fy18v338ke4HUHM
         NdALngbt8i7pO7yoFjuIwKvRFhmPMQv3kjJBOo9dg2o+S//MUpGWPThPEZ1B0mgXTbdi
         xQ7jn2/QMOqYEfCS46DKg5l/cqa3iUQQ2kjBQdE/Tq1vOttRWf1kMIk6nio6NoNVK2NE
         ELTw==
X-Gm-Message-State: APjAAAVU7T1zBxTYuQSAvId3EsznmPMouaHMB3t2Pw+Dqr1rREtqvnJJ
        2uBOz8Y7Z+R0vmdBJHENvVt4029/Kp0FosLu97TRJA==
X-Google-Smtp-Source: APXvYqxrR56/jeNW5wfbXn3LAIfTS06TpB9+W8tRXSKJpjGFbmEs1ldrSVdUukpDamcdSKqNGjzJrDDaeSJSmy/UPww=
X-Received: by 2002:a02:6944:: with SMTP id e65mr13576018jac.11.1575645078544;
 Fri, 06 Dec 2019 07:11:18 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191206125123eucas1p1c1652484cbccef8d8df37e09affe4e25@eucas1p1.samsung.com>
 <20191206125112.11006-1-m.szyprowski@samsung.com>
In-Reply-To: <20191206125112.11006-1-m.szyprowski@samsung.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 6 Dec 2019 07:11:07 -0800
Message-ID: <CAOesGMgLrr_WBif-8jugA6jQL+zgJ27ruhLKeOR1aAN4BC1Yhw@mail.gmail.com>
Subject: Re: [PATCH] arm: multi_v7_config: Restore debugfs support
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kusanagi Kouichi <slash@ac.auone-net.jp>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 6, 2019 at 4:51 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Commit fd7d58f0dbc3 ("ARM: multi_v7_defconfig: renormalize based on recent
> additions") removed explicit enable line for CONFIG_DEBUG_FS, because
> that feature has been selected by other enabled options: CONFIG_TRACING,
> which were enabled by CONFIG_PERF_EVENTS.
>
> In meantime, commit 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS
> dependency") removed the dependency between CONFIG_DEBUG_FS and
> CONFIG_TRACING, so CONFIG_DEBUG_FS is no longer enabled in default builds.
>
> Enable it again explicitly, as debugfs support is essential for various
> automated testing tools.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Please cc patches you want us to apply to soc@kernel.org (and, if you
want, arm@kernel.org).

Applying. Thanks!


-Olof
