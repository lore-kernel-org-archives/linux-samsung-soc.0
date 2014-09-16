From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCHv3 4/5] rtc: s3c: Add support for RTC of Exynos3250 SoC
Date: Tue, 16 Sep 2014 09:03:39 -0600
Message-ID: <CAD8Lp47M8jHLrQAdYUn6NZn2Ety_02E6HPzPDUX3uGLVqf1riw@mail.gmail.com>
References: <1409216559-22402-1-git-send-email-cw00.choi@samsung.com>
	<1409216559-22402-5-git-send-email-cw00.choi@samsung.com>
	<CABxcv=ku9fjFfzyXZEnCGpTrWQ0pN+5mLWay90jXBhkFeWb7sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:51328 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753356AbaIPPDl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 11:03:41 -0400
Received: by mail-wg0-f41.google.com with SMTP id k14so5619329wgh.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Sep 2014 08:03:40 -0700 (PDT)
In-Reply-To: <CABxcv=ku9fjFfzyXZEnCGpTrWQ0pN+5mLWay90jXBhkFeWb7sg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Kyungmin Park <kyungmin.park@samsung.com>, rtc-linux@googlegroups.com, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, Sep 16, 2014 at 7:48 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>> Clock list for s3c-rtc device:
>> - rtc : CLK_RTC of CLK_GATE_IP_PERIR is gate clock for RTC.
>> - rtc_src : XrtcXTI is 32.768.kHz source clock for RTC.
>
> Is this RTC source clock needed for all Exynos SoCs?

It is at least needed on Exynos4412, which has the XrtcXTI thing
exactly as you describe. However the very standard setup there is to
hook it up to the CP clock output of the MAX76686 PMIC. This CP clock
is on by default, so you can potentially live without that detail
being present in the DT.

However... one small issue with this setup is that when you enable
CONFIG_COMMON_CLK_MAX77686, the CP clock gets exposed in Linux's
common clock framework, and Linux then turns it off because it
believes it is unused. Then the RTC stops ticking.

So the rtc_src idea would also be good for Exynos4412. Maybe it would
make sense to drop the needs_src_clk flag, and simply require/enable
the src clock whenever it is present in the DT.

Also, are you sure about the way you are treating this clock, all
those enable/disable calls? You only seem to enable it when doing some
particular driver operations e.g. reading the time, leaving it
disabled at all other times. However I believe on Exynos4412 that if
you disable this clock then the RTC will not tick.

Daniel
