From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 0/2] Add support for the S6E3HA2 panel on TM2 board
Date: Wed, 14 Dec 2016 15:04:03 +0900
Message-ID: <1481695445-13088-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

UHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzIGFkZCBzdXBwb3J0IGZvciBTNkUzSEEyIEFNT0xFRCBw
YW5lbCBvbgp0aGUgVE0yIGJvYXJkLiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBT
NkUzSEEyIHBhbmVsCmRldmljZSB0cmVlIGRvY3VtZW50IGFuZCBkcml2ZXIsIHRoZSBzZWNvbmQg
cGF0Y2ggYWRkIHN1cHBvcnQgZm9yClM2RTNIQTIgcGFuZWwgZGV2aWNlIHRyZWUuCgpIb2VnZXVu
IEt3b24gKDEpOgogIGRybS9wYW5lbDogQWRkIHN1cHBvcnQgZm9yIFM2RTNIQTIgcGFuZWwgZHJp
dmVyIG9uIFRNMiBib2FyZAoKSHl1bmd3b24gSHdhbmcgKDEpOgogIGFybTY0OiBkdHM6IGV4eW5v
czogQWRkIHN1cHBvcnQgZm9yIFM2RTNIQTIgcGFuZWwgZGV2aWNlIG9uIFRNMiBib2FyZAoKIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NhbXN1bmcsczZlM2hhMi50eHQgICAgIHwgIDUyICsr
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMgICAgICB8ICAz
MyArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8
ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmUzaGEyLmMg
ICAgICB8IDc1NiArKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgODQ4IGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9zYW1zdW5nLHM2ZTNoYTIudHh0CiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlM2hhMi5jCgotLSAK
MS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
