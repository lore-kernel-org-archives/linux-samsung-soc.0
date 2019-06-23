From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable Panfrost and Lima drivers
Date: Mon, 24 Jun 2019 08:39:09 +0900
Message-ID: <6edbe882-314c-85e1-4109-7c3b324dc7ab@samsung.com>
References: <20190621180208.25361-7-krzk@kernel.org>
 <20190622191838.29850-1-krzk@kernel.org>
 <CAGTfZH2g6E2pCEtqjfCd+PjEzjwc2AB75LXJfCeO+PcYLiLTUw@mail.gmail.com>
 <CGME20190623192007epcas4p2a3995bb00091b436562828fceb6ff790@epcas4p2.samsung.com>
 <CAJKOXPcFFY08R1H-DrrzX2BC3L8x4NPJTP7nDn9yixAvmaiF9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPcFFY08R1H-DrrzX2BC3L8x4NPJTP7nDn9yixAvmaiF9Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, cwchoi00@gmail.com
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Simon Horman <horms+renesas@verge.net.au>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTkuIDYuIDI0LiDsmKTsoIQgNDoxNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBP
biBTdW4sIDIzIEp1biAyMDE5IGF0IDA2OjMxLCBDaGFud29vIENob2kgPGN3Y2hvaTAwQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEtyenlzenRvZiwKPj4KPj4gMjAxOeuFhCA27JuUIDIz7J28
ICjsnbwpIOyYpOyghCA0OjIwLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
64uY7J20IOyekeyEsToKPj4+Cj4+PiBFbmFibGUgc3VwcG9ydCBmb3IgTWFsaSBHUFUgd2l0aCBQ
YW5mcm9zdCBhbmQgTGltYSBkcml2ZXJzIGZvcjoKPj4+IDEuIFNhbXN1bmcgRXh5bm9zNTQzMyBh
bmQgRXh5bm9zNyAoaGF2aW5nIE1hbGkgVDc2MCksCj4+PiAyLiBBbGx3aW5lciBBNjQgYW5kIEg1
IChNYWxpIDQwMC80NTApLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KPj4+Cj4+PiAtLS0KPj4+Cj4+PiBDaGFuZ2VzIHNpbmNlIHYx
Ogo+Pj4gMS4gRW5hYmxlIExpbWEgZHJpdmVyCj4+PiAtLS0KPj4+ICBhcmNoL2FybTY0L2NvbmZp
Z3MvZGVmY29uZmlnIHwgMyArKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9k
ZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCj4+PiBpbmRleCBmYmJjMDY1
NDE1ZDQuLjNkMzE2MTEzNjhhZiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9k
ZWZjb25maWcKPj4+ICsrKyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKPj4+IEBAIC01
MTgsNiArNTE4LDggQEAgQ09ORklHX0RSTV9ISVNJX0hJQk1DPW0KPj4+ICBDT05GSUdfRFJNX0hJ
U0lfS0lSSU49bQo+Pj4gIENPTkZJR19EUk1fTUVTT049bQo+Pj4gIENPTkZJR19EUk1fUEwxMTE9
bQo+Pj4gK0NPTkZJR19EUk1fTElNQT1tCj4+PiArQ09ORklHX0RSTV9QQU5GUk9TVD1tCj4+PiAg
Q09ORklHX0ZCPXkKPj4+ICBDT05GSUdfRkJfTU9ERV9IRUxQRVJTPXkKPj4+ICBDT05GSUdfQkFD
S0xJR0hUX0dFTkVSSUM9bQo+Pj4gQEAgLTcxOCw3ICs3MjAsNiBAQCBDT05GSUdfQVJDSF9URUdS
QV8xOTRfU09DPXkKPj4+ICBDT05GSUdfQVJDSF9LM19BTTZfU09DPXkKPj4+ICBDT05GSUdfU09D
X1RJPXkKPj4+ICBDT05GSUdfVElfU0NJX1BNX0RPTUFJTlM9eQo+Pj4gLUNPTkZJR19ERVZGUkVR
X0dPVl9TSU1QTEVfT05ERU1BTkQ9eQo+Pgo+PiBFeHlub3M1NDMzLXRtMiBib2FyZCBzdXBwb3J0
IHRoZSBleHlub3MtYnVzIGRldmljZSB3aGljaAo+PiB1c2VkIHRoZSBzaW1wbGVfb25kbWVuYWQg
Z292ZXJub3Igb2YgZGV2ZnJlcS4KPj4gV2h5IGRvIHlvdSByZW1vdmUgdGhpcyBjb25maWd1cmF0
aW9uIGZyb20gdGhlIGRlZmNvbmZpZz8KPiAKPiBJdCBpcyBzZWxlY3RlZCBieSBkZWZhdWx0IGJ5
IERSTV9QQU5GUk9TVC4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdAo+IFBBTkZST1NUIHNlbGVjdHMg
aXQgYXMgbW9kdWxlLiBUaGUgJ3knIGlzIGNob3NlbiBiZWNhdXNlIG9mOgo+ICAgU0NTSV9VRlNI
Q0QgWz15XSAmJiBTQ1NJX0xPV0xFVkVMIFs9eV0gJiYgU0NTSSBbPXldICYmIFNDU0lfRE1BIFs9
eV0KCldoZW4gSSB0cmllZCB0byBmaW5kIHRoZSBoaXN0b3J5IG9mIENPTkZJR19ERVZGUkVRX0dP
Vl9TSU1QTEVfT05ERU1BTkQgCmZvciBkZWZjb25maWcsIHRoZSBmb2xsb3dpbmcgcGF0Y2hbMV0g
YWRkZWQgdGhpcyBjb25maWd1cmF0aW9uLgpbMV0gYjk3MmZmNzVmMjkzOGMzOWUyMjA1YzIzZWEw
ZTUzMWQzNmIyN2Y4NgotICJhcm02NDogZGVmY29uZmlnOiBFbmFibGUgVUZTIG9uIG1zbTg5OTYi
CgpJIHRoaW5rIHRoYXQgdGhpcyBwYXRjaCB3aWxsIGFmZmVjdCB0aGUgb3ByYXRpb24gb2YgJ1VT
RiBvbiBtc204OTk4Jy4KCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpTYW1zdW5nIEVs
ZWN0cm9uaWNzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
