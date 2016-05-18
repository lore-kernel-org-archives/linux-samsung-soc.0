From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/5] drm: mediatek: add CONFIG_OF dependency
Date: Wed, 18 May 2016 18:07:30 +0200
Message-ID: <1463587653-3035181-3-git-send-email-arnd@arndb.de>
References: <1463587653-3035181-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463587653-3035181-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-mediatek@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIG1lZGlhdGVrIERSTSBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgZm9yIGNvbXBpbGUgdGVz
dGluZyB3aXRoCkNPTkZJR19PRiBkaXNhYmxlZCwgYnV0IHRoZW4gZmFpbHMgdG8gbGluazoKCmRy
aXZlcnMvZ3B1L2J1aWx0LWluLm86IEluIGZ1bmN0aW9uIGBtdGtfZHJtX2JpbmQnOgphbmFsb2dp
eF9kcF9yZWcuYzooLnRleHQrMHg1Mjg4OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG9mX2Zp
bmRfZGV2aWNlX2J5X25vZGUnCmFuYWxvZ2l4X2RwX3JlZy5jOigudGV4dCsweDUyOTMwKTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgb2ZfZmluZF9kZXZpY2VfYnlfbm9kZScKClRoaXMgYWRkcyBh
biBleHBsaWNpdCBLY29uZmlnIGRlcGVuZGVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9L
Y29uZmlnCmluZGV4IDU0NTk3M2Y2Yjc0My4uNjcxODNlMjY5NzFkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvS2NvbmZpZwpAQCAtMyw2ICszLDcgQEAgY29uZmlnIERSTV9NRURJQVRFSwogCWRlcGVuZHMg
b24gRFJNCiAJZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLIHx8IChBUk0gJiYgQ09NUElMRV9URVNU
KQogCWRlcGVuZHMgb24gQ09NTU9OX0NMSworCWRlcGVuZHMgb24gT0YKIAlzZWxlY3QgRFJNX0dF
TV9DTUFfSEVMUEVSCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IERSTV9NSVBJX0RT
SQotLSAKMi43LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
