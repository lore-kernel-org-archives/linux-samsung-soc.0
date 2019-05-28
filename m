From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
Date: Tue, 28 May 2019 13:10:55 +0200
Message-ID: <2a0147a3-2371-7f78-b756-09923b5f6cb2@samsung.com>
References: <CGME20190525114732epcas1p3ac5c2205bf004893dc002fe05c3adf7b@epcas1p3.samsung.com>
 <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjUuMDUuMjAxOSAxMzo1NSwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4gVXNlIG9mX2Nsa19nZXRf
cGFyZW50X2NvdW50KCkgaW5zdGVhZCBvZiBvcGVuIGNvZGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5jIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGst
ZXh5bm9zNTQzMy5jCj4gaW5kZXggZGFlMWM5NmRlOTMzLi4xNGUyNTM5MTVjYTQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5jCj4gKysrIGIvZHJpdmVy
cy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5jCj4gQEAgLTU1OTAsOCArNTU5MCw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGV4eW5vczU0MzNfY211X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAlkYXRhLT5ucl9jbGtfc2F2ZSA9IGluZm8tPm5yX2Nsa19yZWdzOwo+ICAJ
ZGF0YS0+Y2xrX3N1c3BlbmQgPSBpbmZvLT5zdXNwZW5kX3JlZ3M7Cj4gIAlkYXRhLT5ucl9jbGtf
c3VzcGVuZCA9IGluZm8tPm5yX3N1c3BlbmRfcmVnczsKPiAtCWRhdGEtPm5yX3BjbGtzID0gb2Zf
Y291bnRfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LT5vZl9ub2RlLCAiY2xvY2tzIiwKPiAtCQkJCQkJ
ICAgICIjY2xvY2stY2VsbHMiKTsKPiArCWRhdGEtPm5yX3BjbGtzID0gb2ZfY2xrX2dldF9wYXJl
bnRfY291bnQoZGV2LT5vZl9ub2RlKTsKPiArCj4gIAlpZiAoZGF0YS0+bnJfcGNsa3MgPiAwKSB7
Cj4gIAkJZGF0YS0+cGNsa3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0IGNsayAq
KSwKPiAgCQkJCQkgICBkYXRhLT5ucl9wY2xrcywgR0ZQX0tFUk5FTCk7CgpSZXZpZXdlZC1ieTog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVq
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
