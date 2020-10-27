Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000EAC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F7D422282
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603795208;
	bh=TvI8tSQLJ8bdJP10zyfkNnn9JEW9WbEsEuYFmMRTw/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MuphGbxLZ0x1UzFrYxQnANziamfv4LBbj/IXz/3NLi6lybKn4lLVmTtFkhrgkuNNt
	 jL//yA4tChP4KioVjOx8glUS3UvUvMLyHklis1maPTHb92azRoXMp9klllBLdt2B1v
	 vM6UgQ8TyPRBnUgRivAiyYkffklJmASLhc7B41sA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898631AbgJ0KkG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:40:06 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:41137 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898628AbgJ0KkE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 06:40:04 -0400
Received: by mail-ej1-f66.google.com with SMTP id s15so1479995ejf.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e+ufz4Fatn6bPAnMtbzgbav13MQmCWw1wj4WjV4yoLw=;
        b=qwVooEOC5AWGqkWOBvAD5ZEzl4e1h3vGUHFDi8H4hsW2clW9duqQSrhjQvF0GoAlS6
         T+UZ0/j2VK6C6yEEqMwceoi5yC7sZEebphUWkLJwbV23ZVjXuJjRo8UV/AHo8zL5rp33
         NPBaYcrpIPPoF9PjCi2DV5zRIK6/9Ij2MRL5z9mfQFIS+j7V8VvRInpWOQJfb0m3p5GQ
         zCwUHzAbenEeIC/WyM4ggp0NdRKCHU9pP1QeU2th/sS0MaA+MZBV9hqWVjXUOUTWRaY/
         2mMYjw9bXs1G0JWraO2AEYH0hUj5pINokwEtAGA89ej3dPjAR9oHqs9jg4h6pDHTYBMK
         /G0A==
X-Gm-Message-State: AOAM530hl0bePgZtkk14UITgC+3/bARMq44lxs8RRfp/vMnspk2xDSYC
        +bcfMVhI72PM0BadHetOFMLY7RRRz7fT1w==
X-Google-Smtp-Source: ABdhPJy29xKu7KRGSeAJym2x8sFDYsVarRgwsQM1PiGJCPfVp/G6Y8KkUMRm8SHyHHNIelhlYuPisQ==
X-Received: by 2002:a17:906:8385:: with SMTP id p5mr1679844ejx.538.1603795202282;
        Tue, 27 Oct 2020 03:40:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id b6sm764986edu.21.2020.10.27.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:40:01 -0700 (PDT)
Date:   Tue, 27 Oct 2020 11:39:59 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos: Simplify code in Exynos3250 CPU core
 restart path
Message-ID: <20201027103959.GC20429@kozik-lap>
References: <CGME20190322114844eucas1p16095d6c26d9b6ef23c1168ce70194255@eucas1p1.samsung.com>
 <20190322114833.12686-1-m.szyprowski@samsung.com>
 <20190322114833.12686-3-m.szyprowski@samsung.com>
 <CAJKOXPeO7uS0mLejYo-oBEpMvBd0338LDogRk=hnU61rdUXCQw@mail.gmail.com>
 <1c410298-f5af-7bcd-d501-397058a59b1a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c410298-f5af-7bcd-d501-397058a59b1a@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 26, 2020 at 10:43:03PM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 22.03.2019 14:10, Krzysztof Kozlowski wrote:
> > On Fri, 22 Mar 2019 at 12:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> exynos_core_restart() is called by secondary CPU boot procedure, used by
> >> CPU hotplug. Replace of_machine_is_compatible() call with a simple SoC
> >> revision check.
> >>
> >> of_machine_is_compatible() function performs a dozen of string comparisons
> >> during the full device tree walk, while soc_is_exynos3250() is a simple
> >> integer check on SoC revision variable.
> > Yes but it is against the effort of getting rid of all soc_is_() (see
> > https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=43565&state=*
> > ). It also makes this code sticky to mach - we cannot move it to
> > drivers. See also Arnd's opinion:
> > https://marc.info/?l=devicetree&m=139291569126848&w=2
> >
> > Did you measure the practical performance impact of this change?
> 
> No, I didn't measure the performance, but recently I noticed the 
> following warning:
> 
> =============================
> WARNING: suspicious RCU usage
> 5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800 Not tainted
> -----------------------------
> ./include/trace/events/lock.h:37 suspicious rcu_dereference_check() usage!
> 
> other info that might help us debug this:
> 
> 
> rcu_scheduler_active = 2, debug_locks = 1
> RCU used illegally from extended quiescent state!
> no locks held by swapper/0/0.
> 
> stack backtrace:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 
> 5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c0111514>] (unwind_backtrace) from [<c010ceb8>] (show_stack+0x10/0x14)
> [<c010ceb8>] (show_stack) from [<c0b1d8dc>] (dump_stack+0xb4/0xd4)
> [<c0b1d8dc>] (dump_stack) from [<c0194acc>] (lock_acquire+0x418/0x584)
> [<c0194acc>] (lock_acquire) from [<c0b29e58>] 
> (_raw_spin_lock_irqsave+0x4c/0x60)
> [<c0b29e58>] (_raw_spin_lock_irqsave) from [<c0897af4>] 
> (of_device_is_compatible+0x1c/0x4c)
> [<c0897af4>] (of_device_is_compatible) from [<c01216d8>] 
> (exynos_core_restart+0x14/0xb0)
> [<c01216d8>] (exynos_core_restart) from [<c0120a78>] 
> (exynos_cpu0_enter_aftr+0x1d0/0x1dc)
> [<c0120a78>] (exynos_cpu0_enter_aftr) from [<c08575b0>] 
> (exynos_enter_coupled_lowpower+0x44/0x74)
> [<c08575b0>] (exynos_enter_coupled_lowpower) from [<c085477c>] 
> (cpuidle_enter_state+0x178/0x660)
> [<c085477c>] (cpuidle_enter_state) from [<c08572dc>] 
> (cpuidle_enter_state_coupled+0x35c/0x378)
> [<c08572dc>] (cpuidle_enter_state_coupled) from [<c0854cc8>] 
> (cpuidle_enter+0x50/0x54)
> [<c0854cc8>] (cpuidle_enter) from [<c0164854>] (do_idle+0x224/0x2a4)
> [<c0164854>] (do_idle) from [<c0164c88>] (cpu_startup_entry+0x18/0x1c)
> [<c0164c88>] (cpu_startup_entry) from [<c1100fa0>] 
> (start_kernel+0x640/0x67c)
> [<c1100fa0>] (start_kernel) from [<00000000>] (0x0)
> 
> I will add this to the commit message and resend. This looks like a good 
> reason for this change.

Good point, thanks.

Best regards,
Krzysztof
