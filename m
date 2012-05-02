From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 19/20] ARM: Exynos5: Add combiner, wakeup interrupt
 controller and ethernet nodes
Date: Wed, 2 May 2012 10:57:11 -0700
Message-ID: <CAOesGMhxn6L+Pcp-v2v6z7srGd=8kGwqff7Tt6ok8pHMVXp3ZQ@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-20-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:62333 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754749Ab2EBR5M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 May 2012 13:57:12 -0400
Received: by yhmm54 with SMTP id m54so962436yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 May 2012 10:57:11 -0700 (PDT)
In-Reply-To: <1335813270-13083-20-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org

Hi,

[adding devicetree-discuss]

On Mon, Apr 30, 2012 at 12:14 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> And interrupt combiner, external interrupt wakeup interrupt controlle=
r
> and smsc9215 lan controller nodes.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 11 ++++++
> =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 55 +++++++=
++++++++++++++++++++++
> =A02 files changed, 66 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boo=
t/dts/exynos5250-smdk5250.dts
> index bcc4b89..dbc4bdb 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -24,6 +24,17 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bootargs =3D "root=3D/dev/ram0 rw ramd=
isk=3D8192 console=3DttySAC1,115200";
> =A0 =A0 =A0 =A0};
>
> + =A0 =A0 =A0 lan9215@0x05000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "smsc,lan9215", "smsc,la=
n9115";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x05000000 0x20000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <5 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&wakeup_eint>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-mode =3D "mii";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc,irq-push-pull;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc,force-internal-phy;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-mac-address =3D [00 80 00 23 45 6=
7];
> + =A0 =A0 =A0 };
> +

since the 911x sits on a chipselect bus, you should instead add that
bus to the dtsi and define this on that bus.

Something like this in the dtsi:

       sromc-bus {
               #address-cells =3D <2>;
               #size-cells =3D <1>;
               ranges =3D < 0 0 0x04000000 0x20000
                          1 0 0x05000000 0x20000
                          2 0 0x06000000 0x20000
                          3 0 0x07000000 0x20000>;
       };

and in the dts:

       sromc-bus {
               lan9215@1,0 {
                       compatible =3D "smsc,lan9215", "smsc,lan9115";
                       reg =3D <1 0 0x20000>;
                       interrupts =3D <5 0>;
                       interrupt-parent =3D <&wakeup_eint>;
                       phy-mode =3D "mii";
                       smsc,irq-push-pull;
                       smsc,force-internal-phy;
                       local-mac-address =3D [00 80 00 23 45 67];
               };
        };


(You might be able to do just fine with one address cell, I'm not 100%
sure why Grant's example uses two, but I used the same above for
consistency).

Also, I don't think it's a good idea to hardcode the mac address in
the dts like this; have u-boot fill it in from the environment
variable there instead, if needed.



-Olof
