From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v5] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Wed, 28 May 2014 11:47:04 +0530
Message-ID: <CAPdUM4Nqq=COS7gRWvMkwh_xZ1rtG8YsuKnUVnRxiLWx6jUgTQ@mail.gmail.com>
References: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
	<CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
	<CAGS+omB642X9XtC6CdmgSFiAUr0ChgJKjVwseMj0TeD09oRq6Q@mail.gmail.com>
	<CAPdUM4O-tx1fog=ad_nTDHFJUVUT1tJBKaF3Wm+eN7GD4sPNvw@mail.gmail.com>
	<CAPdUM4NPURbcVuwZdpvHKHk4f4Kr17Z1veWLzRAqzPZtk78kdw@mail.gmail.com>
	<53848BEF.4060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:38186 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753966AbaE1GRG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 02:17:06 -0400
Received: by mail-wi0-f171.google.com with SMTP id cc10so3046547wib.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 23:17:04 -0700 (PDT)
In-Reply-To: <53848BEF.4060005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Thanks Inki,

I removed fimd_clear_win from fimd_probe and verified this change in ch=
rome
setup. Not seeing any noticeable difference.

I have posted another patch at:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31629.=
html

Thanks everybody for your review effort.

Regards,
Rahul Sharma.


On 27 May 2014 18:28, Inki Dae <inki.dae@samsung.com> wrote:
> On 2014=EB=85=84 05=EC=9B=94 27=EC=9D=BC 18:55, Rahul Sharma wrote:
>> <Gentle Reminder>
>>
>> On 26 May 2014 14:21, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>> Hi Daniel,
>>>
>>> On 26 May 2014 13:11, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>>> On Mon, May 26, 2014 at 2:59 PM, Rahul Sharma <rahul.sharma@samsun=
g.com> wrote:
>>>>>
>>>>> Hi Inki,
>>>>>
>>>>> Please review this patch.
>>> [snip]
>>>>>> +
>>>>>> +       ret =3D clk_prepare_enable(ctx->lcd_clk);
>>>>
>>>> Hi Rahul,
>>>>
>>>> Can you explain why exactly we are "clearing windows" here in prob=
e(), anyway?
>>>
>>> I am not sure why it was added there but it is present since the fi=
rst
>>> version of this
>>> file. Probably Inki can explain about this :). I can see the change
>>> coming from his
>>> first patch for adding drm fimd driver.
>>>
>>>>
>>>> IIUC, bus_clk is the clock that enables FIMD register access, and
>>>> lcd_clk clocks the scan out engine.
>>>> Therefore, if we only need to read/write some registers, we only n=
eed
>>>> the bus_clk, not lcd_clk, right?
>>>>
>>>
>>> Correct, bus_clk should be sufficient to access the registers. But =
unless we
>>> are confident about all implicit clock requirements in all SoCs, it=
 is
>>> safer to follow
>>> the power_on/off sequence. This implementation is as good as DPMS o=
n -> perform
>>> reg operation -> DPMS Off. It was same in the original version but
>>> later clock enables
>>> were moved out of the probe.
>>>
>>>> However, fimd_clear_win() actually clears per-window registers.
>>>> Writes to per-window registers typically do not take effect until =
the
>>>> next vblank.
>>>> Therefore we do would need to enable lcd_clk to ensure that these
>>>> changes take effect.
>>>> Furthermore, to ensure the window clear completes during probe(), =
we
>>>> would also need to synchronously wait for the next vblank here - b=
ut
>>>> only if FIMD scanout is actually enabled already, otherwise there =
will
>>>> never be a next scanout, so we must check for that first.
>>>> Lastly, waiting around for a vblank could take a while.  Doing so =
in
>>>> probe() is not very friendly to boot up time, so the waiting shoul=
d
>>>> probably be moved out of the main probe() thread into some sort of
>>>> asynchronous handler, which could then signal back when the clear =
is
>>>> complete.
>>>>
>>>> Do you agree, or am I missing something?
>>>
>>> I agree. There seems a room for improvement. But at present we have=
 two options,
>>> either fix the current implementation and try to improve it as you =
mentioned
>>> above. OR remove fimd_clear_win from probe if it is just a legacy c=
ode which
>
> Just let's remove fimd_clear_win. it wouldn't need to disable all
> hardware overlays at probe.
>
> Thanks,
> Inki Dae
>
>>> is no more required.
>>>
>>> @Inki, need your inputs here.
>>>
>>> Regards,
>>> Rahul Sharma.
>>>
>>>>
>>>> Thanks,
>>>> -djk
>>>>
>>>>>
>>>>>> +       if (ret) {
>>> [snip]
>>>>>> +pm_put_err:
>>>>>> +       return ret;
>>>>>>  }
>>>>>>
>>>>>>  static void fimd_unbind(struct device *dev, struct device *mast=
er,
>>>>>> --
>>>>>> 1.7.9.5
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
