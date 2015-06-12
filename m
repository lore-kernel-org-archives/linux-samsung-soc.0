From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: fix the clock-frequency of rinato board's panel
Date: Fri, 12 Jun 2015 18:36:10 +0900
Message-ID: <CAJKOXPfO8LFygQaQqDjcurMS+0-8TTGziVVRi6PoFJeaabCMzw@mail.gmail.com>
References: <1434099805-16989-1-git-send-email-human.hwang@samsung.com>
	<1434099805-16989-2-git-send-email-human.hwang@samsung.com>
	<CAJKOXPc6X6ViTfxsf1fz+R9FE2ZhBvOW0wzO_etGT7AjCEOk4Q@mail.gmail.com>
	<20150612182718.6b72090c@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:43364 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbbFLJgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 05:36:10 -0400
In-Reply-To: <20150612182718.6b72090c@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, jy0922.shim@samsung.com

2015-06-12 18:27 GMT+09:00 Hyungwon Hwang <human.hwang@samsung.com>:
> On Fri, 12 Jun 2015 18:23:18 +0900
> Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>
>> 2015-06-12 18:03 GMT+09:00 Hyungwon Hwang <human.hwang@samsung.com>:
>> > Because of recent update, proper clock-frequency becomes mandatory
>> > for validating the mode of panel. This clock-frequency must be set
>> > appropriately for getting required frame rate.
>> >
>> > Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
>>
>> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Is it a bugfix? The property is mandatory right now?
>
> With recent kernel, yes. It is mandatory for the mode to be become
> available.

So it looks like bugfix. Can you resend the patch with:
1. cc-stable and fixes tags,
2. observable bug/issue/error (error from dmesg would be enough)?

It looks quite similar to 242ddf0429

Best regards,
Krzysztof
