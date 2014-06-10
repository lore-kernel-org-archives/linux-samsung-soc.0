From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Tue, 10 Jun 2014 20:56:04 +0200
Message-ID: <539754C4.60008@gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com> <CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35885 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752132AbaFJS4X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 14:56:23 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so1873187wgh.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 11:56:22 -0700 (PDT)
In-Reply-To: <CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu@chromium.org>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, naveenkrishna.ch@gmail.com, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On 10.06.2014 20:04, St=C3=A9phane Marchesin wrote:
> On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.org> w=
rote:
>> I'm trying to get the latest linux-next working on my Chromebook2
>> (it's booting to a serial console) and am now trying to get the
>> display working (at least for a frambuffer console.)
>>
>> Since the display nodes seem to be present in the exynos5800-peach-p=
i
>> DTS, I tried enabling DRM and it's failing to allocate memory (log
>> below[1]
>>
>> Is there some additional memory setup/allocations I should be doing?
>> maybe with CMA?
>=20
> Probably not CMA, but maybe you don't have the iommu enabled?
>=20

It should work without IOMMU as well. We're using Exynos DRM on Exynos4
without IOMMU and with CMA instead and it works fine.

Best regards,
Tomasz
