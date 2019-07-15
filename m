From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/3] Fix USB3.0 DRD PHY calibration issues (DWC3/XHCI)
 on Exynos542x SoCs
Date: Mon, 15 Jul 2019 14:19:04 +0200
Message-ID: <7b9700b5-fe8b-8a15-e136-9a2afd1619ab@samsung.com>
References: <CGME20190627071741eucas1p1af1430c91f636c5766a76f7ef93019da@eucas1p1.samsung.com>
        <20190627071726.30467-1-m.szyprowski@samsung.com>
        <CANAwSgS2fQ_TvABeFzZ23GaeweKDEcAoKWJDMZ=p8vTd7BSp_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgS2fQ_TvABeFzZ23GaeweKDEcAoKWJDMZ=p8vTd7BSp_A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Anand,

On 2019-06-28 17:32, Anand Moon wrote:
> Hi Marek,
>
> On Thu, 27 Jun 2019 at 12:47, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Dear All,
>>
>> Commit d8c80bb3b55b ("phy: exynos5-usbdrd: Calibrate LOS levels for
>> exynos5420/5800") added support for Exynos5 USB3.0 DRD PHY calibration,
>> what enabled proper Super-Speed enumeration of USB3.0 devices connected
>> to various Exynos5 SoCs. After some time it turned out that the mentioned
>> patch worked a bit by pure luck and covered only one use case (fresh
>> boot with all drivers compiled into the kernel).
>>
>> If drivers were compiled as modules, due to timing issue, it worked only
>> if XHCI-plat driver was loaded before the DWC3 driver:
>> https://patchwork.kernel.org/patch/10773947/
>>
>> Also during the system suspend/resume cycle the calibration was not
>> performed at the proper time and resulted in switching USB 3.0 devices to
>> USB 2.0 high-speed compatibility mode.
>>
>> This patch addresses all those issues. Exynos5 USB3.0 DRD PHY calibration
>> is moved to the Exynos5 specific variant of the XHCI-plat driver, which
>> takes care of proper PHY calibration after XHCI core reset. This fixes
>> all known use cases (XHCI driver compiled as module and loaded on demand
>> as well as during system suspend/resume cycle).
>>
>> Here are the logs taken on Exynos5422-based Odroid HC1 board (with USB3.0
>> RTL8153 LAN and USB3.0 JMicron SATA-USB bridge):
>>
> Thanks for these patch. I have tested on linux-next-20190626
>
> *But hotpluging of usb device is not working on usb ports.*

Well, this is a bit poor report. I've checked various USB 3.0 devices 
with my XU4 board and didn't observe any issue with hotplug or 
enumeration. Could you describe a bit more how to trigger the issue?

> These patches fix the suspend/resume for XU4.
> But their is two issue.
> 1> On warm boot fails to reset the usb hub
> ------------------------------------------------------------------
> [    7.019896] usb 4-1.1: new SuperSpeed Gen 1 USB device number 3
> using xhci-hcd
> [    7.063032] usb 4-1.1: New USB device found, idVendor=152d,
> idProduct=0578, bcdDevice=63.01
> [    7.070484] usb 4-1.1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [    7.077438] usb 4-1.1: Product: JMS567
> [    7.081749] usb 4-1.1: Manufacturer: JMicron
> [    7.086028] usb 4-1.1: SerialNumber: DB12345678A3
> [    7.151572] scsi host0: uas
> [    7.162765] scsi 0:0:0:0: Direct-Access     KINGSTON  SA400S37120G
>    6301 PQ: 0 ANSI: 6
> [    7.176231] sd 0:0:0:0: [sda] 234441648 512-byte logical blocks:
> (120 GB/112 GiB)
> [    7.177550] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    7.183547] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [    7.201150] sd 0:0:0:0: [sda] Write Protect is off
> [    7.204977] sd 0:0:0:0: [sda] Disabling FUA
> [    7.209476] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [    7.219411] sd 0:0:0:0: [sda] Optimal transfer size 33553920 bytes
> not a multiple of physical block size (4096 bytes)
> [    7.713603]  sda: sda1
> [    7.736338] sd 0:0:0:0: [sda] Attached SCSI disk
> [   11.372630] xhci-hcd exynos5-dwc3-xhci.5.auto: Timeout while
> waiting for setup device command
> [   16.650624] xhci-hcd exynos5-dwc3-xhci.5.auto: Timeout while
> waiting for setup device command
> [   16.870255] usb 6-1: device not accepting address 2, error -62
> [   22.171093] xhci-hcd exynos5-dwc3-xhci.5.auto: Timeout while
> waiting for setup device command
> [   27.451021] xhci-hcd exynos5-dwc3-xhci.5.auto: Timeout while
> waiting for setup device command
> [   27.669956] usb 6-1: device not accepting address 3, error -62
> [   27.711656] usb usb6-port1: attempt power cycle
>
> some how 12500000.phy do not de-register when we perform reboot.

