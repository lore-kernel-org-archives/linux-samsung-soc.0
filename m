From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Mon, 11 Feb 2019 12:15:31 -0600
Message-ID: <20190211181531.GA3238@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL2Nsay9zYW1zdW5n
L2Nsay1zM2MyNDQzLmM6IEluIGZ1bmN0aW9uIOKAmHMzYzI0NDNfY29tbW9uX2Nsa19pbml04oCZ
Ogpkcml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1zM2MyNDQzLmM6MzkwOjM6IHdhcm5pbmc6IHRoaXMg
c3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBz
YW1zdW5nX2Nsa19yZWdpc3Rlcl9hbGlhcyhjdHgsIHMzYzI0NTBfYWxpYXNlcywKICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgQVJSQVlfU0la
RShzM2MyNDUwX2FsaWFzZXMpKTsKICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRy
aXZlcnMvY2xrL3NhbXN1bmcvY2xrLXMzYzI0NDMuYzozOTM6Mjogbm90ZTogaGVyZQogIGNhc2Ug
UzNDMjQxNjoKICBefn5+CgpXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFs
bHRocm91Z2g9MwoKTm90aWNlIHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCAgdGhlIGNv
ZGUgY29tbWVudCBpcyBtb2RpZmllZAppbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhw
ZWN0aW5nIHRvIGZpbmQuCgpUaGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0
cyB0byBlbmFibGUKLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KClNpZ25lZC1vZmYtYnk6IEd1c3Rh
dm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy9jbGsv
c2Ftc3VuZy9jbGstczNjMjQ0My5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGst
czNjMjQ0My5jIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstczNjMjQ0My5jCmluZGV4IDg4NDA2
N2U0ZjFhMS4uZjM4ZjBlMjRlM2I2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zYW1zdW5nL2Ns
ay1zM2MyNDQzLmMKKysrIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstczNjMjQ0My5jCkBAIC0z
ODksNyArMzg5LDcgQEAgdm9pZCBfX2luaXQgczNjMjQ0M19jb21tb25fY2xrX2luaXQoc3RydWN0
IGRldmljZV9ub2RlICpucCwgdW5zaWduZWQgbG9uZyB4dGlfZiwKIAkJCQlBUlJBWV9TSVpFKHMz
YzI0NTBfZ2F0ZXMpKTsKIAkJc2Ftc3VuZ19jbGtfcmVnaXN0ZXJfYWxpYXMoY3R4LCBzM2MyNDUw
X2FsaWFzZXMsCiAJCQkJQVJSQVlfU0laRShzM2MyNDUwX2FsaWFzZXMpKTsKLQkJLyogZmFsbCB0
aHJvdWdoLCBhcyBzM2MyNDUwIGV4dGVuZHMgdGhlIHMzYzI0MTYgY2xvY2tzICovCisJCS8qIGZh
bGwgdGhyb3VnaCAtIGFzIHMzYzI0NTAgZXh0ZW5kcyB0aGUgczNjMjQxNiBjbG9ja3MgKi8KIAlj
YXNlIFMzQzI0MTY6CiAJCXNhbXN1bmdfY2xrX3JlZ2lzdGVyX2RpdihjdHgsIHMzYzI0MTZfZGl2
aWRlcnMsCiAJCQkJQVJSQVlfU0laRShzM2MyNDE2X2RpdmlkZXJzKSk7Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
