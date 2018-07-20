From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 02/10] drm/amd/display: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Fri, 20 Jul 2018 22:15:01 +0100
Message-ID: <20180720211509.23605-3-alexandru-cosmin.gheorghe@arm.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
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

U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWluLmdoZW9y
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwppbmRleCBjYTAxN2MxZGQ0ZGEuLmMwODE1NzY4Njc4MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBA
IC0zMDEzLDExICszMDEzLDggQEAgc3RhdGljIHZvaWQgZG1fZHJtX3BsYW5lX3Jlc2V0KHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lKQogCWFtZGdwdV9zdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCphbWRn
cHVfc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAlXQVJOX09OKGFtZGdwdV9zdGF0ZSA9PSBOVUxMKTsK
IAkKLQlpZiAoYW1kZ3B1X3N0YXRlKSB7Ci0JCXBsYW5lLT5zdGF0ZSA9ICZhbWRncHVfc3RhdGUt
PmJhc2U7Ci0JCXBsYW5lLT5zdGF0ZS0+cGxhbmUgPSBwbGFuZTsKLQkJcGxhbmUtPnN0YXRlLT5y
b3RhdGlvbiA9IERSTV9NT0RFX1JPVEFURV8wOwotCX0KKwlpZiAoYW1kZ3B1X3N0YXRlKQorCQlf
X2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmYW1kZ3B1X3N0YXRlLT5iYXNl
KTsKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgotLSAKMi4xOC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
