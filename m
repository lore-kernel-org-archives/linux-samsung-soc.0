From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] usb: dwc2: refactor common low-level hw code to platform.c
Date: Mon, 5 Oct 2015 18:27:25 -0500
Message-ID: <874mi4gale.fsf@saruman.tx.rr.com>
References: <20151001155947.GD4469@saruman.tx.rr.com> <1443771918-19075-1-git-send-email-m.szyprowski@samsung.com> <2B3535C5ECE8B5419E3ECBE30077290901DC3876E9@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:40850 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743AbbJEX1f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 19:27:35 -0400
In-Reply-To: <2B3535C5ECE8B5419E3ECBE30077290901DC3876E9@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <John.Youn@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

John Youn <John.Youn@synopsys.com> writes:

Hi,

> On 10/2/2015 12:45 AM, Marek Szyprowski wrote:
>> DWC2 module on some platforms needs three additional hardware
>> resources: phy controller, clock and power supply. All of them must be
>> enabled/activated to properly initialize and operate. This was initially
>> handled in s3c-hsotg driver, which has been converted to 'gadget' part
>> of dwc2 driver. Unfortunately, not all of this code got moved to common
>> platform code, what resulted in accessing DWC2 registers without
>> enabling low-level hardware resources. This fails for example on Exynos
>> SoCs. This patch moves all the code for managing those resources to
>> common platform.c file and provides convenient wrappers for controlling
>> them.
>>=20
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Changelog:
>> v4:
>> - fixed broken conditional compilation and adjusted comments in dwc2_hso=
tg
>>   structure documentation
>>=20
>> v3:
>> - rebased onto latest 'testing/next' from Felipe Balbi (includes
>>   s3c_hsotg -> dwc2 rename)
>>=20
>> v2:
>> - moved setting of ll_hw_enabled flag to enable/disable functions,
>>   as suggested by John Youn
>> - moved setting of phy width to dwc2_lowlevel_init function
>> ---
>>  drivers/usb/dwc2/core.h     |  24 +++--
>>  drivers/usb/dwc2/gadget.c   | 193 ++++--------------------------------
>>  drivers/usb/dwc2/platform.c | 234 +++++++++++++++++++++++++++++++++++++=
-------
>>  3 files changed, 228 insertions(+), 223 deletions(-)
>>=20
>
> Hi Marek,
>
> I still see lockdep warnings.
>
> Any ideas about these?
>
>
> [ 1618.179611] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 1618.179612] [ INFO: possible circular locking dependency detected ]
> [ 1618.179613] 4.3.0-rc3-snps-00125-g744fd93 #28 Not tainted
> [ 1618.179614] -------------------------------------------------------
> [ 1618.179615] modprobe/2658 is trying to acquire lock:
> [ 1618.179616]  (&hsotg->init_mutex){+.+.+.}, at: [<ffffffffc043aa3c>] dw=
c2_hsotg_udc_start+0x5c/0x200 [dwc2]
> [ 1618.179622]=20
> [ 1618.179622] but task is already holding lock:
> [ 1618.179623]  (udc_lock){+.+.+.}, at: [<ffffffffc0374b8a>] usb_gadget_p=
robe_driver+0x3a/0xd0 [udc_core]
> [ 1618.179627]=20
> [ 1618.179627] which lock already depends on the new lock.
> [ 1618.179627]=20
> [ 1618.179628]=20
> [ 1618.179628] the existing dependency chain (in reverse order) is:
> [ 1618.179629]=20
> [ 1618.179629] -> #1 (udc_lock){+.+.+.}:
> [ 1618.179631]        [<ffffffff810da56d>] lock_acquire+0xdd/0x1f0
> [ 1618.179635]        [<ffffffff818658a6>] mutex_lock_nested+0x76/0x3e0
> [ 1618.179638]        [<ffffffffc0374da7>] usb_add_gadget_udc_release+0x1=
87/0x240 [udc_core]
> [ 1618.179640]        [<ffffffffc0374e70>] usb_add_gadget_udc+0x10/0x20 [=
udc_core]
> [ 1618.179642]        [<ffffffffc043b30c>] dwc2_gadget_init+0x47c/0x580 [=
dwc2]
> [ 1618.179645]        [<ffffffffc042d2f2>] dwc2_driver_probe+0x422/0x4b0 =
[dwc2]
> [ 1618.179648]        [<ffffffff8153fe94>] platform_drv_probe+0x34/0x90
> [ 1618.179650]        [<ffffffff8153db54>] driver_probe_device+0x224/0x480
> [ 1618.179652]        [<ffffffff8153deb1>] __device_attach_driver+0x71/0x=
a0
> [ 1618.179654]        [<ffffffff8153b78d>] bus_for_each_drv+0x5d/0x90
> [ 1618.179655]        [<ffffffff8153d83f>] __device_attach+0xbf/0x140
> [ 1618.179657]        [<ffffffff8153df23>] device_initial_probe+0x13/0x20
> [ 1618.179658]        [<ffffffff8153cb03>] bus_probe_device+0xa3/0xb0
> [ 1618.179660]        [<ffffffff8153a76d>] device_add+0x40d/0x690
> [ 1618.179661]        [<ffffffff8153fb81>] platform_device_add+0x111/0x270
> [ 1618.179663]        [<ffffffffc0394128>] dwc2_pci_probe+0xe8/0x1d2 [dwc=
2_pci]
> [ 1618.179665]        [<ffffffff81446085>] local_pci_probe+0x45/0xa0
> [ 1618.179668]        [<ffffffff81447451>] pci_device_probe+0xe1/0x130
> [ 1618.179669]        [<ffffffff8153db54>] driver_probe_device+0x224/0x480
> [ 1618.179671]        [<ffffffff8153de38>] __driver_attach+0x88/0x90
> [ 1618.179672]        [<ffffffff8153b6d6>] bus_for_each_dev+0x66/0xa0
> [ 1618.179674]        [<ffffffff8153d31e>] driver_attach+0x1e/0x20
> [ 1618.179675]        [<ffffffff8153ce8e>] bus_add_driver+0x1ee/0x280
> [ 1618.179677]        [<ffffffff8153e930>] driver_register+0x60/0xe0
> [ 1618.179678]        [<ffffffff81445a60>] __pci_register_driver+0x60/0x70
> [ 1618.179680]        [<ffffffffc000601e>] 0xffffffffc000601e
> [ 1618.179681]        [<ffffffff81002123>] do_one_initcall+0xb3/0x200
> [ 1618.179684]        [<ffffffff811a8a41>] do_init_module+0x5f/0x1e7
> [ 1618.179687]        [<ffffffff81120e48>] load_module+0x21a8/0x2840
> [ 1618.179689]        [<ffffffff8112170a>] SyS_finit_module+0x9a/0xc0
> [ 1618.179691]        [<ffffffff81869c36>] entry_SYSCALL_64_fastpath+0x16=
/0x7a
> [ 1618.179693]=20
> [ 1618.179693] -> #0 (&hsotg->init_mutex){+.+.+.}:
> [ 1618.179695]        [<ffffffff810d97f5>] __lock_acquire+0x1d35/0x1db0
> [ 1618.179697]        [<ffffffff810da56d>] lock_acquire+0xdd/0x1f0
> [ 1618.179698]        [<ffffffff818658a6>] mutex_lock_nested+0x76/0x3e0
> [ 1618.179700]        [<ffffffffc043aa3c>] dwc2_hsotg_udc_start+0x5c/0x20=
0 [dwc2]
> [ 1618.179703]        [<ffffffffc0374a34>] udc_bind_to_driver+0xa4/0x100 =
[udc_core]
> [ 1618.179705]        [<ffffffffc0374bca>] usb_gadget_probe_driver+0x7a/0=
xd0 [udc_core]
> [ 1618.179707]        [<ffffffffc059a674>] usb_composite_probe+0xa4/0xc0 =
[libcomposite]
> [ 1618.179709]        [<ffffffffc0474010>] msg_init+0x10/0x1000 [g_mass_s=
torage]
> [ 1618.179711]        [<ffffffff81002123>] do_one_initcall+0xb3/0x200
> [ 1618.179713]        [<ffffffff811a8a41>] do_init_module+0x5f/0x1e7
> [ 1618.179714]        [<ffffffff81120e48>] load_module+0x21a8/0x2840
> [ 1618.179716]        [<ffffffff8112170a>] SyS_finit_module+0x9a/0xc0
> [ 1618.179717]        [<ffffffff81869c36>] entry_SYSCALL_64_fastpath+0x16=
/0x7a
> [ 1618.179719]=20
> [ 1618.179719] other info that might help us debug this:
> [ 1618.179719]=20
> [ 1618.179720]  Possible unsafe locking scenario:
> [ 1618.179720]=20
> [ 1618.179721]        CPU0                    CPU1
> [ 1618.179722]        ----                    ----
> [ 1618.179722]   lock(udc_lock);
> [ 1618.179723]                                lock(&hsotg->init_mutex);

