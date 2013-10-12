From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: Update arch timer node with clock frequency
Date: Sat, 12 Oct 2013 15:31:32 -0700
Message-ID: <20131012223132.GB20879@quad.lixom.net>
References: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:61439 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752852Ab3JLWb6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Oct 2013 18:31:58 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc17so5755549pbc.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Oct 2013 15:31:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Wed, Sep 18, 2013 at 03:41:53PM +0530, Yuvaraj Kumar C D wrote:
> Without the "clock-frequency" property in arch timer node, could able
> to see the below crash dump.
> 
> [<c0014e28>] (unwind_backtrace+0x0/0xf4) from [<c0011808>] (show_stack+0x10/0x14)
> [<c0011808>] (show_stack+0x10/0x14) from [<c036ac1c>] (dump_stack+0x7c/0xb0)
> [<c036ac1c>] (dump_stack+0x7c/0xb0) from [<c01ab760>] (Ldiv0_64+0x8/0x18)
> [<c01ab760>] (Ldiv0_64+0x8/0x18) from [<c0062f60>] (clockevents_config.part.2+0x1c/0x74)
> [<c0062f60>] (clockevents_config.part.2+0x1c/0x74) from [<c0062fd8>] (clockevents_config_and_register+0x20/0x2c)
> [<c0062fd8>] (clockevents_config_and_register+0x20/0x2c) from [<c02b8e8c>] (arch_timer_setup+0xa8/0x134)
> [<c02b8e8c>] (arch_timer_setup+0xa8/0x134) from [<c04b47b4>] (arch_timer_init+0x1f4/0x24c)
> [<c04b47b4>] (arch_timer_init+0x1f4/0x24c) from [<c04b40d8>] (clocksource_of_init+0x34/0x58)
> [<c04b40d8>] (clocksource_of_init+0x34/0x58) from [<c049ed8c>] (time_init+0x20/0x2c)
> [<c049ed8c>] (time_init+0x20/0x2c) from [<c049b95c>] (start_kernel+0x1e0/0x39c)
> 
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Applied with subject:

ARM: exynos: dts: Update 5250 arch timer node with clock frequency


-Olof
