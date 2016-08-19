From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: samsung: Add GPFx support of Exynos5433
Date: Fri, 19 Aug 2016 20:31:44 +0900
Message-ID: <CA+Ln22EaUmdrfLXJfYPAtCQ1DY4Y5iLWr-tqG67-P9hSXKMC6w@mail.gmail.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <CGME20160816062943epcas1p15015ed6a3e22ef0b723c2b84edc93d3d@epcas1p1.samsung.com>
 <1471328843-26653-5-git-send-email-cw00.choi@samsung.com> <57B6CC38.9090403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57B6CC38.9090403@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, InKi Dae <inki.dae@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, jaewon02.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

2016-08-19 18:07 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> Hi Tomasz Figa,
>
> Due to wrong setting of email client,
> your reply is deleted on my email client at the company.

I used Gmail (in plain text mode) to reply, was that related?

> I'm so sorry. So, I add your comment on below and then
> I reply the detailed description.

No problem. Thanks for description.

>
> On 2016=EB=85=84 08=EC=9B=94 16=EC=9D=BC 15:27, Chanwoo Choi wrote:
>> From: Joonyoung Shim <jy0922.shim@samsung.com>
>>
>> This patch add the support of GPFx pin of Exynos5433 SoC. Exynos5433 has
>> different memory map of GPFx from previous Exynos SoC. Exynos GPIO has
>> following register to control gpio funciton. Usually, all registers of G=
PIO
>> are included in same domain.
>> - CON / DAT / PUD / DRV / CONPDN / PUDPDN
>> - EINT_CON/ EINT_FLTCON0, EINT_FLTCON1 / EINT_MASK / EINT_PEND
>>
>> But, GPFx are included in two domain as following. So, this patch suppor=
ts
>> the GPFx pin which handle the on separate two domains.
>> - ALIVE domain : CON / DAT / PUD / DRV / CONPDN / PUDPDN
>> - IMEM domain  : EINT_CON/ EINT_FLTCON0, EINT_FLTCON1 / EINT_MASK / EINT=
_PEND
>
> ---------
> I'm afraid I don't get anything from the description above. Could you
> describe the layout of registers in memory map and IRQ routing of the
> pins?
>
> Best regards,
> Tomasz
> ----------
>
> On this patch, I'm sorry that I described the wrong information about GFP=
1~5.
> I explained the memory map of GPF[1-5] the oppositely. Following composit=
ions
> are correct.
> - ALIVE : WEINT_FLTCONx, WEINT_MASK, WEING_PEND
> - IMEM : CON, DAT, PUD, DRV, CONPDN, PUDPDN
> And, I add the memory map for GPF[1~5][2] and the wakeup interrupt inform=
ation[1].
>
> [1] Memory map for GPF1~5
> [ALIVE]
> WEINT_GPA0_CON         : 0x1058_0000 (ALIVE) + (0x0700 =3D 0x0700 + 0x0)
> WEINT_GPA1_CON         : 0x1058_0000 (ALIVE) + (0x0704 =3D 0x0700 + 0x4)
> WEINT_GPA2_CON         : 0x1058_0000 (ALIVE) + (0x0708 =3D 0x0700 + 0x8)
> WEINT_GPA3_CON         : 0x1058_0000 (ALIVE) + (0x070C =3D 0x0700 + 0xC)
>
> WEINT_GPF1_CON         : 0x1058_0000 (ALIVE) + (0x1704 =3D 0x0700 + 0x100=
4)
> WEINT_GPF2_CON         : 0x1058_0000 (ALIVE) + (0x1708 =3D 0x0700 + 0x100=
8)
> WEINT_GPF3_CON         : 0x1058_0000 (ALIVE) + (0x170C =3D 0x0700 + 0x100=
C)
> WEINT_GPF4_CON         : 0x1058_0000 (ALIVE) + (0x1710 =3D 0x0700 + 0x100=
10)
> WEINT_GPF5_CON         : 0x1058_0000 (ALIVE) + (0x1714 =3D 0x0700 + 0x101=
4)
>
> WEINT_GPF[x]_MASK     : 0x1058_0000 (ALIVE) + (0x1900 + (x * 4))
> WEINT_GPF[x]_PEND     : 0x1058_0000 (ALIVE) + (0x1A00 + (x * 4))
> (x : 1 ~ 5)
>
> [IMEM]
> GPF1_CON          : 0X1109_0000 (IMEM) + 0x0020
> GPF1_DAT           : 0X1109_0000 (IMEM) + 0x0024
> GPF1_PUD          : 0X1109_0000 (IMEM) + 0x0028
> GPF1_DRV          : 0X1109_0000 (IMEM) + 0x002C
> GPF1_CONPDN  : 0X1109_0000 (IMEM) + 0x0030
> GPF1_PUDPDN  : 0X1109_0000 (IMEM) + 0x0034
>
> GPF2_CON         : 0X1109_0000 (IMEM) + 0x0040
> ...
> GPF3_CON         : 0X1109_0000 (IMEM) + 0x0060
> ...
> GPF4_CON         : 0X1109_0000 (IMEM) + 0x0080
> ...
> GPF5_CON         : 0X1109_0000 (IMEM) + 0x00A0
>
> [2] Interrput pin information
> - the total number of wakeup external IRQ is 64.
> -------------------------------------------------------------------------=
---------
> domain| gpio : nr  | wakeup interrput name   | SPI number       |
> -------------------------------------------------------------------------=
----------
> ALIVE | GPA0 : 8 | INTREQ__EINT[0~7]     | SPI[0] ~ SPI[7]   |
> ALIVE | GPA1 : 8 | INTREQ__EINT[8~15]   | SPI[8] ~ SPI[15] |
> ALIVE | GPA2 : 8 | INTREQ__EINT_16_63 | SPI[16]               |
> ALIVE | GPA3 : 8 | INTREQ__EINT_16_63 | SPI[16]               |
> -------------------------------------------------------------------------=
----------
> ALIVE | GPF1 : 8 | INTREQ__EINT_16_63 | SPI[16]               |
> ALIVE | GPF2 : 4 | INTREQ__EINT_16_63 | SPI[16]               |
> ALIVE | GPF3 : 4 | INTREQ__EINT_16_63 | SPI[16]               |
> ALIVE | GPF4 : 8 | INTREQ__EINT_16_63 | SPI[16]               |
> ALIVE | GPF5 : 8 | INTREQ__EINT_16_63 | SPI[16]               |
> -------------------------------------------------------------------------=
----------
>
> In summary,
> If gpf[1-5] handle the CON/DAT/PUD/DRV register,
> the driver will use the drvdata->ext_base (IMEM base address)
> instead of drvdata->virt_base(ALIVE base address)
> because the CON/DAT/PUD/DRV register of gpf[1-5] are included
> in the IMEM domain.
>
> If gpf[1-5] handle the WEINT_* register,
> the driver will use the drvdata->virt_base(ALIVE base address)
> because the WEINT_* registers of gpf[1-5] are included in the ALIVE domai=
n.

Okay, so Krzysztof's suggestion doesn't apply because it's not the
eint base which is displaced, but the pinctrl base. I'd suggest the
following solution then:

- make samsung_pinctrl_drv_data::virt_base an array and save there all
mapped iomem resources,

- add unsigned pctl_base_res_idx to samsung_pin_bank_data that would
be the index of iomem resource into which the
samsung_pin_bank_data::pctl_offset is an offfset, Existing
EXYNOS_PIN_BANK* macros don't need to be changed, because the field
would be 0 by default. Then only the new bank type macro would have
another argument that would be the resource index,

- replace samsung_pin_bank::pctl_offset with void __iomem *pctl_base
and precalculate the addresses at probe time for each bank (pctl_base
=3D virt_base[pctl_base_res_idx] + samsung_pin_bank_data::pctl_offset).
Since currently there is only a problem with pctl_base and eint_base
seems to be only one, EINT code can simply use virt_base[0] all the
time for now.

Also you should document the second regs entry in the DT binding.

What do you think?

Best regards,
Tomasz
