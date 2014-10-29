From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 3/4] regulator: max77686: Add suspend disable for some
 LDOs
Date: Wed, 29 Oct 2014 11:51:46 +0100
Message-ID: <5450C6C2.2050506@collabora.co.uk>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com> <1414411911-5539-4-git-send-email-k.kozlowski@samsung.com> <20141028223121.GH18557@sirena.org.uk> <1414574413.18868.6.camel@AMDC1943> <20141029100142.GR18557@sirena.org.uk> <1414577934.18868.7.camel@AMDC1943> <20141029103140.GY18557@sirena.org.uk> <1414579442.18868.13.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414579442.18868.13.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/29/2014 11:44 AM, Krzysztof Kozlowski wrote:
> On =C5=9Bro, 2014-10-29 at 10:31 +0000, Mark Brown wrote:
>> On Wed, Oct 29, 2014 at 11:18:54AM +0100, Krzysztof Kozlowski wrote:
>> > On =C5=9Bro, 2014-10-29 at 10:01 +0000, Mark Brown wrote:
>>=20
>> > > No, this isn't suspend enable control - this is normal, standard=
 enable
>> > > control and the device has no suspend enable control.
>>=20
>> > You mean that for such regulator the driver shouldn't implement
>> > suspend_enable()?
>>=20
>> Yes, if there is no separate control of suspend mode in hardware the=
n of
>> course the driver shouldn't implement operations for things it doesn=
't
>> have.
>=20
> Oh, thanks! I'll send fixed patch.
>=20
> This means that probably the max77802 ("mirrored" driver) should be
> fixed...
>=20

Indeed, I had the same confusion that you had. Just to avoid duplicatin=
g work,
do you want me to send a fix or are you going to include one on your se=
ries?

> Best regards,
> Krzysztof
>=20
>=20

Best regards,
Javier
