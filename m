From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [RFC] IDLE/DEEP IDLE scheduler modification for power savings
Date: Mon, 12 Apr 2010 21:55:28 +0900
Message-ID: <s2q1b68c6791004120555qb0ab21ffm9a641ec3f2423597@mail.gmail.com>
References: <000001cada24$01a5ee90$04f1cbb0$%majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:49135 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878Ab0DLMza convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Apr 2010 08:55:30 -0400
Received: by vws18 with SMTP id 18so1075963vws.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Apr 2010 05:55:29 -0700 (PDT)
In-Reply-To: <000001cada24$01a5ee90$04f1cbb0$%majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Tomasz Fujak <t.fujak@samsung.local>, Marek Szyprowski <m.szyprowski@samsung.local>, Kyungmin Park <kyungmin.park@samsung.com>

On Mon, Apr 12, 2010 at 6:39 PM, Lukasz Majewski <l.majewski@samsung.co=
m> wrote:
> One approach to solve the problem, and therefore deliver power saving=
s,
> is to modify the ALSA driver and provide a switch to inform the CPU I=
DLE
> framework that it should now use the DEEP IDLE instead of IDLE when e=
ntering
> the Low Power Audio playback mode is expected. =C2=A0This change may =
be performed
> by replacing the method for entering the IDLE mode to DEEP IDLE. More=
over
> some sources immune to power gating (like e.g. RTC timer) have to be =
used
> for waking up. The biggest problem for this approach is the kernel's =
policy
> violation, that no user program should directly change scheduling/idl=
e
> policy.
Actually any power saving mode is transparent to the LPAM(LowPowerAudio=
Mode).
"LPAM h/w" is simply an I2S controller with an additional 'overlay'
stereo channel
which is h/w-mix'ed with the first two of the 6 channels. And these ove=
rlay
channels works just as well in normal power mode. LPAM is but one
ramification of
of the platform using the interrupt as a wakeup source. It is also used=
 for
low latency playback like 'alerts' and 'alarms'.
Our LPAM doesn't work right away not because of the power management st=
ack
but because ASoC can't yet handle a
codec-active-in-system-suspended-mode scenario.
So, I too think it's a bad idea to hack core PM for things like LPAM.

> So what is your opinion about integrating use of the DEEP IDLE state =
mode
> in the scheduler (either as new scheduling policy or modifying schedu=
ler
> code)?
imho, such 'variation' in suspend had better be implemented in
platform specific manner.
Just because samsung's manual call it deep-IDLE doesn't make it an 'IDL=
E' mode.
It is closer to suspend than idle, at least to me.
