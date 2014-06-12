From: Kevin Hilman <khilman@linaro.org>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Thu, 12 Jun 2014 12:50:39 -0700
Message-ID: <CAGa+x867U=+pnq+4mtssMrtcYq52HaYQvdpOJo3X_m6vnQsXZQ@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
	<CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
	<CAGa+x85gXyefMhkpE8nGZkEEPc1X8pAHUvGMQbOPkTKZ6DLNqQ@mail.gmail.com>
	<CAEC9eQMpukbdekaUeCzs8kqS9543hnnQj95bxHadmOQW1jvmaQ@mail.gmail.com>
	<CAGa+x86YjQoOv=Z-1+96X2D16zfxNHHF=b=KA6c3ft80jEUZRw@mail.gmail.com>
	<CAPdUM4MgG_QEfwB+G6d3Lxo-m+p3s0coZYcgb+P9m7JfzR1Kaw@mail.gmail.com>
	<7hzjhjf8mu.fsf@paris.lan>
	<CAEC9eQNff9Kw2hgKoXCjw1ppBnu7=b1FgGdZQiq_7Dr0=qF6aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:57605 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112AbaFLTuk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 15:50:40 -0400
Received: by mail-qc0-f175.google.com with SMTP id i8so2661039qcq.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 12:50:39 -0700 (PDT)
In-Reply-To: <CAEC9eQNff9Kw2hgKoXCjw1ppBnu7=b1FgGdZQiq_7Dr0=qF6aA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>, sunil joshi <joshi@samsung.com>

On Thu, Jun 12, 2014 at 1:44 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Kevin,
>
>
> On Thu, Jun 12, 2014 at 2:48 AM, Kevin Hilman <khilman@linaro.org> wr=
ote:
>> Rahul Sharma <rahul.sharma@samsung.com> writes:
>>
>>> On 11 June 2014 03:48, Kevin Hilman <khilman@linaro.org> wrote:
>>>> Hi Ajay,
>>>>
>>>> On Tue, Jun 10, 2014 at 1:51 PM, Ajay kumar <ajaynumb@gmail.com> w=
rote:
>>>>> Hi,
>>>>>
>>>>> On 6/11/14, Kevin Hilman <khilman@linaro.org> wrote:
>>>>>> On Tue, Jun 10, 2014 at 11:04 AM, St=C3=A9phane Marchesin
>>>>>> <marcheu@chromium.org> wrote:
>>>>>>> On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.=
org>
>>>>>>> wrote:
>>>>>>>> I'm trying to get the latest linux-next working on my Chromebo=
ok2
>>>>>>>> (it's booting to a serial console) and am now trying to get th=
e
>>>>>>>> display working (at least for a frambuffer console.)
>>>>>>>>
>>>>>>>> Since the display nodes seem to be present in the exynos5800-p=
each-pi
>>>>>>>> DTS, I tried enabling DRM and it's failing to allocate memory =
(log
>>>>>>>> below[1]
>>>>>>>>
>>>>>>>> Is there some additional memory setup/allocations I should be =
doing?
>>>>>>>> maybe with CMA?
>>>>>>>
>>>>>>> Probably not CMA, but maybe you don't have the iommu enabled?
>>>>>>
>>>>>> Turns out it was missing CMA support.  Specifically:
>>>>>>    CONFIG_CMA=3Dy
>>>>>>    CONFIG_DMA_CMA=3Dy
>>>>>> are needed (my full .config is here: http://hastebin.com/uqopira=
zir.vbs)
>>>>>>
>>>>>> With that, it allocates, appears to detect the panel and even cl=
aims
>>>>>> "Console: switching to colour frame buffer device", but I don't =
see
>>>>>> tux or any output on the display (DRM debug output below).
>>>>>>
>>>>>> Note that I'm chain-loading nv_uboot from an SD card, and u-boot=
 is
>>>>>> driving the display (black text on white background.)  As soon a=
s it
>>>>>> starts the kernel though, u-boot seems to shut down the display
>>>>>> (though the backlight seems to still be on.)
>>>>>>
>>>>>> Maybe the DT for peach-pi is missing the regulator used to power=
 the
>>>>>> panel, or maybe a GPIO used to power up the panel?
>>>>>>
>>>>>> Any ideas?
>>>>> Not only the DT patches, but few patches are missing to support t=
he
>>>>> panel present on peach-pi.
>>>>> You should also take the following patches to be able to get the
>>>>> display up on peach-pi:
>>>>> http://www.spinics.net/lists/linux-samsung-soc/msg32122.html
>>>>
>>>> Excellent, thanks for the pointer to those patches.  I'll have a l=
ook.
>>>>
>>>> Can you confirm that this should work even when chain-loading
>>>> nv_uboot?  It appears u-boot is powering down the panel.
>>>
>>> If u-boot is powering down the panel, you also need EC and Tps DT
>>> patches to get regulators up in kernel. Those are not posted yet. I=
 will
>>> send these patches to you.
>>
>> I tested the patches you sent on top of next-2014060 but I'm still n=
ot
>> seeing tux on the framebuffer.  I do see the backlight turn off and =
back
>> on twice during the boot, but nothing else interesting on the displa=
y.
>
> Your configs seem to be fine, but when I analyzed the logs, I could m=
ake
> out that lcd_vdd being on from u-boot is the problem:
> [    2.641456] lcd_vdd: no parameters
> [    2.641522] lcd_vdd: supplied by vbat-supply
>
> The eDP panel on peach-pi throws HPD approximately 100-150ms after po=
wering
> up lcd_vdd. Since u-boot turns the display on, HPD was thrown at u-bo=
ot itself.
> When kernel boots up, it is not disabling and enabling lcd_vdd, but i=
t
> is left in
> same voltage state. That means panel was not actually "reset", and he=
nce HPD
> is not thrown again in kernel.
>
> I have already fixed this problem and sent patches yesterday.
> Revert V3 series of bridge chip patches, and take the latest version =
here:
> http://www.spinics.net/lists/linux-samsung-soc/msg32393.html
>
> Regarding the new configs, you should enable CONFIG_DRM_PANEL_BINDER
> and CONFIG_DRM_PANEL_EDP_LVDS.

Excellent, it works!  I have 8 beautiful penguins on my display, and
then a login prompt.

Thanks for the help.  I anxiously await this stuff geting into the
samsung tree for broader testing.

Kevin
