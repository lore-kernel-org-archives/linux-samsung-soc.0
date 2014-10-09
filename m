From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 3/5] regulator: dt-bindings: Add regulator-initial-mode
 support
Date: Thu, 09 Oct 2014 17:04:35 +0200
Message-ID: <5436A403.1050109@collabora.co.uk>
References: <1412775847-15213-1-git-send-email-javier.martinez@collabora.co.uk> <1412775847-15213-4-git-send-email-javier.martinez@collabora.co.uk> <1412844355.1316.15.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53970 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755785AbaJIPEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 11:04:41 -0400
In-Reply-To: <1412844355.1316.15.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hello Krzysztof,

Thanks a lot for your feedback.

On 10/09/2014 10:45 AM, Krzysztof Kozlowski wrote:
> On =C5=9Bro, 2014-10-08 at 15:44 +0200, Javier Martinez Canillas wrot=
e:
>> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
>> @@ -23,6 +23,14 @@ Optional properties:
>>    state among following defined suspend states:
>>    <3>: PM_SUSPEND_MEM - Setup regulator according to regulator-stat=
e-mem
>>    <4>: PM_SUSPEND_MAX - Setup regulator according to regulator-stat=
e-disk
>> +- regulator-initial-mode: initial regulator operating mode. One of =
following:
>> +	<1>: REGULATOR_MODE_FAST    - Regulator can handle fast changes.
>> +	<2>: REGULATOR_MODE_NORMAL  - Normal regulator power supply mode.
>> +	<4>: REGULATOR_MODE_IDLE    - Regulator runs in a more efficient m=
ode.
>> +	<8>: REGULATOR_MODE_STANDBY - Regulator runs in the most efficient=
 mode.
>> +  modes are defined in the dt-bindings/regulator/regulator.h header=
 and can be
>> +  used in device tree sources files. If no mode is defined, then th=
e OS will not
>> +  manage the operating mode and the HW default values will be used =
instead.
>>  - regulator-state-mem sub-root node for Suspend-to-RAM mode
>>    : suspend to memory, the device goes to sleep, but all data store=
d in memory,
>>    only some external interrupt can wake the device.
>=20
> I agree with the need and the idea of generic bindings for operating
> modes for regulators. At least for Exynos-based boards the PMICs have
> quite similar opmodes.
>=20
> However the regulator mode from consumer.h (and in above doc) does no=
t
> match well with these opmodes. Example is yours patch 4/5:
>  - idle ("more efficient mode") maps to "low power mode in suspend",
>  - standby ("the most efficient mode") maps to "OFF in suspend".
>=20
> Actually we are not enable "efficient modes" but we configure how the
> regulator will behave when AP says - I'm suspending.
>

Agree, Mark also pointed out that there is a difference between changin=
g
how the regulator will behave on runtime vs changing how the regulator
will behave during system suspend. AFAIU from his explanation, the mode=
s
defined in consumer.h only applies to the former and conceptually there
should be a difference between those two cases even when the Maxim PMIC
seems to mix it both in the data-sheet and by using the same field.

I answered Mark on patch #5 with a suggestion on how to handle this in
a generic way to avoid each driver having their own custom DT binding
and duplicating the parsing code.

Could you please answer there with your thoughts?
=20
>=20
> Another issue: is "initial_state" not doing all this already?
>=20

One of the options I indeed evaluated was if using initial_state could =
be
possible. But currently the .set_suspend_mode function handler is only
called for the STANDBY, MEM and MAX suspend modes. While is true that t=
his
could be extended to also support PM_SUSPEND_ON, I don't think that it
makes sense conceptually. Since is not the same to set a mode to be use=
d
at runtime than setting a mode to be used during suspend.

AFAIU that is the reason why there are separate .set_suspend_mode and
=2Eset_mode operations and that's why there are both an .initial_state
and an .initial_mode.

> Best regards,
> Krzysztof
>

Best regards,
Javier
