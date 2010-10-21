From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 12:54:56 +0900
Message-ID: <AANLkTikQXkfCfimEzWGyiVRNPWA8UaQQ=d-s_hmXxX4u@mail.gmail.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
	<1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
	<AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
	<030201cb70c8$bc7f4aa0$357ddfe0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:39370 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757479Ab0JUDy7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 23:54:59 -0400
Received: by wwf26 with SMTP id 26so2059584wwf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2010 20:54:58 -0700 (PDT)
In-Reply-To: <030201cb70c8$bc7f4aa0$357ddfe0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>

On Thu, Oct 21, 2010 at 11:36 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Kyungmin Park wrote:
>>
>> On Thu, Oct 21, 2010 at 9:58 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Seungwhan Youn <sw.youn@samsung.com>
>> >
>> > This patch adds to enable/disable DMA operation clock on S3C-PL330
>> > DMA controller driver.
>>
>> The title and description seems to clock gating but actual code is
>> just enable at probe and disable at remove.
>>
>> Can you make it REAL clock gating, enable clock only when using?
>>
>
> This is just to move DMA enable/disable clock into DMA driver(S3C PL3=
30).
> So it would be better if we could discuss about what you said next ti=
me.
>
> Basically, I prefer most clocks should be registered as disabled, the=
n if
> required enable, just should be controlled in each driver.

And support clock & block gating basically at drivers.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
