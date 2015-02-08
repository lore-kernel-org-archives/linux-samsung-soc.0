From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Sun, 8 Feb 2015 10:52:13 +0100
Message-ID: <CAJKOXPfX_0eWpecHoj2z6cc879CBR=2=SwdMBaD3g3KO_mFHZQ@mail.gmail.com>
References: <54D779FB.9070306@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:43229 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbbBHJwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Feb 2015 04:52:14 -0500
Received: by mail-vc0-f173.google.com with SMTP id hy4so3331335vcb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Feb 2015 01:52:13 -0800 (PST)
In-Reply-To: <54D779FB.9070306@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Feb 7, 2015 9:27 PM, "Tobias Jakobi" <tjakobi@math.uni-bielefeld.de> wrote:
>
> Hello,
>
> I've collected some of the more serious remaining problems on the
> Hardkernel Odroid boards (here on an X2).
>
> 1) When using cpufreq-exynos and having selected the 'ondemand'
> governor, the system shutdown/reboot process doesn't complete and hangs
> before the end. I'm currently hotfixing this by switching to
> 'performance' governor in a custom initscript.
>
> 2) When reading the 'clk_summary' debugfs entry the system locks up
> immediately. Currently hotfixing this by having the ISP powerdomain
> always-on. The problem seems to be known, at least it was mentioned here:
> http://www.spinics.net/lists/linux-samsung-soc/msg39488.html
>
> 3) Maybe related to (1). I'm experiencing high SoC temperatures after
> shutting the system down and leaving the AC connector plugged into the
> board. The shutdown procedure is like mentioned in (1): Switch to
> 'performance' and then do a normal 'shutdown -h now'. I was wondering if
> the Odroid boards need a special shutdown procedure (like designed in
> the odroid-restart handler patch) after all.
>
> 4) Spinlock BUGs triggered by the sdhci subsystem (so for the people
> using the system with a SD card). This is also a known problem, I think
> first mentioned here: http://www.spinics.net/lists/linux-mmc/msg27277.html
> Currently fixing this with this patch:
> https://github.com/tobiasjakobi/linux-odroid/commit/abc749843dd7022d01322dca3db0181211a30cd8

The fourth problem looks similar to:
https://lkml.org/lkml/2015/2/4/63
Could you give that patch a try?

Best regards,
Krzysztof
