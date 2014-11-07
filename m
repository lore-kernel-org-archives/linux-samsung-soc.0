From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 3/4] ARM: dts: add fimd device node to exynos4415.dtsi
Date: Fri, 07 Nov 2014 15:12:26 +0900
Message-ID: <1415340747-27904-4-git-send-email-yj44.cho@samsung.com>
References: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, cw00.choi@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGZpbWQgZGV2aWNlIG5vZGUgdG8gZXh5bm9zNDQxNS5kdHNpLgoKU2ln
bmVkLW9mZi1ieTogWW91bmdKdW4gQ2hvIDx5ajQ0LmNob0BzYW1zdW5nLmNvbT4KQWNrZWQtYnk6
IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxNS5kdHNpIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czQ0MTUuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTUuZHRzaQppbmRleCBjMWM5
YjM3Li4zMGFjYjNhIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDE1LmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxNS5kdHNpCkBAIC0yMzQsNiArMjM0
LDE4IEBACiAJCQlpbnRlcnJ1cHRzID0gPDAgMjQwIDA+OwogCQl9OwogCisJCWZpbWQ6IGZpbWRA
MTFDMDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczQ0MTUtZmltZCI7CisJ
CQlyZWcgPSA8MHgxMUMwMDAwMCAweDMwMDAwPjsKKwkJCWludGVycnVwdC1uYW1lcyA9ICJmaWZv
IiwgInZzeW5jIiwgImxjZF9zeXMiOworCQkJaW50ZXJydXB0cyA9IDwwIDg0IDA+LCA8MCA4NSAw
PiwgPDAgODYgMD47CisJCQljbG9ja3MgPSA8JmNtdSBDTEtfU0NMS19GSU1EMD4sIDwmY211IENM
S19GSU1EMD47CisJCQljbG9jay1uYW1lcyA9ICJzY2xrX2ZpbWQiLCAiZmltZCI7CisJCQlzYW1z
dW5nLHBvd2VyLWRvbWFpbiA9IDwmcGRfbGNkMD47CisJCQlzYW1zdW5nLHN5c3JlZyA9IDwmc3lz
cmVnX3N5c3RlbV9jb250cm9sbGVyPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisK
IAkJaHNvdGc6IGhzb3RnQDEyNDgwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxzM2M2
NDAwLWhzb3RnIjsKIAkJCXJlZyA9IDwweDEyNDgwMDAwIDB4MjAwMDA+OwotLSAKMS45LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