Sorry, but this is not related to PHY at all. If I get your log right, 
you have external USB3->SATA bridge which fails to enumerate in your 
case. Does it work right with other boards or vendor kernels? You 
connect it to the XU4 onboard USB3.0 hub, which cannot be programmed or 
controlled in any way, so I doubt we can do anything to fix your issue.


> [  120.260813] shutdown[1]: All loop devices detached.
> [  120.308592] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [  120.425890] usb 4-1.1: reset SuperSpeed Gen 1 USB device number 3
> using xhci-hcd
> [  120.500085] wake enabled for irq 155
> [  120.592335] reboot: Restartin
>
> Attach are the reboot logs.
> [0] https://pastebin.com/a3d712q4
>
> Second issue is the unbind on usb dwc3 fails.
>
> [root@archl-xu4m ~]# cd /sys/bus/platform/drivers/exynos5_usb3drd_phy/
> [root@archl-xu4m exynos5_usb3drd_phy]# ls -la
> total 0
> drwxr-xr-x   2 root root    0 Jun 28 14:08 .
> drwxr-xr-x 131 root root    0 Jun 28 14:08 ..
> lrwxrwxrwx   1 root root    0 Jun 28 14:11 12100000.phy ->
> ../../../../devices/platform/soc/12100000.phy
> lrwxrwxrwx   1 root root    0 Jun 28 14:11 12500000.phy ->
> ../../../../devices/platform/soc/12500000.phy
> --w-------   1 root root 4096 Jun 28 14:11 bind
> --w-------   1 root root 4096 Jun 28 14:08 uevent
> --w-------   1 root root 4096 Jun 28 14:11 unbind
> [root@archl-xu4m exynos5_usb3drd_phy]#
> [root@archl-xu4m exynos5_usb3drd_phy]#
> [root@archl-xu4m exynos5_usb3drd_phy]# echo 12500000.phy > unbind

This is not dwc3 unbind, but USB3.0 DRD PHY unbind. This is somehow 
expected as unbinding on fly a device, which provides resources to other 
driver (in this case USB phys) causes various issues due to the Linux 
kernel frameworks design. Please don't try such things, it won't work. 
Exynos DRD PHY driver should be marked with suppress_bind flag to hide 
bind/unbind attributes.


