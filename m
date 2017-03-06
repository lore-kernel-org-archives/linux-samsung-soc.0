From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v4 4/5] arm64: dts: exynos: Remove the OF graph from DSI node
Date: Mon, 06 Mar 2017 13:42:22 +0900
Message-ID: <1488775343-6236-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170306044237epcas5p35d955ba5e849a8ebcf13007ab1b377dc@epcas5p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488775343-6236-1-git-send-email-hoegeun.kwon@samsung.com>
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
ZiBkc2kuIFJlbW92ZQp0aGUgcG9ydHMgbm9kZSBpbiBEU0kgbm9kZS4KClNpZ25lZC1vZmYtYnk6
IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSB8IDE0IC0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQppbmRleCBlMzFlMjBjLi43
N2JhMjM4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMz
LXRtMi1jb21tb24uZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1
NDMzLXRtMi1jb21tb24uZHRzaQpAQCAtMzAzLDIwICszMDMsNiBAQAogCXNhbXN1bmcscGxsLWNs
b2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
IAlwaW5jdHJsLTAgPSA8JnRlX2lycT47Ci0KLQlwb3J0cyB7Ci0JCSNhZGRyZXNzLWNlbGxzID0g
PDE+OwotCQkjc2l6ZS1jZWxscyA9IDwwPjsKLQotCQlwb3J0QDEgewotCQkJcmVnID0gPDE+Owot
Ci0JCQlkc2lfb3V0OiBlbmRwb2ludCB7Ci0JCQkJc2Ftc3VuZyxidXJzdC1jbG9jay1mcmVxdWVu
Y3kgPSA8NTEyMDAwMDAwPjsKLQkJCQlzYW1zdW5nLGVzYy1jbG9jay1mcmVxdWVuY3kgPSA8MTYw
MDAwMDA+OwotCQkJfTsKLQkJfTsKLQl9OwogfTsKIAogJmhkbWkgewotLSAKMS45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
