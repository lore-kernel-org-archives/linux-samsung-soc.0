From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 07/16] drm/exynos/hdmi: fix removal order
Date: Fri, 25 Sep 2015 14:48:20 +0200
Message-ID: <1443185309-13827-8-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RFJNIGRldmljZSBzaG91bGQgYmUgZGVzdHJveWVkIGJlZm9yZSByZWxlYXNpbmcgcmVzb3VyY2Vz
LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgfCA4ICsrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2hkbWkuYwppbmRleCA1MGNlZDcwOS4uNzI1ZGRiNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2hkbWkuYwpAQCAtMjA0NiwxNSArMjA0NiwxNyBAQCBzdGF0aWMgaW50
IGhkbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAljYW5jZWxfZGVs
YXllZF93b3JrX3N5bmMoJmhkYXRhLT5ob3RwbHVnX3dvcmspOwogCisJY29tcG9uZW50X2RlbCgm
cGRldi0+ZGV2LCAmaGRtaV9jb21wb25lbnRfb3BzKTsKKworCXBtX3J1bnRpbWVfZGlzYWJsZSgm
cGRldi0+ZGV2KTsKKwogCWlmIChoZGF0YS0+cmVzLnJlZ19oZG1pX2VuKQogCQlyZWd1bGF0b3Jf
ZGlzYWJsZShoZGF0YS0+cmVzLnJlZ19oZG1pX2VuKTsKIAogCWlmIChoZGF0YS0+aGRtaXBoeV9w
b3J0KQogCQlwdXRfZGV2aWNlKCZoZGF0YS0+aGRtaXBoeV9wb3J0LT5kZXYpOwotCXB1dF9kZXZp
Y2UoJmhkYXRhLT5kZGNfYWRwdC0+ZGV2KTsKIAotCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+
ZGV2KTsKLQljb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZoZG1pX2NvbXBvbmVudF9vcHMpOwor
CXB1dF9kZXZpY2UoJmhkYXRhLT5kZGNfYWRwdC0+ZGV2KTsKIAogCXJldHVybiAwOwogfQotLSAK
MS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
