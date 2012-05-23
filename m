From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 09:47:28 +0530
Message-ID: <CAKew6eVXhg9RscZFM1_go3bjvvn_99zqaDRQ1ZjG_BUWCYR0YQ@mail.gmail.com>
References: <y@samsung.com>
	<4fbb2ada.63de440a.589d.78e2@mx.google.com>
	<4FBC4255.4040307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FBC4255.4040307@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonghwa3.lee@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, May 23, 2012 at 7:20 AM,  <jonghwa3.lee@samsung.com> wrote:
> Hi, again.
> On 2012=EB=85=84 05=EC=9B=94 22=EC=9D=BC 14:57, yadi.brar01@gmail.com=
 wrote:
>
>
>> +static __devinit int max77686_pmic_probe(struct platform_device *pd=
ev)
>> +{
>
>> +
>> + =C2=A0 =C2=A0 for (i =3D 0; i < pdata->num_regulators; i++) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config.dev =3D max77686-=
>dev;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config.init_data =3D pda=
ta->regulators[i].init_data;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config.driver_data =3D m=
ax77686;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config.regmap =3D iodev-=
>regmap;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev[i] =3D regulator_re=
gister(&regulators[i], &config);
>
>
> I'm sorry that i missed one. You have to register all regulators
> unconditionally. Mark brown commented about this to my former patch.
>
> 'No, you should unconditionally register all regulators the device
> physically has. =C2=A0This is useful for debug and simplifies the cod=
e.'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0- from Mark Brown
>

Yes, we are registering all regulators here.
As pdata->num_regulators will be equal to ARRAY_SIZE(regulators)

Thanks,
Yadwinder.
