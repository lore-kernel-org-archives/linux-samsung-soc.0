From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v7 11/13] drm/exynos: don't disable unused functions at init
Date: Fri, 22 May 2015 12:40:51 -0300
Message-ID: <1432309253-18572-12-git-send-email-gustavo@padovan.org>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
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
YWRvdmFuQGNvbGxhYm9yYS5jby51az4KUmV2aWV3ZWQtYnk6IEpvb255b3VuZyBTaGltIDxqeTA5
MjIuc2hpbUBzYW1zdW5nLmNvbT4KVGVzdGVkLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1h
dGgudW5pLWJpZWxlZmVsZC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmJkZXYuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCmluZGV4IGU3MWUzMzEuLmUwYjA4
NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCkBAIC0yNzUs
OSArMjc1LDYgQEAgaW50IGV4eW5vc19kcm1fZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQogCiAJfQogCi0JLyogZGlzYWJsZSBhbGwgdGhlIHBvc3NpYmxlIG91dHB1dHMvY3J0Y3Mg
YmVmb3JlIGVudGVyaW5nIEtNUyBtb2RlICovCi0JZHJtX2hlbHBlcl9kaXNhYmxlX3VudXNlZF9m
dW5jdGlvbnMoZGV2KTsKLQogCXJldCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoaGVs
cGVyLCBQUkVGRVJSRURfQlBQKTsKIAlpZiAocmV0IDwgMCkgewogCQlEUk1fRVJST1IoImZhaWxl
ZCB0byBzZXQgdXAgaHcgY29uZmlndXJhdGlvbi5cbiIpOwotLSAKMi4xLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
