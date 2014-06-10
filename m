From: Kevin Hilman <khilman@linaro.org>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Tue, 10 Jun 2014 11:24:42 -0700
Message-ID: <CAGa+x860u5On=bNvdrCKyega8AXs5a_+5Tuxhhag9h+-HCAZwQ@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
	<CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:45908 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaFJSYn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 14:24:43 -0400
Received: by mail-qc0-f171.google.com with SMTP id w7so1110434qcr.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 11:24:42 -0700 (PDT)
In-Reply-To: <CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, naveenkrishna.ch@gmail.com, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On Tue, Jun 10, 2014 at 11:04 AM, St=C3=A9phane Marchesin
<marcheu@chromium.org> wrote:
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
>
> Probably not CMA, but maybe you don't have the iommu enabled?

Thanks!  I didn'th ave that enabled in the .config.
With that, it seems to allocate, but fails to probe:

[    0.829231] [drm] Initialized drm 1.1.0 20060810
[    0.833153] [drm:drm_platform_init]
[    0.835947] [drm:drm_get_platform_dev]
[    0.839813] [drm:drm_minor_register]
[    0.843580] [drm:drm_minor_register] new minor assigned 64
[    0.848877] [drm:drm_minor_register]
[    0.852512] [drm:drm_minor_register]
[    0.856319] [drm:drm_minor_register] new minor assigned 0
[    0.861568] [drm:exynos_drm_create_enc_conn] *ERROR* failed to creat=
e encoder
[    0.868651] [drm:exynos_drm_initialize_displays] *ERROR* Encoder
create [1] failed with -14
[    0.877420] exynos-drm: probe of exynos-drm failed with error -14
