From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v5 8/8] arm64: dts: add <dt-bindings/> symlink
Date: Tue, 23 Sep 2014 14:24:00 +0530
Message-ID: <CAM4voamCVn6+BP0ycu6aGdnWZgVtbgv3-ERjVkO2kEU9aC9sfg@mail.gmail.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
	<1411361228-18279-9-git-send-email-a.kesavan@samsung.com>
	<012f01cfd702$7ed15c30$7c741490$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f44.google.com ([209.85.192.44]:39777 "EHLO
	mail-qg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755009AbaIWIyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 04:54:03 -0400
In-Reply-To: <012f01cfd702$7ed15c30$7c741490$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Chanho,

On Tue, Sep 23, 2014 at 1:16 PM, Chanho Park <chanho61.park@samsung.com> wrote:
> Hi,
>
>> -----Original Message-----
>> From: linux-arm-kernel [mailto:linux-arm-kernel-
>> bounces@lists.infradead.org] On Behalf Of Abhilash Kesavan
>> Sent: Monday, September 22, 2014 1:47 PM
>> To: linux-samsung-soc@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; devicetree@vger.kernel.org;
>> catalin.marinas@arm.com
>> Cc: naveenkrishna.ch@gmail.com; kesavan.abhilash@gmail.com;
>> tomasz.figa@gmail.com
>> Subject: [PATCH v5 8/8] arm64: dts: add <dt-bindings/> symlink
>>
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/ to
>> match the ones in ARM architectures so that preprocessed device
>> tree files can include various useful constant definitions.
>>
>> See commit c58299aa8754 ("kbuild: create an "include chroot" for DT
>> bindings")
>> merged in v3.10-rc1 for details.
>>
>> CC: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
>> Tested-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>>  arch/arm64/boot/dts/include/dt-bindings | 1 +
>>  1 file changed, 1 insertion(+)
>>  create mode 120000 arch/arm64/boot/dts/include/dt-bindings
>>
>> diff --git a/arch/arm64/boot/dts/include/dt-bindings
>> b/arch/arm64/boot/dts/include/dt-bindings
>> new file mode 120000
>> index 0000000..1e89bce
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/include/dt-bindings
>> @@ -0,0 +1 @@
>> +../../../../../include/dt-bindings/
>> \ No newline at end of file
> ^
> It generates incorrect symlink. Please remove last line like below:
>
> diff --git a/arch/arm64/boot/dts/include/dt-bindings
> b/arch/arm64/boot/dts/include/dt-bindings
> new file mode 120000
> index 0000000..499472b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/include/dt-bindings
> @@ -0,0 +1 @@
> +../../../../../include/dt-bindings/

I just re-checked this patch and it seems to be working fine. I did
find a thread where patchwork appeared to be changing the patch
causing issues [1]. Are you downloading this via patchwork ?

[1] http://www.spinics.net/lists/linux-kbuild/msg08656.html

Regards,
Abhilash
> --
>
> Best Regards,
> Chanho Park
>
