From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 1/6] [media] exynos-gsc: Add compatible for Exynos 5250
 and 5420 specific version
Date: Fri, 08 Sep 2017 15:02:35 +0900
Message-ID: <1504850560-27950-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170908060308epcas1p4cd62b065429a7ab1591593e94853c7b8@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, mchehab@kernel.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

RXh5bm9zIDUyNTAgYW5kIDU0MjAgaGF2ZSBkaWZmZXJlbnQgaGFyZHdhcmUgcm90YXRpb24gbGlt
aXRzLgpTaW5jZSB3ZSBoYXZlIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlc2UgdHdvLCB3ZSBh
ZGQgZGlmZmVyZW50CmNvbXBhdGlibGUoc2Ftc3VuZyxleHlub3M1MjUwLWdzYyBhbmQgc2Ftc3Vu
ZyxleHlub3M1NDIwLWdzYykuCgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4u
a3dvbkBzYW1zdW5nLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvZXh5bm9zNS1nc2MudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
ZXh5bm9zNS1nc2MudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2V4eW5vczUtZ3NjLnR4dAppbmRleCAyNmNhMjViLi5kYWE1NmQ1IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvZXh5bm9zNS1nc2MudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9leHlub3M1LWdzYy50eHQK
QEAgLTUsNiArNSw3IEBAIEctU2NhbGVyIGlzIHVzZWQgZm9yIHNjYWxpbmcgYW5kIGNvbG9yIHNw
YWNlIGNvbnZlcnNpb24gb24gRVhZTk9TNSBTb0NzLgogUmVxdWlyZWQgcHJvcGVydGllczoKIC0g
Y29tcGF0aWJsZTogc2hvdWxkIGJlICJzYW1zdW5nLGV4eW5vczUtZ3NjIiAoZm9yIEV4eW5vcyA1
MjUwLCA1NDIwIGFuZAogCSAgICAgIDU0MjIgU29Dcykgb3IgInNhbXN1bmcsZXh5bm9zNTQzMy1n
c2MiIChFeHlub3MgNTQzMykKKwkgICAgICBvciAic2Ftc3VuZyxleHlub3M1MjUwLWdzYyIgb3Ig
InNhbXN1bmcsZXh5bm9zNTQyMC1nc2MiCiAtIHJlZzogc2hvdWxkIGNvbnRhaW4gRy1TY2FsZXIg
cGh5c2ljYWwgYWRkcmVzcyBsb2NhdGlvbiBhbmQgbGVuZ3RoLgogLSBpbnRlcnJ1cHRzOiBzaG91
bGQgY29udGFpbiBHLVNjYWxlciBpbnRlcnJ1cHQgbnVtYmVyCiAKLS0gCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
