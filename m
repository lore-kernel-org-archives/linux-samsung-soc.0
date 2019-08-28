From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date: Wed, 28 Aug 2019 10:22:37 +0200
Message-ID: <1ade54c6-aaf9-f536-484e-a2a50f443a03@samsung.com>
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
 <CGME20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a@eucas1p2.samsung.com>
 <20190826103142.3477-4-m.szyprowski@samsung.com>
 <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <maz@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marc,

On 2019-08-26 12:49, Marc Zyngier wrote:
> On 2019-08-26 11:31, Marek Szyprowski wrote:
>> ARM architected timer can be used together with Exynos MultiCore Timer
>> driver, so enable support for it. Support for ARM architected timers is
>> essential for enabling proper KVM support.
>
> How can you say that this is to "enable KVM support", while in the 
> previous
> patch, you set "arm,cpu-registers-not-fw-configured" which implies 
> that you're
> booting in secure mode with the timer's CP15 registers left to 
> undefined values?

Thanks for asking a good question!

I've did my KVM research mainly on Exynos5422-based OdroidXU3/XU4 boards 
family. After some recently merged patches they all now boot correctly 
in HYP mode.

On all of those boards arch timers are indeed partially not configured 
(CNTFRQ is zero). I was convinced that this also requires adding 
"arm,cpu-registers-not-fw-configured" property to make timers fully 
operational, but it looks that this only disables VDSO on arm32 and 
switches to phys timers if booted in SVC mode.

I've checked and KVM works fine on the mentioned boards regardless of 
the "arm,cpu-registers-not-fw-configured" property. The only issue is 
the lack of proper value in CNTFRQ register, what requires patching 
timer node by adding "clock-frequency = <24000000>" property also to the 
guest dtb.

I've did my test of KVM with QEMU emulator version 3.1.0 (Debian 
1:3.1+dfsg-8) virtualizing vexpress-a15 machine, with patched 
vexpress-v2p-ca15-tc1.dtb and the following command line on OdroidXU3:

taskset 0x30 qemu-system-arm -M vexpress-a15 -smp 2 -cpu host 
-enable-kvm -m 512 -kernel zImage -dtb vexpress-v2p-ca15-tc1.dtb -append 
"console=ttyAMA0 root=/dev/vda rw rootwait" -serial stdio -display none 
-monitor null -device virtio-blk-device,drive=virtio-blk -drive 
file=rootfs.raw,id=virtio-blk,if=none,format=raw -netdev user,id=user 
-device virtio-net-device,netdev=user

Then I've checked other boards that are capable of running in HYP mode. 
Exynos5250 Arndale board with mainline uboot boots to HYP fine. 
Exynos5250-based Snow Chromebook with stock bootloader boots only to SVC 
mode. There exists a way to upgrade uboot to enable HYP, but this 
requires HW fix to enable write access to nvram. Both boards however 
also don't configure CNTFRQ register, but otherwise the arch timer 
registers seems to be configured fine (virt counters are in sync between 
CPUs).

The last group of boards are Exynos5420-based Pit and Exynos5800-based 
Pi Chromebooks. In theory they are capable in running HYP mode with a 
patched bootloader, but stock bootloader boots only to SVC. They also 
truly don't have arch timer registers correctly configured, as virt 
timers are out of sync between CPUs.

I will send v3 with "arm,cpu-registers-not-fw-configured" property moved 
from the timer nodes in dtsi files to respective effected boards.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
