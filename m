From: Vincent Palatin <vpalatin@chromium.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Wed, 2 Jul 2014 07:56:14 -0700
Message-ID: <CAP_ceTy-Z5y6QAH57XcMVqFcfxEq+yhuukWGYthS-xZJk3j8dQ@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <CAD=FV=X4qGeWRZ9kcFGGr_tznruJkpzUJ5MU3hp-Q+mo2R1a4g@mail.gmail.com>
 <CANLzEksRmsk1y2ZEjRVE8F8DjSUeW3AebaaDWL71Z4Gc9NvZeg@mail.gmail.com>
 <53A89B0C.5000206@suse.de> <53B3881F.7040304@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:57367 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839AbaGBO4f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 10:56:35 -0400
Received: by mail-vc0-f174.google.com with SMTP id hy4so10385031vcb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2014 07:56:35 -0700 (PDT)
In-Reply-To: <53B3881F.7040304@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Benson Leung <bleung@chromium.org>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, openSUSE ARM ML <opensuse-arm@opensuse.org>, Alexander Graf <agraf@suse.de>

On Tue, Jul 1, 2014 at 9:18 PM, Andreas F=C3=A4rber <afaerber@suse.de> =
wrote:
> Am 23.06.2014 23:24, schrieb Andreas F=C3=A4rber:
>> Am 23.06.2014 22:11, schrieb Benson Leung:
>>> On Mon, Jun 23, 2014 at 12:57 PM, Doug Anderson <dianders@chromium.=
org> wrote:
>>>>> Also when the screen stayed on, the embedded controller's keymap =
seems
>>>>> hardcoded to US English with system settings not taking effect; b=
ut
>>>>> surely we don't want per-keyboard device tree files to remedy tha=
t.
>>>>
>>>> +Benson may be able to answer this.  I believe generally non-US
>>>> keyboard layouts are handled at a higher level.
>>>
>>> There's no such thing as a notion of US versus non-US keyboard layo=
uts
>>> at the embedded controller level or even in the kernel. Indeed, thi=
s
>>> should all be handled in user space.
>>>
>>> The chromeos firmware and kernel should return the correct key code=
s
>>> for every key pressed on keyboards with the ANSI layout (US based),=
 or
>>> ISO (UK and most other countries).
>>>
>>> The only differences are :
>>> * the ISO keyboard has an extra key, which is immediately to the ri=
ght
>>> of the Left Shift key. This must return KEY_102ND key code from the
>>> input layer.
>>> * the ISO keyboard has a  different location for the | \ key, which
>>> accomodates the upside L shaped Enter key on the right side of the
>>> keyboard. The keycode for this key is KEY_BACKSLASH.
>>>
>>> Basically, all of this should be verified using evtest to test that
>>> the ec and kernel have the keys right.
>>
>> Hm, we may be talking about two different things here? I have been d=
oing
>> a minimum system bring-up for 3.16, with openSUSE userspace.
>> My YaST-selected system keymap (German with deadkeys) is not taking
>> effect on German Spring at the *framebuffer console* (tty1) - evdev =
is
>> not involved at that level AIUI.
>>
>> Backspace and L-shaped enter keys work okay. The keymap here should =
be
>> identical to that in the original German device and seemed to match =
that
>> in the exynos5250-snow.dts file.
>>
>> I just checked (w/ dp-controller, hdmi, fimd commented out in my pat=
ch):
>> * An external USB keyboard does not work correctly either.
>> * In X11 (xdm), both internal and USB keyboard work as expected.
>
> Another observation: Ctrl+o does not work on the Chromebook keyboard,
> whereas o and Shift+o or Ctrl+x do work as expected. On an external U=
SB
> keyboard it works just fine. Same at the console and in X11.
>
> Testcases are nano (saving) and gEdit (opening).
>
> I tried the new cros-ec-keyboard.dtsi, no change; and given that the =
key
> itself works okay, I assume it's not the dt linux,keymap.
>
> Anyone any suggestion how to debug?

I guess Ctrl+U is not working either.

That's the combination of 2 factors :
a. a magic feature on Spring
b. a pre-existing bug in the cros_ec_keyb keyboard driver

a. On Spring, the AC adapter events are exported as a virtual key in
the keyboard matrix
(mapped as KEY_BATTERY in the ChromeOS kernel)
b. the de-ghosting algorithm in the driver is slightly wrong.

In your case, the driver is seeing a (non existing) ghost when Ctrl +
O + KEY_BATTERY are pressed, and discarding the key press. As
KEY_BATTERY is a virtual key, this ghost obviously cannot exist.
To verify that hypothesis, you can try to disconnect your charger (or
connect it), and see if the key combination is now working.

We might need to upstream a patch similar to :
https://chromium-review.googlesource.com/#/c/178539/
to fix the de-ghosting and exclude KEY_BATTERY.

>> Similar situation in ChromeOS IIRC, with keymap correct at graphical
>> login but not on the right-arrow console - although I don't know the
>> ChromeOS userland too well to judge if it was configured correctly.
>>
>>> If you are having other problems with keyboard layout being stuck t=
o
>>> US QWERTY, please check your user space.
>>
>> On my Raspberry Pi for instance, the equivalent openSUSE Factory wor=
ks
>> just fine with German keymap for USB keyboard. Might any related ker=
nel
>> config options be missing in exynos_defconfig? Anything in particula=
r I
>> should check in user space?
>>
>> Cheers,
>> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
