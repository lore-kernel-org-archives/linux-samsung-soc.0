From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: Odroid U3 - Upgrade to latest u-boot kernel load fails.
Date: Tue, 19 Mar 2019 15:12:49 +0530
Message-ID: <CANAwSgQo7=hHZpR8p6c9yZaMDap8eGEUG52y+Qva=JfiNDN0vg@mail.gmail.com>
References: <CANAwSgR8SNYT4JmGu_U-wGGJcEtkEmBnWaSMae1MEPYh07vbXg@mail.gmail.com>
 <CAJKOXPcg9QkW3cwY2BQ1CoNCqtS1mSfK88=iA5iCF57PoxiR9g@mail.gmail.com>
 <CANAwSgTpQQNsPTpU-CXoKrZrgYxq2F+J9MWhcGY0NNCB5x_p2w@mail.gmail.com>
 <CAJKOXPfm49g6quuX5jxoZ8-d=-5vBVRkTwO-_jhB-w7Ki8Jo1w@mail.gmail.com>
 <CANAwSgTpzXzfs6EBC9ydpyWJxLtMyefYNnCaSkMHs-=ppYwNeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANAwSgTpzXzfs6EBC9ydpyWJxLtMyefYNnCaSkMHs-=ppYwNeQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,


On Tue, 19 Mar 2019 at 01:54, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Mon, 18 Mar 2019 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, 18 Mar 2019 at 18:49, Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > Hi Krzysztof,
> > >
> > > On Mon, 18 Mar 2019 at 18:20, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > On Mon, 18 Mar 2019 at 13:32, Anand Moon <linux.amoon@gmail.com> wrote:
> > > > >
> > > > > Hi Krzysztof / Marek,
> > > > >
> > > > > After I update the latest u-boot on my Odroud U3+ it fails to load the
> > > > > kernel it hangs.
> > > > > I am using Archlinux on Odroid U3.
> > > > >
> > > > > U-Boot 2019.04-rc3-00131-g8303467e80d-dirty (Mar 18 2019 - 12:12:23 +0000)
> > > > >
> > > > > CPU:   Exynos4412 @ 1 GHz
> > > > > Model: Odroid based on Exynos4412
> > > > > Type:  u3
> > > > > DRAM:  2 GiB
> > > > > LDO20@VDDQ_EMMC_1.8V: set 1800000 uV; enabling
> > > > > LDO22@VDDQ_EMMC_2.8V: set 2800000 uV; enabling
> > > > > LDO21@TFLASH_2.8V: set 2800000 uV; enabling
> > > > > MMC:   SAMSUNG SDHCI: 1, EXYNOS DWMMC: 0
> > > > > Loading Environment from MMC... Card did not respond to voltage select!
> > > > > *** Warning - No block device, using default environment
> > > > >
> > > > > Net:   No ethernet found.
> > > > > Hit any key to stop autoboot:  0
> > > > > switch to partitions #0, OK
> > > > > mmc1 is current device
> > > > > Scanning mmc 1:1...
> > > > > Found U-Boot script /boot/boot.scr
> > > > > 769 bytes read in 6 ms (125 KiB/s)
> > > > > ## Executing script at 42000000
> > > > > 6901856 bytes read in 253 ms (26 MiB/s)
> > > > > 53078 bytes read in 19 ms (2.7 MiB/s)
> > > > > 6590950 bytes read in 240 ms (26.2 MiB/s)
> > > > > Kernel image @ 0x41000000 [ 0x000000 - 0x695060 ]
> > > > > ## Flattened Device Tree blob at 40800000
> > > > >    Booting using the fdt blob at 0x40800000
> > > > >    Loading Ramdisk to 4f9b6000, end 4ffff1e6 ... OK
> > > > >    Loading Device Tree to 4f9a6000, end 4f9b5f55 ... OK
> > > > >
> > > > > Starting kernel ...
> > > >
> > > > Can you attach your boot.init file (the source of boot.scr)?
> > > >
> > > > By the size of DTB you can see that different DTB is loaded. I assume
> > > > you tried to boot the same kernel, then it could mean that boardname
> > > > was used instead of board_name to choose DTB. Suspicious is that
> > > > kernel size also differs... so maybe you booted something else? As
> > > > usual debugging practice, reduce number of unknown factors. Do not
> > > > change kernel and U-Boot at the same time.
> > > >
> > > > Also, you can try reverting commit e6b1467081d3 ("arm: exynos: Remove
> > > > duplicated "boardname" env setting") and see if it helps. Or just try
> > > > to bisect around changes coming from u-boot samsung tree. Try booting
> > > > v2019.01 and paste the results as well.
> > > >
> > > > Best regards,
> > > > Krzysztof
> > > >
> > >
> > > I have tested with pre-compiled image and the cross compiled kernel image
> > > both failed to load the kernel.
> > >
> > > No revert of the commit e6b1467081d3 did not help.
> > >
> > > Yes it seem strange that that load address is changes some how in the u-boot env
> > >
> > > printenv setting of the latest u-boot     U-Boot
> > > 2019.04-rc3-00131-g8303467e80d-dirty
> > > [0] https://pastebin.com/1Hgc5xxC      (newu-boot.txt)
> > >
> > > printenv setting for the old u-boot.      U-Boot 2018.01-1
> > > [1] https://pastebin.com/wD6zK6eG    (oldu-boot.txt)
> > >
> > > Attach is the boot.txt (boot.scr), also the u-boot env old and u-boot-env new
> >
> > And does 2019.01 work?
> >
> > Krzysztof
>
> It looks like Archlinux uboot for Odroid U3 set some extra environment variable to make this work.
>
> [0] https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/uboot-odroid/0001-Convert-odroid-to-use-distro_bootcmd.patch
> [1] https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/uboot-odroid/0002-odroid-x-support.patch
>
> I gave these patches a try but no success
>
> Best Regards
> -Anand

If found out the commit that break the boot on Odroid U3
Revert of below commit breaks the booting of the kernel.

From: Seung-Woo Kim <sw0312.kim@samsung.com>
Date: Tue, 20 Nov 2018 14:54:39 +0900
Subject: [PATCH] Revert "arm: config: fix default console only to specify the
 device"

This reverts commit 232ed3ca534708527a9515c7c41bc3542949525c.

In exynos boards, ${console} is used to set bootargs but it sets
without "console=", so CONFIG_DEFAULT_CONSOLE for these boards is
designated with "console=" but it is removed. So revert the commit.

References for using ${console} in
   board/samsung/common/bootscripts/autoboot.cmd
   board/samsung/common/bootscripts/bootzimg.cmd

Please let me know it how to resolve this issue.

Best Regards
-Anand
