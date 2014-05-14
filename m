From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Wed, 14 May 2014 19:09:15 +0530
Message-ID: <CAM4voam29e7aK7n86_Mpj-wwvkchm-e68qA5=iUFou+sUMONig@mail.gmail.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1405131325060.980@knanqh.ubzr>
	<CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com>
	<alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
	<CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com>
	<alpine.LFD.2.11.1405140931380.980@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:35377 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755625AbaENNjQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 09:39:16 -0400
Received: by mail-qg0-f53.google.com with SMTP id f51so2805038qge.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 06:39:15 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1405140931380.980@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

Hi Nicolas,

On Wed, May 14, 2014 at 7:03 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> On Wed, 14 May 2014, Abhilash Kesavan wrote:
>
>> Hi Nicolas,
>>
>> [...]
>> >>
>> >> 1) can't create /sys/devices/system/cpu/cpu//online: nonexistent directory
>> >
>> > What do you get if you do:
>> >
>> > $ ls -d /sys/devices/system/cpu/cpu?/online
>> ls: /sys/devices/system/cpu/cpu//online: No such file or directory
>
> Somehow, you or your shell replaced the ? character into a / character.
> You could try with a * instead.
With a different RFS your script runs fine without any change. Will
update with results once testing is done.

Abhilash
>
>
> Nicolas
