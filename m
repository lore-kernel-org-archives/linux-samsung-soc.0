From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Mon, 19 May 2014 08:08:58 +0530
Message-ID: <CAM4voakoSd0DXvG_fSXSAYxjMDNJmvOY5GMW=jQKD5Y0jTtJ+A@mail.gmail.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1405131325060.980@knanqh.ubzr>
	<CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com>
	<alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
	<CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com>
	<alpine.LFD.2.11.1405140931380.980@knanqh.ubzr>
	<CAM4voam29e7aK7n86_Mpj-wwvkchm-e68qA5=iUFou+sUMONig@mail.gmail.com>
	<CAM4voakB57mgyQmtkpCUAF1BVW5z3BGsesvxvTuSg_JwBh-sxw@mail.gmail.com>
	<alpine.LFD.2.11.1405151250070.17310@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:48449 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271AbaESCi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 May 2014 22:38:58 -0400
Received: by mail-qc0-f171.google.com with SMTP id x13so7989703qcv.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 May 2014 19:38:58 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1405151250070.17310@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

Hi Nicolas,

On Thu, May 15, 2014 at 10:22 PM, Nicolas Pitre
<nicolas.pitre@linaro.org> wrote:
> On Thu, 15 May 2014, Abhilash Kesavan wrote:
>
>> Hi Nicolas,
>>
>> On Wed, May 14, 2014 at 7:09 PM, Abhilash Kesavan
>> <kesavan.abhilash@gmail.com> wrote:
>> > Hi Nicolas,
>> >
>> > On Wed, May 14, 2014 at 7:03 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>> >> On Wed, 14 May 2014, Abhilash Kesavan wrote:
>> >>
>> >>> Hi Nicolas,
>> >>>
>> >>> [...]
>> >>> >>
>> >>> >> 1) can't create /sys/devices/system/cpu/cpu//online: nonexistent directory
>> >>> >
>> >>> > What do you get if you do:
>> >>> >
>> >>> > $ ls -d /sys/devices/system/cpu/cpu?/online
>> >>> ls: /sys/devices/system/cpu/cpu//online: No such file or directory
>> >>
>> >> Somehow, you or your shell replaced the ? character into a / character.
>> >> You could try with a * instead.
>> > With a different RFS your script runs fine without any change. Will
>> > update with results once testing is done.
>> The script has been running for a few hours on my 5420 based
>> chromebook. I can see all the cores being hotplugged in/out. A snippet
>> of the prints, that I get on running the test, follows:
>>
> [...]
>
> Good, that looks pretty good.
>
> Once you implement full cluster shutdown I can provide you with another
> script stressing that part.
I am done with the cluster power on/off code and it seems to work fine
with bL_switcher. Can you please provide me with your stress script.

Regards,
Abhilash
>
>
> Nicolas
