From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v4 0/7] ARM: S3C24XX: Convert s3c2416 and s3c2443 to
 common clock framework
Date: Tue, 24 Dec 2013 15:50:00 +0530
Message-ID: <CAK9yfHy6bEGB0eX7-+fKeB+Q9FxmT9ykmeiuucvWHN8EjOMMPw@mail.gmail.com>
References: <201312101614.29781.heiko@sntech.de>
	<201312231411.35417.heiko@sntech.de>
	<1af701cf0048$b175b3c0$14611b40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:44525 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539Ab3LXKUA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Dec 2013 05:20:00 -0500
Received: by mail-oa0-f42.google.com with SMTP id i4so6818119oah.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2013 02:20:00 -0800 (PST)
In-Reply-To: <1af701cf0048$b175b3c0$14611b40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>

Hi Kukjin,

On 24 December 2013 07:07, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Heiko St=FCbner wrote:
>>
>> Hi Kukjin,
>>
> Hi,
>
>> it seems you didn't have the time for this series during your 2nd ro=
und.
>>
>> I'm not sure what your plans/time constraint are, but according to t=
he -
>> rc5
>> release mail from Linus [0], 3.13 will at least reach -rc8 so it see=
ms as
>> if
>> there is still a bit of time to for 3.14 stuff.
>>
> Good news to us :-)
>
>> This series would really be a nice base for not only the other ccf-
>> conversions
>> (the already submitted s3c2410 and the s3c2412 which I'm currently w=
orking
>> on)
>> but also for broadening the dt-support, with the auxdata gone from t=
he dt-
>> board file.
>>
> I agreed, let me try to send one more pull-request for 3.14 after fin=
ishing review of your patches.

While at it please also try to send the remaining pending patches.

--=20
With warm regards,
Sachin
