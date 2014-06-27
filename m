From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 08/14] mfd: max77802: Add DT binding documentation
Date: Fri, 27 Jun 2014 10:50:26 +0200
Message-ID: <53AD3052.40901@collabora.co.uk>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk> <1403806546-31122-9-git-send-email-javier.martinez@collabora.co.uk> <53AD25F6.6030007@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53AD25F6.6030007@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

Thanks a lot for your feedback.

On 06/27/2014 10:06 AM, Andreas F=E4rber wrote:
> Am 26.06.2014 20:15, schrieb Javier Martinez Canillas:
>> Add Device Tree binding documentation for Maxim 77802 PMIC.
>>=20
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> ---
>>=20
>> Changes since v4: None
>>=20
>> Changes since v3: None
>>=20
>> Changes since v2:
>>  - Explain better the Dynamic Voltage Scaling (DVS) support in some =
Buck
>>    regulators and the max77802,pmic-buck-{dvs,selb}-gpios properties=
=2E
>>    Suggested by Mark Brown.
>>=20
>>  Documentation/devicetree/bindings/mfd/max77802.txt | 97 +++++++++++=
+++++++++++
>>  1 file changed, 97 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/max77802.t=
xt
>>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Do=
cumentation/devicetree/bindings/mfd/max77802.txt
>> new file mode 100644
>> index 0000000..f3b67c5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
>> @@ -0,0 +1,97 @@
>> +Maxim MAX77802 multi-function device
>> +
>> +MAX77802 is a Mulitifunction device with PMIC, RTC and Charger on c=
hip. It is
>=20
> "Multifunction"?
>=20

Yes, another typo. I'll fix it on the next series as well.

>> +interfaced to host controller using i2c interface. PMIC, Charger an=
d RTC
>> +submodules are addressed using same i2c slave address.
>> +
>> +Buck regulators 1, 2, 3, 4 and 6 include Dynamic Voltage Scaling (D=
VS) that
>> +allows each output voltage to change dynamically. Each Buck output =
voltage
>> +is selected using a set of external inputs: DVS1-3 and SELB1, 2, 3 =
and 6.
>> +
>> +There are 8 DVS registers that can be used to configure the output =
voltage
>> +for each Buck regulator and which one is active is controled by DVS=
x lines.
>> +
>> +SELBx lines are used to control if individual Buck lines are ON or =
OFF.
>> +
>> +This document describes the binding for mfd device and PMIC submodu=
le.
>> +
>> +Binding for the built-in 32k clock generator block is defined separ=
ately
>> +in bindings/clk/maxim,max77802.txt file.
>> +
>> +Required properties:
>> +- compatible : Must be "maxim,max77802";
>> +- reg : Specifies the i2c slave address of PMIC block.
>> +- interrupts : This i2c device has an IRQ line connected to the mai=
n SoC.
>> +- interrupt-parent : The parent interrupt controller.
>> +
>> +Optional properties:
>> +- max77802,pmic-buck-default-dvs-idx: We'll always write this DVS i=
ndex in the
>> +  PMIC for Bucks with DVS.
>> +  NOTE: at the moment these bindings don't include enough details f=
or actual
>> +  GPIO-DVS--this just lets you choose which single slot to use.
>> +
>> +- max77802,pmic-buck-dvs-gpios: A GPIO array where each GPIO is con=
nected to a
>> +  DVS line. We'll try to set these GPIOs to match pmic-buck-default=
-dvs-idx at
>> +  probe time if they are defined. If some or all of these GPIOs are=
 not defined
>> +  it's assumed that the board has any missing GPIOs hardwired to ma=
tch
>> +  pmic-buck-default-dvs-idx.
>> +
>> +- max77802,pmic-buck-selb-gpios: A GPIO array where each GPIO is co=
nnected to a
>> +  SELBx line. Should be five values: 1, 2, 3, 4, 6. It is strongly =
suggested to
>> +  include these GPIOs if there's any chance that changing DVS GPIOs=
 one line at
>> +  a time might glitch your DVS values.
>> +
>> +Optional node:
>> +- regulators : The regulators of max77802 have to be instantiated
>> +  under subnode named "regulators" using the following format.
>> +
>> +	regulator_name {
>=20
> The convention, I was told, would be regulator-name as node name.
>=20

Ok, I'll change this to regulator-name. It is a symbolic name to refer =
to the
regulator node name anyways since now that the regulator-compatible pro=
perty is
deprecated, the regulator node name is used for matching. So the list o=
f valid
regulator node names is properly defined below:

>> +
>> +  The regulator node name should be initialized with a string
>> +to get matched with their hardware counterparts as follow:
>> +
>> +	-LDOn 	:	for LDOs, where n can lie in range 1 to 35.
>> +			example: LDO1, LDO2, LDO35.
>> +	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 10.
>> +			example: BUCK1, BUCK5, BUCK10.
>> +Example:
>> +
>> +	max77802@09 {
>> +		compatible =3D "maxim,max77802";
>> +		interrupt-parent =3D <&wakeup_eint>;
>> +		interrupts =3D <26 0>;
>> +		reg =3D <0x09>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		max77802,pmic-buck-default-dvs-idx =3D <1>;
>> +		max77802,pmic-buck-dvs-gpios =3D <&gpy7 6 0>,
>> +					       <&gpj4 2 0>,
>> +					       <&gpj4 3 0>;
>> +		max77802,pmic-buck-selb-gpios =3D <&gph0 2 0>,
>> +						<&gph0 3 0>,
>> +						<&gph0 4 0>,
>> +						<&gph0 5 0>,
>> +						<&gph0 6 0>;
>> +
>> +		regulators {
>> +			ldo11_reg: LDO11 {
>> +				regulator-compatible =3D "LDO11";
>> +				regulator-name =3D "vdd_ldo11";
>> +				regulator-min-microvolt =3D <1900000>;
>> +				regulator-max-microvolt =3D <1900000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck1_reg {
>=20
> Missing ": BUCK1"
>=20

Ups, since it was documentation and not the DTS I completely missed tha=
t. Thanks
for pointing out!

>> +				regulator-compatible =3D "BUCK1";
>> +				regulator-name =3D "vdd_mif";
>> +				regulator-min-microvolt =3D <950000>;
>> +				regulator-max-microvolt =3D <1300000>;
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +			};
>> +	};
>=20
> Regards,
> Andreas
>=20

Best regards,
Javier
