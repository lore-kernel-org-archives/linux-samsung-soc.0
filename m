From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Mon, 19 Jan 2015 17:30:33 +0100
Message-ID: <54BD3129.5090305@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
 <54B8533C.3070000@math.uni-bielefeld.de> <54B99178.1060006@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9508 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbbASQah (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 11:30:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIF002CMNDRS220@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jan 2015 16:34:39 +0000 (GMT)
In-reply-to: <54B99178.1060006@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,

On 2015-01-16 23:32, Tobias Jakobi wrote:
> Hello,
>
> so OK, this doesn't look too good.
>
> Tobias Jakobi wrote:
>> I checked with my panel just now and played around a bit with the DRM
>> (opening, vsync, etc.). However on deinitialization the entire system
>> locked up. I currently haven't hooked the board up to the serial
>> console, otherwise I would've tried to extract some more meaningful
>> information.
>>
>> Going to check again more thoroughly on the weekend what exactly
>> triggers the lockup.
> So, first of all I did my initial test with the exynos video backend of
> RetroArch. But it turns out that there's no fancy application needed. I
> now tested this with the 'modetest' application from libdrm, and did this:
>
> ./modetest -M exynos -s 16@13:1920x1080
> setting mode 1920x1080-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
> setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
> setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
>
> The board instantly died then. No kernel log output from the serial
> console, the heartbeat just stops and the board is dead. Need to
> power-cycle to get it running again.
>
> I'm unsure how to triage this at all.

Thanks for you tests and pointing this issue. I turned out that the 
initial fix proposed
by Andrzej Hajda 
(http://www.spinics.net/lists/linux-samsung-soc/msg38915.html) worked
fine, while the final version merged to clock fixes ('clk: samsung: 
exynos4: set parent
of sclk_hdmiphy to hdmi' - commit 
df019a5c0f7083001cb694f44821ca506425bda2) doesn't work
properly.

Please check the following kernel tree - instead of hacking around hdmi 
clock I've added
handling of it directly to drm mixer driver:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git/shortlog/refs/heads/v3.19-odroid-hdmi
I hope that this will finally solve all mixer initialization related 
issues (also for
Odroid XU3, discussed recently in the other thread). If it works fine, I 
will resend
exynos4 hdmi patches to include this change.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
