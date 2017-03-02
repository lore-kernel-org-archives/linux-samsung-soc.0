From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 2/7] arm: dts: Add the burst and esc clock frequency
 properties for exynos3250 dts
Date: Thu, 02 Mar 2017 19:20:14 +0900
Message-ID: <1488450019-6482-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170302102113epcas1p343e9da20f05be0a2359bf32834626c4a@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
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
ZiBkc2kuIFNvCmFkZGVkIHRoZSBidXJzdCBhbmQgZXNjIGNsb2NrIGZyZXF1ZW5jeSBwcm9wZXJ0
aWVzIHRvIHRoZSBwYXJlbnQgKERTSQpub2RlKSwgdGFraW5nIGludG8gYWNjb3VudCB0aGUgYmlz
ZWN0YWJpbGl0eSBwcm9ibGVtIHNvIHRoYXQgcmVtb3ZlCnRoZSBPRiBncmFwaCBmcm9tIERTSSBu
b2RlLgoKU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5j
b20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0K
IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtcmluYXRvLmR0cyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9l
eHlub3MzMjUwLXJpbmF0by5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0
by5kdHMKaW5kZXggNTQ4NDEzZS4uYzlmMTkxYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zMzI1MC1yaW5hdG8uZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMy
NTAtcmluYXRvLmR0cwpAQCAtMjE1LDYgKzIxNSw4IEBACiAmZHNpXzAgewogCXZkZGNvcmUtc3Vw
cGx5ID0gPCZsZG82X3JlZz47CiAJdmRkaW8tc3VwcGx5ID0gPCZsZG82X3JlZz47CisJc2Ftc3Vu
ZyxidXJzdC1jbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDAwPjsKKwlzYW1zdW5nLGVzYy1jbG9j
ay1mcmVxdWVuY3kgPSA8MjAwMDAwMDA+OwogCXNhbXN1bmcscGxsLWNsb2NrLWZyZXF1ZW5jeSA9
IDwyNDAwMDAwMD47CiAJc3RhdHVzID0gIm9rYXkiOwogCi0tIAoxLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
