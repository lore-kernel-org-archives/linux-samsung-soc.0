From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
Date: Wed, 29 May 2019 14:32:46 +0900
Message-ID: <2a68376b-32a4-a016-124f-c7fa3b8579bd@samsung.com>
References: <CGME20190525114732epcas5p3f9d8aec51fb32c7e2ca80f0a45afe8a8@epcas5p3.samsung.com>
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
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAxOS4gNS4gMjUuIOyYpO2bhCA4OjU1LCBLZWZlbmcgV2FuZyB3cm90ZToKPiBVc2Ug
b2ZfY2xrX2dldF9wYXJlbnRfY291bnQoKSBpbnN0ZWFkIG9mIG9wZW4gY29kaW5nLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5jIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MzMuYyBiL2RyaXZlcnMvY2xr
L3NhbXN1bmcvY2xrLWV4eW5vczU0MzMuYwo+IGluZGV4IGRhZTFjOTZkZTkzMy4uMTRlMjUzOTE1
Y2E0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MzMuYwo+
ICsrKyBiL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MzMuYwo+IEBAIC01NTkwLDgg
KzU1OTAsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBleHlub3M1NDMzX2NtdV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJZGF0YS0+bnJfY2xrX3NhdmUgPSBpbmZvLT5ucl9j
bGtfcmVnczsKPiAgCWRhdGEtPmNsa19zdXNwZW5kID0gaW5mby0+c3VzcGVuZF9yZWdzOwo+ICAJ
ZGF0YS0+bnJfY2xrX3N1c3BlbmQgPSBpbmZvLT5ucl9zdXNwZW5kX3JlZ3M7Cj4gLQlkYXRhLT5u
cl9wY2xrcyA9IG9mX2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKGRldi0+b2Zfbm9kZSwgImNsb2Nr
cyIsCj4gLQkJCQkJCSAgICAiI2Nsb2NrLWNlbGxzIik7Cj4gKwlkYXRhLT5ucl9wY2xrcyA9IG9m
X2Nsa19nZXRfcGFyZW50X2NvdW50KGRldi0+b2Zfbm9kZSk7Cj4gKwo+ICAJaWYgKGRhdGEtPm5y
X3BjbGtzID4gMCkgewo+ICAJCWRhdGEtPnBjbGtzID0gZGV2bV9rY2FsbG9jKGRldiwgc2l6ZW9m
KHN0cnVjdCBjbGsgKiksCj4gIAkJCQkJICAgZGF0YS0+bnJfcGNsa3MsIEdGUF9LRVJORUwpOwo+
IAoKSXQgdXNlcyB0aGUgaGVscGVyIGZ1bmN0aW9uIGZyb20gQ0NGLiBMb29rcyBnb29kIHRvIG1l
LgoKQWNrZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgoKLS0gCkJl
c3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pClNhbXN1bmcgRWxlY3Ryb25pY3MKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
