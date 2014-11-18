From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [BUG] blocked task after exynos_drm_init
Date: Tue, 18 Nov 2014 16:32:09 +0000
Message-ID: <CACxGe6sTnJ7i7jf+mPVsM0hunRM+uwzSzeHY0m2qy-i2Uu3NiQ@mail.gmail.com>
References: <1415264811.27478.4.camel@AMDC1943> <546B228E.6030500@samsung.com>
 <546B2508.8070409@samsung.com> <CABxcv=k9mTfezmU_a5SoaWuvY5em5QsdeJ01syKv-fScrLCPbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:61777 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932100AbaKRQca convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 11:32:30 -0500
Received: by mail-ob0-f173.google.com with SMTP id uy5so5260558obc.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 08:32:29 -0800 (PST)
In-Reply-To: <CABxcv=k9mTfezmU_a5SoaWuvY5em5QsdeJ01syKv-fScrLCPbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Inki Dae <inki.dae@samsung.com>, Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, Nov 18, 2014 at 12:29 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> [adding Kevin to cc list]
>
> Hello Inki,
>
> On Tue, Nov 18, 2014 at 11:52 AM, Inki Dae <inki.dae@samsung.com> wro=
te:
>> On 2014=EB=85=84 11=EC=9B=94 18=EC=9D=BC 19:42, Andrzej Hajda wrote:
>>> On 11/06/2014 10:06 AM, Krzysztof Kozlowski wrote:
>>>> Hi,
>>>>
>>>> On last next (next-20141104, next-20141105) booting locks after
>>>> initializing Exynos DRM (Trats2 board):
>>>>
>>>> [    2.028283] [drm] Initialized drm 1.1.0 20060810
>>>> [  240.505795] INFO: task swapper/0:1 blocked for more than 120 se=
conds.
>>>> [  240.510825]       Not tainted 3.18.0-rc3-next-20141105 #794
>>>> [  240.516418] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" =
disables this message.
>>>> [  240.524173] swapper/0       D c052534c     0     1      0 0x000=
00000
>>>> [  240.530527] [<c052534c>] (__schedule) from [<c0525b34>] (schedu=
le_preempt_disabled+0x14/0x20)
>>>> [  240.539030] [<c0525b34>] (schedule_preempt_disabled) from [<c05=
26d44>] (mutex_lock_nested+0x1c4/0x464)
>>>> [  240.548320] [<c0526d44>] (mutex_lock_nested) from [<c02be908>] =
(__driver_attach+0x48/0x98)
>>>> [  240.556562] [<c02be908>] (__driver_attach) from [<c02bcc00>] (b=
us_for_each_dev+0x54/0x88)
>>>> [  240.564717] [<c02bcc00>] (bus_for_each_dev) from [<c02bdce0>] (=
bus_add_driver+0xe4/0x200)
>>>> [  240.572876] [<c02bdce0>] (bus_add_driver) from [<c02bef94>] (dr=
iver_register+0x78/0xf4)
>>>> [  240.580864] [<c02bef94>] (driver_register) from [<c029e99c>] (e=
xynos_drm_platform_probe+0x34/0x234)
>>>> [  240.589890] [<c029e99c>] (exynos_drm_platform_probe) from [<c02=
bfcf0>] (platform_drv_probe+0x48/0xa4)
>>>> [  240.599090] [<c02bfcf0>] (platform_drv_probe) from [<c02be680>]=
 (driver_probe_device+0x13c/0x37c)
