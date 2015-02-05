From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 3/3] ARM: dts: exynos5420: add async-bridge clock to disp1
 power domain
Date: Thu, 05 Feb 2015 13:35:39 +0100
Message-ID: <1423139739-19881-4-git-send-email-a.hajda@samsung.com>
References: <1423139739-19881-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1423139739-19881-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Liquid.Acid@gmx.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, javier.martinez@collabora.co.uk, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

ZGlzcDEgcG93ZXIgZG9tYWluIHJlcXVpcmVzIG9wZXJhdGlvbmFsIGFzeW5jLWJyaWRnZSBhc3Nv
Y2lhdGVkIHdpdGggSERNSSwKaWUgaXRzIGNsb2NrIHNob3VsZCBiZSBlbmFibGVkIGR1cmluZyBw
b3dlciBvbi9vZmYuCgpUaGlzIHBhdGNoIGZpeGVzIGJyb2tlbiBPZHJvaWQgWFUzIEhETUkgc3Vw
cG9ydC4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNTQyMC5kdHNpCmluZGV4IGI4ZjFjOWYuLjEzMTkxZmUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczU0MjAuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1
NDIwLmR0c2kKQEAgLTI4NSw5ICsyODUsMTEgQEAKIAkJCSA8JmNsb2NrIENMS19NT1VUX1NXX0FD
TEszMDA+LAogCQkJIDwmY2xvY2sgQ0xLX01PVVRfVVNFUl9BQ0xLMzAwX0RJU1AxPiwKIAkJCSA8
JmNsb2NrIENMS19NT1VUX1NXX0FDTEs0MDA+LAotCQkJIDwmY2xvY2sgQ0xLX01PVVRfVVNFUl9B
Q0xLNDAwX0RJU1AxPjsKKwkJCSA8JmNsb2NrIENMS19NT1VUX1VTRVJfQUNMSzQwMF9ESVNQMT4s
CisJCQkgPCZjbG9jayBDTEtfSERNST47CiAJCWNsb2NrLW5hbWVzID0gIm9zY2NsayIsICJwY2xr
MCIsICJjbGswIiwKLQkJCSAgICAgICJwY2xrMSIsICJjbGsxIiwgInBjbGsyIiwgImNsazIiOwor
CQkJICAgICAgInBjbGsxIiwgImNsazEiLCAicGNsazIiLCAiY2xrMiIsCisJCQkgICAgICAiYXNi
MCI7CiAJfTsKIAogCXBpbmN0cmxfMDogcGluY3RybEAxMzQwMDAwMCB7Ci0tIAoxLjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
