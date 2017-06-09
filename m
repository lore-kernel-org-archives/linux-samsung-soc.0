From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Remove the display-timing and delay
 from rinato dts
Date: Fri, 09 Jun 2017 13:59:14 +0900
Message-ID: <1496984354-5271-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1496984354-5271-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170609045939epcas1p2e4b50c78978b8f14630ca29550c1cb34@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1496984354-5271-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGRpc3BsYXktdGltaW5nIGFuZCBkZWxheSBhcmUgaW5jbHVkZWQgaW4gdGhlIHBhbmVsIGRy
aXZlci4gU28gaXQKc2hvdWxkIGJlIHJlbW92ZWQgaW4gZHRzLgoKU2lnbmVkLW9mZi1ieTogSG9l
Z2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zMzI1MC1yaW5hdG8uZHRzIHwgMjIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczMyNTAtcmluYXRvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAt
cmluYXRvLmR0cwppbmRleCA4MmU2NzZhLi4zZDE5YjdjIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zMzI1MC1yaW5hdG8uZHRzCkBAIC0yMjcsMjggKzIyNyw2IEBACiAJCXZjaS1zdXBwbHkgPSA8
JmxkbzIwX3JlZz47CiAJCXJlc2V0LWdwaW9zID0gPCZncGUwIDEgR1BJT19BQ1RJVkVfSElHSD47
CiAJCXRlLWdwaW9zID0gPCZncHgwIDYgR1BJT19BQ1RJVkVfSElHSD47Ci0JCXBvd2VyLW9uLWRl
bGF5PSA8MzA+OwotCQlwb3dlci1vZmYtZGVsYXk9IDwxMjA+OwotCQlyZXNldC1kZWxheSA9IDw1
PjsKLQkJaW5pdC1kZWxheSA9IDwxMDA+OwotCQlmbGlwLWhvcml6b250YWw7Ci0JCWZsaXAtdmVy
dGljYWw7Ci0JCXBhbmVsLXdpZHRoLW1tID0gPDI5PjsKLQkJcGFuZWwtaGVpZ2h0LW1tID0gPDI5
PjsKLQotCQlkaXNwbGF5LXRpbWluZ3MgewotCQkJdGltaW5nLTAgewotCQkJCWNsb2NrLWZyZXF1
ZW5jeSA9IDw0NjAwMDAwPjsKLQkJCQloYWN0aXZlID0gPDMyMD47Ci0JCQkJdmFjdGl2ZSA9IDwz
MjA+OwotCQkJCWhmcm9udC1wb3JjaCA9IDwxPjsKLQkJCQloYmFjay1wb3JjaCA9IDwxPjsKLQkJ
CQloc3luYy1sZW4gPSA8MT47Ci0JCQkJdmZyb250LXBvcmNoID0gPDE1MD47Ci0JCQkJdmJhY2st
cG9yY2ggPSA8MT47Ci0JCQkJdnN5bmMtbGVuID0gPDI+OwotCQkJfTsKLQkJfTsKIAl9OwogfTsK
IAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
