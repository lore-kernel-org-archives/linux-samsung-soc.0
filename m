Return-Path: <SRS0=czo+=36=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19437C35254
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Feb 2020 19:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9DC6206ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Feb 2020 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581362711;
	bh=F7xCoWvmLF8KQFc2Wg6MfGoTkt8wQKUP5hT6adHJMkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=j3ctGU/KvnhbuYlTnyYsg5YdI5fD2KM7xdiFvOdjNnDxv3+tbESe+WGDtbOBCYph8
	 YMqUhs071bVKMW78LDjui/VggzdMu6lTw6v9OYjcFgWFZ+HDVJMgRb6O3Y8/wx8jcc
	 Bb7Q3bbkC6+PQsLc+jkVAIQ+b6ws8EmVkWBm2PGM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgBJTZL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Feb 2020 14:25:11 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37148 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJTZL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 14:25:11 -0500
Received: by mail-ed1-f67.google.com with SMTP id cy15so1708155edb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2020 11:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L7YETxlgN8rxOEOClx/ftEE/V0motftRDEsM1b3YoIg=;
        b=FPlNie9VCnw8dMlysy/TX5joJrGiskW3TfwlhsScjTFSpKikDKbCq02IHSdMtJpE7W
         PZVMrHIZOXBRMV0NfyKWaVwWFXMm8n832psp3vDyWBKOQ22fmV5XslNnXFZMpDSPt5YZ
         qpxj9ex0F0NOJkMlDFSqzdDc1nLPyid43owYEW/afA5mWwDVEkQ119jF2Lhd7VuWVflE
         90TQZy5IVfCSRYl84TWDYE1MVM6oudO8UR6T4ulSFPs17Q5IpXhk1Zl4HH+fanx+Zi7v
         EonndKSePFWWjR0UxbiAytBGvZ9ToDSUIDvKlJEfQsL5ioOyfpogD2NFV0jzQZrSogul
         ZnDw==
X-Gm-Message-State: APjAAAVbR8y7i8TWVNGCQPcWa6ZEuYAvm6fimpcfDZMLs6QAHHXOSpxJ
        DkMUkq4MdnfQ7WVW7jCv9lA=
X-Google-Smtp-Source: APXvYqwbkv6CH2JyG+3VMZZ7Y2nDW6vN9kqVLcqCh9HGBg3SiuRAuCkdPuL3WCNyrPi8vIdb1uRRaw==
X-Received: by 2002:aa7:d803:: with SMTP id v3mr2476663edq.62.1581362709734;
        Mon, 10 Feb 2020 11:25:09 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id cm24sm84658edb.59.2020.02.10.11.25.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 11:25:09 -0800 (PST)
Date:   Mon, 10 Feb 2020 20:25:07 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] ARM: dts: exynos: Fix broken reboot on some Odroid
 U2/X2/U3 boards
Message-ID: <20200210192507.GA27658@kozik-lap>
References: <CGME20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb@eucas1p2.samsung.com>
 <20200131103709.15763-1-m.szyprowski@samsung.com>
 <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 31, 2020 at 12:20:03PM +0100, Krzysztof Kozlowski wrote:
> On Fri, 31 Jan 2020 at 11:37, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > The bootloader on Odroid U2/X2/U3 boards configures main ARM clock to
> > 1GHz. During the system shutdown procedure Linux kernel selects so called
> > 'suspend-opp' for the CPU cores, what means that ARM clock is set to
> > 800MHz and the CPU supply voltage is adjusted to that value. PMIC
> > configuration is preserved during the board reboot. Later when the
> > bootloader tries to enter the 1GHz mode, the voltage value configured by
> > the kernel might be not high enough for the CPU to operate stable. This
> > depends on the individual physical properties of each SoC (usually it is
> > related to the production series) and varies between the boards.
> > Typically most of the Odroid U3 boards work fine, while most of the U2
> > and X2 hangs during the reboot.
> >
> > This commit switches suspend-opp to 1GHz for the Odroid U2/X2/U3 boards,
> > what finally fixes this issue.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 9 +++++++++

Thanks, applied.

Best regards,
Krzysztof