It seems like init_mutex is completely unnecessary in this driver. In
fact, why are you trying to hold a mutex while inside a spinlock ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEwdfAAoJEIaOsuA1yqREyOEQAIZd81uvhB7tAPq88nC9Mvyh
aLyNl8iF24AQO5Uv1yt4lQnp0qU6PfnCjgv2E13Ija9nBOm0zCCk0oCvS8WUqoHN
vj62f1CxQ45XkMSd1Ioqo72TAcBTWuflkt9kdJsGqBqUgWHfT6T4nRR2Y5FnlrJS
1JKnxwTzUOjWkoW4aXzPm4WAGKX7Y8XKzhARyWAEV42CPZlzfL7JkhM+l6UbRdoG
S0BsjLS92uOjWNczNXzLiUkmpuXn4mtbA91lZYSDwzQovhpEEeLA1zG/+rvE/sB7
UByuysTcZaCex3Ay28NTFEBObbwUTh+1MMl/2hP0mJPlvaB8iEqtRYE8DkCZslax
Z8SWj89rW6+FFXy1vP9tq+Tf3VqerSDglYzTKBxUxiNpLtY1pgFFuoOZCuz6eKZS
vTPUY2DIG0OKpF1uzyW14ON9Rrro/ydGJlMpb9Ny4x4nQhpewC/5ulf0iCp2slqt
+RVw6kdA7hAGE4bGdVCGLEZmlcsJKaHyA65CQ9k+jFMS8RnY4yFFDctJoqxPEYhB
rRiZo4ThayVrqe5om/8L5oM5GPElLJX1e0Ghxnng/Uc4jAVFG/p3ydXVDPtqVVFv
6kuGcip7bM4Bmb1U7iZgg2TLurXq4ZMCYYgphJKvDkpLpMlW2lpmVmRaByujyWcA
fI3RzKnpDiefpDmecSUP
=KVlc
-----END PGP SIGNATURE-----
--=-=-=--
