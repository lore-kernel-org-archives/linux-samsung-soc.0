Return-Path: <SRS0=Dzkt=Z7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57536C04E30
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Dec 2019 17:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327B9208C3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Dec 2019 17:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="LYy/j19T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfLIRpZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Dec 2019 12:45:25 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36610 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfLIRpY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 12:45:24 -0500
Received: by mail-io1-f67.google.com with SMTP id a22so716105ios.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2019 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QAJ1Vw8HE02dYf6sQbXG/6aB2iF07v1KJiO657GCsLk=;
        b=LYy/j19TUmllvt8z6fjO3GajnwvBpq3AXDpYNZFzI8jqqaYbJbDRHN3Sot7WrEMqVX
         LHpBvv3shG0kc/FVNRmNMnkjH5tonPCEv/e2IG1ZNNKRuJJAuP2mickgt0GVbp1q6EEi
         Cby13DSkaYw49aO55eIWIG8ylPvaL055XKmBtCcPV/QHW4iv/y9yJl3cclnoy+Fkmgq5
         N5dyv4VS/ZhfKP8MZv32WfTUs2ncQd9VKUZ/d/+cMVZXPWDVgdSczTWZrUOn516+/gyv
         orDInd5Cd2b+tf15mnu+r8z8VegMBOBTa4KpnpCdxbmHrE1bSyCUVDxqAcZn3MPJ167D
         3CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QAJ1Vw8HE02dYf6sQbXG/6aB2iF07v1KJiO657GCsLk=;
        b=em6wiCYMQosWtjPDa1G+R3HrL3YWSv79XEQNK+igaHwUVOexwGz1bmuI3rHgLzMFbN
         DZ0vcHVaHh5g1gA790e1tdLbdi13MZ0JycXGauAsXsJJcM3QaNg7BAAzJ5cdc9I1QHe8
         y0TuibCnxS3lre7gLj5zeDMzNvsp6t9ZhKIRiXVu/g0NKuEZKIXKjewUrJ/WKeU2IUxr
         GHRuZLZ4sD+4Q1JeVL7XmzlXn9vsiti7jmUSYxGrA3R3a6UFlezfn5K5EUc0JgZbsnL4
         sGlJyj92rogUHR8ZApuRj7itY6Jpk1Krq5tfm7IJZMnTZKrC4kSRKFAeQuGcXLAXdgd+
         1idA==
X-Gm-Message-State: APjAAAVuX2jaACLE3/EQm3A6BQ0MuLY6doBtVu70lLZPkttmm+b0VC+n
        iCz7O2KDBwSjm/mncsOpJP+l/YfqOvHNhoa4aJnLAg==
X-Google-Smtp-Source: APXvYqwUgBnvd+rwHY/s5qaQtiTjjiqC+neHS7lfvu+7bB13pOzsyKqqMPGOKQ88fhkyE7jLD0/R23n44PXsnYnQEw0=
X-Received: by 2002:a6b:3a8a:: with SMTP id h132mr17290510ioa.207.1575913524002;
 Mon, 09 Dec 2019 09:45:24 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191206125123eucas1p1c1652484cbccef8d8df37e09affe4e25@eucas1p1.samsung.com>
 <20191206125112.11006-1-m.szyprowski@samsung.com> <CAMuHMdUsRa2QTDw4oM8SGUqfmsGt3-Mc=AnZoPV8RSqehUxyrg@mail.gmail.com>
In-Reply-To: <CAMuHMdUsRa2QTDw4oM8SGUqfmsGt3-Mc=AnZoPV8RSqehUxyrg@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 9 Dec 2019 09:45:12 -0800
Message-ID: <CAOesGMiC+_ouDdFecV-2DvVzmBkeE=JjrwNyTgcr81=cBhhoAw@mail.gmail.com>
Subject: Re: [PATCH] arm: multi_v7_config: Restore debugfs support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kusanagi Kouichi <slash@ac.auone-net.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

+Kevin, since this seems like something ideally we would see some
coverage of from Kernel CI at some point.


On Mon, Dec 9, 2019 at 1:29 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Marek,
>
> On Fri, Dec 6, 2019 at 1:51 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Commit fd7d58f0dbc3 ("ARM: multi_v7_defconfig: renormalize based on recent
> > additions") removed explicit enable line for CONFIG_DEBUG_FS, because
> > that feature has been selected by other enabled options: CONFIG_TRACING,
> > which were enabled by CONFIG_PERF_EVENTS.
> >
> > In meantime, commit 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS
> > dependency") removed the dependency between CONFIG_DEBUG_FS and
> > CONFIG_TRACING, so CONFIG_DEBUG_FS is no longer enabled in default builds.
> >
> > Enable it again explicitly, as debugfs support is essential for various
> > automated testing tools.
>
> ... and for systemd :-(
>
> E.g. with Debian 9 nfsroot:
>
>     [FAILED] Failed to mount /sys/kernel/debug.
>     See 'systemctl status sys-kernel-debug.mount' for details.
>     [DEPEND] Dependency failed for Local File Systems.
>     ...
>     You are in emergGive root password for maintenance
>     (or press Control-D to continue):
>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Thank you!
>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This is gonna bite lots of people (and defconfigs)...

Looks like the in-tree affected defconfigs are:

olof@quad:~/work/arm-soc/arch/arm/configs (for-next) $ fgrep -L
CONFIG_DEBUG_FS $(fgrep -l CONFIG_PERF_EVENTS *)
aspeed_g4_defconfig
aspeed_g5_defconfig
exynos_defconfig
imx_v6_v7_defconfig
milbeaut_m10v_defconfig
mvebu_v7_defconfig
mxs_defconfig
oxnas_v6_defconfig
shmobile_defconfig
tegra_defconfig
olof@quad:~/work/arm-soc/arch/arm/configs (for-next) $

I'll revisit with patches for those later today.


-Olof
