From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v4 1/5] arm64: dts: exynos: Add the burst and esc clock
 frequency properties to DSI node
Date: Mon, 06 Mar 2017 13:42:19 +0900
Message-ID: <1488775343-6236-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170306044233epcas1p20b5e6c764a7752290e5ed25cc13a69af@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIE9GIGdyYXBoIGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgcGFuZWwgaXMgYSBjaGlsZCBv
ZiBkc2kuIEFkZAp0aGUgYnVyc3QgYW5kIGVzYyBjbG9jayBmcmVxdWVuY3kgcHJvcGVydGllcyB0
byB0aGUgcGFyZW50IChEU0kgbm9kZSkuCgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhv
ZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQz
My10bTItY29tbW9uLmR0c2kgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIt
Y29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1j
b21tb24uZHRzaQppbmRleCA2Y2U5M2EzLi5lMzFlMjBjIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQorKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQpAQCAtMjk4LDYg
KzI5OCw4IEBACiAJc3RhdHVzID0gIm9rYXkiOwogCXZkZGNvcmUtc3VwcGx5ID0gPCZsZG82X3Jl
Zz47CiAJdmRkaW8tc3VwcGx5ID0gPCZsZG83X3JlZz47CisJc2Ftc3VuZyxidXJzdC1jbG9jay1m
cmVxdWVuY3kgPSA8NTEyMDAwMDAwPjsKKwlzYW1zdW5nLGVzYy1jbG9jay1mcmVxdWVuY3kgPSA8
MTYwMDAwMDA+OwogCXNhbXN1bmcscGxsLWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CiAJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnRlX2lycT47Ci0tIAox
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
