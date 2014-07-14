From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] ARM: dts: Add mask-tpm-reset to the device tree
Date: Mon, 14 Jul 2014 10:02:02 -0700
Message-ID: <CAD=FV=WTCJJCZ5ZPs34XRGmbp9qrHh7x88qdcRz6dR4-0BpqcQ@mail.gmail.com>
References: <1405319602-29892-1-git-send-email-vikas.sajjan@samsung.com>
	<CAD=FV=UQfQpJ3Tp-cBAfPsH9wHXb1yknget6iMQcgOVnH1PwFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:38736 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756174AbaGNRCC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 13:02:02 -0400
Received: by mail-vc0-f169.google.com with SMTP id hu12so2797147vcb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 10:02:02 -0700 (PDT)
In-Reply-To: <CAD=FV=UQfQpJ3Tp-cBAfPsH9wHXb1yknget6iMQcgOVnH1PwFA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Thomas P Abraham <thomas.ab@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Vikas,

On Mon, Jul 14, 2014 at 10:00 AM, Doug Anderson <dianders@chromium.org> wrote:
> Vikas,
>
> On Sun, Jul 13, 2014 at 11:33 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>>
>> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
>> being reset across sleep/wake.  If we don't set it to anything then
>> the TPM will be reset.  U-Boot will detect this as invalid
>> and will reset the system on resume time. This GPIO can always be low
>> and not hurt anything.  It will get pulled back high again during a
>> normal warm reset when it will default back to an input.
>>
>> To properly preserve the TPM state across suspend/resume and to make
>> the chrome U-Boot happy, properly set the GPIO to mask the
>> reset to the TPM.
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> ---
>> changes since v1:
>>         - removed fixed regulator and used hogs instead.
>>
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>
> This looks reasonable to me except for two things:
>
> 1. You need to apply this to pit and pi (not just pi)

Sorry, just realized that you had two patches and they weren't just
revisions (I got confused when one was v1 and one was v2).  I would
have just put them in the same patch, but two patches is OK.


> 2. The proper sort ordering for elements within a pin control group is
> by pin number, so this pin should be _after_ gpx0-2, not before.
