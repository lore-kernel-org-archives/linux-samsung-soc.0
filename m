From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH v2] ARM: dts: Add dts file for odroid XU3 board
Date: Wed, 07 Jan 2015 23:38:53 +0100
Message-ID: <1420670333.6075.2.camel@collabora.co.uk>
References: <1417721269-19342-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <54AA48E6.3040404@samsung.com> <1420470469.15910.134.camel@collabora.co.uk>
	 <69242715.30115.1420655868687.JavaMail.yahoo@jws10659.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="sha-1"; protocol="application/x-pkcs7-signature";
	boundary="=-XvH2OCxlSXtU3zM8A+1m"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:39656 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600AbbAGWi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 17:38:59 -0500
In-Reply-To: <69242715.30115.1420655868687.JavaMail.yahoo@jws10659.mail.bf1.yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Heesub Shin <heesub.shin@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--=-XvH2OCxlSXtU3zM8A+1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-01-07 at 18:37 +0000, Anand Moon wrote:
> Hi Sjoerd,
>=20
> I am using 3.18.0 kernel on my odroidxu3 board.
> Using exynos_defconfig I am able to boot the board.
>=20
> Are you able to get all the 8 core CPU up and running ?
>=20
>=20
> Only 4 core cpu's are on my board. Also CpuFreq is not working.
>=20
> Can you share some point on this.

The defconfig is using the bL switcher, which pairs up big and little
cores to make them appear as one core.. So for 8 real cores, you'll get
4 "virtual cores".




>=20
> root@odroid-xu3:/usr/src/odroidxu3-3.18.y-debug# cat /proc/cpuinfo | grep=
 processor
> processor : 0
> processor : 5
> processor : 6
> processor : 7
>=20
>=20
> Below are the logs of the board.
>=20
> [    9.720905] Registering SWP/SWPB emulation handler
> [    9.725457] big.LITTLE switcher initializing
> [    9.729518] CPU0 paired with CPU4
> [    9.732805] CPU5 paired with CPU3
> [    9.736069] CPU6 paired with CPU2
> [    9.739386] CPU7 paired with CPU1
> [    9.742688] GIC ID for CPU 0 cluster 1 is 4
> [    9.746816] GIC ID for CPU 0 cluster 0 is 0
> [    9.800575] IRQ153 no longer affine to CPU1
> [    9.803065] CPU1: shutdown
> [    9.813482] GIC ID for CPU 1 cluster 0 is 1
> [    9.869776] IRQ154 no longer affine to CPU2
> [    9.872218] CPU2: shutdown
> [    9.879985] GIC ID for CPU 2 cluster 0 is 2
> [    9.924656] IRQ155 no longer affine to CPU3
> [    9.927094] CPU3: shutdown
> [    9.935544] GIC ID for CPU 3 cluster 0 is 3
> [    9.989578] IRQ160 no longer affine to CPU4
> [    9.991787] CPU4: shutdown
> [   10.001003] GIC ID for CPU 1 cluster 1 is 5
> [   10.003812] GIC ID for CPU 2 cluster 1 is 6
> [   10.007976] GIC ID for CPU 3 cluster 1 is 7
> [   10.015308] big.LITTLE switcher initialized
> [   10.031368] registered taskstats version 1
> [   10.038110] pinctrl core: add 2 pinmux maps
> [   10.038374] samsung-pinctrl 13400000.pinctrl: found group selector 39 =
for gpx3-7
> [   10.038541] samsung-pinctrl 13400000.pinctrl: found group selector 39 =
for gpx3-7
> [   10.038586] samsung-pinctrl 13400000.pinctrl: request pin 39 (gpx3-7) =
for 14530000.hdmi
> [   10.039440] of_get_named_gpiod_flags: parsed 'hpd-gpio' property of no=
de '/hdmi@14530000[0]' - status (0)
> [   10.040227] exynos-hdmi 14530000.hdmi: Looking up vdd-supply from devi=
ce tree
> [   10.042869] exynos-hdmi 14530000.hdmi: Looking up vdd_osc-supply from =
device tree
> [   10.044700] exynos-hdmi 14530000.hdmi: Looking up vdd_pll-supply from =
device tree
> [   10.046528] exynos-hdmi 14530000.hdmi: Looking up hdmi-en-supply from =
device tree
> [   10.046558] exynos-hdmi 14530000.hdmi: Looking up hdmi-en-supply prope=
rty in node /hdmi@14530000 failed
> [   10.048281] samsung-pinctrl 13400000.pinctrl: request pin 39 (gpx3-7) =
for gpx3:39
> [   10.071915] exynos-mixer 14450000.mixer: probe start
> [   10.076942] exynos-sysmmu 14650000.sysmmu: Enabled
> [   10.076975] exynos-mixer 14450000.mixer: exynos_iommu_attach_device: A=
ttached IOMMU with pgtable 0x42264000
> [   10.077570] exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_com=
ponent_ops)
> [   10.089655] exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_compo=
nent_ops)
> [   10.095639] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
> [   10.102242] [drm] No driver support for vblank timestamp query.
> [   10.161814] cma: cma_alloc(cma c11c3218, count 2025, align 8)
> [   10.256074] cma: cma_alloc(): returned ef6cd400
> [   10.457934] Console: switching to colour frame buffer device 274x77
> [   10.511095] exynos-drm exynos-drm: fb0:  frame buffer device
> [   10.516212] exynos-drm exynos-drm: registered panic notifier
> [   10.537871] [drm] Initialized exynos 1.0.0 20110530 on minor 0
> [   10.545873] s3c-rtc 101e0000.rtc: setting system clock to 2015-01-07 1=
7:50:09 UTC (1420653009)
> [   10.553979] power-domain: Power-off latency exceeded, new value 388375=
 ns
