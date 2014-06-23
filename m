From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Mon, 23 Jun 2014 12:57:43 -0700
Message-ID: <CAD=FV=X4qGeWRZ9kcFGGr_tznruJkpzUJ5MU3hp-Q+mo2R1a4g@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:61791 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbaFWT5o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 15:57:44 -0400
Received: by mail-ve0-f173.google.com with SMTP id db11so6555178veb.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 12:57:43 -0700 (PDT)
In-Reply-To: <1403486483-4063-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>, Benson Leung <bleung@chromium.org>

Andreas,

On Sun, Jun 22, 2014 at 6:21 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>
> Hello,
>
> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15
> based attempts by Stephan and me that broke for 3.16, I've prepared a
> device tree for the HP Chromebook 11 aka Google Spring.
>
> The first three patches should be good to go and contain documentatio=
n
> fixes found while comparing exynos5250-snow.dts vs. /proc/device-tree=
=2E
>
> The main patch was tested using a chained non-verified U-Boot (simple=
fb)
> and a rootfs on USB-attached SD card.
> The display goes dark unfortunately (drm bridge series not yet tested=
),
> but I am able to log in via ssh over USB ethernet adapter okay.
>
> Audio support is likely missing as my focus was getting USB booting.
> Not included is touchpad support, as "atmel,atmel_mxt_tp" is not
> documented to be available upstream. And no /dev/mmcblk0 or Wifi yet.
> Also when the screen stayed on, the embedded controller's keymap seem=
s
> hardcoded to US English with system settings not taking effect; but
> surely we don't want per-keyboard device tree files to remedy that.

+Benson may be able to answer this.  I believe generally non-US
keyboard layouts are handled at a higher level.
