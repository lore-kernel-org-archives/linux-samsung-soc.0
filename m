From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
Date: Wed, 7 Mar 2012 23:20:34 +0900
Message-ID: <CAH9JG2VhCT6psHa3nhMCeA6dF12r1EuAaXMHxca44dOV1T5nbg@mail.gmail.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
	<1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
	<CAOesGMhmcnt6LPb9O+3420VgG=PiCnOjzZA3JqsA=4OdHN-R-g@mail.gmail.com>
	<00a901ccf084$90460900$b0d21b00$%kim@samsung.com>
	<CAOesGMgedngJKRVCYwK=+xRnchXj4StGLTVqvv9BMqVhtM=5RA@mail.gmail.com>
	<4F575EC8.2090205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:59272 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755599Ab2CGOUf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 09:20:35 -0500
Received: by qcqw6 with SMTP id w6so3294076qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 06:20:34 -0800 (PST)
In-Reply-To: <4F575EC8.2090205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

On Wed, Mar 7, 2012 at 10:12 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> On 03/06/12 10:55, Olof Johansson wrote:
>>
>> Hi,
>>
>> On Tue, Feb 21, 2012 at 2:35 AM, Kukjin Kim<kgene.kim@samsung.com> =A0=
wrote:
>>
>>> Yes, as you said, it brakes single zImage for EXYNOS4 + EXYNOS5
>>> (mach-exynos). So I'm working on regarding resource for EXYNOS SoCs=
 and I
>>> think, it can resolve the problem you said before v3.4 merge window=
=2E
>>>
>>> If any updates, let you know.
>>
>>
>> Just a friendly reminder; the time is close to running out for stagi=
ng
>> new code for 3.4.
>>
> Hi Olof,
>
> Thanks for your kindly reminder but I couldn't finish it yet because =
it is
> required to touch most of samsung stuff, and it's a big change. Frank=
ly, I
> need more time...
>
> So how about sending current exynos5 stuff for now and then sorting o=
ut
> single kernel for exynos4 and exynos5 next time? Actually, this exyno=
s5 arch
> part is _really_ needed for developing/contribution of drivers on exy=
nos5.
No,

I heard too many times. "we have plan to support ..." but I didn't see
any progress.
it's general rules. you should fix it correctly and merged correctly
instead of "not now"

Thank you,
Kyungmin Park
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
