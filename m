From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: Add mask-tpm-reset to the device tree
Date: Wed, 16 Jul 2014 02:35:56 +0900
Message-ID: <53C5667C.9070207@samsung.com>
References: <1405420294-9323-1-git-send-email-vikas.sajjan@samsung.com> <1405420294-9323-2-git-send-email-vikas.sajjan@samsung.com> <CAD=FV=XJD=Dt8z5Vmy2wXs4_FWqiW3=AhVw=sSZXFxv31+FHhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:39841 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932078AbaGORgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 13:36:10 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so3090677pdj.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 10:36:10 -0700 (PDT)
In-Reply-To: <CAD=FV=XJD=Dt8z5Vmy2wXs4_FWqiW3=AhVw=sSZXFxv31+FHhA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 07/16/14 01:19, Doug Anderson wrote:
> Vikas,
>
> On Tue, Jul 15, 2014 at 3:31 AM, Vikas Sajjan<vikas.sajjan@samsung.com>  wrote:
>> From: Doug Anderson<dianders@chromium.org>
>>
>> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
>> being reset across sleep/wake.  If we don't set it to anything then
>> the TPM will be reset.  U-Boot will detect this as invalid
>> and will reset the system on resume time. This GPIO can always be low
>> and not hurt anything.  It will get pulled back high again during a
>> normal warm reset when it will default back to an input.
>>
>> To properly preserve the TPM state across suspend/resume and to make
>> the chrome U-Boot happy, properly set the GPIO to mask the
>> reset to the TPM.
>>
>> Signed-off-by: Doug Anderson<dianders@chromium.org>
>> Signed-off-by: Vikas Sajjan<vikas.sajjan@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>
> Looks good to me.  I'll assume Kukjin will add the words
> "exynos5420-peach-pit" into the patch description when applying.
>
Yes :)

> Reviewed-by: Doug Anderson<dianders@chromium.org>
>
I've applied this series, thanks.

- Kukjin
