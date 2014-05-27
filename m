From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v5] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Tue, 27 May 2014 15:25:36 +0530
Message-ID: <CAPdUM4NPURbcVuwZdpvHKHk4f4Kr17Z1veWLzRAqzPZtk78kdw@mail.gmail.com>
References: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
	<CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
	<CAGS+omB642X9XtC6CdmgSFiAUr0ChgJKjVwseMj0TeD09oRq6Q@mail.gmail.com>
	<CAPdUM4O-tx1fog=ad_nTDHFJUVUT1tJBKaF3Wm+eN7GD4sPNvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:46303 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbaE0Jzi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 05:55:38 -0400
Received: by mail-we0-f181.google.com with SMTP id w61so9079478wes.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 02:55:36 -0700 (PDT)
In-Reply-To: <CAPdUM4O-tx1fog=ad_nTDHFJUVUT1tJBKaF3Wm+eN7GD4sPNvw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

<Gentle Reminder>

On 26 May 2014 14:21, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Hi Daniel,
>
> On 26 May 2014 13:11, Daniel Kurtz <djkurtz@chromium.org> wrote:
>> On Mon, May 26, 2014 at 2:59 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>>
>>> Hi Inki,
>>>
>>> Please review this patch.
> [snip]
>>> > +
>>> > +       ret = clk_prepare_enable(ctx->lcd_clk);
>>
>> Hi Rahul,
>>
>> Can you explain why exactly we are "clearing windows" here in probe(), anyway?
>
> I am not sure why it was added there but it is present since the first
> version of this
> file. Probably Inki can explain about this :). I can see the change
> coming from his
> first patch for adding drm fimd driver.
>
>>
>> IIUC, bus_clk is the clock that enables FIMD register access, and
>> lcd_clk clocks the scan out engine.
>> Therefore, if we only need to read/write some registers, we only need
>> the bus_clk, not lcd_clk, right?
>>
>
> Correct, bus_clk should be sufficient to access the registers. But unless we
> are confident about all implicit clock requirements in all SoCs, it is
> safer to follow
> the power_on/off sequence. This implementation is as good as DPMS on -> perform
> reg operation -> DPMS Off. It was same in the original version but
> later clock enables
> were moved out of the probe.
>
>> However, fimd_clear_win() actually clears per-window registers.
>> Writes to per-window registers typically do not take effect until the
>> next vblank.
>> Therefore we do would need to enable lcd_clk to ensure that these
>> changes take effect.
>> Furthermore, to ensure the window clear completes during probe(), we
>> would also need to synchronously wait for the next vblank here - but
>> only if FIMD scanout is actually enabled already, otherwise there will
>> never be a next scanout, so we must check for that first.
>> Lastly, waiting around for a vblank could take a while.  Doing so in
>> probe() is not very friendly to boot up time, so the waiting should
>> probably be moved out of the main probe() thread into some sort of
>> asynchronous handler, which could then signal back when the clear is
>> complete.
>>
>> Do you agree, or am I missing something?
>
> I agree. There seems a room for improvement. But at present we have two options,
> either fix the current implementation and try to improve it as you mentioned
> above. OR remove fimd_clear_win from probe if it is just a legacy code which
> is no more required.
>
> @Inki, need your inputs here.
>
> Regards,
> Rahul Sharma.
>
>>
>> Thanks,
>> -djk
>>
>>>
>>> > +       if (ret) {
> [snip]
>>> > +pm_put_err:
>>> > +       return ret;
>>> >  }
>>> >
>>> >  static void fimd_unbind(struct device *dev, struct device *master,
>>> > --
>>> > 1.7.9.5
>>> >
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
