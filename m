From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynos: Add support for S6E3HA2 edge panel
 device on TM2e board
Date: Fri, 14 Apr 2017 14:19:39 +0900
Message-ID: <1492147179-7824-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1492147179-7824-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170414051959epcas1p3a246070b065129c4ffbf94736cde321a@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1492147179-7824-1-git-send-email-hoegeun.kwon@samsung.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZWRn
ZSBkaXNwbGF5CmNvbnRyb2xsZXIgdG8gVE0yZSBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVu
IEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2V4eW5vcy9leHlub3M1NDMzLXRtMmUuZHRzIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZXh5bm9zL2V4eW5vczU0MzMtdG0yZS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9l
eHlub3M1NDMzLXRtMmUuZHRzCmluZGV4IDY5NDcxN2EuLjc5ZjIyZjcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yZS5kdHMKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTJlLmR0cwpAQCAtNTIsNiArNTIsMTgg
QEAKIAlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyNzgwMDAwMDA+LCA8NDAwMDAwMDAwPjsKIH07
CiAKKyZkc2kgeworCXBhbmVsQDAgeworCQljb21wYXRpYmxlID0gInNhbXN1bmcsczZlM2hhMi1l
IjsKKwkJcmVnID0gPDA+OworCQl2ZGQzLXN1cHBseSA9IDwmbGRvMjdfcmVnPjsKKwkJdmNpLXN1
cHBseSA9IDwmbGRvMjhfcmVnPjsKKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwZzAgMCBHUElPX0FDVElW
RV9MT1c+OworCQllbmFibGUtZ3Bpb3MgPSA8JmdwZjEgNSBHUElPX0FDVElWRV9ISUdIPjsKKwkJ
dGUtZ3Bpb3MgPSA8JmdwZjEgMyBHUElPX0FDVElWRV9ISUdIPjsKKwl9OworfTsKKwogJmxkbzMx
X3JlZyB7CiAJcmVndWxhdG9yLW5hbWUgPSAiVFNQX1ZERF8xLjhWX0FQIjsKIAlyZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
