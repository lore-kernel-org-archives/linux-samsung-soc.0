From: Doug Anderson <dianders@google.com>
Subject: clocksources, rtcs, and sleeps, oh my!
Date: Mon, 21 Apr 2014 13:50:04 -0700
Message-ID: <CAD=FV=Wxk4dWSZw0=joLqX+P9uqKiWrz8vkO2iZf+E_i-nu57g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:35767 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754469AbaDUUuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 16:50:06 -0400
Received: by mail-ve0-f173.google.com with SMTP id oy12so8451040veb.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2014 13:50:04 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Alexander Graf <agraf@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sean Paul <seanpaul@chromium.org>, Prashanth G <prashanth.g@samsung.com>

Hi,

I've been doing a bit of work with the upstream kernel on
exynos5250-snow and noticed an annoying delay of several seconds when
the max77686 rtc gets probed.  The longer time that I sit in the
bootloader the longer the delay is.

I've tracked down the line and found that this little piece of code is
causing the delay:

   /* Minimum 16ms delay required before RTC update. */
   msleep(MAX77686_RTC_UPDATE_DELAY);

...that doesn't make a whole lot of sense, so I tracked things down a
bit more.  It appears that if I disable _either_ the MCT timer _or_
the ARM arch timers that the problem magically goes away.  In other
words, either of these will do it:

mct@101C0000 {
   status = "disabled";
};

timer {
   status = "disabled";
};

Disabling either of the timers also fixes the rather annoying jump
from 0 seconds to ~2910 seconds at boot time.

Does anyone have time to dig into this?

---

Here's the log showing the big jump in time:

[    0.008067] Switching to timer-based delay loop
[ 2910.537817] Console: colour dummy device 80x30

---

...and the big delay when the RTC is probed:

[ 2911.609317] max77686-rtc max77686-rtc: max77686_rtc_probe
[ 2920.652394] max77686-rtc max77686-rtc: rtc core: registered
max77686-rtc as rtc0

---

-Doug
