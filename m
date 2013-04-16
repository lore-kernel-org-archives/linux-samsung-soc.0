From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform
 support
Date: Tue, 16 Apr 2013 22:51:35 +0200
Message-ID: <516DB9D7.1070705@gmail.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:43284 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753767Ab3DPUvl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 16:51:41 -0400
Received: by mail-ea0-f179.google.com with SMTP id f15so421093eak.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 13:51:39 -0700 (PDT)
In-Reply-To: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de

On 04/12/2013 09:17 PM, Tomasz Figa wrote:
> This series is an attempt to make the samsung-time clocksource driver ready
> for multiplatform kernels. It moves the driver to drivers/clocksource, cleans
> it up from uses of static platform-specific definitions, simplifies timer
> interrupt handling and adds Device Tree support.
>
> The samsung_pwm clocksource driver is made the master driver, which
> exposes a single function to the PWM driver to get required data. Only
> samsung-time driver is reworked to use the master driver at this time,
> since the PWM driver can be already considered broken at the moment and
> needs separate series of several patches to fix and clean it up, which
> I am already working on.
>
> Tested on Universal C210 board with Device Tree. Not tested without
> Device Tree, since it has been already broken before this series.
> Compile tested for other related SoCs.

On s3c2440 based board

Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
