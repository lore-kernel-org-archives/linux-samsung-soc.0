From: Kevin Hilman <khilman@linaro.org>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Tue, 10 Jun 2014 15:18:07 -0700
Message-ID: <CAGa+x86YjQoOv=Z-1+96X2D16zfxNHHF=b=KA6c3ft80jEUZRw@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
	<CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
	<CAGa+x85gXyefMhkpE8nGZkEEPc1X8pAHUvGMQbOPkTKZ6DLNqQ@mail.gmail.com>
	<CAEC9eQMpukbdekaUeCzs8kqS9543hnnQj95bxHadmOQW1jvmaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:35079 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbaFJWSI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 18:18:08 -0400
Received: by mail-qa0-f46.google.com with SMTP id i13so3543347qae.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 15:18:07 -0700 (PDT)
In-Reply-To: <CAEC9eQMpukbdekaUeCzs8kqS9543hnnQj95bxHadmOQW1jvmaQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>

Hi Ajay,

On Tue, Jun 10, 2014 at 1:51 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Hi,
>
> On 6/11/14, Kevin Hilman <khilman@linaro.org> wrote:
>> On Tue, Jun 10, 2014 at 11:04 AM, St=C3=A9phane Marchesin
>> <marcheu@chromium.org> wrote:
>>> On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.org>
>>> wrote:
>>>> I'm trying to get the latest linux-next working on my Chromebook2
>>>> (it's booting to a serial console) and am now trying to get the
>>>> display working (at least for a frambuffer console.)
>>>>
>>>> Since the display nodes seem to be present in the exynos5800-peach=
-pi
>>>> DTS, I tried enabling DRM and it's failing to allocate memory (log
>>>> below[1]
>>>>
>>>> Is there some additional memory setup/allocations I should be doin=
g?
>>>> maybe with CMA?
>>>
>>> Probably not CMA, but maybe you don't have the iommu enabled?
>>
>> Turns out it was missing CMA support.  Specifically:
>>    CONFIG_CMA=3Dy
>>    CONFIG_DMA_CMA=3Dy
>> are needed (my full .config is here: http://hastebin.com/uqopirazir.=
vbs)
>>
>> With that, it allocates, appears to detect the panel and even claims
>> "Console: switching to colour frame buffer device", but I don't see
>> tux or any output on the display (DRM debug output below).
>>
>> Note that I'm chain-loading nv_uboot from an SD card, and u-boot is
>> driving the display (black text on white background.)  As soon as it
>> starts the kernel though, u-boot seems to shut down the display
>> (though the backlight seems to still be on.)
>>
>> Maybe the DT for peach-pi is missing the regulator used to power the
>> panel, or maybe a GPIO used to power up the panel?
>>
>> Any ideas?
> Not only the DT patches, but few patches are missing to support the
> panel present on peach-pi.
> You should also take the following patches to be able to get the
> display up on peach-pi:
> http://www.spinics.net/lists/linux-samsung-soc/msg32122.html

Excellent, thanks for the pointer to those patches.  I'll have a look.

Can you confirm that this should work even when chain-loading
nv_uboot?  It appears u-boot is powering down the panel.

Kevin
