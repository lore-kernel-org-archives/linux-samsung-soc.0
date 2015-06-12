From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/9] tests/exynos: replace return by break
Date: Fri, 12 Jun 2015 20:15:07 +0200
Message-ID: <1434132914-3150-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

VGhlICd1c2FnZScgZnVuY3Rpb24gYWxyZWFkeSBkb2VzIGV4aXQoMCksIHNvIHRoYXQgdGhpcwon
cmV0dXJuIC1FSU5WQUwnIGlzIG5ldmVyIGNhbGxlZC4gSnVzdCBwdXQgYSBicmVhayB0aGVyZQp0
byBhdm9pZCBjb25mdXNpb24uCgpTaWduZWQtb2ZmLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2Jp
QG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KLS0tCiB0ZXN0cy9leHlub3MvZXh5bm9zX2ZpbWcyZF90
ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9leHlub3MvZXh5bm9zX2ZpbWcyZF90ZXN0LmMgYi90ZXN0
cy9leHlub3MvZXh5bm9zX2ZpbWcyZF90ZXN0LmMKaW5kZXggZTY0YmIzMi4uNjRkYWNmYSAxMDA2
NDQKLS0tIGEvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jCisrKyBiL3Rlc3RzL2V4
eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYwpAQCAtNjg5LDcgKzY4OSw3IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKIAkJCWJyZWFrOwogCQlkZWZhdWx0OgogCQkJdXNhZ2UoYXJn
dlswXSk7Ci0JCQlyZXR1cm4gLUVJTlZBTDsKKwkJCWJyZWFrOwogCQl9CiAJfQogCi0tIAoyLjAu
NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
