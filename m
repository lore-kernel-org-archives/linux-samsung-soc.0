From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v5 1/5] arm64: dts: exynos: Add the burst and esc clock
 frequency properties to DSI node
Date: Wed, 08 Mar 2017 13:54:08 +0900
Message-ID: <1488948852-5380-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308045502epcas1p2b16df118e0ad91dbd2446687dc5ee843@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

QWRkIHRoZSBidXJzdCBhbmQgZXNjIGNsb2NrIGZyZXF1ZW5jeSBwcm9wZXJ0aWVzIHRvIHRoZSBw
YXJlbnQgKERTSSBub2RlKS4KQ3VycmVudGx5IHRoZSBjbG9jayBpcyBwYXJzZWQgZnJvbSB0aGUg
cG9ydCBub2RlLCB3aGlsZSBpdCBzaG91bGQgYmUKdGFrZW4gZnJvbSB0aGUgZHNpIG5vZGUuCgpT
aWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5
OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQHNhbXN1bmcuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9l
eHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKaW5kZXggNmNlOTNhMy4uZTMxZTIwYyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29t
bW9uLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIt
Y29tbW9uLmR0c2kKQEAgLTI5OCw2ICsyOTgsOCBAQAogCXN0YXR1cyA9ICJva2F5IjsKIAl2ZGRj
b3JlLXN1cHBseSA9IDwmbGRvNl9yZWc+OwogCXZkZGlvLXN1cHBseSA9IDwmbGRvN19yZWc+Owor
CXNhbXN1bmcsYnVyc3QtY2xvY2stZnJlcXVlbmN5ID0gPDUxMjAwMDAwMD47CisJc2Ftc3VuZyxl
c2MtY2xvY2stZnJlcXVlbmN5ID0gPDE2MDAwMDAwPjsKIAlzYW1zdW5nLHBsbC1jbG9jay1mcmVx
dWVuY3kgPSA8MjQwMDAwMDA+OwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3Ry
bC0wID0gPCZ0ZV9pcnE+OwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
