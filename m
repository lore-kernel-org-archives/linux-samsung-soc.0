From: Kevin Hilman <khilman@linaro.org>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Tue, 10 Jun 2014 11:36:24 -0700
Message-ID: <CAGa+x86G+uj_j=HSZCnshNq_LXVYvqU-Se-A5qf=ykt-aLw0OQ@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
	<CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
	<CAGa+x860u5On=bNvdrCKyega8AXs5a_+5Tuxhhag9h+-HCAZwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:52574 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbaFJSgZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 14:36:25 -0400
Received: by mail-qc0-f181.google.com with SMTP id x3so2799690qcv.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 11:36:24 -0700 (PDT)
In-Reply-To: <CAGa+x860u5On=bNvdrCKyega8AXs5a_+5Tuxhhag9h+-HCAZwQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On Tue, Jun 10, 2014 at 11:24 AM, Kevin Hilman <khilman@linaro.org> wro=
te:
> On Tue, Jun 10, 2014 at 11:04 AM, St=C3=A9phane Marchesin
> <marcheu@chromium.org> wrote:
>> On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.org> =
wrote:
>>> I'm trying to get the latest linux-next working on my Chromebook2
>>> (it's booting to a serial console) and am now trying to get the
>>> display working (at least for a frambuffer console.)
>>>
>>> Since the display nodes seem to be present in the exynos5800-peach-=
pi
>>> DTS, I tried enabling DRM and it's failing to allocate memory (log
>>> below[1]
>>>
>>> Is there some additional memory setup/allocations I should be doing=
?
>>> maybe with CMA?
>>
>> Probably not CMA, but maybe you don't have the iommu enabled?
>
> Thanks!  I didn'th ave that enabled in the .config.
> With that, it seems to allocate, but fails to probe:

Oops, ignore this one... operator error.
