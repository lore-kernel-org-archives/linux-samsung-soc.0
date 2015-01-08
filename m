From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH v2] ARM: dts: Add dts file for odroid XU3 board
Date: Thu, 08 Jan 2015 09:49:08 +0100
Message-ID: <1420706948.6075.17.camel@collabora.co.uk>
References: <1417721269-19342-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <54AA48E6.3040404@samsung.com> <1420470469.15910.134.camel@collabora.co.uk>
	 <69242715.30115.1420655868687.JavaMail.yahoo@jws10659.mail.bf1.yahoo.com>
	 <1420670333.6075.2.camel@collabora.co.uk>
	 <6203C077F070A646AA0FCB4B5F1795D248114CA6@sisaex01sj>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="sha-1"; protocol="application/x-pkcs7-signature";
	boundary="=-AArK61rFWzR4KkQhD1ym"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:40340 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753420AbbAHItN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Jan 2015 03:49:13 -0500
In-Reply-To: <6203C077F070A646AA0FCB4B5F1795D248114CA6@sisaex01sj>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonathan Stone -SISA <j.stone@samsung.com>
Cc: Anand Moon <moon.linux@yahoo.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Kevin Hilman <khilman@kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Heesub Shin <heesub.shin@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@linaro.org>


--=-AArK61rFWzR4KkQhD1ym
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-01-07 at 23:49 +0000, Jonathan Stone -SISA wrote:
>=20
> On On Wed, 2015-01-07 at 18:37 +0000, Sjoerd Simons writes wrote:
> >On Wed, 2015-01-07 at 18:37 +0000, Anand Moon wrote:>
> [...]
>=20
> >> Only 4 core cpu's are on my board. Also CpuFreq is not working.
> >=20
> > Can you share some point on this.
>=20
> >The defconfig is using the bL switcher, which pairs up big and little co=
res to make them appear as one core.. So for 8 real cores, you'll get
> >4 "virtual cores".
>=20
> That configuration is appropriate for the 5420, which allegedly has a har=
dware bug in the cache-coherence between the Cortex-A7 block and the Cortex=
-A15 block.
> Newer Exynos 5 SoCs -- 5422/5800, 5620, etc -- don't have that bug. The s=
cheduler should configured to  do HMP on all 8 (or 6) cores.
> I don't have a 5410, but I assume it has the same bug as the 5420.

Yes the kernel/scheduler could be configured like that, but
exynos_defconfig turns on bL rather then HMP.=20

Now it's not unthinkable to add code/dts properties to select the
right/preferred scheduling strategy depending on the board (HMP vs. bL).
But proper HMP scheduling is still a work in progress in mainline and
iirc specifically on the XU3 there are open issue wrt. MCPM and its
secure firmware. I've added Kevin to the CC as he's been working on this
topic so should know the status a lot better then i do.

> The XU3 kernel supplied by HardKernel shows all 8 cores, and does HMP sch=
eduling across all 8.

Yes, that's independant of the dts though as mentioned above. Also there
are still opne issues to booting up all cores on an XU3 afaik. See=20
   http://www.spinics.net/lists/linux-samsung-soc/msg39523.html

> I tried v1.0 of the Odroid-XU3 DTB patch, applied to linux-next
> 20150107.  I'm only seeing 1 core running on my Odroid-XU3.  The USB
> 3.0 port works (great!) but I'm not getting any HDMI output. I didn't
> try DisplayPort.   I'll gladly try v2 of the patch on an XU3; is there
> a better base to apply the patch to?

HDMI output is broken on all exynos boards in mainline atm. For exynos
5, see the thread here:
 http://www.spinics.net/lists/linux-samsung-soc/msg40708.html

As far as a i know with the DTS as posted (just posted v3 with a small
improvement), all base functionality that can work on mainline (MMC/SD,
network, USB2, USB3) works. Some less important bits (fan control &
power sensors) are outstanding, but that really shouldn't block the
merge of the DTS.

--
Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Collabora Ltd.

--=-AArK61rFWzR4KkQhD1ym
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTUwMTA4MDg0OTA4WjAjBgkqhkiG
9w0BCQQxFgQUBTvNuwhZAt97mXsf3LTYkFqHHPYwgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UE
BhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEh
MB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0xAhANn8FCjYb5C/HTfPLVBb1cMIGHBgsq
hkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcG
A1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBDQS0x
AhANn8FCjYb5C/HTfPLVBb1cMA0GCSqGSIb3DQEBAQUABIIBAAw0Tfk2Y5ZvGx3ul7IzFeNNBki5
rAWAHC426Ff09mD9slvy6N1HwkAmachWcW0NGHK6PiQLOR3b6ZqL31/+07ZkBJZMCPhvBV8QyHTX
87o2qqEfEL3wKtx/a+krL4xT55OHK6K3kcCBjMFFpejpjoo/zCxsa/Jm514LxDsL89Eg8dWpdwbw
6a31V80CGViewEsHR7/M1cP7KdA32icbhQxCMEksySx5AcX2M7CrFAZxH7KJJWWyZzvkpsmpcIU6
Lg8ZwFiyl7t0c+yGWAw9xLUJtX769lGSeym1pN399zGQsntceP4SZvHRXRBMlEGDdysI1eu+ff4h
sxNjOzZB/WgAAAAAAAA=


--=-AArK61rFWzR4KkQhD1ym--
