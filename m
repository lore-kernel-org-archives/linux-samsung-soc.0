From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Thu, 10 May 2012 20:30:12 +0530
Message-ID: <CAK9yfHyX9hnyJ0BgxgoP5Jo8tbXhevw6TxwogCeFBen+KmjSKw@mail.gmail.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
	<037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
	<CAH9JG2V_9RVPvEHodDD422r=o4QxHcrMO-YXv2KUGYeys=ZjqA@mail.gmail.com>
	<201205101348.20870.arnd@arndb.de>
	<CAH9JG2U83+q9NKuvZV4s_iHvDTrQ-RCEqx=9L9uwqiMhYMSiHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:55597 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757333Ab2EJPAN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 11:00:13 -0400
Received: by mail-qc0-f174.google.com with SMTP id o28so1178425qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 May 2012 08:00:12 -0700 (PDT)
In-Reply-To: <CAH9JG2U83+q9NKuvZV4s_iHvDTrQ-RCEqx=9L9uwqiMhYMSiHA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 10 May 2012 20:16, Kyungmin Park <kmpark@infradead.org> wrote:
> On Thu, May 10, 2012 at 10:48 PM, Arnd Bergmann <arnd@arndb.de> wrote=
:
>> On Thursday 10 May 2012, Kyungmin Park wrote:
>>> > And I won't apply new feature for non-dt board file from now on. =
I think,
>>> > we
>>> > need to support DT in mach-exynos/ instead of non-DT and DT toget=
her, so
>>> > please consider to move on dt supporting for Samsung mobile board=
s.
>>> >
>>>
>>> Probably you misunderstand Arnd word.
>>>
>>> "From the statements made so far, I can see no clear policy that we=
 can
>>> apply to everyone. My take on this is that for any work I spend on
>>> multiplatform kernel, I concentrate on the DT-based board files and
>>> get them to work together first, but leave it up to the individual
>>> subarch maintainers whether they want to add other board files into
>>> the mix."
>>>
>>> It doesn't mean add new feature to non-DT board. don't add new boar=
d file.
>>
>> This is a completely separate discussion, the problem at hand doesn'=
t
>> have anything to do with building a kernel for multiple mach-*
>> directories combined that I was referring to in the text you quote.
>>
>>> In this case, DRM is not yet ready to support DT.
>>>
>>> Okay, you can just drop this patches. but please note that this
>>> patches are posted at Mar 13 before you decide.
>>
>> I think it's a good idea to make new features DT-only because this
>> way we don't get any regressions and everyone who want to use
>> the new feature will be able to test the DT support on his board.
> The 'new feature' is some misleading word. In this case DRM drivers
> are used from v3.2 at drivers. but not registered it at board file.
> Basically agree to move DT and used it finally. Before that bring up
> the board using DRM based graphics.
>>
>> This of course requires that basic DT support is available for the
>> systems in question so we don't regress when moving away from the
>> old board files. My impression is that we're getting close to that
>> point on exynos thanks to Thomas' work on this. AFAICT we don't
>> have a DT binding for screen timings yet, so you will still have
>> to use auxdata for that or put the timings into the driver.
> I'm also thanks to Thomas, he did a lot of works for eyxnos. but most
> parts are missing at least exynos platform.
> e.g., Please see the origen.dts. I wonder it's booted with any
> graphical user interface platform, android or ubuntu.
> Maybe not.

We (Samsung Landing team) did manage to boot Origen with Ubuntu using
DT support. But that is only upto home screen with minimal support.

>
> Anyway, as discussed in multi-platform support mail threads, we're
> also moving to DT in the big picture. but still want to use existing
> boards as is.

=46or Exynos multimedia IPs, for instance, which already have drivers a=
s
well as platform support in mainline, do we still defer device
registration in machine file until DT support for these IPs is added?

>
> Thank you,
> Kyungmin Park
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
With warm regards,
Sachin
