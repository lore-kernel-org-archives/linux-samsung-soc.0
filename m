From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] ARM: dts: Initial ODROID U2 support
Date: Thu, 12 Jun 2014 14:24:29 +0100
Message-ID: <CAD8Lp45LW06L+uub7qm0t3yzX43wkO621vAuprh9UdAE4B-qYQ@mail.gmail.com>
References: <1402577077-7835-1-git-send-email-drake@endlessm.com>
	<5399A526.6040303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:38706 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781AbaFLNYa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 09:24:30 -0400
Received: by mail-wg0-f52.google.com with SMTP id b13so1237647wgh.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 06:24:29 -0700 (PDT)
In-Reply-To: <5399A526.6040303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, prahal@yahoo.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thu, Jun 12, 2014 at 2:03 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Thanks for posting, however I have already prepared dts for Odroid X2
> and U3 with complete USB support. HDMI needs a few little tweaks, but I
> hope it can be also merged soon.
>
> I'm waiting for v3.16-rc1 to rebase them onto latest mainline and post
> here. I will check if I can integrate your patch to them.

Nice, thanks. I took a quick glance at your work and indeed it looks
much more complete. I don't think you have anything to add from my
patch.

Just one request, please be sure to submit this work after -rc1 comes
out even if HDMI is not working at first. Too many people have started
working on this and then stopped short of actually sending any code
upstream. If you CC me on the patches I'll try to help with reviews
too.

Thanks,
Daniel
