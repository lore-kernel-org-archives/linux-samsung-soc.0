From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: exynos4210 not booting
Date: Sat, 16 Mar 2013 14:02:30 +0530
Message-ID: <CAG17yqRi=BS95wzYcKiUWLyGaAH2raY6VWYWsWQKT9=HfaWgeQ@mail.gmail.com>
References: <51434CFF.3050806@linaro.org>
	<CAAgF-Bf8AJseo-i_Eb6SMJt_YO=O54gELbiv+PjXHYDkikiMzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:45704 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750848Ab3CPIcb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Mar 2013 04:32:31 -0400
Received: by mail-wg0-f43.google.com with SMTP id e12so3263430wge.34
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Mar 2013 01:32:30 -0700 (PDT)
In-Reply-To: <CAAgF-Bf8AJseo-i_Eb6SMJt_YO=O54gELbiv+PjXHYDkikiMzw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On 16 March 2013 12:51, Padma Venkat <padma.kvr@gmail.com> wrote:
> Hi,
>
> On Fri, Mar 15, 2013 at 10:01 PM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> Using the exynos4_defconfig and compiling the kernel from the samsun=
g
>> git tree at 3.9-rc1, I am stuck.
>>
>> Does anyone have any idea ?
>>
>> Thanks !
>>
>>   -- Daniel
>>
>> --------------------------------------------------------
>>
>> U-Boot 2013.01.-rc1 (Dec 08 2012 - 12:15:17) for ORIGEN
>>
>> CPU:    Exynos4210@1000MHz
>>
>> Board: ORIGEN
>> DRAM:  1 GiB
>> WARNING: Caches not enabled
>> MMC:   SAMSUNG SDHCI: 0
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Hit any key to stop autoboot:  0
>> reading uImage
>> 1385264 bytes read
>> reading uInitrd
>> 3780878 bytes read
>> reading board.dtb
>> 16717 bytes read
>> ## Booting kernel from Legacy Image at 40007000 ...
>>    Image Name:   Linux-3.9.0-rc1
>>    Image Type:   ARM Linux Kernel Image (uncompressed)
>>    Data Size:    1385200 Bytes =3D 1.3 MiB
>>    Load Address: 40008000
>>    Entry Point:  40008000
>>    Verifying Checksum ... OK
>> ## Loading init Ramdisk from Legacy Image at 42000000 ...
>>    Image Name:   initramfs
>>    Image Type:   ARM Linux RAMDisk Image (uncompressed)
>>    Data Size:    3780814 Bytes =3D 3.6 MiB
>>    Load Address: 00000000
>>    Entry Point:  00000000
>>    Verifying Checksum ... OK
>> ## Flattened Device Tree blob at 41f00000
>>    Booting using the fdt blob at 0x41f00000
>>    Loading Kernel Image ... OK
>> OK
>>    Using Device Tree in place at 41f00000, end 41f0714c
>>
>> Starting kernel ...
>
> Can you please try with below patches?
>
> This is required for non-DT case and it is not yet merged.
> https://patchwork.kernel.org/patch/2218321/
>
> For DT case below patch is required and this got merged in kgene tree=
=2E
> https://patchwork.kernel.org/patch/2210621/
>

Also check CONFIG_S3C_LOWLEVEL_UART_PORT, it needs to be 2 for origen.

Hope it helps.

Thanks,
Inder

> Thanks
> Padma
>>
>> --
>>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software =
for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
