From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Wed, 02 Jul 2014 06:18:39 +0200
Message-ID: <53B3881F.7040304@suse.de>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>	<CAD=FV=X4qGeWRZ9kcFGGr_tznruJkpzUJ5MU3hp-Q+mo2R1a4g@mail.gmail.com> <CANLzEksRmsk1y2ZEjRVE8F8DjSUeW3AebaaDWL71Z4Gc9NvZeg@mail.gmail.com> <53A89B0C.5000206@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <opensuse-arm+bounces-3094-glsa-opensusearm=m.gmane.org-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:opensuse-arm-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:opensuse-arm+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:opensuse-arm+subscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:opensuse-arm+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Owner: <mailto:opensuse-arm+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-archive: <http://lists.opensuse.org/opensuse-arm>
In-Reply-To: <53A89B0C.5000206-l3A5Bk7waGM@public.gmane.org>
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, openSUSE ARM ML <opensuse-arm-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am 23.06.2014 23:24, schrieb Andreas F=C3=A4rber:
> Am 23.06.2014 22:11, schrieb Benson Leung:
>> On Mon, Jun 23, 2014 at 12:57 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
> wrote:
>>>> Also when the screen stayed on, the embedded controller's keymap see=
ms
>>>> hardcoded to US English with system settings not taking effect; but
>>>> surely we don't want per-keyboard device tree files to remedy that.
>>>
>>> +Benson may be able to answer this.  I believe generally non-US
>>> keyboard layouts are handled at a higher level.
>>
>> There's no such thing as a notion of US versus non-US keyboard layouts
>> at the embedded controller level or even in the kernel. Indeed, this
>> should all be handled in user space.
>>
>> The chromeos firmware and kernel should return the correct key codes
>> for every key pressed on keyboards with the ANSI layout (US based), or
>> ISO (UK and most other countries).
>>
>> The only differences are :
>> * the ISO keyboard has an extra key, which is immediately to the right
>> of the Left Shift key. This must return KEY_102ND key code from the
>> input layer.
>> * the ISO keyboard has a  different location for the | \ key, which
>> accomodates the upside L shaped Enter key on the right side of the
>> keyboard. The keycode for this key is KEY_BACKSLASH.
>>
>> Basically, all of this should be verified using evtest to test that
>> the ec and kernel have the keys right.
>=20
> Hm, we may be talking about two different things here? I have been doin=
g
> a minimum system bring-up for 3.16, with openSUSE userspace.
> My YaST-selected system keymap (German with deadkeys) is not taking
> effect on German Spring at the *framebuffer console* (tty1) - evdev is
> not involved at that level AIUI.
>=20
> Backspace and L-shaped enter keys work okay. The keymap here should be
> identical to that in the original German device and seemed to match tha=
t
> in the exynos5250-snow.dts file.
>=20
> I just checked (w/ dp-controller, hdmi, fimd commented out in my patch)=
:
> * An external USB keyboard does not work correctly either.
> * In X11 (xdm), both internal and USB keyboard work as expected.

Another observation: Ctrl+o does not work on the Chromebook keyboard,
whereas o and Shift+o or Ctrl+x do work as expected. On an external USB
keyboard it works just fine. Same at the console and in X11.

Testcases are nano (saving) and gEdit (opening).

I tried the new cros-ec-keyboard.dtsi, no change; and given that the key
itself works okay, I assume it's not the dt linux,keymap.

Anyone any suggestion how to debug?

Thanks,
Andreas

> Similar situation in ChromeOS IIRC, with keymap correct at graphical
> login but not on the right-arrow console - although I don't know the
> ChromeOS userland too well to judge if it was configured correctly.
>=20
>> If you are having other problems with keyboard layout being stuck to
>> US QWERTY, please check your user space.
>=20
> On my Raspberry Pi for instance, the equivalent openSUSE Factory works
> just fine with German keymap for USB keyboard. Might any related kernel
> config options be missing in exynos_defconfig? Anything in particular I
> should check in user space?
>=20
> Cheers,
> Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg
--=20
To unsubscribe, e-mail: opensuse-arm+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
To contact the owner, e-mail: opensuse-arm+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
