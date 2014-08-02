From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v6 04/10] ARM: dts: Clean up exynos5250-snow
Date: Sat, 02 Aug 2014 15:08:10 +0200
Message-ID: <53DCE2BA.7010803@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-5-git-send-email-afaerber@suse.de> <53DCD7D7.2070208@gmail.com> <53DCDFF3.7030909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38093 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751534AbaHBNIP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 09:08:15 -0400
In-Reply-To: <53DCDFF3.7030909@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

Am 02.08.2014 14:56, schrieb Tomasz Figa:
> On 02.08.2014 14:21, Tomasz Figa wrote:
>> On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
>>> Use the new style of referencing inherited nodes and use symbolic n=
ames.
>>> Reorder one pinctrl node in GPIO order.
>>>
>>> Goal is the alignment of all exynos5250 based device trees for comp=
arison.
>>>
>>> Suggested-by: Doug Anderson <dianders@chromium.org>
>>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v5 -> v6:
>>>  * Split off label additions (Doug Anderson)
>>>  * Fixed alphabetical order of sd3_* nodes (Doug Anderson)
>>> =20
>>>  v4 -> v5:
>>>  * Introduced labels to consistently use new referencing style (Tom=
asz Figa)
>>>  * Use IRQ_TYPE_* constants
>>>  * Use some more GPIO_ACTIVE_*
>>>
>>>  v3 -> v4: Unchanged
>>> =20
>>>  v3: New (Doug Anderson)
>>>
>>>  arch/arm/boot/dts/exynos5250-snow.dts | 291 +++++++++++++++++-----=
------------
>>>  1 file changed, 145 insertions(+), 146 deletions(-)
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>=20
> Just for convenience of other reviewers, here are actual changes done=
 do
> the device tree after compiling into dtb and then back into dts:

Erm, to not confuse reviewers, this must be over the whole series:

>> --- exynos5250-snow.dtb.dts	2014-08-02 14:54:15.145905921 +0200
>> +++ ../dtbs.post/exynos5250-snow.dtb.dts	2014-08-02 14:54:15.1469059=
21 +0200
>> @@ -8,6 +8,7 @@
>>  	model =3D "Google Snow";
>> =20
>>  	chosen {
>> +		bootargs =3D "console=3Dtty1";
>>  	};
>> =20
>>  	aliases {

This is optional follow-on patch 05/10.

>> @@ -829,15 +830,6 @@
>>  			phandle =3D <0x44>;
>>  		};
>> =20
>> -		hdmi-hpd-irq {
>> -			samsung,pins =3D "gpx3-7";
>> -			samsung,pin-function =3D <0x0>;
>> -			samsung,pin-pud =3D <0x1>;
>> -			samsung,pin-drv =3D <0x0>;
>> -			linux,phandle =3D <0x33>;
>> -			phandle =3D <0x33>;
>> -		};
>> -
>>  		max77686-irq {
>>  			samsung,pins =3D "gpx3-2";
>>  			samsung,pin-function =3D <0x0>;
>> @@ -846,6 +838,15 @@
>>  			linux,phandle =3D <0xe>;
>>  			phandle =3D <0xe>;
>>  		};
>> +
>> +		hdmi-hpd-irq {
>> +			samsung,pins =3D "gpx3-7";
>> +			samsung,pin-function =3D <0x0>;
>> +			samsung,pin-pud =3D <0x1>;
>> +			samsung,pin-drv =3D <0x0>;
>> +			linux,phandle =3D <0x33>;
>> +			phandle =3D <0x33>;
>> +		};
>>  	};
>> =20
>>  	pinctrl@13400000 {

This is this patch 04/10. Just a movement.

>> @@ -1703,12 +1704,12 @@
>>  		samsung,dw-mshc-ciu-div =3D <0x3>;
>>  		samsung,dw-mshc-sdr-timing =3D <0x2 0x3>;
>>  		samsung,dw-mshc-ddr-timing =3D <0x1 0x2>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <0x27 0x28 0x29>;
>> =20
>>  		slot@0 {
>>  			reg =3D <0x0>;
>>  			bus-width =3D <0x4>;
>> -			pinctrl-names =3D "default";
>> -			pinctrl-0 =3D <0x27 0x28 0x29>;
>>  		};
>>  	};
>> =20

This is preceding patch 01/10.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
