From: Benson Leung <bleung@chromium.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Mon, 23 Jun 2014 13:11:08 -0700
Message-ID: <CANLzEksRmsk1y2ZEjRVE8F8DjSUeW3AebaaDWL71Z4Gc9NvZeg@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
	<CAD=FV=X4qGeWRZ9kcFGGr_tznruJkpzUJ5MU3hp-Q+mo2R1a4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:52259 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbaFWULJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:11:09 -0400
Received: by mail-ve0-f181.google.com with SMTP id db11so6589799veb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:11:08 -0700 (PDT)
In-Reply-To: <CAD=FV=X4qGeWRZ9kcFGGr_tznruJkpzUJ5MU3hp-Q+mo2R1a4g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>

On Mon, Jun 23, 2014 at 12:57 PM, Doug Anderson <dianders@chromium.org> wrote:
>> Also when the screen stayed on, the embedded controller's keymap seems
>> hardcoded to US English with system settings not taking effect; but
>> surely we don't want per-keyboard device tree files to remedy that.
>
> +Benson may be able to answer this.  I believe generally non-US
> keyboard layouts are handled at a higher level.

There's no such thing as a notion of US versus non-US keyboard layouts
at the embedded controller level or even in the kernel. Indeed, this
should all be handled in user space.

The chromeos firmware and kernel should return the correct key codes
for every key pressed on keyboards with the ANSI layout (US based), or
ISO (UK and most other countries).

The only differences are :
* the ISO keyboard has an extra key, which is immediately to the right
of the Left Shift key. This must return KEY_102ND key code from the
input layer.
* the ISO keyboard has a  different location for the | \ key, which
accomodates the upside L shaped Enter key on the right side of the
keyboard. The keycode for this key is KEY_BACKSLASH.

Basically, all of this should be verified using evtest to test that
the ec and kernel have the keys right.

If you are having other problems with keyboard layout being stuck to
US QWERTY, please check your user space.

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
