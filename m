From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: fix for sleeping in
 atomic ctx handling cpu hotplug notif.
Date: Mon, 29 Jun 2015 12:14:27 +0200
Message-ID: <55911A83.1080404@linaro.org>
References: <1426151496-5509-1-git-send-email-d.eppel@samsung.com> <1435324984-7328-1-git-send-email-d.eppel@samsung.com> <55910DA6.4070404@linaro.org> <alpine.DEB.2.11.1506291123320.4037@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35436 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343AbbF2KOX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jun 2015 06:14:23 -0400
Received: by wiga1 with SMTP id a1so66743600wig.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2015 03:14:22 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.11.1506291123320.4037@nanos>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Damian Eppel <d.eppel@samsung.com>, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, m.jabrzyk@samsung.com, stable@vger.kernel.org

On 06/29/2015 11:24 AM, Thomas Gleixner wrote:
> On Mon, 29 Jun 2015, Daniel Lezcano wrote:
>
>> On 06/26/2015 03:23 PM, Damian Eppel wrote:
>>> This is to fix an issue of sleeping in atomic context when processi=
ng
>>> hotplug notifications in Exynos MCT(Multi-Core Timer).
>>> The issue was reproducible on Exynos 3250 (Rinato board) and Exynos=
 5420
>>> (Arndale Octa board).
>>>
>>> Whilst testing cpu hotplug events on kernel configured with DEBUG_P=
REEMPT
>>> and DEBUG_ATOMIC_SLEEP we get following BUG message, caused by call=
ing
>>> request_irq() and free_irq() in the context of hotplug notification
>>> (which is in this case atomic context).
>>
>> Applied as a 4.2 fix.
>>
>> Should it be tagged stable@ ?
>
> I have that one queued in tip/timers/urgent already. Please check my
> branches before picking up stuff.

Mmmh, yep. I thought I refreshed my branch. Now I see it.

Thanks for the heads up.

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
