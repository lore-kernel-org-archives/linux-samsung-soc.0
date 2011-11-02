From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2] gpio/samsung: Add device tree support for Exynos4
Date: Wed, 2 Nov 2011 18:37:19 +0530
Message-ID: <CAJuYYwRrku+7u_Ws4_c99xP3tWXG9ewj=sULchwcQK2_sdPnJQ@mail.gmail.com>
References: <1320108227-2693-1-git-send-email-thomas.abraham@linaro.org>
	<004d01cc9956$46ef8040$d4ce80c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35118 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097Ab1KBNHV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 09:07:21 -0400
Received: by ggnb2 with SMTP id b2so100841ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2011 06:07:20 -0700 (PDT)
In-Reply-To: <004d01cc9956$46ef8040$d4ce80c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

Hi Mr. Kim,

On 2 November 2011 17:25, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> As gpio chips get registered, a device tree node which represents th=
e
>> gpio chip is searched and attached to it. A translate function is al=
so
>> provided to convert the gpio specifier into actual platform settings
>> for pin function selection, pull up/down and driver strength setting=
s.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>> Changes since v1:
>> - As suggested by Rob and Grant, the gpio controller node lookup is =
based
>> =A0 on the base address of the gpio controller instead of the unique
>> =A0 per-controller compatible property value.
>>
>> This patch is based on the following tree and branch.
>> git://git.linaro.org/git/people/arnd/arm-soc.git =A0branch: for-next
>>
>> =A0.../devicetree/bindings/gpio/gpio-samsung.txt =A0 =A0 =A0| =A0 40=
 ++++++++++++
>> =A0drivers/gpio/gpio-samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 66
>> ++++++++++++++++++++
>> =A02 files changed, 106 insertions(+), 0 deletions(-)
>> =A0create mode 100644

[...]

>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung=
=2Ec
>> index 8662518..0140756 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c

[...]

> Thomas,
>
> Happens following build error.
>
> drivers/gpio/gpio-samsung.c: In function 'samsung_gpiolib_init':
> drivers/gpio/gpio-samsung.c:2519: error: 'EXYNOS4_PA_GPIO1' undeclare=
d
> (first use in this function)
> drivers/gpio/gpio-samsung.c:2519: error: (Each undeclared identifier =
is
> reported only once
> drivers/gpio/gpio-samsung.c:2519: error: for each function it appears=
 in.)
> drivers/gpio/gpio-samsung.c:2533: error: 'EXYNOS4_PA_GPIO2' undeclare=
d
> (first use in this function)
> drivers/gpio/gpio-samsung.c:2547: error: 'EXYNOS4_PA_GPIO3' undeclare=
d
> (first use in this function)

Can this be fixed while you apply this patch. If required, I can
submit an updated patch for this.

Thanks,
Thomas.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
