From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2 3/3] drm/exynos: initialize VIDCON0 when fimd is disabled
Date: Fri, 12 Jun 2015 17:27:16 +0900
Message-ID: <1434097636-10709-3-git-send-email-jy0922.shim@samsung.com>
References: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, a.hajda@samsung.com, gustavo.padovan@collabora.co.uk, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

V2hlbiB0aGUgZmltZCBpcyBkaXNhYmxlZCBieSBmaW1kX2Rpc2FibGUoKSwgZW5hYmxlZCBvdmVy
bGF5IGxheWVycyBhbHNvCmFyZSBkaXNhYmxlZC4gSWYgY2xvY2tzIGZvciBmaW1kIGFyZSBlbmFi
bGVkIGJ5IGZpbWRfZW5hYmxlKCkgb24gdGhpcwpjYXNlLCBpdCBjYW4gbGVhZCBJT01NVSBwYWdl
IGZhdWx0LiBUaGUgcmVhc29uIGlzIHRoYXQgVklEQ09OMF9FTlZJRCBhbmQKVklEQ09OMF9FTlZJ
RF9GIGJpdHMgb2YgVklEQ09OMCByZWdpc3RlciBhcmUgc2V0IHN0aWxsIGV2ZW4gdGhvdWdoIGZp
bWQKaXMgZGlzYWJsZWQsIHNvIGl0IG1heSBjb250aW51ZSBkaXNwbGF5IG91dHB1dCBvZiBwcmlv
ciB3aGVuIGNsb2NrcyBmb3IKZmltZCBhcmUgZW5hYmxlZCBhZ2Fpbi4KClNpZ25lZC1vZmYtYnk6
IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9maW1kLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCmlu
ZGV4IGI0NWUwOWIuLjNiMGUwZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9maW1kLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2ZpbWQuYwpAQCAtNzkxLDYgKzc5MSw4IEBAIHN0YXRpYyB2b2lkIGZpbWRfZGlzYWJsZShzdHJ1
Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjKQogCWZvciAoaSA9IDA7IGkgPCBXSU5ET1dTX05SOyBp
KyspCiAJCWZpbWRfd2luX2Rpc2FibGUoY3J0YywgaSk7CiAKKwl3cml0ZWwoMCwgY3R4LT5yZWdz
ICsgVklEQ09OMCk7CisKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoY3R4LT5sY2RfY2xrKTsKIAlj
bGtfZGlzYWJsZV91bnByZXBhcmUoY3R4LT5idXNfY2xrKTsKIAotLSAKMS45LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
