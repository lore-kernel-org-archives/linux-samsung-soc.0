From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v7 0/8] mfd: cros_ec: Add multi EC and proto v3 support
Date: Thu, 11 Jun 2015 13:50:37 +0200
Message-ID: <24727363.WKhvMDQ6EE@diego>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47724 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752647AbbFKLut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 07:50:49 -0400
In-Reply-To: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Am Dienstag, 9. Juni 2015, 13:04:41 schrieb Javier Martinez Canillas:
> Hello,
> 
> This is a v7 of a series that adds support for multiple EC in a system
> and also for the protocol version 3 that is used on newer ECs.
> 
> Most patches were taken from the downstream ChromiumOS v3.14 tree with
> fixes squashed, split to minimise the cross subsystem churn and changes
> for mainline inclusion but were not modified functionality wise.
> 
> This version addresses issues pointed out by Lee Jones on the v6 posted
> before [0] and also adds the Acked-by tags of all the needed maintainers.
> 
> The patches are based on top of "[PATCH 0/2] mfd: cros_ec: Small cleanups"
> [1] that were posted before and already picked by Lee Jones.
> 
> Testing was done on some Chromebooks that have a single EC and support
> protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and Exynos5800
> Peach Pi to be sure that no regressions were introduced for these machines.
> 
> The series were tested using a modified ectool [2] that supports the new
> cros_ec IOCTL API. They were also tested on a x86 Pixel Chromebook 2 (Samus)
> that uses the new protocol v3 and has 2 EC (cros_ec and cros_pd). But for
> testing on Samus, also the posted "[PATCH 0/3] platform/chrome: Changes for
> cros_ec_lpc and cros_ec_dev" series [3] are needed.

everything still works as expected on a rk3288-veyron-jerry

Tested-by: Heiko Stuebner <heiko@sntech.de>
[tags are already present in the patches]


As the series now has Olof's Ack, can this still make it in time for 4.2 - as 
there is still a bit more than a week left till the merge window?


Heiko
