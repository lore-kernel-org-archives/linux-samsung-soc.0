From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 1/3] dt-bindings: Add support for samsung s6e3hf2 panel
Date: Tue, 18 Apr 2017 17:40:34 +0900
Message-ID: <1492504836-19225-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170418084047epcas5p440464afa8770d07253f42f362764059b@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHNhbXN1bmcgczZlM2hmMiBwYW5lbCBpcyBhIDUuNjUiIDE2MDB4MjU2MCBBTU9MRUQgcGFu
ZWwgY29ubmVjdGVkCnVzaW5nIE1JUEktRFNJIGludGVyZmFjZXMuCgpUaGUgczZlM2hmMiBpcyBh
ZGQgdG8gc2Ftc3VuZyxzNmUzaGEyLnR4dCBiaW5kaW5nIGJlY2F1c2UgaXQgaXMgYQpwYW5lbCBz
aW1pbGFyIHRvIHRoZSBzNmUzaGEyLiBTbyBhZGQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGFuZApj
b21tZW50cy4KClNpZ25lZC1vZmYtYnk6IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1
bmcuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4K
LS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zYW1z
dW5nLHM2ZTNoYTIudHh0IHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NhbXN1bmcsczZlM2hhMi50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zYW1zdW5nLHM2ZTNoYTIudHh0Cmlu
ZGV4IDE4ODU0ZjQuLjRhY2VhMjUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NhbXN1bmcsczZlM2hhMi50eHQKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2Ftc3VuZyxzNmUzaGEy
LnR4dApAQCAtMSw3ICsxLDEwIEBACiBTYW1zdW5nIFM2RTNIQTIgNS43IiAxNDQweDI1NjAgQU1P
TEVEIHBhbmVsCitTYW1zdW5nIFM2RTNIRjIgNS42NSIgMTYwMHgyNTYwIEFNT0xFRCBwYW5lbAog
CiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgotICAtIGNvbXBhdGlibGU6ICJzYW1zdW5nLHM2ZTNoYTIi
CisgIC0gY29tcGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZjoKKyAgICAic2Ftc3VuZyxzNmUzaGEy
IiwKKyAgICAic2Ftc3VuZyxzNmUzaGYyIi4KICAgLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwg
bnVtYmVyIG9mIGEgRFNJIHBlcmlwaGVyYWwKICAgLSB2ZGQzLXN1cHBseTogSS9PIHZvbHRhZ2Ug
c3VwcGx5CiAgIC0gdmNpLXN1cHBseTogdm9sdGFnZSBzdXBwbHkgZm9yIGFuYWxvZyBjaXJjdWl0
cwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