>>>> [  240.607940] [<c02be680>] (driver_probe_device) from [<c02be954>=
] (__driver_attach+0x94/0x98)
>>>> [  240.616360] [<c02be954>] (__driver_attach) from [<c02bcc00>] (b=
us_for_each_dev+0x54/0x88)
>>>> [  240.624517] [<c02bcc00>] (bus_for_each_dev) from [<c02bdce0>] (=
bus_add_driver+0xe4/0x200)
>>>> [  240.632679] [<c02bdce0>] (bus_add_driver) from [<c02bef94>] (dr=
iver_register+0x78/0xf4)
>>>> [  240.640667] [<c02bef94>] (driver_register) from [<c029e938>] (e=
xynos_drm_init+0x70/0xa0)
>>>> [  240.648739] [<c029e938>] (exynos_drm_init) from [<c00089b0>] (d=
o_one_initcall+0xac/0x1f0)
>>>> [  240.656914] [<c00089b0>] (do_one_initcall) from [<c074bd90>] (k=
ernel_init_freeable+0x10c/0x1d8)
>>>> [  240.665591] [<c074bd90>] (kernel_init_freeable) from [<c051eabc=
>] (kernel_init+0x8/0xec)
>>>> [  240.673661] [<c051eabc>] (kernel_init) from [<c000f268>] (ret_f=
rom_fork+0x14/0x2c)
>>>> [  240.681196] 3 locks held by swapper/0/1:
>>>> [  240.685091]  #0:  (&dev->mutex){......}, at: [<c02be908>] __dri=
ver_attach+0x48/0x98
>>>> [  240.692732]  #1:  (&dev->mutex){......}, at: [<c02be918>] __dri=
ver_attach+0x58/0x98
>>>> [  240.700367]  #2:  (&dev->mutex){......}, at: [<c02be908>] __dri=
ver_attach+0x48/0x98
>>>
>>>
>>> This is caused by patch moving platform devices to
>>> /sys/devices/platform[1]. Since this patch registering platform
>>> drivers/devices in probe of platform device causes deadlocks. I gue=
ss
>>> now all driver registration should be moved to exynos_drm_init and =
it
>>> seems better location for it IMHO.
>>
>> Thanks. It might be a chance that we could separate sub drivers of
>> Exynos drm into independent modules so that they can be called
>> independently because if we move them to exynos_drm_init then the
>> deferred probe wouldn't work correctly.
>>
>
> I don't understand why registering the platform drivers in the
> exynos_drm_init() will make deferred probing to not work correctly?
> AFAICT it does not matter where the driver is registered since if the
> driver probe function is called when the driver is attached and fails
> with -EPROBE_DEFER, it will be added to the deferred list and the
> probe function will be retried when other drivers are registered due
> devices being added (e.g: by OF when matching a compatible string). O=
r
> maybe I'm missing something here?

It's only by luck that it even worked before.

I think the problem is that exynos_drm_init() is registering a normal
(non-OF) platform device, so the parent will be /sys/devices/platform.
It immediately gets bound against exynos_drm_platform_driver which
calls the exynos drm_platform_probe() hook. The driver core obtains
device_lock() on the device *and on the device parent*.

Inside the probe hook, additional platform_drivers get registered.
Each time one does, it tries to bind against every platform device in
the system, which includes the ones created by OF. When it attempts to
bind, it obtains device_lock() on the device *and on the device
parent*.

Before the change to move of-generated platform devices into
/sys/devices/platform, the devices had different parents. Now both
devices have /sys/devices/platform as the parent, so yes they are
going to deadlock.

The real problem is registering drivers from within a probe hook. That
is completely wrong for the above deadlock reason. __driver_attach()
will deadlock. Those registrations must be pulled out of .probe().

Registering devices in .probe() is okay because __device_attach()
doesn't try to obtain device_lock() on the parent.

g.

>
> By the way, I tried moving the platform driver registration to
> exynos_drm_init() as suggested by Andrzej and it fixed both the issue
> reported in $subject (which is the same reported by Kevin) and the
> infinite loop you were tried to fix with your "drm/exynos: fix
> infinite loop issue incurred by no pair" patch.
>
> I didn't have display working but that is expected since the machine
> is a Peach Pit that has a eDP/LVDS bridge and needs out-of-tree
> patches.
>
> I also reverted a few patches on linux-next that said to be fixing
> infinite loop issues,  these are:
>
> 7afbfcc drm/exynos: fix possible infinite loop issue (in fact I had t=
o
> revert this to move the registration from the probe function)
> f7c2f36f drm/exynos: resolve infinite loop issue on non multi-platfor=
m
> 06a2f5c drm/exynos: resolve infinite loop issue on multi-platform
>
> And I didn't have the infinite loop issue, so I wonder if those
> patches are really necessary or were trying to fix the cause explaine=
d
> by Andrzej.
>
> Best regards,
> Javier
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
