From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v5 10/12] drm/exynos: don't disable unused functions at init
Date: Thu, 21 May 2015 12:02:54 -0300
Message-ID: <1432220576-18532-12-git-send-email-gustavo@padovan.org>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
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
Cc: tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
RXZlcnl0aGluZyBzdGFydHMgZGlzYWJsZWQgc28gd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8gZGlz
YWJsZSBhbnl0aGluZy4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5w
YWRvdmFuQGNvbGxhYm9yYS5jby51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZmJkZXYuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCmluZGV4IGU3MWUzMzEuLmUw
YjA4NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRl
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCkBAIC0y
NzUsOSArMjc1LDYgQEAgaW50IGV4eW5vc19kcm1fZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCiAJfQogCi0JLyogZGlzYWJsZSBhbGwgdGhlIHBvc3NpYmxlIG91dHB1dHMvY3J0
Y3MgYmVmb3JlIGVudGVyaW5nIEtNUyBtb2RlICovCi0JZHJtX2hlbHBlcl9kaXNhYmxlX3VudXNl
ZF9mdW5jdGlvbnMoZGV2KTsKLQogCXJldCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWco
aGVscGVyLCBQUkVGRVJSRURfQlBQKTsKIAlpZiAocmV0IDwgMCkgewogCQlEUk1fRVJST1IoImZh
aWxlZCB0byBzZXQgdXAgaHcgY29uZmlndXJhdGlvbi5cbiIpOwotLSAKMi4xLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