> [  194.138492] ------------[ cut here ]------------
> [  194.142104] WARNING: CPU: 6 PID: 292 at
> drivers/regulator/core.c:2036 _regulator_put.part.4+0x110/0x118
> [  194.156913] Modules linked in: s5p_mfc s5p_jpeg exynos_gsc
> v4l2_mem2mem v4l2_common videobuf2_dma_contig videobuf2_memops
> videobuf2_v4l2 videobuf2_common videodev mc s5p_cec
> [  194.171542] CPU: 6 PID: 292 Comm: bash Not tainted
> 5.2.0-rc6-next-20190626-xu4ml #21
> [  194.178963] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  194.184983] [<c0112794>] (unwind_backtrace) from [<c010dfec>]
> (show_stack+0x10/0x14)
> [  194.192732] [<c010dfec>] (show_stack) from [<c0ab30c0>]
> (dump_stack+0x98/0xc4)
> [  194.199887] [<c0ab30c0>] (dump_stack) from [<c0127b78>]
> (__warn.part.3+0xbc/0xec)
> [  194.207332] [<c0127b78>] (__warn.part.3) from [<c0127d10>]
> (warn_slowpath_null+0x44/0x4c)
> [  194.215491] [<c0127d10>] (warn_slowpath_null) from [<c04f8f3c>]
> (_regulator_put.part.4+0x110/0x118)
> [  194.224518] [<c04f8f3c>] (_regulator_put.part.4) from [<c04f8f70>]
> (regulator_put+0x2c/0x3c)
> [  194.232916] [<c04f8f70>] (regulator_put) from [<c05b8eb8>]
> (release_nodes+0x1c0/0x204)
> [  194.240791] [<c05b8eb8>] (release_nodes) from [<c05b4f20>]
> (device_release_driver_internal+0xec/0x1ac)
> [  194.250086] [<c05b4f20>] (device_release_driver_internal) from
> [<c05b2d38>] (unbind_store+0x60/0xd4)
> [  194.259189] [<c05b2d38>] (unbind_store) from [<c03332dc>]
> (kernfs_fop_write+0x100/0x1e0)
> [  194.267232] [<c03332dc>] (kernfs_fop_write) from [<c02a2f60>]
> (__vfs_write+0x30/0x1c4)
> [  194.275110] [<c02a2f60>] (__vfs_write) from [<c02a5a74>]
> (vfs_write+0xa4/0x184)
> [  194.282376] [<c02a5a74>] (vfs_write) from [<c02a5ccc>] (ksys_write+0x5c/0xd4)
> [  194.289472] [<c02a5ccc>] (ksys_write) from [<c0101000>]
> (ret_fast_syscall+0x0/0x28)
> [  194.297103] Exception stack(0xe50fbfa8 to 0xe50fbff0)
> [  194.302074] bfa0:                   0000000d 0054a958 00000001
> 0054a958 0000000d 00000000
> [  194.310284] bfc0: 0000000d 0054a958 b6e7ebc8 00000004 0054a958
> 0000000d 00000000 00000000
> [  194.318424] bfe0: 00000070 be9e1868 b6da3c80 b6dff784
> [  194.323614] irq event stamp: 20491
> [  194.326920] hardirqs last  enabled at (20515): [<c0199aac>]
> console_unlock+0x440/0x64c
> [  194.334720] hardirqs last disabled at (20522): [<c0199714>]
> console_unlock+0xa8/0x64c
> [  194.342690] softirqs last  enabled at (20540): [<c0102544>]
> __do_softirq+0x35c/0x654
> [  194.350403] softirqs last disabled at (20553): [<c012fd80>]
> irq_exit+0x158/0x16c
> [  194.357782] ---[ end trace 5ea20768939447c5 ]---
> [  194.363628] ------------[ cut here ]------------
> [  194.367095] WARNING: CPU: 6 PID: 292 at
> drivers/regulator/core.c:2036 _regulator_put.part.4+0x110/0x118
> [  194.376360] Modules linked in: s5p_mfc s5p_jpeg exynos_gsc
> v4l2_mem2mem v4l2_common videobuf2_dma_contig videobuf2_memops
> videobuf2_v4l2 videobuf2_common videodev mc s5p_cec
> [  194.392067] CPU: 6 PID: 292 Comm: bash Tainted: G        W
> 5.2.0-rc6-next-20190626-xu4ml #21
> [  194.400882] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  194.406902] [<c0112794>] (unwind_backtrace) from [<c010dfec>]
> (show_stack+0x10/0x14)
> [  194.414647] [<c010dfec>] (show_stack) from [<c0ab30c0>]
> (dump_stack+0x98/0xc4)
> [  194.421825] [<c0ab30c0>] (dump_stack) from [<c0127b78>]
> (__warn.part.3+0xbc/0xec)
> [  194.429284] [<c0127b78>] (__warn.part.3) from [<c0127d10>]
> (warn_slowpath_null+0x44/0x4c)
> [  194.437441] [<c0127d10>] (warn_slowpath_null) from [<c04f8f3c>]
> (_regulator_put.part.4+0x110/0x118)
> [  194.446469] [<c04f8f3c>] (_regulator_put.part.4) from [<c04f8f70>]
> (regulator_put+0x2c/0x3c)
> [  194.454868] [<c04f8f70>] (regulator_put) from [<c05b8eb8>]
> (release_nodes+0x1c0/0x204)
> [  194.462743] [<c05b8eb8>] (release_nodes) from [<c05b4f20>]
> (device_release_driver_internal+0xec/0x1ac)
> [  194.472038] [<c05b4f20>] (device_release_driver_internal) from
> [<c05b2d38>] (unbind_store+0x60/0xd4)
> [  194.481135] [<c05b2d38>] (unbind_store) from [<c03332dc>]
> (kernfs_fop_write+0x100/0x1e0)
> [  194.489175] [<c03332dc>] (kernfs_fop_write) from [<c02a2f60>]
> (__vfs_write+0x30/0x1c4)
> [  194.497056] [<c02a2f60>] (__vfs_write) from [<c02a5a74>]
> (vfs_write+0xa4/0x184)
> [  194.504323] [<c02a5a74>] (vfs_write) from [<c02a5ccc>] (ksys_write+0x5c/0xd4)
> [  194.511417] [<c02a5ccc>] (ksys_write) from [<c0101000>]
> (ret_fast_syscall+0x0/0x28)
> [  194.519050] Exception stack(0xe50fbfa8 to 0xe50fbff0)
> [  194.524020] bfa0:                   0000000d 0054a958 00000001
> 0054a958 0000000d 00000000
> [  194.532231] bfc0: 0000000d 0054a958 b6e7ebc8 00000004 0054a958
> 0000000d 00000000 00000000
> [  194.540372] bfe0: 00000070 be9e1868 b6da3c80 b6dff784
> [  194.545640] irq event stamp: 20765
> [  194.548824] hardirqs last  enabled at (20785): [<c0199aac>]
> console_unlock+0x440/0x64c
> [  194.556794] hardirqs last disabled at (20802): [<c0199714>]
> console_unlock+0xa8/0x64c
> [  194.564468] softirqs last  enabled at (20800): [<c0102544>]
> __do_softirq+0x35c/0x654
> [  194.572329] softirqs last disabled at (20819): [<c012fd80>]
> irq_exit+0x158/0x16c
> [  194.579679] ---[ end trace 5ea20768939447c6 ]---
> [root@archl-xu4m exynos5_usb3drd_phy]#
>
> I saw the peripherals get on/off during suspend resume but on no
> regulator disable/enable calls.

There is no such need and the regulators are shared during runtime, so 
they will be on anyway.

> Attach are the logs
> [2] https://pastebin.com/uQT2EYgX

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
