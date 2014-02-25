From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/2] ARM: SAMSUNG: move all arches to generic uncompress.h
Date: Tue, 25 Feb 2014 21:11:09 +0530
Message-ID: <CAK9yfHycc-98YG1ZWD5sB=k8t4CCYmxfRoJxSR_v=Hdm8FPG8g@mail.gmail.com>
References: <3594365.ORKU4Q2jDp@phil>
	<3158811.UU2ZyPShVi@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33545 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752895AbaBYPlK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 10:41:10 -0500
Received: by mail-ob0-f181.google.com with SMTP id wp4so6965617obc.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Feb 2014 07:41:10 -0800 (PST)
In-Reply-To: <3158811.UU2ZyPShVi@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>

 Hi Heiko,

On 25 February 2014 19:47, Heiko St=FCbner <heiko@sntech.de> wrote:
> Am Sonntag, 16. Februar 2014, 18:32:24 schrieb Heiko St=FCbner:
>> On 2014-01-06 Sachin Kamat posted two patches converting Exynos to u=
se
>> the generic uncompress.h.
>>
>> But in fact all Samsung platforms can go this route, as all Samsung
>> uncompress.h files are simply used to set up the serial port.
>>
>> As the original patches were not yet applied, this series includes t=
he
>> original Exynos-specific change.
>>
>> Tested on a s3c2416 and s3c2442 based machine.
>
> ping?

Kukjin has already applied my 2 patches doing this for Exynos.
You might need to rebase your patches on top of his for-next and re-sen=
d.


--=20
With warm regards,
Sachin
