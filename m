From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 2/3] arm64: dts: exynos: Add the hardware rotation limits
 for gsc
Date: Fri, 01 Sep 2017 10:47:55 +0900
Message-ID: <1504230476-1878-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1504230476-1878-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170901014758epcas2p201036a38e7d079e10732d1c43c6248d7@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1504230476-1878-1-git-send-email-hoegeun.kwon@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGdzY2FsZXIgaGFzIG1heGltdW0gc2l6ZSBvZiBpbnB1dCBvciBvdXRwdXQgcm90YXRpb24u
IEFkZCB0aGUKaGFyZHdhcmUgbGltaXRzIHByb3BlcnR5IGZvciB0aGUgZ3NjYWxlciByb3RhdGlv
biBpbiB0aGUgZXh5bm9zNTQzMwpkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhv
ZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9l
eHlub3M1NDMzLmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRzaQppbmRleCA3ZmU5
OTRiLi41N2M5OTk3IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlu
b3M1NDMzLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5k
dHNpCkBAIC04OTEsNiArODkxLDggQEAKIAkJCQkgPCZjbXVfZ3NjbCBDTEtfQUNMS19HU0NMMD4s
CiAJCQkJIDwmY211X2dzY2wgQ0xLX0FDTEtfWElVX0dTQ0xYPiwKIAkJCQkgPCZjbXVfZ3NjbCBD
TEtfQUNMS19HU0NMQkVORF8zMzM+OworCQkJcm90LW1heC1oc2l6ZSA9IDwyMDQ3PjsKKwkJCXJv
dC1tYXgtdnNpemUgPSA8MjA0Nz47CiAJCQlpb21tdXMgPSA8JnN5c21tdV9nc2NsMD47CiAJCX07
CiAKQEAgLTkwNCw2ICs5MDYsOCBAQAogCQkJCSA8JmNtdV9nc2NsIENMS19BQ0xLX0dTQ0wxPiwK
IAkJCQkgPCZjbXVfZ3NjbCBDTEtfQUNMS19YSVVfR1NDTFg+LAogCQkJCSA8JmNtdV9nc2NsIENM
S19BQ0xLX0dTQ0xCRU5EXzMzMz47CisJCQlyb3QtbWF4LWhzaXplID0gPDIwNDc+OworCQkJcm90
LW1heC12c2l6ZSA9IDwyMDQ3PjsKIAkJCWlvbW11cyA9IDwmc3lzbW11X2dzY2wxPjsKIAkJfTsK
IApAQCAtOTE3LDYgKzkyMSw4IEBACiAJCQkJIDwmY211X2dzY2wgQ0xLX0FDTEtfR1NDTDI+LAog
CQkJCSA8JmNtdV9nc2NsIENMS19BQ0xLX1hJVV9HU0NMWD4sCiAJCQkJIDwmY211X2dzY2wgQ0xL
X0FDTEtfR1NDTEJFTkRfMzMzPjsKKwkJCXJvdC1tYXgtaHNpemUgPSA8MjA0Nz47CisJCQlyb3Qt
bWF4LXZzaXplID0gPDIwNDc+OwogCQkJaW9tbXVzID0gPCZzeXNtbXVfZ3NjbDI+OwogCQl9Owog
Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
