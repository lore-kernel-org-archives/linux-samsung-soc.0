From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v2 02/10] drm/amd/display: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Thu, 26 Jul 2018 17:17:48 +0100
Message-ID: <20180726161756.1794-3-alexandru-cosmin.gheorghe@arm.com>
References: <20180726161756.1794-1-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180726161756.1794-1-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: seanpaul@chromium.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, ville.syrjala@linux.intel.com, daniel@ffwll.ch, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, harry.wentland@amd.com, andrey.grodzovsky@amd.com, Tony.Cheng@amd.com, sunpeng.li@amd.com, shirish.s@amd.com, boris.brezillon@bootlin.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com, maxime.ripard@bootlin.com, wens@csie.org, eric@anholt.net, linux-graphics-maintainer@vmware.com, syeh@
Cc: nd@arm.com, Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

QSBuZXcgaGVscGVyIGZ1bmN0aW9uKF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQpIGhh
cyBiZWVuIGFkZGVkCmZvciBsaW5raW5nIGEgcGxhbmUgd2l0aCBpdHMgc3RhdGUgYW5kIHJlc2V0
dGluZyB0aGUgY29yZQpwcm9wZXJ0aWVzKGFscGhhLCByb3RhdGlvbiwgZXRjKSB0byB0aGVpciBk
ZWZhdWx0IHZhbHVlcy4KVXNlIHRoYXQgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgbG9naWMu
CgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdo
ZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKaW5kZXggYWUwOTMzMWVlZDAwLi44ZTQ5NzhkNWI4M2YgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAt
Mjk2NSwxMSArMjk2NSw4IEBAIHN0YXRpYyB2b2lkIGRtX2RybV9wbGFuZV9yZXNldChzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSkKIAlhbWRncHVfc3RhdGUgPSBremFsbG9jKHNpemVvZigqYW1kZ3B1
X3N0YXRlKSwgR0ZQX0tFUk5FTCk7CiAJV0FSTl9PTihhbWRncHVfc3RhdGUgPT0gTlVMTCk7CiAJ
Ci0JaWYgKGFtZGdwdV9zdGF0ZSkgewotCQlwbGFuZS0+c3RhdGUgPSAmYW1kZ3B1X3N0YXRlLT5i
YXNlOwotCQlwbGFuZS0+c3RhdGUtPnBsYW5lID0gcGxhbmU7Ci0JCXBsYW5lLT5zdGF0ZS0+cm90
YXRpb24gPSBEUk1fTU9ERV9ST1RBVEVfMDsKLQl9CisJaWYgKGFtZGdwdV9zdGF0ZSkKKwkJX19k
cm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJmFtZGdwdV9zdGF0ZS0+YmFzZSk7
CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoKLS0gCjIuMTguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
