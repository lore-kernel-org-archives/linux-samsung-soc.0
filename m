From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [RESEND PATCH v4 2/2] ARM: EXYNOS: Refactor the pm code to use DT
 based lookup
Date: Tue, 9 Sep 2014 11:24:48 +0530
Message-ID: <CAGm_ybj2jekeq0pqqYeXyr6e6cMRfVkto8=nGm=2utCnJSvy_g@mail.gmail.com>
References: <1408431167-14134-1-git-send-email-vikas.sajjan@samsung.com>
	<1408431167-14134-3-git-send-email-vikas.sajjan@samsung.com>
	<CAGm_ybjx4t7kGg0mJHjrox39jP-DNgc-0rkLNn2rcOLS6JjAHQ@mail.gmail.com>
	<2186657.jhIisq7Fok@amdc1032>
	<CAGm_ybhDsGpoHg8XVBOPEv7oHc0YdSZBW_JXB0hZk-y6Bac00g@mail.gmail.com>
	<02aa01cfc77c$94865f20$bd931d60$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:43227 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932133AbaIIFyt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 01:54:49 -0400
Received: by mail-wg0-f52.google.com with SMTP id x13so2876827wgg.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2014 22:54:48 -0700 (PDT)
In-Reply-To: <02aa01cfc77c$94865f20$bd931d60$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Kukjin,

On Wed, Sep 3, 2014 at 7:10 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Vikas Sajjan wrote:
>>
>> Hi,
>>
> Hi,
>
> Sorry for late response...
>
>> On Tue, Aug 19, 2014 at 3:05 PM, Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com> wrote:
>> >
>> > Hi,
>> >
>> > On Tuesday, August 19, 2014 01:26:49 PM Vikas Sajjan wrote:
>> >> Hi Kukjin,
>> >>
>> >> On Tue, Aug 19, 2014 at 12:22 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> >> > Refactoring the pm.c to avoid using "soc_is_exynos" checks,
>> >> > instead use the DT based lookup.
>> >> >
>> >> > While at it, consolidate the common code across SoCs
>> >> > and create static helper functions.
>> >> >
>> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> >> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> >>
>> >> Can you pick this series...
>> >
>> > I think that my PM_SLEEP=n build fixes should go in before this cleanup
>> > series:
>>
>> Its better for Kukjin to decide which series he wants to pick first.
>>
> Hmm...I need to have a look at the Bart's fix then I'll let you know. Maybe
> tomorrow morning ;)
>

PING...

>>
>> >
>> >   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35430.html
>> >
>
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
