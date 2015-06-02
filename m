From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Tue, 02 Jun 2015 23:15:49 +0200
Message-ID: <2123062.dmIBPlf795@diego>
References: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, 2. Juni 2015, 10:11:03 schrieb Javier Martinez Canillas:
> Hello,
> 
> Newer Chromebooks have more than one Embedded Controller (EC) in the
> system. These additional ECs are connected through I2C with a host EC
> which is the one that is connected to the Application Processor (AP)
> through different transports (I2C, SPI or LPC).
> 
> So on these platforms, sub-processors are chained to each other:
> 
> AP <--> Host EC <--> Power Delivery (PD) EC
> 
> The AP sends commands to the additional EC through the host EC using
> a set of passthru commands and the host redirects to the correct EC.
> 
> This is a v4 of a series that adds support for multiple EC in a system
> and also for the protocol version 3 that is used on newer ECs.
> 
> Most patches were taken from the downstream ChromiumOS v3.14 tree with
> fixes squashed, split to minimise the cross subsystem churn and changes
> for mainline inclusion but were not modified functionality wise.
> 
> This version addresses a lot of issues pointed out by Lee Jones on the v3
> posted before [0].
> 
> The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cleanups"
> [1] that were posted before and was already picked by Lee Jones.
> 
> Testing was done on some Chromebooks that have a single EC and support
> protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800
> Peach Pi to be sure that no regressions were introduced for these machines.

I just gave this a try on veyron and everything still works as expected.

All patches except "[PATCH v4 6/8] mfd: cros_ec: Support multiple EC in a 
system" already have Tested-by tags, so this patch now is also

Tested-by: Heiko Stuebner <heiko@sntech.de>


Heiko
