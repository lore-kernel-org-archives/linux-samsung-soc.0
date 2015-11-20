From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Fri, 20 Nov 2015 13:44:37 -0300
Message-ID: <564F4DF5.2010301@osg.samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com> <564EFD13.7040409@samsung.com>
 <564F0053.6020401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:38105 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161900AbbKTQon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 11:44:43 -0500
In-Reply-To: <564F0053.6020401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Inki,

On 11/20/2015 08:13 AM, Inki Dae wrote:
>=20
>=20
> 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 19:59=EC=97=90 Inki Dae =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Hi Javier,
>>
>> 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:51=EC=97=90 Javier Martinez=
 Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> On 11/19/2015 11:55 AM, Javier Martinez Canillas wrote:
>>>>>>
>>>>>
>>>>> This series causes a boot failure on at least an Exynos5800 Peach=
 Pi
>>>>> Chromebook (tested myself) and seems to be the cause of other Exy=
nos
>>>>> boards failing to boot: http://kernelci.org/boot/?exynos&fail
>>>>>
>>>>> [snip]
>>>>>
>>>>>>   drm/exynos: add pm_runtime to Mixer
>>>>>>   drm/exynos: add pm_runtime to FIMD
>>>>>
>>>>> I had to revert these patches in order to get the machine in a bo=
otable
>>>>> state again, the sha1 hash for these patches in next-20151119 are=
:
>>>>>
>>>>> 045febd5f813 drm/exynos: add pm_runtime to FIMD
>>>
>>> On a closer look, only reverting the FIMD patch is enough
>>> to make at least the Exynos5800 Peach Pi to boot again.
>>
>> Thanks for report.
>>
>> I assume that the issue is because above patch removed 'suspended' v=
ariable
>> for checking the suspend status in runtime so I revived it.
>>
>> I'm not sure that the change could resolve the issue. Could you test=
 it
>> with the change again? I have no Exynos5800 Peach Pi board. :(
>>
>> For this, I pushed it to below exynos-drm/for-next branch,
>> 	https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git=
/commit/?h=3Dexynos-drm/for-next&id=3De84f43e2b2c3388694b0b3a58c2c4447f=
1fbae7c
>>
>> If the issue is resolved by the change then I will modify other patc=
hes for
>> DECON series. And if really so, there may be a corner case we missed=
=2E
>=20
> Oops, I found out one error at the boot log,
> http://storage.kernelci.org/next/next-20151120/arm-multi_v7_defconfig=
+CONFIG_LKDTM=3Dy/lab-collabora/boot-exynos5800-peach-pi.html
>=20
> The boot log says,
> [    5.754493] vdd_ldo9: supplied by vdd_2v
> [    5.765510] of_graph_get_next_endpoint(): no port node found in /d=
p-controller@145B0000
>

This message is a red herring for the reported issue, the message is al=
so
present when the machine boots and the display is brought correctly.
=20
> Seems this error is because exynos5800-peach-pit.dts file doesn't hav=
e 'ports' node in dp node.
>
> Below is dp node description of exynos5420-peach-pit.dts file.
> &dp {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hpd_gpio>;
> 	samsung,color-space =3D <0>;
> 	samsung,dynamic-range =3D <0>;
> 	samsung,ycbcr-coeff =3D <0>;
> 	samsung,color-depth =3D <1>;
> 	samsung,link-rate =3D <0x06>;
> 	samsung,lane-count =3D <2>;
> 	samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
>=20
> 	ports {
> 		port@0 {
> 			dp_out: endpoint {
> 				remote-endpoint =3D <&bridge_in>;
> 			};
> 		};
> 	};
> };
>=20
> And below is for exynos5800-peash-pit.dts,
> &dp {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hpd_gpio>;
> 	samsung,color-space =3D <0>;
> 	samsung,dynamic-range =3D <0>;
> 	samsung,ycbcr-coeff =3D <0>;
> 	samsung,color-depth =3D <1>;
> 	samsung,link-rate =3D <0x0a>;
> 	samsung,lane-count =3D <2>;
> 	samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
> 	panel =3D <&panel>;
> };
>=20

The difference is because the Exynos5420 Peach Pit Display Port is not
attached directly to the display panel, there is an eDP/LVDS bridge chi=
p
in the middle (PS8622) while the Exynos5800 Peach Pi doesn't have that.

The Exynos DP driver lookups for either a panel phandle or an OF graph
endpoint that points to a bridge chip and the bridge enpoint has a port
that points to the panel.

So the DT is correct but of_graph_get_next_endpoint() always prints an
error if the port so OF graph endpoints it seems can't be optional as
used in this driver. Maybe that message should be change to debug then?

Another option is to extend the DP driver DT binding to be more generic
supporting having a port to a panel besides a bridge, so we could have
something like this for Exynos5800 Peach and be consistent in both case=
s:

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/=
dts/exynos5800-peach-pi.dts
index 7b018e451880..9c6fd7314ee0 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -122,6 +122,12 @@
 		compatible =3D "auo,b133htn01";
 		power-supply =3D <&tps65090_fet6>;
 		backlight =3D <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint =3D <&dp_out>;
+			};
+		};
 	};
=20
 	mmc1_pwrseq: mmc1_pwrseq {
@@ -148,7 +154,14 @@
 	samsung,link-rate =3D <0x0a>;
 	samsung,lane-count =3D <2>;
 	samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
-	panel =3D <&panel>;
+
+	ports {
+		port@0 {
+			dp_out: endpoint {
+				remote-endpoint =3D <&panel_in>;
+			};
+		};
+	};
 };
=20
 &fimd {

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
