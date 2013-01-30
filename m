From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: Failure due to missing (Exynos related) pinctrl patch
Date: Wed, 30 Jan 2013 09:40:03 +0530
Message-ID: <CAK9yfHzOVbz0unEZdJEQ=Zn9XS0H6fft-nuxC4wvupCk=B5KnQ@mail.gmail.com>
References: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
	<CACRpkdYj_e6+iT7iAVtA8_t=4e_2Lxo9duozXccfcbKY8fGk7A@mail.gmail.com>
	<CAK9yfHwav_u3mjVqNdX4kY=LyUW30vr6AMGUExfGKuJn2KH8qQ@mail.gmail.com>
	<076401cdfe9f$6a0f5fa0$3e2e1ee0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:60093 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990Ab3A3EKF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 23:10:05 -0500
Received: by mail-pb0-f41.google.com with SMTP id ro12so713837pbb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 20:10:04 -0800 (PST)
In-Reply-To: <076401cdfe9f$6a0f5fa0$3e2e1ee0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 30 January 2013 09:38, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> >> This patch is required along with the
>> >> patch "gpio: samsung: fix pinctrl condition for exynos and exynos5440"
>> >> (mainline commit Id: e4a5da51) which has already made it into
>> >> mainline. Without the missing patch we get the following boot up
>> >> warnings and subsequent failures with dt boot on 4412 based board:
>> >
>> > Hm I didn't realize there was a dependency between these
>> > patches, oh well, better get the pull for the pinctrl tree finished
>> > off then...
>>
>> Ideally those 2 patches should have been squashed together.
>>
> Err, Sachin, what are you talking about? As you said, one patch has been
> merged into the mainline, so how does it can be squashed? In this case, just
> applying the other patch into pinctrl-fixes is enough.

Yes you are right. It cannot be squashed now. I was referring to the
time of generation of these patches.

>
> Thanks.
>
> - Kukjin
>



-- 
With warm regards,
Sachin
