From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 04/14] exynos/fimg2d: check buffer space in g2d_solid_fill()
Date: Mon, 24 Aug 2015 16:13:59 +0200
Message-ID: <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGFtb3VudCBvZiBjb21tYW5kcyAocmVndWxhciBhbmQgR0VNKSBkb2Vzbid0IGRlcGVuZApv
biB0aGUgaW5wdXQgaGVyZS4KClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlA
bWF0aC51bmktYmllbGVmZWxkLmRlPgotLS0KIGV4eW5vcy9leHlub3NfZmltZzJkLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2V4eW5vcy9l
eHlub3NfZmltZzJkLmMgYi9leHlub3MvZXh5bm9zX2ZpbWcyZC5jCmluZGV4IDFhZThhZGYuLjli
N2JjY2UgMTAwNjQ0Ci0tLSBhL2V4eW5vcy9leHlub3NfZmltZzJkLmMKKysrIGIvZXh5bm9zL2V4
eW5vc19maW1nMmQuYwpAQCAtMzE5LDYgKzMxOSw5IEBAIGcyZF9zb2xpZF9maWxsKHN0cnVjdCBn
MmRfY29udGV4dCAqY3R4LCBzdHJ1Y3QgZzJkX2ltYWdlICppbWcsCiAJdW5pb24gZzJkX2JpdGJs
dF9jbWRfdmFsIGJpdGJsdDsKIAl1bmlvbiBnMmRfcG9pbnRfdmFsIHB0OwogCisJaWYgKGcyZF9j
aGVja19zcGFjZShjdHgsIDcsIDEpKQorCQlyZXR1cm4gLUVOT1NQQzsKKwogCWcyZF9hZGRfY21k
KGN0eCwgRFNUX1NFTEVDVF9SRUcsIEcyRF9TRUxFQ1RfTU9ERV9OT1JNQUwpOwogCWcyZF9hZGRf
Y21kKGN0eCwgRFNUX0NPTE9SX01PREVfUkVHLCBpbWctPmNvbG9yX21vZGUpOwogCWcyZF9hZGRf
YmFzZV9hZGRyKGN0eCwgaW1nLCBnMmRfZHN0KTsKLS0gCjIuMC41CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
