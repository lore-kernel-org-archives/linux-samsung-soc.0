From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 12/14] clk: max77802: Add DT binding documentation
Date: Fri, 27 Jun 2014 09:55:51 +0200
Message-ID: <53AD2387.5090704@collabora.co.uk>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk> <1403806546-31122-13-git-send-email-javier.martinez@collabora.co.uk> <53AD22D0.9000403@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33743 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbaF0Hz6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 03:55:58 -0400
In-Reply-To: <53AD22D0.9000403@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Andres,

Thanks a lot for your feedback.

On 06/27/2014 09:52 AM, Andreas F=E4rber wrote:
> Am 26.06.2014 20:15, schrieb Javier Martinez Canillas:
>> Add Device Tree binding documentation for the clocks
>> outputs in the Maxim 77802 Power Management IC.
>>=20
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> ---
>>=20
>> Changes since v4: None
>>=20
>> Changes since v3:
>>  - Don't use the same clock driver name in clock-names since it's a =
consumer
>>    concept and most probably will be different. Suggested by Doug An=
derson.
>>=20
>> Changes since v2:
>>  - Split the DT binding documentation in a separate patch.
>>=20
>>  .../devicetree/bindings/clock/maxim,max77802.txt   | 42 +++++++++++=
+++++++++++
>>  1 file changed, 42 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/maxim,ma=
x77802.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/clock/maxim,max77802.=
txt b/Documentation/devicetree/bindings/clock/maxim,max77802.txt
>> new file mode 100644
>> index 0000000..26bc4f7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/maxim,max77802.txt
>> @@ -0,0 +1,42 @@
>> +Binding for Maxim MAX77802 32k clock generator block
>> +
>> +This is a part of device tree bindings of MAX77802 multi-function d=
evice.
>> +More information can be found in bindings/mfd/max77802.txt file.
>> +
>> +The MAX77802 contains two 32.768khz clock outputs that can be contr=
olled
>> +(gated/ungated) over I2C.
>> +
>> +Following properties should be presend in main device node of the M=
=46D chip.
>=20
> "present"
>

Right, it's a typo. I'll wait for further feedback and will fix both is=
sues you
pointed out in the next version of the series.

> Regards,
> Andreas
>=20

Best regards,
Javier
