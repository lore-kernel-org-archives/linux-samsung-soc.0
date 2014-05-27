From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Tue, 27 May 2014 21:58:23 +0900
Message-ID: <53848BEF.4060005@samsung.com>
References: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
 <CAGS+omB642X9XtC6CdmgSFiAUr0ChgJKjVwseMj0TeD09oRq6Q@mail.gmail.com>
 <CAPdUM4O-tx1fog=ad_nTDHFJUVUT1tJBKaF3Wm+eN7GD4sPNvw@mail.gmail.com>
 <CAPdUM4NPURbcVuwZdpvHKHk4f4Kr17Z1veWLzRAqzPZtk78kdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25269 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbaE0M60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 08:58:26 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6800FMRHDBRYC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 May 2014 21:58:24 +0900 (KST)
In-reply-to: <CAPdUM4NPURbcVuwZdpvHKHk4f4Kr17Z1veWLzRAqzPZtk78kdw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On 2014=EB=85=84 05=EC=9B=94 27=EC=9D=BC 18:55, Rahul Sharma wrote:
> <Gentle Reminder>
>=20
> On 26 May 2014 14:21, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Hi Daniel,
>>
>> On 26 May 2014 13:11, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>> On Mon, May 26, 2014 at 2:59 PM, Rahul Sharma <rahul.sharma@samsung=
=2Ecom> wrote:
>>>>
>>>> Hi Inki,
>>>>
>>>> Please review this patch.
>> [snip]
>>>>> +
>>>>> +       ret =3D clk_prepare_enable(ctx->lcd_clk);
>>>
>>> Hi Rahul,
>>>
>>> Can you explain why exactly we are "clearing windows" here in probe=
(), anyway?
>>
>> I am not sure why it was added there but it is present since the fir=
st
>> version of this
>> file. Probably Inki can explain about this :). I can see the change
>> coming from his
>> first patch for adding drm fimd driver.
>>
>>>
>>> IIUC, bus_clk is the clock that enables FIMD register access, and
>>> lcd_clk clocks the scan out engine.
>>> Therefore, if we only need to read/write some registers, we only ne=
ed
>>> the bus_clk, not lcd_clk, right?
>>>
>>
>> Correct, bus_clk should be sufficient to access the registers. But u=
nless we
>> are confident about all implicit clock requirements in all SoCs, it =
is
>> safer to follow
>> the power_on/off sequence. This implementation is as good as DPMS on=
 -> perform
>> reg operation -> DPMS Off. It was same in the original version but
>> later clock enables
>> were moved out of the probe.
>>
>>> However, fimd_clear_win() actually clears per-window registers.
>>> Writes to per-window registers typically do not take effect until t=
he
>>> next vblank.
>>> Therefore we do would need to enable lcd_clk to ensure that these
>>> changes take effect.
>>> Furthermore, to ensure the window clear completes during probe(), w=
e
>>> would also need to synchronously wait for the next vblank here - bu=
t
>>> only if FIMD scanout is actually enabled already, otherwise there w=
ill
>>> never be a next scanout, so we must check for that first.
>>> Lastly, waiting around for a vblank could take a while.  Doing so i=
n
>>> probe() is not very friendly to boot up time, so the waiting should
>>> probably be moved out of the main probe() thread into some sort of
>>> asynchronous handler, which could then signal back when the clear i=
s
>>> complete.
>>>
>>> Do you agree, or am I missing something?
>>
>> I agree. There seems a room for improvement. But at present we have =
two options,
>> either fix the current implementation and try to improve it as you m=
entioned
>> above. OR remove fimd_clear_win from probe if it is just a legacy co=
de which

Just let's remove fimd_clear_win. it wouldn't need to disable all
hardware overlays at probe.

Thanks,
Inki Dae

>> is no more required.
>>
>> @Inki, need your inputs here.
>>
>> Regards,
>> Rahul Sharma.
>>
>>>
>>> Thanks,
>>> -djk
>>>
>>>>
>>>>> +       if (ret) {
>> [snip]
>>>>> +pm_put_err:
>>>>> +       return ret;
>>>>>  }
>>>>>
>>>>>  static void fimd_unbind(struct device *dev, struct device *maste=
r,
>>>>> --
>>>>> 1.7.9.5
>>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
