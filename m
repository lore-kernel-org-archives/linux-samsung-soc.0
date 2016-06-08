From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] of: reserved_mem: restore old behavior when no region is
 defined
Date: Wed, 08 Jun 2016 08:51:53 +0200
Message-ID: <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com>
References: <20160607143425.GE1165@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20160607143425.GE1165@e106497-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Kamil Debski <k.debski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Liviu Dudau <liviu.dudau@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Q2hhbmdlIHJldHVybiB2YWx1ZSBiYWNrIHRvIC1FTk9ERVYgd2hlbiBubyByZWdpb24gaXMgZGVm
aW5lZCBmb3IgZ2l2ZW4KZGV2aWNlLiBUaGlzIHJlc3RvcmVzIG9sZCBiZWhhdmlvciBvZiB0aGlz
IGZ1bmN0aW9uLCBhcyBzb21lIGRyaXZlcnMgcmVseQpvbiBzdWNoIGVycm9yIGNvZGUuCgpSZXBv
cnRlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CkZpeGVzOiA1OWNlNDAz
OTcyN2VmNDAgKCJvZjogcmVzZXJ2ZWRfbWVtOiBhZGQgc3VwcG9ydCBmb3IgdXNpbmcgbW9yZSB0
aGFuCiAgICAgICBvbmUgcmVnaW9uIGZvciBnaXZlbiBkZXZpY2UiKQpTaWduZWQtb2ZmLWJ5OiBN
YXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9v
Zi9vZl9yZXNlcnZlZF9tZW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVt
LmMgYi9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jCmluZGV4IDNjZjEyOWYuLjA2YWY5OWYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKKysrIGIvZHJpdmVycy9v
Zi9vZl9yZXNlcnZlZF9tZW0uYwpAQCAtMzM0LDcgKzMzNCw3IEBAIGludCBvZl9yZXNlcnZlZF9t
ZW1fZGV2aWNlX2luaXRfYnlfaWR4KHN0cnVjdCBkZXZpY2UgKmRldiwKIAogCXRhcmdldCA9IG9m
X3BhcnNlX3BoYW5kbGUobnAsICJtZW1vcnktcmVnaW9uIiwgaWR4KTsKIAlpZiAoIXRhcmdldCkK
LQkJcmV0dXJuIC1FSU5WQUw7CisJCXJldHVybiAtRU5PREVWOwogCiAJcm1lbSA9IF9fZmluZF9y
bWVtKHRhcmdldCk7CiAJb2Zfbm9kZV9wdXQodGFyZ2V0KTsKLS0gCjEuOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
