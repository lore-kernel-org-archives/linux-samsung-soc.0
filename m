From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] watchdog: s3c2410_wdt: Only register for cpufreq on CPU_FREQ_S3C24XX
Date: Tue, 26 Nov 2013 01:16:51 +0100
Message-ID: <2791036.CbFhSFdK0z@flatron>
References: <1385420137-32725-1-git-send-email-dianders@chromium.org> <20131126000831.GW12108@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:52633 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751903Ab3KZAQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 19:16:53 -0500
In-Reply-To: <20131126000831.GW12108@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: Doug Anderson <dianders@chromium.org>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Leela Krishna Amudala <l.krishna@samsung.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 26 of November 2013 00:08:31 Ben Dooks wrote:
> On Mon, Nov 25, 2013 at 02:55:37PM -0800, Doug Anderson wrote:
> > On modern SoCs the watchdog timer is parented on a clock that doesn't
> > change every time we have a cpufreq change.  That means we don't need
> > to constantly adjust the watchdog timer, so avoid registering for and
> > dealing with cpufreq transitions unless we've actually got
> > CPU_FREQ_S3C24XX defined.
> 
> The S3C2410 to at-least S3C2440 there is only one PLL/clock-divider
> set so changing any part of that can change frequency supplied to
> the watchdog.

And so we're leaving the notifier code intact, just changing the ifdef
conditionm which decides whether it should be compiled in, from a (too)
generic one to an S3C24xx-specific one.

Best regards,
Tomasz
