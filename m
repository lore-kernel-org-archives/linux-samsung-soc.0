From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Tue, 20 Jan 2015 12:25:19 +0100
Message-ID: <CABxcv=nNKrF45TL3_1BZHMzfKj1xPm6TzUGRSZ3WgJxzyUSmxQ@mail.gmail.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
	<54B68A74.8070405@math.uni-bielefeld.de>
	<54B79123.4090200@samsung.com>
	<54B8533C.3070000@math.uni-bielefeld.de>
	<54B99178.1060006@gmx.net>
	<54BD3129.5090305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34447 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753692AbbATLZV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 06:25:21 -0500
Received: by mail-wi0-f169.google.com with SMTP id bs8so22668530wib.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jan 2015 03:25:19 -0800 (PST)
In-Reply-To: <54BD3129.5090305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

[Adding Inki and Joonyoung to cc list]

Hello Marek,

On Mon, Jan 19, 2015 at 5:30 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>>
>> The board instantly died then. No kernel log output from the serial
>> console, the heartbeat just stops and the board is dead. Need to
>> power-cycle to get it running again.
>>
>> I'm unsure how to triage this at all.
>
>
> Thanks for you tests and pointing this issue. I turned out that the initial
> fix proposed
> by Andrzej Hajda
> (http://www.spinics.net/lists/linux-samsung-soc/msg38915.html) worked
> fine, while the final version merged to clock fixes ('clk: samsung: exynos4:
> set parent
> of sclk_hdmiphy to hdmi' - commit df019a5c0f7083001cb694f44821ca506425bda2)
> doesn't work
> properly.
>

I was working on adding HDMI support for Exynos5420/5422/5800 and I
also found that the hdmi clock being gated by the exynos_hdmi driver
on hdmi_poweroff(), was causing a system hang when the exynos_mixer
driver tried to access the mixer module registers.

My first approach was to do the same than Andrzej's patch, that is set
the parent of mixer gate clock to hdmi so when the exynos_mixer driver
enables its mixer clock, the hdmi clock would be enabled too.
Unfortunately that didn't work (more on that below)

> Please check the following kernel tree - instead of hacking around hdmi
> clock I've added
> handling of it directly to drm mixer driver:
> https://git.linaro.org/people/marek.szyprowski/linux-srpol.git/shortlog/refs/heads/v3.19-odroid-hdmi
> I hope that this will finally solve all mixer initialization related issues

My second approach was indeed the same that you are doing, to add a
phandle to the hdmi clock directly in the exynos_mixer driver to avoid
having to set the parent of the mixer clock on each exynos clock
driver.

When dumping the value of the CLK_GATE_IP_DISP1 register I see that
both CLK_HDMI and CLK_MIXER are set with both approaches but the
system still crashes. So enabling the hdmi clock seems to be enough to
make the mixer happy on Exynos4 but unfortunately is not enough on
Exynos5420.

> (also for
> Odroid XU3, discussed recently in the other thread). If it works fine, I
> will resend
> exynos4 hdmi patches to include this change.
>
>

I compared the clock hierarchy when the system is able to turn on and
off the fb blank and when it crash and I notice this difference:

Working:

 sclk_pwi                                 0            0    24000000
       0 0
 sclk_hdmiphy                             1            1    24000000
       0 0
    mout_hdmi                             1            1    24000000
       0 0
       sclk_hdmi                          1            1    24000000
       0 0
...
    mout_pixel                            0            0    24000000
       0 0
       dout_hdmi_pixel                    0            0    24000000
       0 0
          sclk_pixel                      0            0    24000000
       0 0


Not working:

 sclk_pwi                                 0            0    24000000
       0 0
 sclk_hdmiphy                             0            0    24000000
       0 0
...
    mout_pixel                            0            0    24000000
       0 0
       dout_hdmi_pixel                    0            0    24000000
       0 0
          mout_hdmi                       0            0    24000000
       0 0
             sclk_hdmi                    0            0    24000000
       0 0
          sclk_pixel                      0            0    24000000
       0 0

The difference is because the source clock of the hdmi clock is
generated by the output of a mux clock (mout_hdmi) that select either
dout_hdmi_pixel or sclk_hdmiphy as input parent. The exynos5420 clk
driver defines as:

PNAME(mout_hdmi_p) = {"dout_hdmi_pixel", "sclk_hdmiphy"};
...
MUX(CLK_MOUT_HDMI, "mout_hdmi", mout_hdmi_p, SRC_DISP10, 28, 1),

And the exynos_hdmi driver does:

clk_disable_unprepare(hdata->res.sclk_hdmi);
clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
clk_prepare_enable(hdata->res.sclk_hdmi);

So is not only that the hdmi clock has to be enabled but also the
clock hierarchy matters. I don't even know if the hdmi clock is needed
or is that enabling this clock has the side effect of enabling another
clock in the hierarchy that is the one that is needed. It would be
good if someone can compare the clock hierarchy on an Exynos4.

So I would like to understand what is really the root cause here
instead of trying to only solve the symptoms for each platform.

I have also noticed this patch from Inki - commit 245f98f269714
("drm/exynos: hdmi: fix power order issue") that forces the
exynos_mixer to be disabled before exynos_hdmi to prevent a system
crash but only for DRM_MODE_DPMS_OFF. So I wonder if the same should
be true for DRM_MODE_DPMS_ON and the exynos_hdmi should be enabled
before exynos_hdmi.

IOW, I would like to know what is the dependency between the mixer and
hdmi modules at the module level first and then once that is clear we
can dig deeper on what clocks are needed and when those must be
enabled.

Best regards,
Javier