> [   10.560076] power-domain: Power-off latency exceeded, new value 622175=
0 ns
> [   10.567225] power-domain: Power-off latency exceeded, new value 248791=
 ns
> [   10.573666] power-domain: Power-off latency exceeded, new value 650291=
6 ns
> [   11.093083] MAIN_DC: disabling
> [   11.099738] ALSA device list:
> [   11.101347]   No soundcards found.
> [   11.117975] Freeing unused kernel memory: 1732K (c079b000 - c094c000)
> [   11.775702] systemd-udevd[1676]: starting version 204
> [   15.298783] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data =
mode. Opts: (null)
> [   17.878286] init: plymouth-upstart-bridge main process (1732) terminat=
ed with status 1
> [   17.885458] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [   18.211733] init: plymouth-upstart-bridge main process (1741) terminat=
ed with status 1
> [   18.219007] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [   18.432104] init: plymouth-upstart-bridge main process (1745) terminat=
ed with status 1
> [   18.439365] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [   22.612268] EXT4-fs (mmcblk0p2): re-mounted. Opts: errors=3Dremount-ro
> [   26.072597] systemd-udevd[1923]: starting version 204
> [   32.854190] Bluetooth: Core ver 2.19
> [   32.856710] NET: Registered protocol family 31
> [   32.856733] Bluetooth: HCI device and connection manager initialized
> [   32.857604] Bluetooth: HCI socket layer initialized
> [   32.877598] Bluetooth: L2CAP socket layer initialized
> [   32.879515] Bluetooth: SCO socket layer initialized
> [   33.282331] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [   33.282356] Bluetooth: BNEP filters: protocol multicast
> [   33.282600] Bluetooth: BNEP socket layer initialized
> [   33.371899] _cpu_up: attempt to bring up CPU 2 failed
> [   33.380836] Bluetooth: RFCOMM TTY layer initialized
> [   33.381088] Bluetooth: RFCOMM socket layer initialized
> [   33.381439] Bluetooth: RFCOMM ver 1.11
> [   33.410276] _cpu_up: attempt to bring up CPU 3 failed
> [   33.414848] _cpu_up: attempt to bring up CPU 4 failed
> [   33.419857] _cpu_up: attempt to bring up CPU 1 failed
> [   38.518916] NET: Registered protocol family 10
> [   46.590494] init: failsafe main process (2550) killed by TERM signal
> [   50.596528] smsc95xx 5-1.1:1.0 eth0: hardware isn't capable of remote =
wakeup
>=20
>=20
> -Anand Moon
>=20
>=20
>=20
> On Monday, January 5, 2015 9:00 PM, Sjoerd Simons <sjoerd.simons@collabor=
a.co.uk> wrote:
> On Mon, 2015-01-05 at 17:18 +0900, Joonyoung Shim wrote:
> > Hi Sjoerd,
> >=20
> > On 12/05/2014 04:27 AM, Sjoerd Simons wrote:
> > > Add DTS for the Hardkernel Odroid XU3. The name of the DTS file is ke=
pt the
> > > same as the vendors naming, which means it's prefixed with exynos5422
> > > instead of exynos5800 as the SoC name even though it includes the
> > > exyno5800 dtsi.
> > >=20
> > > Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> > > ---
> > > Changes since v1:
> > >   * Add chosen/linux,stdout-path to point the serial console device
> > >   * Change memory start offset to 0x40000000 to match the vendors DTS=
 (pointed
> > >     out by Heesub Shin)
> > >   * Declare base address & size for the memory banks to be used by th=
e MFC
> > >=20
> > > Kevin, Tyler, even though the changes are small i didn't want to just=
 stick
