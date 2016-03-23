From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/7] drm/exynos: HDMI and DECON fixes and enhancements
Date: Wed, 23 Mar 2016 14:15:11 +0100
Message-ID: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoaXMgc2V0IG9mIHBhdGNoZXMgcHJvdmlkZXMgc2V0IG9mIGRpZmZlcmVudCBm
aXhlcyBhbmQgZW5oYW5jZW1lbnRzCmZvciBERUNPTiAtPiBIRE1JIHBhdGguIEl0IGlzIGJhc2Vk
IG9uOgotIG15IEhETUkgcGF0Y2hlcyB3aGljaCBhcmUgbm90IHlldCBtZXJnZWRbMV0sIGNvdWxk
IHlvdSBsb29rIGF0IHRoZW0KICBieSB0aGUgd2F5LCB0aGV5IHdlcmUgcG9zdGVkIGFib3V0IDUg
bW9udGhzIGFnbyA6KQotIElPTU1VIHBhdGNoZXMgYnkgTWFyZWsgKGZvciBzb21lIG15c3Rlcmlv
dXMgcmVhc29uIEhETUkgcGF0aCBvbiA1NDMzCiAgd29ya3Mgb25seSB3aXRoIElPTU1VIGVuYWJs
ZWQpLAotIGxhdGVzdCBleHlub3MtZHJtLW5leHQgcGF0Y2hlcy4KClsxXTogaHR0cDovL3Blcm1h
bGluay5nbWFuZS5vcmcvZ21hbmUuY29tcC52aWRlby5kcmkuZGV2ZWwvMTQwMTA5CgpSZWdhcmRz
CkFuZHJ6ZWoKCgpBbmRyemVqIEhhamRhICg3KToKICBkcm0vZXh5bm9zL2hkbWk6IGZpeCBQSFkg
Y29uZmlndXJhdGlvbiBzZXF1ZW5jZQogIGRybS9leHlub3MvaGRtaTogYWRkIFBIWSBwb3dlciBv
ZmYgc2lnbmFsIGhhbmRsaW5nCiAgZHJtL2V4eW5vcy9oZG1pOiBhZGQgY29yZSByZXNldCBjb2Rl
CiAgZHJtL2V4eW5vcy9oZG1pOiByZW1vdmUgcmVnaXN0cnkgZHVtcAogIGRybS9leHlub3MvZGVj
b241NDMzOiBmaXggREVDT04gc3RhbmRhbG9uZSB1cGRhdGUKICBkcm0vZXh5bm9zL2RlY29uNTQz
MzogcmVzZXQgZGVjb24gb24gc3RhcnQKICBkcm0vZXh5bm9zL2RlY29uNTQzMzogZG8gbm90IHBy
b3RlY3Qgd2luZG93IGluIHBsYW5lIGRpc2FibGUKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vczU0MzNfZHJtX2RlY29uLmMgfCAgMjIgKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2hkbWkuYyAgICAgICAgICB8IDI5MyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyODYgZGVsZXRpb25zKC0pCgotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
