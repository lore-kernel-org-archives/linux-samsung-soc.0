From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2 1/4] Exynos4 NURI: configure regulators and PMIC
Date: Wed, 22 Jun 2011 11:31:35 +0900
Message-ID: <BANLkTi=pv=y+1XC5bYEHgL1sy48JPztiOg@mail.gmail.com>
References: <20110620103124.GD31864@opensource.wolfsonmicro.com>
	<1308622033-2521-1-git-send-email-myungjoo.ham@samsung.com>
	<1308622033-2521-2-git-send-email-myungjoo.ham@samsung.com>
	<4E002D18.2080401@linaro.org>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41881 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757845Ab1FVCbh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 22:31:37 -0400
In-Reply-To: <4E002D18.2080401@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, dg77.kim@samsung.com

On Tue, Jun 21, 2011 at 2:33 PM, Tushar Behera <tushar.behera@linaro.or=
g> wrote:
> On Tuesday 21 June 2011 07:37 AM, MyungJoo Ham wrote:
>>
>> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>
>> --
>> Changes from v1. Thanks so much for your valuable comments, Mark.
>> - Removed unnecessary initialization data
>> - Add __initdata where necessary
>> - Corrected a regulator name for ADC
>> ---
>> =C2=A0arch/arm/mach-exynos4/mach-nuri.c | =C2=A0622
>> ++++++++++++++++++++++++++++++++++++-
>> =C2=A01 files changed, 621 insertions(+), 1 deletions(-)
>>
> Will it be possible to move PMIC specific defines to a common file an=
d make
> appropriate calls in the board-specific file?
>
> In that way, we can re-use this PMIC code on some other boards (e.g.
> Insignal low-cost board Origen featuring Exynos4210 also features MAX=
8997).
>

Yes, we have tried creating PMIC defines at a seperated file in our
local repositories (still doing so in those repositories).
However, that ended up creating multiple PMIC defines (one PMIC define
file for each board); the connections between LDO# and devices are
different.

>
> --
> Tushar Behera
>


--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