> > > your Tested-By on. Could you both be so kind to retest this on your X=
U3's ?
> > >=20
> > > Heesub, I would still love to know the reason for having the memory s=
tart
> > > address at 0x40000000 for this board?
> > >=20
> > >  arch/arm/boot/dts/Makefile                 |   1 +
> > >  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 332 +++++++++++++++++++=
++++++++++
> > >  2 files changed, 333 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > >=20
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index 38c89ca..0a898cc 100644
>=20
>=20
> > > +
> > > +&hdmi {
> > > +    status =3D "okay";
> > > +    hpd-gpio =3D <&gpx3 7 0>;
> > > +    pinctrl-names =3D "default";
> > > +    pinctrl-0 =3D <&hdmi_hpd_irq>;
> > > +
> > > +    vdd_osc-supply =3D <&ldo10_reg>;
> > > +    vdd_pll-supply =3D <&ldo8_reg>;
> > > +    vdd-supply =3D <&ldo8_reg>;
> >=20
> > ldo10 and ldo8 are right? I think ldo7 and ldo6 are related with hdmi
> > from schematic.
>=20
> Nice catch. I followed hardkernels dts here, which refers to ldo10 &
> ldo8, however double-checking the schematics indeed indicate that ldo7
> and ldo6 are used the HDMI supplies.=20
>=20
> I'll do some testing and follow-up
>=20



--=-XvH2OCxlSXtU3zM8A+1m
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIUzDCCBsIw
ggWqoAMCAQICEAoE3yF0XU0rjOozcgUAUOkwDQYJKoZIhvcNAQEFBQAwZTELMAkGA1UEBhMCVVMx
FTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEkMCIGA1UE
AxMbRGlnaUNlcnQgQXNzdXJlZCBJRCBSb290IENBMB4XDTA2MTExMDAwMDAwMFoXDTIxMTExMDAw
MDAwMFowYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3
LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0xMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6IItmfnKwkKVpYBzQHDSnlZUXKnE0kEGj8kz/E1FkVyB
n+0snPgWWd+etSQVwpi5tHdJ3InECtqvy15r7a2wcTHrzzpADEZNk+yLejYIA6sMNP4YSYL+x8cx
SIB8HqIPkg5QycaH6zY/2DDD/6b3+6LNb3Mj/qxWBZDwMiEWicZwiPkFl32jx0PdAug7Pe2xQaPt
P77blUjE7h6z8rwMK5nQxl0SQoHhg26Ccz8mSxSQrllmCsSNvtLOBq6thG9IhJtPQLnxTPKvmPv2
zkBdXPao8S+v7Iki8msYZbHBc63X8djPHgp0XEK4aH631XcKJ1Z8D2KkPzIUYJX9BwSiCQIDAQAB
o4IDbzCCA2swDgYDVR0PAQH/BAQDAgGGMDsGA1UdJQQ0MDIGCCsGAQUFBwMBBggrBgEFBQcDAgYI
KwYBBQUHAwMGCCsGAQUFBwMEBggrBgEFBQcDCDCCAcYGA1UdIASCAb0wggG5MIIBtQYLYIZIAYb9
bAEDAAQwggGkMDoGCCsGAQUFBwIBFi5odHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9zc2wtY3BzLXJl
cG9zaXRvcnkuaHRtMIIBZAYIKwYBBQUHAgIwggFWHoIBUgBBAG4AeQAgAHUAcwBlACAAbwBmACAA
dABoAGkAcwAgAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAGMAbwBuAHMAdABpAHQAdQB0AGUAcwAg
AGEAYwBjAGUAcAB0AGEAbgBjAGUAIABvAGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMA
UAAvAEMAUABTACAAYQBuAGQAIAB0AGgAZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkAIABB
AGcAcgBlAGUAbQBlAG4AdAAgAHcAaABpAGMAaAAgAGwAaQBtAGkAdAAgAGwAaQBhAGIAaQBsAGkA
dAB5ACAAYQBuAGQAIABhAHIAZQAgAGkAbgBjAG8AcgBwAG8AcgBhAHQAZQBkACAAaABlAHIAZQBp
AG4AIABiAHkAIAByAGUAZgBlAHIAZQBuAGMAZQAuMA8GA1UdEwEB/wQFMAMBAf8wfQYIKwYBBQUH
AQEEcTBvMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKG
O2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NBQ2VydHMvRGlnaUNlcnRBc3N1cmVkSURSb290Q0Eu
Y3J0MIGBBgNVHR8EejB4MDqgOKA2hjRodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRB
c3N1cmVkSURSb290Q0EuY3JsMDqgOKA2hjRodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNl
cnRBc3N1cmVkSURSb290Q0EuY3JsMB0GA1UdDgQWBBQVABIrE5iymQftHt+ivlcNK2cCzTAfBgNV
HSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd823IDzANBgkqhkiG9w0BAQUFAAOCAQEAhGFOQR64dgQq
tbbvj/JVhbldVv4KmObkvWWKfUAp0/yxXUX9OrgqWzNLJFzNubTkc61hXXatdDOKZtUjr0wfcm5F
2XVAu6I7z41JL8BBsOIpo1E4Q1CZFKwzBjViiX13qVIH5WwgV7aBum+8s8KU7XYCgNl8zoWoHOzH
Q0pLsVfPcs7f9SU8yyJP/Z9S0TfLCLs4PuDVPm95Ca1bfDGzdzXD5GP5aAqYB+dGOHeE0j6XvAqg
qKwlT0RukeHSWq9r7zAcjaNEQrMQiyP61+Y1dDesz+urWB/JiCP/NtQH6jRqR+qdlWyeKU9T7eMr
lSBOKs+WYHr4LIDwlVLOKZaBYjCCBv8wggXnoAMCAQICEA2fwUKNhvkL8dN88tUFvVwwDQYJKoZI
hvcNAQEFBQAwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQ
d3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0xMB4XDTE0
MDIxNzAwMDAwMFoXDTE1MDMxMjEyMDAwMFowgaQxCzAJBgNVBAYTAkdCMRcwFQYDVQQIEw5DYW1i
cmlkZ2VzaGlyZTESMBAGA1UEBxMJQ2FtYnJpZGdlMRYwFAYDVQQKEw1Db2xsYWJvcmEgTHRkMQow
CAYDVQQLEwExMRYwFAYDVQQDEw1Tam9lcmQgU2ltb25zMSwwKgYJKoZIhvcNAQkBFh1zam9lcmQu
c2ltb25zQGNvbGxhYm9yYS5jby51azCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN4Q
EHeW1NbogMVZpHedG7o509/L4VBhqQd8j8JViWd+yvLlxOBw/gY+7ioHMatrQY2VvY6QOLle2Xqs
CDvELcXMxwyFpBC0Ia+CVE+5pF+0IMuVkGIL1T8LHeKZYeRP+uFXtmWzas12hsMILNRmK7Q5PACm
+v/6HFn111hLKkANBtRHIRiDbFQOiluNeR2bq+ck1y2+X//SGumA1XZFdCB/1VcRJXDdFnYdU3j/
RkoiGggo3MSq3mJ6yV7sqzk04fTLFvfL0KadCMauputeGBybEiFAt6rCm5TkyUqoDOTU07byOEXO
M32EGeYeV515RzARTpOSE9sdmRq0jNNAqGsCAwEAAaOCA2wwggNoMB8GA1UdIwQYMBaAFBUAEisT
mLKZB+0e36K+Vw0rZwLNMB0GA1UdDgQWBBRaTG8RXMDSFO5XcrjqYs/YDlmqSDAoBgNVHREEITAf
gR1zam9lcmQuc2ltb25zQGNvbGxhYm9yYS5jby51azAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMH0GA1UdHwR2MHQwOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2lj
ZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENBLTEuY3JsMDigNqA0hjJodHRwOi8vY3JsNC5kaWdp
Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDQS0xLmNybDCCAcUGA1UdIASCAbwwggG4MIIBtAYK
YIZIAYb9bAQBAjCCAaQwOgYIKwYBBQUHAgEWLmh0dHA6Ly93d3cuZGlnaWNlcnQuY29tL3NzbC1j
cHMtcmVwb3NpdG9yeS5odG0wggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBzAGUAIABv
AGYAIAB0AGgAaQBzACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAAYwBvAG4AcwB0AGkAdAB1AHQA
ZQBzACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAgAHQAaABlACAARABpAGcAaQBDAGUAcgB0
ACAAQwBQAC8AQwBQAFMAIABhAG4AZAAgAHQAaABlACAAUgBlAGwAeQBpAG4AZwAgAFAAYQByAHQA
eQAgAEEAZwByAGUAZQBtAGUAbgB0ACAAdwBoAGkAYwBoACAAbABpAG0AaQB0ACAAbABpAGEAYgBp
AGwAaQB0AHkAIABhAG4AZAAgAGEAcgBlACAAaQBuAGMAbwByAHAAbwByAGEAdABlAGQAIABoAGUA
cgBlAGkAbgAgAGIAeQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wdwYIKwYBBQUHAQEEazBpMCQGCCsG
AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNl
cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENBLTEuY3J0MAwGA1UdEwEB/wQCMAAw
DQYJKoZIhvcNAQEFBQADggEBAAc8CwXSms3RbIx+bhxFsGQoN+RpHtjnPvMPPAobv7rxdhQPPz+N
6h3hpVzegeW2XhyZVC8MT0U6uWXrk+1uQUAXrJEG+W2X8yTEoHDS/SCF/POOsj/ekaDuNE9JJB/9
cspoa4W+W8pX1sRurBDFHL0DBudUQ1PgvTSLPOHtfKQpu4gRb2u8KpJermp/IvPLImX9xSCbYKQM
2L0wbpStFIYdyKCKuXuQxOX3BdBKLCFvcIDE6hjj3UpOlThCbeul2Tz5jARCfRK4OUxnXyb/Tp5j
tshIAa2ZMGaTH9ApeY7P6C2ONF+Mh5yV/raWXOnJ9dEg6/sXcbdiieqzLKYBIgQwggb/MIIF56AD
AgECAhANn8FCjYb5C/HTfPLVBb1cMA0GCSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlVTMRUwEwYD
VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERp
Z2lDZXJ0IEFzc3VyZWQgSUQgQ0EtMTAeFw0xNDAyMTcwMDAwMDBaFw0xNTAzMTIxMjAwMDBaMIGk
MQswCQYDVQQGEwJHQjEXMBUGA1UECBMOQ2FtYnJpZGdlc2hpcmUxEjAQBgNVBAcTCUNhbWJyaWRn
ZTEWMBQGA1UEChMNQ29sbGFib3JhIEx0ZDEKMAgGA1UECxMBMTEWMBQGA1UEAxMNU2pvZXJkIFNp
bW9uczEsMCoGCSqGSIb3DQEJARYdc2pvZXJkLnNpbW9uc0Bjb2xsYWJvcmEuY28udWswggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDeEBB3ltTW6IDFWaR3nRu6OdPfy+FQYakHfI/CVYln
fsry5cTgcP4GPu4qBzGra0GNlb2OkDi5Xtl6rAg7xC3FzMcMhaQQtCGvglRPuaRftCDLlZBiC9U/
Cx3imWHkT/rhV7Zls2rNdobDCCzUZiu0OTwApvr/+hxZ9ddYSypADQbURyEYg2xUDopbjXkdm6vn
JNctvl//0hrpgNV2RXQgf9VXESVw3RZ2HVN4/0ZKIhoIKNzEqt5iesle7Ks5NOH0yxb3y9CmnQjG
rqbrXhgcmxIhQLeqwpuU5MlKqAzk1NO28jhFzjN9hBnmHledeUcwEU6TkhPbHZkatIzTQKhrAgMB
AAGjggNsMIIDaDAfBgNVHSMEGDAWgBQVABIrE5iymQftHt+ivlcNK2cCzTAdBgNVHQ4EFgQUWkxv
EVzA0hTuV3K46mLP2A5ZqkgwKAYDVR0RBCEwH4Edc2pvZXJkLnNpbW9uc0Bjb2xsYWJvcmEuY28u
dWswDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjB9BgNVHR8E
djB0MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDQS0x
LmNybDA4oDagNIYyaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ0Et
MS5jcmwwggHFBgNVHSAEggG8MIIBuDCCAbQGCmCGSAGG/WwEAQIwggGkMDoGCCsGAQUFBwIBFi5o
dHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9zc2wtY3BzLXJlcG9zaXRvcnkuaHRtMIIBZAYIKwYBBQUH
AgIwggFWHoIBUgBBAG4AeQAgAHUAcwBlACAAbwBmACAAdABoAGkAcwAgAEMAZQByAHQAaQBmAGkA
YwBhAHQAZQAgAGMAbwBuAHMAdABpAHQAdQB0AGUAcwAgAGEAYwBjAGUAcAB0AGEAbgBjAGUAIABv
AGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMAUAAvAEMAUABTACAAYQBuAGQAIAB0AGgA
ZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkAIABBAGcAcgBlAGUAbQBlAG4AdAAgAHcAaABp
AGMAaAAgAGwAaQBtAGkAdAAgAGwAaQBhAGIAaQBsAGkAdAB5ACAAYQBuAGQAIABhAHIAZQAgAGkA
bgBjAG8AcgBwAG8AcgBhAHQAZQBkACAAaABlAHIAZQBpAG4AIABiAHkAIAByAGUAZgBlAHIAZQBu
AGMAZQAuMHcGCCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQu
Y29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1
cmVkSURDQS0xLmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4IBAQAHPAsF0prN0WyM
fm4cRbBkKDfkaR7Y5z7zDzwKG7+68XYUDz8/jeod4aVc3oHltl4cmVQvDE9FOrll65PtbkFAF6yR
Bvltl/MkxKBw0v0ghfzzjrI/3pGg7jRPSSQf/XLKaGuFvlvKV9bEbqwQxRy9AwbnVENT4L00izzh
7XykKbuIEW9rvCqSXq5qfyLzyyJl/cUgm2CkDNi9MG6UrRSGHcigirl7kMTl9wXQSiwhb3CAxOoY
491KTpU4Qm3rpdk8+YwEQn0SuDlMZ18m/06eY7bISAGtmTBmkx/QKXmOz+gtjjRfjIeclf62llzp
yfXRIOv7F3G3YonqsyymASIEMYIDEDCCAwwCAQEwdjBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2Vy
dCBBc3N1cmVkIElEIENBLTECEA2fwUKNhvkL8dN88tUFvVwwCQYFKw4DAhoFAKCCAW8wGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTUwMTA3MjIzODUzWjAjBgkqhkiG
9w0BCQQxFgQUHXxs0T5uQDb/MBk4skeUr0iz5kAwgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UE
BhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEh
MB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0xAhANn8FCjYb5C/HTfPLVBb1cMIGHBgsq
hkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcG
A1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0x
AhANn8FCjYb5C/HTfPLVBb1cMA0GCSqGSIb3DQEBAQUABIIBANDeWt0LFNwfKLFSveDm5hxyiVrs
aT2GTAaxwu2FoL3qmAwcaFDfwMXpKIhcflSAnXsrCo2rALocmQyhPoUC4jxGxluB4LNO3dPsl+lU
bCq0N7O4a9IEsII2iPgMbI8y5FQmIRV+fDUzyLXABQ8u1NUFXUQnBCeC7HF4SQ3v0q7yOgQ565Ps
SwqAXFstssIwdhIJlE6F+7PXNHx2Vxnwb+HvedzYJK5Xi/k/YOSd9Hx1ttYRKJaQDJuWTfnJi7PV
HLFItOGMMIjTH4YRJPH9Gby8IHSyvKGYJn+WpxT4WY4swHvF8kEh4UQOlZdAxdDLe1CgEiP7eZfj
hc3RoQxdPOkAAAAAAAA=


--=-XvH2OCxlSXtU3zM8A+1m--
