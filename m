From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 19/20] ARM: Exynos5: Add combiner, wakeup interrupt
 controller and ethernet nodes
Date: Fri, 18 May 2012 23:23:43 -0700
Message-ID: <CAOesGMjrDL2-cS7XFUYnJdL5i6=YFzf6yRUO3eLX4a4GVB4x_w@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-20-git-send-email-thomas.abraham@linaro.org>
	<CAOesGMhxn6L+Pcp-v2v6z7srGd=8kGwqff7Tt6ok8pHMVXp3ZQ@mail.gmail.com>
	<20120519061129.BEE9D3E046E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:57049 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753033Ab2ESGXo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 02:23:44 -0400
Received: by obbtb18 with SMTP id tb18so4961448obb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 May 2012 23:23:43 -0700 (PDT)
In-Reply-To: <20120519061129.BEE9D3E046E@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On Fri, May 18, 2012 at 11:11 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> On Wed, 2 May 2012 10:57:11 -0700, Olof Johansson <olof@lixom.net> wr=
ote:
>> Hi,
>>
>> [adding devicetree-discuss]
>>
>> On Mon, Apr 30, 2012 at 12:14 PM, Thomas Abraham
>> <thomas.abraham@linaro.org> wrote:
>> > And interrupt combiner, external interrupt wakeup interrupt contro=
ller
>> > and smsc9215 lan controller nodes.
>> >
>> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> > ---
>> > =A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 11 ++++++
>> > =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 55 ++++=
+++++++++++++++++++++++++
>> > =A02 files changed, 66 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/=
boot/dts/exynos5250-smdk5250.dts
>> > index bcc4b89..dbc4bdb 100644
>> > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> > @@ -24,6 +24,17 @@
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bootargs =3D "root=3D/dev/ram0 rw r=
amdisk=3D8192 console=3DttySAC1,115200";
>> > =A0 =A0 =A0 =A0};
>> >
>> > + =A0 =A0 =A0 lan9215@0x05000000 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "smsc,lan9215", "smsc=
,lan9115";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x05000000 0x20000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <5 0>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&wakeup_eint>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-mode =3D "mii";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc,irq-push-pull;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc,force-internal-phy;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-mac-address =3D [00 80 00 23 4=
5 67];
>> > + =A0 =A0 =A0 };
>> > +
>>
>> since the 911x sits on a chipselect bus, you should instead add that
>> bus to the dtsi and define this on that bus.
>>
>> Something like this in the dtsi:
>>
>> =A0 =A0 =A0 =A0sromc-bus {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <2>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ranges =3D < 0 0 0x04000000 0x20000
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 0 0x05000000 0=
x20000
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 2 0 0x06000000 0=
x20000
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 3 0 0x07000000 0=
x20000>;
>> =A0 =A0 =A0 =A0};
>>
>> and in the dts:
>>
>> =A0 =A0 =A0 =A0sromc-bus {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lan9215@1,0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "smsc,=
lan9215", "smsc,lan9115";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <1 0 0x20000>=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <5 0>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-parent =3D =
<&wakeup_eint>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phy-mode =3D "mii";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0smsc,irq-push-pull;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0smsc,force-internal-p=
hy;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0local-mac-address =3D=
 [00 80 00 23 45 67];
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>> =A0 =A0 =A0 =A0 };
>>
>>
>> (You might be able to do just fine with one address cell, I'm not 10=
0%
>> sure why Grant's example uses two, but I used the same above for
>> consistency).
>
> Because otherwise there is no way to describe an offset from the base
> of the chipselect base value, and the core code will try to apply the
> size to the cs part of the address specifier. (so in the example
> above the address range described by:
>
> =A0 =A0 =A0 =A0reg =3D <1 0x20000>;
>
> would mean cs values 1 to 0x20001; which is definitely wrong.

Ah yes, that makes perfect sense. I can't seem to create an account to
update the 'Device_Tree_Usage' page on the devicetree.org wiki, but
it'd probably not be a bad idea to include the above for explanation
there.


-Olof
