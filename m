From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v6 00/10] Add device tree support for PL330 dma controller driver
Date: Tue, 11 Oct 2011 20:35:36 +0530
Message-ID: <CAJuYYwR_syveV=4Qb9-ZSi0dt7RWtRkXmJRoY8067-_BKv0rJg@mail.gmail.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
	<057401cc880e$41e30b20$c5a92160$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46566 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373Ab1JKPFj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 11:05:39 -0400
Received: by bkbzt4 with SMTP id zt4so9904779bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2011 08:05:37 -0700 (PDT)
In-Reply-To: <057401cc880e$41e30b20$c5a92160$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: vinod.koul@intel.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>

Hi Vinod,

On 11 October 2011 17:36, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Changes since v5:
>> - Added alias clocks for pdma clocks on Exynos4.
>> - Modified platform data for s5p64x0, s5pc100 and s5pv210.
>> - Rebased on the tip of for-next branch of linux-samsung kernel and
> tested.
>>
>> Changes since v4:
>> - Rebased with Samsung maintainer's for-next branch which is at
> linux-3.1-rc7
>> =A0 - Modified Patch 6/6 to apply cleanly.
>>
>> Changes since v3:
>> - In Patch 4/6, a recommendation is added in the pl330 binding
> documentation
>> =A0 for the name of the property which specifies the dma channel in =
the
> client
>> =A0 device node.
>> - In Patch 6/6, dropped #ifdef around of_have_populated_dt.
>>
>> Changes since v2:
>> - Only the sixth patch is changed, to make dma platform data conditi=
onally
>> =A0 selectable.
>> - Tested with v8 version of pl330 dma driver update patches from Boo=
jin
> Kim.
>>
>> Changes since v1:
>> - Removed "arm,pl330-pdma" and "arm,pl330-mdma" compatible values.
>> - Removed "arm,primecell-periphid" and "arm,pl330-peri-reqs"
>> =A0 property requirements.
>>
>> This patchset adds device tree support for PL330 driver and uses it =
to add
>> device tree support for Samsung platforms, specifically Exynos4.
>>
>> Patch 1 moves the pl330_filter function from Samsung specific wrappe=
rs to
> pl330
>> dma driver and also adds a check to ensure that the filter function
> proceeds
>> only if it the dma channel being investigated belongs to pl330 dma
> controller
>> instance.
>>
>> Patch 2 adds support to infer the direction of the dma transfer usin=
g the
>> direction specified with the transfer request instead of including t=
his
>> information in the platform data. This simlifies the addition of dev=
ice
> tree
>> support. Patch 3 simplifies the platform data for Exynos4 pl330 dma
> controllers.
>>
>> Patch 4 adds device tree support for pl330 dma controller driver. A =
dma
> channel
>> is represented using a phandle of the dma controller node and the ch=
annel
> id
>> within that controller. Client driver request a dma channel using th=
e
> phandle
>> and channel id pair. Correspondingly, the pl330 filter function has =
been
>> modified to lookup a channel based on this value.
>>
>> Patch 5 adds device tree support for Samsung's DMA engine wrappers. =
Client
>> drivers retrive the channel property from their device node and pass=
 it to
> the
>> wrappers. The wrapper functions use the property value as the filter
> function
>> parameter. Patch 6 restricts the usage of pl330 device and platform =
data
>> instances to non-dt platforms.
>>
>> Patch 7 adds clock alias for both the pdma clocks. When pdma control=
lers
> are
>> instantiated from device tree, the amba device registration process
> enables
>> clock to the controllers to read the peripheral id of the PDMA amba
> device. In
>> case of Exynos4, the clocks to the PDMA controllers are named as 'dm=
a' but
>> amba_device_register() looks up the clock using the name 'apb_pclk'.
> Hence,
>> alias clocks with name 'apb_pclk' clock are created for clocks with =
name
> 'dma'.
>>
>> Patch 8 to 10 simplifies the pdma platform data for s5p64x0, s5pc100=
 and
>> s5pv210.
>>
>> This patchset is based on the following tree:
>> https://github.com/kgene/linux-samsung.git =A0 branch: for-next
>>
>> and tested tested for both device-tree and non-device-tree kernel on
> smdkv310.
>>
>> This patchset has dependency on the following patchset.
>> [PATCH V2 0/2] Add a common macro for creating struct clk_lookup ent=
ries.
>>
>>
>> Thomas Abraham (10):
>> =A0 DMA: PL330: move filter function into driver
>> =A0 DMA: PL330: Infer transfer direction from transfer request inste=
ad of
> platform
>> data
>> =A0 ARM: EXYNOS4: Modify platform data for pl330 driver
>> =A0 DMA: PL330: Add device tree support
>> =A0 ARM: SAMSUNG: Add device tree support for pl330 dma engine wrapp=
ers
>> =A0 ARM: EXYNOS4: Limit usage of pl330 device instance to non-dt bui=
ld
>> =A0 ARM: Exynos4: Add a alias for pdma clocks
>> =A0 ARM: S5P64x0: Modify platform data for pl330 driver
>> =A0 ARM: S5PC100: Modify platform data for pl330 driver
>> =A0 ARM: S5PV210: Modify platform data for pl330 driver
>>
>> =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0 =A0| =A0=
 30 +++
>> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 10 +
>> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A03 +-
>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 35 ++-
>> =A0arch/arm/mach-exynos4/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0227
> ++++++-----------
>> --
>> =A0arch/arm/mach-s5p64x0/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0227
> +++++-------------
>> =A0arch/arm/mach-s5pc100/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0247
> ++++++-----------
>> ---
>> =A0arch/arm/mach-s5pv210/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0241
> ++++++-----------
>> ---
>> =A0arch/arm/plat-samsung/dma-ops.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 15 +-
>> =A0arch/arm/plat-samsung/include/plat/dma-ops.h =A0 =A0 =A0 | =A0 =A0=
1 +
>> =A0arch/arm/plat-samsung/include/plat/dma-pl330.h =A0 =A0 | =A0 =A03=
 +-
>> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 99 +++++----
>> =A0include/linux/amba/pl330.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 15 +-
>> =A013 files changed, 405 insertions(+), 748 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/dma/arm-pl33=
0.txt
>
> Hi,
>
> Looks ok to me and if required,
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> And I hope since this includes many changes of arch/arm/Samsung stuff=
, this
> would be sent to upstream via Samsung tree after ack from Vinod for d=
ma
> stuff.

All the comments for this patchset that adds device tree support for
pl330 dma controller driver have been addressed. This patchset is
based on the linux-samsung kernel since there are many changes in the
samsung platform code included in this patchset.

If there are no other changes required, can this patchset be
considered for merge in 3.2 ?

Thanks,
Thomas.


>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
