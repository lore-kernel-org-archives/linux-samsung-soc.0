From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Boot hangs after "Starting kernel..." message [odroid u3]
Date: Fri, 12 Jun 2015 14:15:54 +0200
Message-ID: <557ACD7A.3040800@samsung.com>
References: <2289383.JOvxAabN12@home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14224 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbbFLMP6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 08:15:58 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPT00B2QZEKXQ00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Jun 2015 13:15:56 +0100 (BST)
In-reply-to: <2289383.JOvxAabN12@home>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas-Karl Pietrowski <thopiekar@gmail.com>, linux-samsung-soc@vger.kernel.org

Hello,

On 2015-06-12 14:00, Thomas-Karl Pietrowski wrote:
> Hello everyone,
>
>
> I'm just trying to get my kernel built for my Odroid U3, but no matter whether
> I use 4.0.x or the latest code from arm-soc repository 4.1.0-rc3, it ends at
> this message during boot:
>
> ###
>
> U-Boot 2015.07-rc1-00408-g012681b (May 30 2015 - 17:49:11 +0000)
>
> CPU:    Exynos4412@1000MHz
> Model: Odroid based on Exynos4412
> DRAM:  2 GiB
> ERROR: "regulator-name" of dev: "ldo18", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ERROR: "regulator-name" of dev: "ldo19", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ERROR: "regulator-name" of dev: "ldo23", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ERROR: "regulator-name" of dev: "ldo24", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ERROR: "regulator-name" of dev: "ldo26", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ERROR: "regulator-name" of dev: "buck9", has nonunique value: "nc"
> at drivers/power/regulator/regulator-uclass.c:294/regulator_post_bind()
> ldo20@VDDQ_EMMC_1.8V: set 1800000 uV; enabling
> ldo22@VDDQ_EMMC_2.8V: set 2800000 uV; enabling
> ldo21@TFLASH_2.8V: set 2800000 uV; enabling
> MMC:   SAMSUNG SDHCI: 0, EXYNOS DWMMC: 1
> Net:   No ethernet found.
> Hit any key to stop autoboot:  0
> reading boot.scr
> 1143 bytes read in 18 ms (61.5 KiB/s)
> ## Executing script at 40408000
> reading zImage-4.1
> 2497840 bytes read in 141 ms (16.9 MiB/s)
> reading exynos4412-odroidu3.dtb
> 54489 bytes read in 25 ms (2.1 MiB/s)
> Kernel image @ 0x40008000 [ 0x000000 - 0x261d30 ]
> ## Flattened Device Tree blob at 41f00000
>     Booting using the fdt blob at 0x41f00000
>     reserving fdt memory region: addr=41f00000 size=e000
>     Using Device Tree in place at 41f00000, end 41f10fff
>
> Starting kernel ...
>
> ###
>
> The error messages during uboot loading just appear because there is something
> missing in it's RC, but don't think it is the reason, because a old build
> (3.19.x) just boots.
> Sadly my serial output does not give better error messages, so I'm asking
> here, because google'ing around didn't point me to any solutions.
> Do you have any hints why that happens? My .config can be found here -
> http://pastebin.com/qRLmtmmt . Is there a way to get early error messages
> during boot?

Please goto 'Kernel hacking' page and enable 'Kernel low-level debugging 
functions' with 'Use Samsung S3C UART 1 for low-level debug' and then 
also enable 'Early printk'. Then add 'earlyprintk' to your kernel cmd 
line. I hope you are using the exynos4412-odroidu3.dtb compiled from the 
same kernel tree as zImage.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
