From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on
	S5PV210/S5PC110.
Date: Wed, 7 Jul 2010 13:40:39 +0900
Message-ID: <AANLkTinwGaBt-vOVThBb1yoevkHZtxQTQzZ2b5Nyt3dY@mail.gmail.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
	<20100706071245.GA5058@n2100.arm.linux.org.uk>
	<013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44632 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750916Ab0GGEkk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 00:40:40 -0400
Received: by pwi5 with SMTP id 5so2274481pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jul 2010 21:40:40 -0700 (PDT)
In-Reply-To: <013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Jul 7, 2010 at 8:27 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Russell King wrote:
>>
> Hi Russell :-)
>
>> On Tue, Jul 06, 2010 at 01:36:47PM +0900, Kukjin Kim wrote:
>> > This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5P=
C110.
>> > Because smallest size of a bank on S5PV210/S5PC110 is aligned by 1=
6MB.
>> > So each section's maximum size should be 16MB.
>>
>> What is the spacing of chunks of memory, and minimum alignment of th=
ose
>> chunks in physical address space?
>
> Some S5PC110(MCP D-type) has only available 80MiB in a bank.
> So the space accounts for 432MiB in a DMC0, but larger memory(256MiB =
+
> 128MiB) exists in a DMC1.

It's OneDRAM consists of 80MiB for AP, 16MiB for shared between AP and
CP, and last 32MiB for CP.
Even though we use the dedicated 80MiB for AP. we also use the shared
16MiB at AP side.
Then can we access the last 32MiB? the answer is no. But it's
connected physically. so we can't  use the last 32MiB area for other
case.

Additionally it's almost difficult to 16MiB align by Spec.

Memory Chip0 Configuration Register (MemConfig0, R/W,
Address=3D0xF000_0008, 0xF140_0008)

chip_mask [23:16] AXI Base Address Mask
Upper address bit mask to determine AXI offset address of memory chip0.
0 =3D Corresponding address bit is not to be used for comparison
1 =3D Corresponding address bit is to be used for comparison
=46or example, if chip_mask =3D 0xF8, then AXI offset address
becomes 0x0000_0000 ~ 0x07FF_FFFF. If AXI base address
of memory chip0 is 0x2000_0000, then memory chip0 has an
address range of 0x2000_0000 ~ 0x27FF_FFFF.

Thank you,
Kyungmin Park

>
> As you know, the size of a section should be a power of 2 and a physi=
cal
> address space of a section should be contiguous.
> If a section size is greater than 16MiB, a section have a hole. So th=
e
> SECTION_SIZE_BITS should be 16MiB.
>
>>
>> Also, what is the maximum physical address which memory can be locat=
ed?
>
> Following is memory map of S5PV210/S5PC110.
>
> 0x80000000 =A0-------------------
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x70000000 =A0| =A0 =A0 =A0 =A0 =A0|
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x60000000 =A0| =A0DMC 1 =A0| =A0up to 1GiB
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x50000000 =A0| =A0 =A0 =A0 =A0 =A0|
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x40000000 =A0-----------------
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x30000000 =A0| =A0DMC 0 =A0| =A0up to 512MiB
> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0|
> 0x20000000 =A0-------------------
>
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
