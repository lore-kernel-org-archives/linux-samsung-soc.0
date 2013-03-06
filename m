From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Wed, 6 Mar 2013 05:31:42 +0530
Message-ID: <CAJuYYwQN-0JFptS+zNG3oq6-a0Tn8UjYWB7892H3QcNa-7SAuA@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAJuYYwRSHYHs=0qOaWq7_U8+ARz-SYLQM5UAGTd8jTA_4x2wow@mail.gmail.com>
	<CAD=FV=X8-CAQxfjaw0Fq37j4CvMbYKytaCOpd6Qt6sO++YjJQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:44857 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752888Ab3CFABn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 19:01:43 -0500
Received: by mail-vc0-f169.google.com with SMTP id n10so4570663vcn.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 16:01:42 -0800 (PST)
In-Reply-To: <CAD=FV=X8-CAQxfjaw0Fq37j4CvMbYKytaCOpd6Qt6sO++YjJQQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

On 6 March 2013 05:20, Doug Anderson <dianders@chromium.org> wrote:
> Thomas,
>
> On Mon, Mar 4, 2013 at 6:04 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>>
>> Ok. I will repost this patch again with pinctrl_1 and pinctrl_2
>> included. I had not included this in the earlier patch since I was not
>> sure of the best pin grouping for the camera and c2c interface.
>
> OK, thanks.

I have added pinctrl_1 and pinctrl_2 now.

>
>>>> --> NOTE: Appears (IIRC) to have incorrect interrupt for pinctrl_3.  I
>>>> believe that 45 is pinctrl_1.  Maybe 3 is 47?
>>>
>>> I can't verify this, unfortunately.
>>
>> The documentation does not state this clearly. I will recheck on this
>> and correct as needed.
>
> OK.  Let me know if you can't find it.  I spent a bunch of time
> digging in this area and wrote up my findings, but I certainly could
> be wrong.  ;)

So now I have: pinctrl_0 is SPI[46], pinctrl_1 is SPI[45], pinctrl_2
is SPI[50] and pinctrl_3 is SPI[47]. I am yet to test this and
confirm. If you feel these are wrong, could you please let me know.

>
>> I have posted i2c pinctrl support patch based on LinusW's pin grab by
>> device core patch. If that is acceptable, I can post pinctrl support
>> patches for other other controllers as well.
>
> OK, I see that.  <https://patchwork.kernel.org/patch/2212731/>.  That
> particular patch isn't strictly required, right?  Even without that
> patch I can specify pinctrl for the i2c nodes and it will work
> OK--this just removes the old gpio nodes.
>
> One problem I see with taking this approach for DW_MMC and for SPI is
> that it will make bisecting hard.  If you land a change to take out
> GPIO stuff from dw_mmc and the spi driver then it will make the
> transition difficult.  exynos5 boards will stop booting until the
> device tree support is also landed.  ...and it would be an awfully big
> patch to add all the device tree stuff in the same patch as the dw_mmc
> and spi driver changes...

Right, I did not pay attention to the bisecting problem. What I have
now is, a set of individual patches that migrate i2c, sdhci, dwmmc,
i2s, spi and keypad drivers to pinctrl based pin-configuration. In
addition to that, two patches that add default pin-state information
for Exynos4 and Exynos5 platforms. Since there are multiple drivers
involved, is it okay to keep them as separate patches?

Thanks,
Thomas.

>
>
> -Doug
