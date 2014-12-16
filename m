From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/13] drm/rockchip: Store correct CRTC index in events
Date: Tue, 16 Dec 2014 17:53:28 +0100
Message-ID: <1418748815-15434-6-git-send-email-thierry.reding@gmail.com>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Mark Yao <mark.yao@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkEgbmVnYXRpdmUgcGlw
ZSBjYXVzZXMgYSBzcGVjaWFsIGNhc2UgdG8gYmUgdHJpZ2dlcmVkIGZvciBkcml2ZXJzIHRoYXQK
ZG9uJ3QgaGF2ZSBwcm9wZXIgVkJMQU5LIHN1cHBvcnQuIFJvY2tjaGlwIGRvZXMgc3VwcG9ydCBW
QkxBTktzLCBzbwp0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUgZmFsbGJhY2sgY29kZS4KCkNjOiBN
YXJrIFlhbyA8bWFyay55YW9Acm9jay1jaGlwcy5jb20+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcC5jCmluZGV4IGU3Y2EyNWIzZmIzOC4uOTk5NjE2ZDIxNmFjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKQEAgLTk1OCw3ICs5NTgsNyBAQCBzdGF0
aWMgdm9pZCB2b3Bfd2luX3N0YXRlX2NvbXBsZXRlKHN0cnVjdCB2b3Bfd2luICp2b3Bfd2luLAog
CiAJaWYgKHN0YXRlLT5ldmVudCkgewogCQlzcGluX2xvY2tfaXJxc2F2ZSgmZHJtLT5ldmVudF9s
b2NrLCBmbGFncyk7Ci0JCWRybV9zZW5kX3ZibGFua19ldmVudChkcm0sIC0xLCBzdGF0ZS0+ZXZl
bnQpOworCQlkcm1fc2VuZF92YmxhbmtfZXZlbnQoZHJtLCB2b3AtPnBpcGUsIHN0YXRlLT5ldmVu
dCk7CiAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRybS0+ZXZlbnRfbG9jaywgZmxhZ3MpOwog
CX0KIAotLSAKMi4xLjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
